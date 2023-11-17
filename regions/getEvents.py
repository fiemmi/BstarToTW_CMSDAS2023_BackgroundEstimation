#!/usr/bin/env python
# coding: utf-8

# In[1]:


from optparse import OptionParser
import subprocess
import array
from  array import array
import numpy as np
import json

import ROOT
from ROOT import TGraph, TLatex, TFile, TLine, TLegend, TCanvas, kOrange, kGreen, kTRUE, gStyle, gROOT

gStyle.SetOptStat(0)
gROOT.SetBatch(kTRUE)





ffwd0b = '/eos/home-m/mmorris/Documents/TTbarResonance/backgroundEstimate/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/regions/2016_ht950/ttbarfits_fwd0b_trigger_0x1/ttbar-RSGluon2000_area/plots_fit_b/all_plots.root'
fcen0b = '/eos/home-m/mmorris/Documents/TTbarResonance/backgroundEstimate/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/regions/2016_ht950/ttbarfits_cen0b_trigger_0x1/ttbar-RSGluon2000_area/plots_fit_b/all_plots.root'
ffwd1b = '/eos/home-m/mmorris/Documents/TTbarResonance/backgroundEstimate/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/regions/2016_ht950/ttbarfits_fwd1b_trigger_2x1/ttbar-RSGluon2000_area/plots_fit_b/all_plots.root'
fcen1b = '/eos/home-m/mmorris/Documents/TTbarResonance/backgroundEstimate/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/regions/2016_ht950/ttbarfits_cen1b_trigger_2x1/ttbar-RSGluon2000_area/plots_fit_b/all_plots.root'
ffwd2b = '/eos/home-m/mmorris/Documents/TTbarResonance/backgroundEstimate/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/regions/2016_ht950/ttbarfits_fwd2b_trigger_2x1/ttbar-RSGluon2000_area/plots_fit_b/all_plots.root'
fcen2b = '/eos/home-m/mmorris/Documents/TTbarResonance/backgroundEstimate/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/regions/2016_ht950/ttbarfits_cen2b_trigger_2x1/ttbar-RSGluon2000_area/plots_fit_b/all_plots.root'

rfwd0b = TFile.Open(ffwd0b)
rcen0b = TFile.Open(fcen0b)
rfwd1b = TFile.Open(ffwd1b)
rcen1b = TFile.Open(fcen1b)
rfwd2b = TFile.Open(ffwd2b)
rcen2b = TFile.Open(fcen2b)


fnames = [
    fcen0b,
    ffwd0b,
    fcen1b,
    ffwd1b,
    fcen2b,
    ffwd2b,
]



# In[3]:


# rcen0b.ls()


# In[4]:


c = TCanvas()
rcen2b.Get('data_obs_cen2bPass_prefit_projy1;1').Draw()
c.Draw()


# In[5]:





h = rcen2b.Get('data_obs_cen2bPass_prefit_projy1;1')
for b in range(h.GetNbinsX()):
    print b, h.GetBinContent(b), h.GetBinError(b), np.sqrt(h.GetBinContent(b))


# In[6]:


rfiles = [
    rcen0b,
    rfwd0b,
    rcen1b,
    rfwd1b,
    rcen2b,
    rfwd2b,
]

labels = [
    'cen0b',
    'fwd0b',
    'cen1b',
    'fwd1b',
    'cen2b',
    'fwd2b',
    
]


#print 'NTMJ'
total = 0
total_errors = 0
for i in range(len(fnames)):
#     print(labels[i])
#     print(rfiles[i])
#     print(rfiles[i].ls())
    
    rf = TFile.Open(fnames[i])
    

    h1 = rf.Get('QCD_'+labels[i]+'Pass_prefit_projy0;')
    h2 = rf.Get('QCD_'+labels[i]+'Pass_prefit_projy1;')
    h3 = rf.Get('QCD_'+labels[i]+'Pass_prefit_projy2;')
    
    events = 0
    for j in range(h1.GetNbinsX()):
        events += h1.GetBinContent(j)
    for j in range(h2.GetNbinsX()):
        events += h2.GetBinContent(j)
    for j in range(h3.GetNbinsX()):
        events += h3.GetBinContent(j)
    
    total += events
    
    errors = 0
    
    for b in range(h1.GetNbinsX()):
        errors += h1.GetBinError(b)
    for b in range(h2.GetNbinsX()):
        errors += h2.GetBinError(b)
    for b in range(h3.GetNbinsX()):
        errors += h3.GetBinError(b)
    
    total_errors += errors*errors
    print labels[i], '\t & ', int(events), ' \pm ', int(np.ceil(errors))
    
    rf.Close()

