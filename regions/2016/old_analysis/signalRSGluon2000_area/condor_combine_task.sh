#!/bin/sh
ulimit -s unlimited
set -e
cd /afs/cern.ch/user/m/mmorris/BackgroundEstimation/CMSSW_10_6_14/src
export SCRAM_ARCH=slc7_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh
eval `scramv1 runtime -sh`
cd //afs/cern.ch/user/m/mmorris/BackgroundEstimation/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/regions/2016/ttbarfits_inclusive/signalRSGluon2000_area

if [ $1 -eq 0 ]; then
  combine --saveWorkspace --cminDefaultMinimizerStrategy 0 -v 0 -M AsymptoticLimits -d signalRSGluon2000_card.txt -n .Test
fi