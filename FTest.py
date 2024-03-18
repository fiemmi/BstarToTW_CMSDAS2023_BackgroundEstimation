from time import time
from TwoDAlphabet import plot
from TwoDAlphabet.twoDalphabet import MakeCard, TwoDAlphabet
from TwoDAlphabet.alphawrap import BinnedDistribution, ParametricFunction
from TwoDAlphabet.helpers import make_env_tarball, cd, execute_cmd
from TwoDAlphabet.ftest import FstatCalc
import os
import numpy as np

def _select_signal(row, args):
    signame = args[0]
    if row.process_type == 'SIGNAL':
        if signame in row.process:
            return True
        else:
            return False
    elif 'Background' in row.process:
        if row.process == 'QCD':
            return True
        else:
            return False
    else:
        return True

def _gof_for_FTest(twoD, subtag, card_or_w='card.txt'):

    run_dir = twoD.tag+'/'+subtag

    with cd(run_dir):
        gof_data_cmd = [
            'combine -M GoodnessOfFit',
            '-d '+card_or_w,
            '--algo=saturated',
            '-n _gof_data'
        ]

        gof_data_cmd = ' '.join(gof_data_cmd)
        execute_cmd(gof_data_cmd)

def FTest(poly1, poly2, directory, regionby):
    '''
    Perform an F-test to compare the goodness-of-fit between two transfer function parameterizations using existing working areas
    Arguments:
	poly1 (str): e.g. '0x0', '1x1', ...
	poly2 (str): e.g. '0x0', '1x1', ...
    '''
    area1 = directory+'ttbarfits_'+regionby+'_ftest_{}'.format(poly1)
    area2 = directory+'ttbarfits_'+regionby+'_ftest_{}'.format(poly2)
    
    nParams_dict = {
        '0x0':1,
        '0x1':2,
        '1x0':2,
        '1x1':3,
        '2x1':4,
        '1x2':4,
        '2x2':5,
        '3x1':5,
        '1x3':5,
        '2x3':6,
        '3x2':6,
        '3x3':7,
    }
    
    print('getting file {}/runConfig.json'.format(area1))
    
    twoD1 = TwoDAlphabet(area1, '{}/runConfig.json'.format(area1), loadPrevious=True)
    twoD2 = TwoDAlphabet(area2, '{}/runConfig.json'.format(area2), loadPrevious=True)

    # assume binnings are the same for each area
    binning = twoD1.binnings['default']
    nBins = (len(binning.xbinList)-1)*(len(binning.ybinList)-1)

    # get number of RPF params and run GoF for poly1
    params1 = twoD1.ledger.select(_select_signal, 'signalRSGluon2000', '').alphaParams
    
    print('params1', params1)
    
    rpfSet1 = params1[params1["name"].str.contains("rratio")]
    nRpfs1  = len(rpfSet1.index)
    nRpfs1 = 1
    _gof_for_FTest(twoD1, 'ttbar-RSGluon2000_area', card_or_w='card.txt')
    gofFile1 = area1+'/ttbar-RSGluon2000_area/higgsCombine_gof_data.GoodnessOfFit.mH120.root'

    # get number of RPF params and run GoF for poly2
    params2 = twoD2.ledger.select(_select_signal, 'signalRSGluon2000', '').alphaParams
    rpfSet2 = params2[params2["name"].str.contains("rratio")]
    nRpfs2  = len(rpfSet2.index)
    nRpfs2 = 2

    _gof_for_FTest(twoD2, 'ttbar-RSGluon2000_area', card_or_w='card.txt')
    gofFile2 = area2+'/ttbar-RSGluon2000_area/higgsCombine_gof_data.GoodnessOfFit.mH120.root'

    base_fstat = FstatCalc(gofFile1,gofFile2,nRpfs1,nRpfs2,nBins)
    print 'base_fstat', base_fstat

    # Now define a sub function for plotting
    def plot_FTest(base_fstat,nRpfs1,nRpfs2,nBins):
        from ROOT import TF1, TH1F, TLegend, TPaveText, TLatex, TArrow, TCanvas, kBlue, gStyle
        gStyle.SetOptStat(0000)

        if len(base_fstat) == 0: base_fstat = [0.0]

        ftest_p1    = min(nRpfs1,nRpfs2)
        ftest_p2    = max(nRpfs1,nRpfs2)
        ftest_nbins = nBins
        fdist       = TF1("fDist", "[0]*TMath::FDist(x, [1], [2])", 0,max(10,1.3*base_fstat[0]))
        fdist.SetParameter(0,1)
        fdist.SetParameter(1,ftest_p2-ftest_p1)
        fdist.SetParameter(2,ftest_nbins-ftest_p2)
        
        print(ftest_nbins, ftest_p1, ftest_p2)

        pval = fdist.Integral(0.0,base_fstat[0])
        print 'P-value: %s'%pval

        c = TCanvas('c','c',800,600)
        c.SetLeftMargin(0.12)
        c.SetBottomMargin(0.12)
        c.SetRightMargin(0.1)
        c.SetTopMargin(0.1)
        ftestHist_nbins = 30
        ftestHist = TH1F("Fhist","",ftestHist_nbins,0,max(10,1.3*base_fstat[0]))
        ftestHist.GetXaxis().SetTitle("F = #frac{-2log(#lambda_{1}/#lambda_{2})/(p_{2}-p_{1})}{-2log#lambda_{2}/(n-p_{2})}")
        ftestHist.GetXaxis().SetTitleSize(0.025)
        ftestHist.GetXaxis().SetTitleOffset(2)
        ftestHist.GetYaxis().SetTitleOffset(0.85)

        ftestHist.Draw("pez")
        ftestobs  = TArrow(base_fstat[0],0.25,base_fstat[0],0)
        ftestobs.SetLineColor(kBlue+1)
        ftestobs.SetLineWidth(2)
        fdist.Draw('same')

        ftestobs.Draw()
        tLeg = TLegend(0.6,0.73,0.89,0.89)
        tLeg.SetLineWidth(0)
        tLeg.SetFillStyle(0)
        tLeg.SetTextFont(42)
        tLeg.SetTextSize(0.03)
        tLeg.AddEntry(ftestobs,"observed = %.3f"%base_fstat[0],"l")
        tLeg.AddEntry(fdist,"F-dist, ndf = (%.0f, %.0f) "%(fdist.GetParameter(1),fdist.GetParameter(2)),"l")
        tLeg.Draw("same")

        model_info = TPaveText(0.2,0.6,0.4,0.8,"brNDC")
        model_info.AddText('p1 = '+poly1)
        model_info.AddText('p2 = '+poly2)
        model_info.AddText("p-value = %.2f"%(1-pval))
        model_info.Draw('same')

        latex = TLatex()
        latex.SetTextAlign(11)
        latex.SetTextSize(0.06)
        latex.SetTextFont(62)
        latex.SetNDC()
        latex.DrawLatex(0.12,0.91,"CMS")
        latex.SetTextSize(0.05)
        latex.SetTextFont(52)
        latex.DrawLatex(0.65,0.91,"Preliminary")
        latex.SetTextFont(42)
        latex.SetTextFont(52)
        latex.SetTextSize(0.045)
        c.SaveAs('./ftests/ftest_'+regionby+'_{0}_vs_{1}_2018.png'.format(poly1,poly2))