print 'total', '\t & ', int(total), ' \pm ', int(np.sqrt(total_errors))


# In[12]:


print 'TTbar'
total = 0
total_errors = 0
for i in range(len(fnames)):
#     print(labels[i])
#     print(rfiles[i])
#     print(rfiles[i].ls())
    
    rf = TFile.Open(fnames[i])
    

    h1 = rf.Get('16_TTbar_'+labels[i]+'Pass_prefit_projy0;')
    h2 = rf.Get('16_TTbar_'+labels[i]+'Pass_prefit_projy1;')
    h3 = rf.Get('16_TTbar_'+labels[i]+'Pass_prefit_projy2;')
    
    events = 0
    for j in range(h1.GetNbinsX()):
        events += h1.GetBinContent(j)
    for j in range(h2.GetNbinsX()):
        events += h2.GetBinContent(j)
    for j in range(h3.GetNbinsX()):
        events += h3.GetBinContent(j)
    
    total += events
    
    errors = 0
    
    for b in range(h1.GetNbinsX()):
        errors += h1.GetBinError(b)
    for b in range(h2.GetNbinsX()):
        errors += h2.GetBinError(b)
    for b in range(h3.GetNbinsX()):
        errors += h3.GetBinError(b)
    
    total_errors += errors*errors
    print labels[i], '\t & ', int(events), ' \pm ', int(np.ceil(errors))
    
    rf.Close()

print 'total', '\t & ', int(total), ' \pm ', int(np.sqrt(total_errors))


# In[25]:


print 'Data'
total = 0
total_errors = 0
for i in range(len(fnames)):
#     print(labels[i])
#     print(rfiles[i])
#     print(rfiles[i].ls())
    
    rf = TFile.Open(fnames[i])
    

    h1 = rf.Get('data_obs_'+labels[i]+'Pass_prefit_projy0;')
    h2 = rf.Get('data_obs_'+labels[i]+'Pass_prefit_projy1;')
    h3 = rf.Get('data_obs_'+labels[i]+'Pass_prefit_projy2;')
    
    events = 0
    for j in range(h1.GetNbinsX()):
        events += h1.GetBinContent(j)
    for j in range(h2.GetNbinsX()):
        events += h2.GetBinContent(j)
    for j in range(h3.GetNbinsX()):
        events += h3.GetBinContent(j)
    
    total += events
    
    errors = 0
    
    for b in range(h1.GetNbinsX()):
        errors += h1.GetBinError(b)*h1.GetBinError(b)
    for b in range(h2.GetNbinsX()):
        errors += h2.GetBinError(b)*h2.GetBinError(b)
    for b in range(h3.GetNbinsX()):
        errors += h3.GetBinError(b)*h3.GetBinError(b)
    
    total_errors += errors
    print labels[i], '\t & ', int(events), ' \pm ', int(np.ceil(np.sqrt(errors)))
    
    rf.Close()

print 'total', '\t & ', int(total), ' \pm ', int(np.sqrt(total_errors))


# In[13]:


print 'TotalBkg'
total = 0
total_errors = 0
for i in range(len(fnames)):
#     print(labels[i])
#     print(rfiles[i])
#     print(rfiles[i].ls())
    
    rf = TFile.Open(fnames[i])
    

    h1 = rf.Get('TotalBkg_'+labels[i]+'Pass_prefit_projy0;')
    h2 = rf.Get('TotalBkg_'+labels[i]+'Pass_prefit_projy1;')
    h3 = rf.Get('TotalBkg_'+labels[i]+'Pass_prefit_projy2;')
    
    events = 0
    for j in range(h1.GetNbinsX()):
        events += h1.GetBinContent(j)
    for j in range(h2.GetNbinsX()):
        events += h2.GetBinContent(j)
    for j in range(h3.GetNbinsX()):
        events += h3.GetBinContent(j)
    
    total += events
    
    errors = 0
    
    for b in range(h1.GetNbinsX()):
        errors += h1.GetBinError(b)*h1.GetBinError(b)
    for b in range(h2.GetNbinsX()):
        errors += h2.GetBinError(b)*h2.GetBinError(b)
    for b in range(h3.GetNbinsX()):
        errors += h3.GetBinError(b)*h3.GetBinError(b)
    
    total_errors += errors
    print labels[i], '\t & ', int(events), ' \pm ', int(np.ceil(np.sqrt(errors)))
    
    rf.Close()

print 'total', '\t & ', int(total), ' \pm ', int(np.sqrt(total_errors))


