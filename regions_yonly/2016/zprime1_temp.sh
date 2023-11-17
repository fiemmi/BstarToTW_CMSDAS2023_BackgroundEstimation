#!/bin/sh

dir=/afs/cern.ch/user/m/mmorris/BackgroundEstimation/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/regions_yonly/2016
savedir=ttbarfits_inclusive
tag0=_2x1
tag=_2x3

# ZPrime 1% #



for MASS in 1000 1200 1400 1600 1800 2000 2500 3000 3500 4000 4500
do

    echo ''

    combineCards.py cen=$dir/ttbarfits_cen$tag0/signalZPrime${MASS}_1_area/card.txt fwd=$dir/ttbarfits_fwd$tag/signalZPrime${MASS}_1_area/card.txt > $dir/$savedir/signalZPrime${MASS}_1_area/signalZPrime${MASS}_1_card.txt

    echo 'combining data cards into '$dir'/'$savedir'/signalZPrime'${MASS}'_1_area/signalZPrime'${MASS}'_1_card.txt'
    
    
    echo "combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_1_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
    cd $dir/$savedir/signalZPrime${MASS}_1_area
    pwd    
#    combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_1_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
    combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_1_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 


done