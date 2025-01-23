from time import time
import os, sys
import json
from TwoDAlphabet import plot


# main directory
maindir = '/eos/home-m/mmorris/Documents/TTbarResonance/backgroundEstimate/restarting_10172023/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/newSFs'


# subdirectories for year and rapidity regions
directories = [
    '2016/cen/ttbarfits_cen2016_limit_0x0/signalRSGluon2000_area/',
    '2016/fwd/ttbarfits_fwd2016_limit_0x0/signalRSGluon2000_area/',
    '2017/cen/ttbarfits_cen2017_limit_0x0/signalRSGluon2000_area/',
    '2017/fwd/ttbarfits_fwd2017_limit_0x0/signalRSGluon2000_area/',
    '2018/cen/ttbarfits_cen2018_limit_0x0/signalRSGluon2000_area/',
    '2018/fwd/ttbarfits_fwd2018_limit_0x0/signalRSGluon2000_area/'
]




# number of toys for signal injection tests
nToys = '100'



# expected signals for 1 and 5 TeV RSGluons
expect_signal_RSGluon1000 = 0.1
expect_signal_RSGluon5000 = 0.05


# list of all expected signals for signal injection tests
expect_signal_list = [
    0.0,
    1.0,
    expect_signal_RSGluon1000,
    expect_signal_RSGluon5000
]




# make workspace in each subdirectory
for wdir in directories:
    
    cmd = 'text2workspace.py '+wdir+'card.txt --channel-masks -o '+wdir+'workspace.root'
    print cmd
    os.system(cmd)
    del cmd

    
    
    
# run signal injection tests
for wdir in directories:
    
    if '2017' in wdir:
        regionname = 'cen17'
        if 'fwd' in wdir: regionname = 'fwd17'
    elif '2018' in wdir: 
        regionname = 'cen18'
        if 'fwd' in wdir: regionname = 'fwd18'
    else: 
        regionname = 'cen16'
        if 'fwd' in wdir: regionname = 'fwd16'
    
    os.chdir(wdir)
    
    for expect_signal in expect_signal_list:
        
        expect_signal_string = str(expect_signal).replace('.','p')
        
        
        # signal injection command
        cmd = 'combine -M FitDiagnostics -d workspace.root --skipBOnlyFit --cminDefaultMinimizerStrategy 0 -t '+nToys+' --toysFrequentist --bypassFrequentistFit  -s 123456 --rMin -5 --rMax 5 -n _sigInj_r'+expect_signal_string+'_123456 -v 0 --expectSignal='+str(expect_signal)+' --setParameters mask_cen16Pass_SIG=1'
        
        print cmd.replace('cen16',regionname)
        os.system(cmd.replace('cen16',regionname))
        

        # plot signal injection and signal injection pull plots
        plot.plot_signalInjection('.', '', injectedAmount=expect_signal, seed=123456, stats=True, condor=False)
        
        # copy plots into stat_tests directory
        os.system('cp signalInjection_r'+expect_signal_string+'.png '+maindir+'/stat_tests/signalInjection_r'+expect_signal_string+'_' + wdir[5:8] + wdir[:4] + '.png')
        os.system('cp signalInjection_r'+expect_signal_string+'_pull.png '+maindir+'/stat_tests/signalInjection_r'+expect_signal_string+'_' + wdir[5:8] + wdir[:4] + '_pull.png')

    
    os.chdir(maindir)

    

    

    