# In[52]:


h = rfwd2b.Get('QCD_fwd2bPass_prefit_2D;1').ProjectionY()


# In[41]:


h.ProjectionY().Draw("h")


# In[42]:


c.Draw()


# In[58]:


h.GetBinContent(4)


# In[74]:


total = 0
for i in range(h.GetNbinsX()):
    total += h.GetBinContent(i)
    print(h.GetBinContent(i))
print()
print(total)


# In[75]:


h.GetEntries()


# In[85]:


print 'TTbar'
for i in range(len(fnames)):
#     print(labels[i])
#     print(rfiles[i])
#     print(rfiles[i].ls())
    
    rf = TFile.Open(fnames[i])
    

    h1 = rf.Get('16_TTbar_'+labels[i]+'Pass_prefit_projy0;')
    h2 = rf.Get('16_TTbar_'+labels[i]+'Pass_prefit_projy1;')
    h3 = rf.Get('16_TTbar_'+labels[i]+'Pass_prefit_projy2;')
    
    events = h1.GetEntries() + h2.GetEntries() + h3.GetEntries()
    total += events
    
    errors = 0
    
    for b in range(h1.GetNbinsX()):
        errors += h1.GetBinError(b)
    for b in range(h2.GetNbinsX()):
        errors += h2.GetBinError(b)
    for b in range(h3.GetNbinsX()):
        errors += h3.GetBinError(b)
    
    total_errors += errors
    print labels[i], int(events), int(np.ceil(errors))
    
    rf.Close()


# In[15]:


print 'Data'
for i in range(len(fnames)):
#     print(labels[i])
#     print(rfiles[i])
#     print(rfiles[i].ls())
    
    rf = TFile.Open(fnames[i])
    

    h1 = rf.Get('data_obs_'+labels[i]+'Pass_prefit_projy0;')
    h2 = rf.Get('data_obs_'+labels[i]+'Pass_prefit_projy1;')
    h3 = rf.Get('data_obs_'+labels[i]+'Pass_prefit_projy2;')
    
    events = h1.GetEntries() + h2.GetEntries() + h3.GetEntries()
    total += events
    
    errors = 0
    
    for b in range(h1.GetNbinsX()):
        errors += h1.GetBinError(b)
    for b in range(h2.GetNbinsX()):
        errors += h2.GetBinError(b)
    for b in range(h3.GetNbinsX()):
        errors += h3.GetBinError(b)
    
    total_errors += errors
    print labels[i], int(events), int(np.ceil(errors))
    
#     rf.Close()


# In[16]:


total, total_errors


# In[12]:


np.ceil(total), np.ceil(total_errors)


# In[13]:


rf.ls()


# In[ ]:





# In[ ]:





# ## mt mass window event counts

# In[83]:


print 'TTbar'

ttbar_evts = []
ttbar_errs = []

total = 0
total_errors = 0
for i in range(len(fnames)):
#     print(labels[i])
#     print(rfiles[i])
#     print(rfiles[i].ls())
    
    rf = TFile.Open(fnames[i])
    

    h = rf.Get('16_TTbar_'+labels[i]+'Pass_prefit_projy1;')
    
    events = 0

    for j in range(h.GetNbinsX()):
        events += h.GetBinContent(j)
    
    total += events
    
    errors = 0
    
    for b in range(h.GetNbinsX()):
        errors += h.GetBinError(b) * h.GetBinError(b)

    
    total_errors += errors
    
    ttbar_evts.append(int(events))
    ttbar_errs.append(int(np.sqrt(errors)))

    print labels[i], '\t & ', int(events), ' \pm ', int(np.ceil(np.sqrt(errors)))
    
    rf.Close()
    

ttbar_evts.append(int(total))
ttbar_errs.append(int(np.sqrt(total_errors)))
    
print 'total', '\t & ', int(total), ' \pm ', int(np.sqrt(total_errors))


# In[84]:


print 'NTMJ'

ntmj_evts = []
ntmj_errs = []

total = 0
total_errors = 0
for i in range(len(fnames)):
#     print(labels[i])
#     print(rfiles[i])
#     print(rfiles[i].ls())
    
    rf = TFile.Open(fnames[i])
    

    h = rf.Get('QCD_'+labels[i]+'Pass_prefit_projy1;')
    
    events = 0

    for j in range(h.GetNbinsX()):
        events += h.GetBinContent(j)
    
    total += events
    
    errors = 0
    
    for b in range(h.GetNbinsX()):
        errors += h.GetBinError(b) * h.GetBinError(b)

    
    total_errors += errors
    
    ntmj_evts.append(int(events))
    ntmj_errs.append(int(np.sqrt(errors)))

    print labels[i], '\t & ', int(events), ' \pm ', int(np.ceil(np.sqrt(errors)))
    
    rf.Close()
    

