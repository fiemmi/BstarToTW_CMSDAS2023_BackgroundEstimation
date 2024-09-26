from time import time
import os, sys
import json
from TwoDAlphabet import plot


directories = [
     '2016/cen/ttbarfits_cen2016_limit_0x0/signalRSGluon2000_area/',
     '2016/fwd/ttbarfits_fwd2016_limit_0x0/signalRSGluon2000_area/',
     '2017/cen/ttbarfits_cen2017_limit_0x0/signalRSGluon2000_area/',
     '2017/fwd/ttbarfits_fwd2017_limit_0x0/signalRSGluon2000_area/',
    '2018/cen/ttbarfits_cen2018_limit_0x0/signalRSGluon2000_area/',
     '2018/fwd/ttbarfits_fwd2018_limit_0x0/signalRSGluon2000_area/'
]

# make workspace


maindir = '/eos/home-m/mmorris/Documents/TTbarResonance/backgroundEstimate/restarting_10172023/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/an_v6'

for wdir in directories:
    
    cmd = 'text2workspace.py '+wdir+'card.txt --channel-masks -o '+wdir+'workspace.root'
    print cmd
    os.system(cmd)
    del cmd

    
    
# run goodness of fit


gof_cmds = [
    'combine -M GoodnessOfFit -d workspace.root --algo=saturated -n _gof_data --setParameters mask_cen16Pass_SIG=1',
    'combine -M GoodnessOfFit -d workspace.root --algo=saturated --toysFrequentist --bypassFrequentistFit -t 100 -n _gof_toys --setParameters mask_cen16Pass_SIG=1 -s 12345',
    'combine -M GoodnessOfFit -d workspace.root --algo=saturated --toysFrequentist --bypassFrequentistFit -t 100 -n _gof_toys --setParameters mask_cen16Pass_SIG=1 -s 78632',
    'combine -M GoodnessOfFit -d workspace.root --algo=saturated --toysFrequentist --bypassFrequentistFit -t 100 -n _gof_toys --setParameters mask_cen16Pass_SIG=1 -s 32577',
    'combine -M GoodnessOfFit -d workspace.root --algo=saturated --toysFrequentist --bypassFrequentistFit -t 100 -n _gof_toys --setParameters mask_cen16Pass_SIG=1 -s 86771',
    'combine -M GoodnessOfFit -d workspace.root --algo=saturated --toysFrequentist --bypassFrequentistFit -t 100 -n _gof_toys --setParameters mask_cen16Pass_SIG=1 -s 54321',
    'cp higgsCombine_gof_data.GoodnessOfFit.mH120.root data_run.root',
    'hadd toys_run.root higgsCombine_gof_toys.GoodnessOfFit.mH120.*root',
    'combineTool.py -M CollectGoodnessOfFit --input data_run.root toys_run.root -m 120 -o gof.json',
    'plotGof.py gof.json --statistic saturated --mass 120.0 -o gof_plot --title-right="35.9 fb^{-1} (13 TeV)"'
]
    
si_cmds = [
#     'combine -M FitDiagnostics -d workspace.root --skipBOnlyFit --cminDefaultMinimizerStrategy 0 -t 100 --toysFrequentist --bypassFrequentistFit  -s 123456 --rMin -5 --rMax 5 -n _sigInj_r0p0_123456 -v 0 --expectSignal=0.0 --setParameters mask_cen16Pass_SIG=1',
#     'combine -M FitDiagnostics -d workspace.root --skipBOnlyFit --cminDefaultMinimizerStrategy 0 -t 100 --toysFrequentist --bypassFrequentistFit  -s 123456 --rMin -5 --rMax 5 -n _sigInj_r1p0_123456 -v 0 --expectSignal=1.0 --setParameters mask_cen16Pass_SIG=1',
#     'combine -M FitDiagnostics -d workspace.root --skipBOnlyFit --cminDefaultMinimizerStrategy 0 -t 100 --toysFrequentist --bypassFrequentistFit  -s 123456 --rMin -5 --rMax 5 -n _sigInj_r0p1_123456 -v 0 --expectSignal=0.1 --setParameters mask_cen16Pass_SIG=1',

]
    
# for wdir in directories:
    
#     if '2017' in wdir:
#         regionname = 'cen17'
#         if 'fwd' in wdir: regionname = 'fwd17'
#     elif '2018' in wdir: 
#         regionname = 'cen18'
#         if 'fwd' in wdir: regionname = 'fwd18'
#     else: 
#         regionname = 'cen16'
#         if 'fwd' in wdir: regionname = 'fwd16'
    
#     os.chdir(wdir)
    
#     for cmd in si_cmds:
#         print cmd.replace('cen16',regionname)
#         os.system(cmd.replace('cen16',regionname))
        

#     os.chdir(maindir)
    
        
# #     plot.plot_signalInjection(wdir, '', injectedAmount=0.0, seed=123456, stats=True, condor=False)
# #     plot.plot_signalInjection(wdir, '', injectedAmount=1.0, seed=123456, stats=True, condor=False)
    
    
#     plot.plot_signalInjection(wdir, '', injectedAmount=0.07, seed=123456, stats=True, condor=False)
        
    
        
#     os.system('cp '+wdir+'signalInjection_r0p0.png '+maindir+'/stat_tests/signalInjection_r0p0_' + wdir[5:8] + wdir[:4] + '.png')
#     os.system('cp '+wdir+'signalInjection_r1p0.png '+maindir+'/stat_tests/signalInjection_r1p0_' + wdir[5:8] + wdir[:4] + '.png')
#     os.system('cp '+wdir+'signalInjection_r0p0_pull.png '+maindir+'/stat_tests/signalInjection_r0p0_pull_' + wdir[5:8] + wdir[:4] + '.png')
#     os.system('cp '+wdir+'signalInjection_r1p0_pull.png '+maindir+'/stat_tests/signalInjection_r1p0_pull_' + wdir[5:8] + wdir[:4] + '.png')
    
    
#     os.system('cp '+wdir+'signalInjection_r0p1.png '+maindir+'/stat_tests/signalInjection_r0p1_' + wdir[5:8] + wdir[:4] + '.png')

#     os.system('cp '+wdir+'signalInjection_r0p1_pull.png '+maindir+'/stat_tests/signalInjection_r0p1_pull_' + wdir[5:8] + wdir[:4] + '.png')  
    
    
for wdir in directories:
    
    if '2017' in wdir:
        gof_cmds[-1] = 'plotGof.py gof.json --statistic saturated --mass 120.0 -o gof_plot --title-right="41.5 fb^{-1} (13 TeV)"'
        regionname = 'cen17'
        if 'fwd' in wdir: regionname = 'fwd17'
    elif '2018' in wdir:
        gof_cmds[-1] = 'plotGof.py gof.json --statistic saturated --mass 120.0 -o gof_plot --title-right="60 fb^{-1} (13 TeV)"'
        regionname = 'cen18'
        if 'fwd' in wdir: regionname = 'fwd18'
    else:
        regionname = 'cen16'
        if 'fwd' in wdir: regionname = 'fwd16'
    
    os.chdir(wdir)
    
    for cmd in gof_cmds:
        print cmd.replace('cen16',regionname)
        os.system(cmd.replace('cen16',regionname))
        
        
    os.system('cp gof_plot.png '+maindir+'/stat_tests/gof_plot_' + wdir[5:8] + wdir[:4] + '_0p6.png')
    os.system('cp gof_plot.pdf '+maindir+'/stat_tests/gof_plot_' + wdir[5:8] + wdir[:4] + '_0p6.pdf')
    
    os.chdir(maindir)
    
