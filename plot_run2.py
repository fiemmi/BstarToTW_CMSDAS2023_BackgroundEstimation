#plot.py

import math
import  ROOT 
from style import *


savedirname = 'results'

savedir = savedirname+'/2016/cen/ttbarfits_cen2016_limit_0x0'



projy = "projy2"
category = "cen"
log=False
prefit=True

def _make_pull_plot(data, bkg):
        pull = data.Clone(data.GetName()+"_pull")
        pull.Add(bkg,-1)
        
        sigma = 0.0
        for ibin in range(1,pull.GetNbinsX()+1):
            d = data.GetBinContent(ibin)
            b = bkg.GetBinContent(ibin)
            if d >= b:
                derr = data.GetBinErrorLow(ibin)
                berr = bkg.GetBinErrorUp(ibin)
            elif d < b:
                derr = data.GetBinErrorUp(ibin)
                berr = bkg.GetBinErrorLow(ibin)
            
            if d == 0:
                derr = 1

            sigma = math.sqrt(derr*derr + berr*berr)
            if sigma != 0:
                pull.SetBinContent(ibin, (pull.GetBinContent(ibin))/sigma)
            else:
                pull.SetBinContent(ibin, 0.0 )

        pull.SetFillColor(ROOT.kGray)
        pull.SetLineColor(ROOT.kGray)
        return pull




    
    
    

prefit_postfit_string = 'prefit' if prefit else 'postfit'
 
for category in ['cen', 'fwd']:
# for category in ['fwd']:
    
    if category == "cen":
    
        savedir = savedirname+'/2016/cen/ttbarfits_cen2016_limit_0x0'


        file_1 = savedir+"/ttbar-RSGluon2000_area/plots_fit_b/all_plots.root"
        file_2 = savedir.replace('2016','2017')+"/ttbar-RSGluon2000_area/plots_fit_b/all_plots.root"
        file_3 = savedir.replace('2016','2018').replace('0x1','2x1')+"/ttbar-RSGluon2000_area/plots_fit_b/all_plots.root"

        file_1_ = ROOT.TFile.Open(file_1)
        file_2_ = ROOT.TFile.Open(file_2)
        file_3_ = ROOT.TFile.Open(file_3)

    elif category == "fwd":

        savedir = savedirname+'/2016/fwd/ttbarfits_fwd2016_limit_0x0'

        file_1 = savedir.replace('1x1','2x1')+"/ttbar-RSGluon2000_area/plots_fit_b/all_plots.root"
        file_2 = savedir.replace('2016','2017')+"/ttbar-RSGluon2000_area/plots_fit_b/all_plots.root"
        file_3 = savedir.replace('2016','2018')+"/ttbar-RSGluon2000_area/plots_fit_b/all_plots.root"

        file_1_ = ROOT.TFile.Open(file_1)
        file_2_ = ROOT.TFile.Open(file_2)
        file_3_ = ROOT.TFile.Open(file_3)
        
        
#     for region in ['Pass', 'Fail']: 
        
    for region in ['Pass','Fail']:

#         for year in ['2016', '2017', '2018', 'run2']:
        for year in ['2017']:
            
            for projy in ['projy0', 'projy1', 'projy2','projx0','projx1','projx2']:

                if '2016' in year:

                    print "QCD_"+category+"16"+region+"_"+prefit_postfit_string+"_"+str(projy)

                    histogram_1_QCD  = file_1_.Get("QCD_"+category+"16"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_TTbar  = file_1_.Get("16_TTbar_"+category+"16"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_Data  = file_1_.Get("data_obs_"+category+"16"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_totbkg = file_1_.Get("TotalBkg_"+category+"16"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_RSGluon2000  = file_1_.Get("16_signalRSGluon2000_"+category+"16"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    
                    
                    if prefit:
                        histogram_1_QCD = histogram_1_Data.Clone()
                        histogram_1_QCD.Add(-1 * histogram_1_TTbar)
                        histogram_1_totbkg = histogram_1_QCD.Clone()
                        histogram_1_totbkg.Add(histogram_1_TTbar)


                elif '2017' in year:

                    histogram_1_QCD  = file_2_.Get("QCD_"+category+"17"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_TTbar  = file_2_.Get("17_TTbar_"+category+"17"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_Data  = file_2_.Get("data_obs_"+category+"17"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_totbkg = file_2_.Get("TotalBkg_"+category+"17"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_RSGluon2000  = file_2_.Get("17_signalRSGluon2000_"+category+"17"+region+"_"+prefit_postfit_string+"_"+str(projy))

                    if prefit:
                        histogram_1_QCD = histogram_1_Data.Clone()
                        histogram_1_QCD.Add(-1 * histogram_1_TTbar)
                        histogram_1_totbkg = histogram_1_QCD.Clone()
                        histogram_1_totbkg.Add(histogram_1_TTbar)


                elif '2018' in year:

                    histogram_1_QCD  = file_3_.Get("QCD_"+category+"18"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_TTbar  = file_3_.Get("18_TTbar_"+category+"18"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_Data  = file_3_.Get("data_obs_"+category+"18"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_totbkg = file_3_.Get("TotalBkg_"+category+"18"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_RSGluon2000  = file_3_.Get("18_signalRSGluon2000_"+category+"18"+region+"_"+prefit_postfit_string+"_"+str(projy))

                    if prefit:
                        histogram_1_QCD = histogram_1_Data.Clone()
                        histogram_1_QCD.Add(-1 * histogram_1_TTbar)
                        histogram_1_totbkg = histogram_1_QCD.Clone()
                        histogram_1_totbkg.Add(histogram_1_TTbar)


                elif 'run2' in year:

                    histogram_1_QCD  = file_1_.Get("QCD_"+category+"16"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_TTbar  = file_1_.Get("16_TTbar_"+category+"16"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_Data  = file_1_.Get("data_obs_"+category+"16"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_totbkg = file_1_.Get("TotalBkg_"+category+"16"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_1_RSGluon2000  = file_1_.Get("16_signalRSGluon2000_"+category+"16"+region+"_"+prefit_postfit_string+"_"+str(projy))



                    histogram_2_QCD  = file_2_.Get("QCD_"+category+"17"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_2_TTbar  = file_2_.Get("17_TTbar_"+category+"17"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_2_Data  = file_2_.Get("data_obs_"+category+"17"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_2_totbkg = file_2_.Get("TotalBkg_"+category+"17"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_2_RSGluon2000  = file_2_.Get("17_signalRSGluon2000_"+category+"17"+region+"_"+prefit_postfit_string+"_"+str(projy))




                    histogram_3_QCD  = file_3_.Get("QCD_"+category+"18"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_3_TTbar  = file_3_.Get("18_TTbar_"+category+"18"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_3_Data  = file_3_.Get("data_obs_"+category+"18"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_3_totbkg = file_3_.Get("TotalBkg_"+category+"18"+region+"_"+prefit_postfit_string+"_"+str(projy))
                    histogram_3_RSGluon2000  = file_3_.Get("18_signalRSGluon2000_"+category+"18"+region+"_"+prefit_postfit_string+"_"+str(projy))



                    if prefit:
                        histogram_1_QCD = histogram_1_Data.Clone()
                        histogram_2_QCD = histogram_2_Data.Clone()
                        histogram_3_QCD = histogram_3_Data.Clone()

                        histogram_1_QCD.Add(-1 * histogram_1_TTbar)
                        histogram_2_QCD.Add(-1 * histogram_2_TTbar)
                        histogram_3_QCD.Add(-1 * histogram_3_TTbar)


                        histogram_1_totbkg = histogram_1_QCD.Clone()
                        histogram_2_totbkg = histogram_2_QCD.Clone()
                        histogram_3_totbkg = histogram_3_QCD.Clone()

                        histogram_1_totbkg.Add(histogram_1_TTbar)
                        histogram_2_totbkg.Add(histogram_2_TTbar)
                        histogram_3_totbkg.Add(histogram_3_TTbar)
                        
                        




                    histogram_1_QCD.Add(histogram_2_QCD)
                    histogram_1_QCD.Add(histogram_3_QCD)
                    histogram_1_TTbar.Add(histogram_2_TTbar)
                    histogram_1_TTbar.Add(histogram_3_TTbar)
                    histogram_1_Data.Add(histogram_2_Data)
                    histogram_1_Data.Add(histogram_3_Data)
                    #%%%%%%%%%%%% Total background uncertainties %%%%%%%%%%%%%%%%%%%%%%
                    histogram_1_totbkg.Add(histogram_2_totbkg)
                    histogram_1_totbkg.Add(histogram_3_totbkg)
                    #%%%%%%%%%%%% signal %%%%%%%%%%%%%%%%%%%%%%
                    histogram_1_RSGluon2000.Add(histogram_2_RSGluon2000)
                    histogram_1_RSGluon2000.Add(histogram_3_RSGluon2000)




                histogram_1_QCD.SetTitle("")
                histogram_1_QCD.GetXaxis().SetTitle("")
                histogram_1_QCD.GetYaxis().SetTitle("")

                histogram_1_TTbar.SetTitle("")
                histogram_1_TTbar.GetXaxis().SetTitle("")
                histogram_1_TTbar.GetYaxis().SetTitle("")

                histogram_1_Data.SetTitle("")
                histogram_1_Data.GetXaxis().SetTitle("")
                histogram_1_Data.GetYaxis().SetTitle("")
                
                
                histogram_1_RSGluon2000.SetTitle("")
                histogram_1_RSGluon2000.GetXaxis().SetTitle("")
                histogram_1_RSGluon2000.GetYaxis().SetTitle("")

                canvas = makeCanvas()
                canvas.cd()

                canvas.SetBottomMargin(0.1)
                canvas.SetLeftMargin(0.13)
                canvas.SetRightMargin(0.1)

                pad1 = ROOT.TPad("pad1","pad1",0, 0.32, 1, 1)
                pad1.SetBottomMargin(0.02)
                pad1.SetLeftMargin(0.13)
                pad1.SetRightMargin(0.1)
                pad1.SetBorderMode(0)

                pad2 = ROOT.TPad("pad2","pad2",0, 0, 1, 0.32)
                pad2.SetFillStyle(4000)
                pad2.SetTopMargin(0.0)
                pad2.SetBottomMargin(0.3)
                pad2.SetLeftMargin(0.13)
                pad2.SetRightMargin(0.1)
                pad2.SetBorderMode(0)


                pad1.Draw()
                pad2.Draw()

                makeCMSText(0.15, 0.92, additionalText=" Preliminary")
                lumi = {"2016": 36, "2017": 41.5, "2018": 60, "run2": 138}
                makeLumiText(0.9, 0.96, year=year, lumi=lumi[year])

                if projy=="projy0" : 
                    text = makeText(0.15, 0.87, 0.7, 0.87, "25 < m_{t}< 105 GeV ")

                elif projy=="projy1" :
                    text = makeText(0.15, 0.87, 0.7, 0.87, "105 < m_{t}< 210 GeV ")
                    
                elif projy=="projy2" :
                    text = makeText(0.15, 0.87, 0.7, 0.87, "210 < m_{t}< 475 GeV ")

                #text =makeText(0.43, 0.87, 0.7, 0.87,"")
                #text.SetTextFont(63)
                #text.SetTextSize(31)


                pad1.cd()


                histogram_1_QCD.SetFillColor(ROOT.kYellow)
                histogram_1_QCD.SetLineColor(ROOT.kYellow)

                histogram_1_TTbar.SetFillColor(ROOT.kRed)
                histogram_1_TTbar.SetLineColor(ROOT.kRed)
                
                histogram_1_RSGluon2000.SetLineColor(ROOT.kBlack)
                histogram_1_RSGluon2000.SetLineStyle(2)
                histogram_1_RSGluon2000.SetLineWidth(2)

                
                ############# THSTack 


                hs =  ROOT.THStack("hs","")

                hs.Add(histogram_1_TTbar)
                hs.Add(histogram_1_QCD)



                histogram_1_Data.SetMarkerStyle(8) 
                histogram_1_Data.SetMarkerSize(1.5) 



                
                histogram_1_Data.SetBinErrorOption(ROOT.TH1.kPoisson)
                histogram_1_Data.GetYaxis().SetLabelSize(0.07)
                histogram_1_Data.GetYaxis().SetTitleSize(0.05)
                histogram_1_Data.GetYaxis().SetTitleOffset(0.9)
                histogram_1_Data.GetYaxis().SetTitle("Events / Bin")
                histogram_1_Data.GetYaxis().SetMaxDigits(10)
                histogram_1_Data.GetXaxis().SetLabelSize(0.07)
                histogram_1_Data.GetXaxis().SetTitleSize(0.09)
                histogram_1_Data.GetXaxis().SetLabelOffset(0.05)
                histogram_1_Data.GetXaxis().SetNdivisions(504)
                histogram_1_Data.GetXaxis().SetLabelSize(0)
                histogram_1_Data.GetXaxis().SetMaxDigits(10)
                if log == True : 
                     histogram_1_Data.SetMaximum(1e7)
                     histogram_1_Data.SetMinimum(0.005)
                     histogram_1_TTbar.SetMinimum(0.005)
                     histogram_1_QCD.SetMinimum(0.005)
                     hs.SetMinimum(0.005)
                     histogram_1_totbkg.SetMinimum(0.005)
                     histogram_1_RSGluon2000.SetMinimum(0.005)

                else : 
                     histogram_1_Data.SetMaximum(1.5*histogram_1_Data.GetMaximum())
#                      histogram_1_Data.SetMaximum(50)
                #histogram_1_Data.SetMinimum(1e-3)

                log_ =''
                if log == True:
                    pad1.SetLogy()
                    log_ = 'logy' 

                pull = _make_pull_plot(histogram_1_Data, histogram_1_totbkg)

                histogram_1_totbkg.SetMarkerStyle(0)
                totalBkg_err = histogram_1_totbkg.Clone()
                histogram_1_totbkg.SetLineColor(ROOT.kBlack)
                totalBkg_err.SetLineColor(ROOT.kBlack)
                totalBkg_err.SetLineWidth(0)
                totalBkg_err.SetFillColor(ROOT.kBlack)
                totalBkg_err.SetFillStyle(3354)


                histogram_1_Data.Draw("pe X0")
                hs.Draw("hist SAME")
                histogram_1_totbkg.Draw("HIST SAME")
                totalBkg_err.Draw("E2 SAME")
                histogram_1_Data.Draw("pe X0 SAME")
                histogram_1_RSGluon2000.Draw("HIST SAME")


                lumiE = ROOT.TLatex()
                lumiE.SetNDC()
                lumiE.SetTextAngle(0)
                lumiE.SetTextColor(ROOT.kBlack)
                lumiE.SetTextFont(42)
                lumiE.SetTextAlign(31) 
                lumiE.SetTextSize(0.06)
                if 'cen' in category:
                    lumiE.DrawLatex(0.25, 0.68,"#bf{central}")
                elif 'fwd' in category:
                    lumiE.DrawLatex(0.25, 0.68,"#bf{forward}")



                pad2.cd()

                pull.SetStats(0)
                pull.SetTitleOffset(1.15,"xy")

                pull.GetXaxis().SetLabelSize(0.11)
                pull.GetXaxis().SetTitleSize(0.11)
                pull.GetXaxis().SetTitleOffset(1.3)  
                pull.GetYaxis().SetTitleOffset(0.4) 
                pull.GetYaxis().SetLabelSize(0.07)
                pull.GetYaxis().SetTitleSize(0.11)
                pull.GetYaxis().SetNdivisions(504)
                pull.GetYaxis().SetTitle("(Data-Bkg)/#sigma")
                pull.GetYaxis().SetLabelFont(42)
                pull.GetYaxis().SetLabelSize(0.13)
                pull.GetYaxis().SetRangeUser(-2.9,2.9)
                
                if 'projy' in projy:
                    pull.GetXaxis().SetTitle("m_{t#bar{t}} [GeV]")
                else:
                    pull.GetXaxis().SetTitle("m_{t} [GeV]")
                pull.Draw("hist")

                ##%%%%%%%%%%%%% LEGEND
                pad1.cd()
                legend = makeLegend(0.65, 0.5, 0.8, 0.88)
                legend.SetBorderSize(0)
                legend.AddEntry(histogram_1_Data,'Data',"P EX0")
                legend.AddEntry(histogram_1_QCD,'QCD',"F")
                legend.AddEntry(histogram_1_TTbar,'t#bar{t}',"F")
                legend.AddEntry(histogram_1_RSGluon2000,'2 TeV g_{KK}',"l")
                legend.AddEntry(totalBkg_err,'Stat+Syst',"F")
                
                legend.Draw()

                #canvas.SaveAs("closure_combined/test_combination_"+str(category)+"_"+str(projy)+"_"+str(log_)+".pdf")
                canvas.SaveAs(savedirname+"/plots_0x0/"+year+"_"+str(category)+region+"_"+prefit_postfit_string+"_"+str(projy)+"_"+str(log_)+"_blind.pdf")
                canvas.SaveAs(savedirname+"/plots_0x0/"+year+"_"+str(category)+region+"_"+prefit_postfit_string+"_"+str(projy)+"_"+str(log_)+"_blind.png")

                
                canvas.Close()
                del canvas