ntmj_evts.append(int(total))
ntmj_errs.append(int(np.sqrt(total_errors)))
    
print 'total', '\t & ', int(total), ' \pm ', int(np.sqrt(total_errors))



print('\nTotal Bkg')

bkg_evts = []
bkg_errs = []
for i in range(len(ntmj_evts)):
    
    bkg_evts.append(int(ntmj_evts[i] + ttbar_evts[i]))
    bkg_errs.append(int(np.sqrt(ntmj_errs[i]*ntmj_errs[i] + ttbar_errs[i]*ntmj_errs[i])))
    
    
print(bkg_evts, bkg_errs)


# In[85]:


print 'Data'

data_evts = []
data_errs = []

total = 0
total_errors = 0
for i in range(len(fnames)):
#     print(labels[i])
#     print(rfiles[i])
#     print(rfiles[i].ls())
    
    rf = TFile.Open(fnames[i])
    

    h = rf.Get('data_obs_'+labels[i]+'Pass_prefit_projy1;')
    
    events = 0

    for j in range(h.GetNbinsX()):
        events += h.GetBinContent(j)
    
    total += events
    
    errors = 0
    
    for b in range(h.GetNbinsX()):
        errors += h.GetBinError(b) * h.GetBinError(b)

    
    total_errors += errors
    
    data_evts.append(int(events))
    data_errs.append(int(np.sqrt(errors)))

    print labels[i], '\t & ', int(events), ' \pm ', int(np.ceil(np.sqrt(errors)))
    
    rf.Close()
    

data_evts.append(int(total))
data_errs.append(int(np.sqrt(total_errors)))
    
print 'total', '\t & ', int(total), ' \pm ', int(np.sqrt(total_errors))


# In[86]:


counts = {
    'Deepak8' : data_evts + [b + t for b, t in zip(ntmj_evts, ttbar_evts)] + ttbar_evts,
}


# In[87]:


len(ttbar_evts), len(data_evts), len([b + t for b, t in zip(ntmj_evts, ttbar_evts)])


# In[88]:


df = pd.DataFrame(data=counts)


# In[89]:


df


# In[90]:


string = '''
\\begin{frame}
\\begin{table}
    \\resizebox{0.8\\textwidth}{!}{%
        \\begin{tabular}{@{}cccccc@{}}
        & \\textbf{Category} & \\textbf{2016 AN} & \\textbf{CMSv2 CSVv2} & \\textbf{CMSv2 DeepCSV} & \\textbf{DeepAK8 DeepCSV} \\\\ \\cline{1-6}
        \\multirow{6}{*}{Obs. Data}
        & 0bcen & $22313 \\pm 149$ & $22355  \\pm 149$  & $20152 \\pm 141$   & $ ''' + ' {0}  \\pm  {1} '.format(data_evts[0], data_errs[0]) + ''' $ \\\\ 
        & 0bfwd & $21836 \\pm 148$ & $21650  \\pm 147 $ & $19692 \\pm 140$   & $ ''' + ' {0}  \\pm  {1} '.format(data_evts[1], data_errs[1]) + ''' $ \\\\ 
        & 1bcen & $9368  \\pm 97$  & $8899   \\pm 95$   & $10082 \\pm 100$   & $ ''' + ' {0}  \\pm  {1} '.format(data_evts[2], data_errs[2]) + ''' $ \\\\ 
        & 1bfwd & $7973  \\pm 89$  & $7631   \\pm 87$   & $8976  \\pm  94$   & $ ''' + ' {0}  \\pm  {1} '.format(data_evts[3], data_errs[3]) + ''' $ \\\\ 
        & 2bcen & $2226  \\pm 47$  & $2190   \\pm 46$   & $3200  \\pm  56$   & $ ''' + ' {0}  \\pm  {1} '.format(data_evts[4], data_errs[4]) + ''' $ \\\\ 
        & 2bfwd & $1376  \\pm 37$  & $1381   \\pm 37$   & $2002  \\pm  44$   & $ ''' + ' {0}  \\pm  {1} '.format(data_evts[5], data_errs[5]) + ''' $ \\\\ 
        & Total & $65092 \\pm 255$ & $64106  \\pm 253$  & $64104 \\pm 253$   & $ ''' + ' {0}  \\pm  {1} '.format(data_evts[6], data_errs[6]) + ''' $ \\\\\\cline{1-6}\\\\\\cline{1-6}
        \\multirow{6}{*}{Total Bkg}
        & 0bcen & $22530 \\pm 815$ &  $22030  \\pm 178$   & $19884 \\pm 225$  & $ ''' + ' {0}  \\pm  {1} '.format(bkg_evts[0], bkg_errs[0]) + ''' $\\\\ 
        & 0bfwd & $21388 \\pm 758$ &  $21302  \\pm 163$   & $19492 \\pm 191$  & $ ''' + ' {0}  \\pm  {1} '.format(bkg_evts[1], bkg_errs[1]) + ''' $\\\\
        & 1bcen & $9883  \\pm 994$ &  $8998   \\pm 161$   & $10243 \\pm 381$  & $ ''' + ' {0}  \\pm  {1} '.format(bkg_evts[2], bkg_errs[2]) + '''  $\\\\ 
        & 1bfwd & $8227  \\pm 229$ &  $7667   \\pm 109$   & $8993  \\pm 210$  & $ ''' + ' {0}  \\pm  {1} '.format(bkg_evts[3], bkg_errs[3]) + '''  $\\\\ 
        & 2bcen & $2646 \\pm  317$ &  $2213   \\pm  92$   & $3200  \\pm 370$  & $ ''' + ' {0}  \\pm  {1} '.format(bkg_evts[4], bkg_errs[4]) + ''' $\\\\ 
        & 2bfwd & $1674 \\pm  212$ &  $1376   \\pm  52$   & $1993  \\pm 166$  & $ ''' + ' {0}  \\pm  {1} '.format(bkg_evts[5], bkg_errs[5]) + ''' $\\\\ 
        & Total & $66348 \\pm 1557$& $63589	 \\pm 327$   & $63807 \\pm 664$  & $  ''' + ' {0}  \\pm  {1} '.format(bkg_evts[6], bkg_errs[6]) + ''' $ \\\\\\cline{1-6}\\\\\\cline{1-6}
        \\multirow{7}{*}{SM $t\\bar{t}$}
        & 0bcen & $1261 \\pm 169 $  & $1058  \\pm 159$ & $603 \\pm  175$  &  $ ''' + ' {0}  \\pm  {1} '.format(ttbar_evts[0], ttbar_errs[0]) + ''' $ \\\\ 
        & 0bfwd & $812 \\pm  87  $    & $601   \\pm 150$ & $353 \\pm  150$&  $ ''' + ' {0}  \\pm  {1} '.format(ttbar_evts[1], ttbar_errs[1]) + ''' $ \\\\ 
        & 1bcen & $3347 \\pm 442 $  & $2729  \\pm 157$ & $2415 \\pm 370$  &  $ ''' + ' {0}  \\pm  {1} '.format(ttbar_evts[2], ttbar_errs[2]) + ''' $ \\\\ 
        & 1bfwd & $1980 \\pm 208 $  & $1493  \\pm 107$ & $1340 \\pm 200$  &  $ ''' + ' {0}  \\pm  {1} '.format(ttbar_evts[3], ttbar_errs[3]) + ''' $ \\\\ 
        & 2bcen & $2165 \\pm 309 $  & $1774  \\pm  92$ & $2424 \\pm 370$  &  $ ''' + ' {0}  \\pm  {1} '.format(ttbar_evts[4], ttbar_errs[4]) + ''' $\\\\ 
        & 2bfwd & $1205 \\pm 133 $   & $924   \\pm  52$ & $1256 \\pm 165$  & $ ''' + ' {0}  \\pm  {1} '.format(ttbar_evts[5], ttbar_errs[5]) + ''' $\\\\
        & Total & $10770 \\pm 623 $ & $8581  \\pm 308$ & $8394 \\pm 628$   & $ ''' + ' {0}  \\pm  {1} '.format(ttbar_evts[6], ttbar_errs[6]) + ''' $  \\\\\\cline{1-6}
      \\end{tabular}
    }
    \\caption{ \\tiny Comparison of previous analysis ({\\bf 2016 AN}) and this analysis with the same taggers
    ({\\bf CMSv2 \\& CSVv2}) and new taggers ({\\bf DeepAK8 \\& DeepCSV}).}
  \\label{Table1_2016}
    \\end{table}
\\end{frame}




'''


# In[91]:


print(string)


# In[1]:





# In[ ]:


fH = util.load('outputs/medium_loop/JetHT_2016H_noSyst_mcut.coffea')