#         c.SaveAs('./ftest_{0}_vs_{1}_notoys.png'.format(poly1,poly2))


    plot_FTest(base_fstat,nRpfs1,nRpfs2,nBins)

if __name__=="__main__":
    directory = '/eos/home-m/mmorris/Documents/TTbarResonance/backgroundEstimate/restarting_10172023/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/tight_rebinned/2018/'
    
    FTest('0x0','1x0', directory, 'cen')
    FTest('0x0','1x0', directory, 'fwd')
    
    FTest('0x0','0x1', directory, 'cen')
    FTest('0x0','0x1', directory, 'fwd')
    
    FTest('1x0','1x1', directory, 'cen')
    FTest('1x0','1x1', directory, 'fwd')
    
    FTest('0x1','1x1', directory, 'cen')
    FTest('0x1','1x1', directory, 'fwd')
        
    FTest('1x1','2x1', directory, 'cen')
    FTest('1x1','2x1', directory, 'fwd')
    
    FTest('1x1','1x2', directory, 'cen')
    FTest('1x1','1x2', directory, 'fwd')
    
    FTest('1x1','3x1', directory, 'cen')
    FTest('1x1','3x1', directory, 'fwd')
    
    FTest('2x1','3x1', directory, 'cen')
    FTest('2x1','3x1', directory, 'fwd')
    
    FTest('2x2','3x1', directory, 'cen')
    FTest('2x2','3x1', directory, 'fwd')
    
    FTest('1x1','2x2', directory, 'cen')
    FTest('1x1','2x2', directory, 'fwd')
    
    FTest('1x2','2x2', directory, 'cen')
    FTest('1x2','2x2', directory, 'fwd')
    
    FTest('2x1','2x2', directory, 'cen')
    FTest('2x1','2x2', directory, 'fwd')

    FTest('2x2','3x1', directory, 'cen')
    FTest('2x2','3x1', directory, 'fwd')
    
    FTest('3x1','2x2', directory, 'cen')
    FTest('3x1','2x2', directory, 'fwd')
    
    FTest('0x0','1x1', directory, 'cen')
    FTest('0x0','1x1', directory, 'fwd')
    
    
    
    
    

