#!/bin/sh

dir=/afs/cern.ch/user/m/mmorris/BackgroundEstimation/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/regions/2016
savedir=ttbarfits_inclusive
tag0=_0x1
tag=_3x1



# ZPRIME 10% WIDTH #

echo "combineTool.py -M AsymptoticLimits -d signalZPrime1000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 "
cd /$dir/$savedir/signalZPrime1000_10_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime1000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 
echo "combineTool.py -M AsymptoticLimits -d signalZPrime2000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 "
cd /$dir/$savedir/signalZPrime2000_10_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime2000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 
echo "combineTool.py -M AsymptoticLimits -d signalZPrime3000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 "
cd /$dir/$savedir/signalZPrime3000_10_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime3000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 
echo "combineTool.py -M AsymptoticLimits -d signalZPrime4000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 "
cd /$dir/$savedir/signalZPrime4000_10_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime4000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 



