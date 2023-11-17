#!/bin/sh

dir=/afs/cern.ch/user/m/mmorris/BackgroundEstimation/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/regions/2017
savedir=ttbarfits_inclusive
tag0=_0x1
tag=_3x1


mkdir $dir/$savedir
cp -rp ttbarfits_cen2b$tag/signal* $dir/$savedir
cp ttbarfits_cen2b$tag/*root $dir/$savedir



combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalRSGluon1000_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalRSGluon1000_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalRSGluon1000_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalRSGluon1000_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalRSGluon1000_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalRSGluon1000_area/card.txt > $dir/$savedir/signalRSGluon1000_area/signalRSGluon1000_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalRSGluon1000_area/signalRSGluon1000_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalRSGluon1500_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalRSGluon1500_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalRSGluon1500_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalRSGluon1500_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalRSGluon1500_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalRSGluon1500_area/card.txt > $dir/$savedir/signalRSGluon1500_area/signalRSGluon1500_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalRSGluon1500_area/signalRSGluon1500_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalRSGluon2000_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalRSGluon2000_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalRSGluon2000_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalRSGluon2000_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalRSGluon2000_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalRSGluon2000_area/card.txt > $dir/$savedir/signalRSGluon2000_area/signalRSGluon2000_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalRSGluon2000_area/signalRSGluon2000_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalRSGluon2500_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalRSGluon2500_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalRSGluon2500_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalRSGluon2500_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalRSGluon2500_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalRSGluon2500_area/card.txt > $dir/$savedir/signalRSGluon2500_area/signalRSGluon2500_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalRSGluon2500_area/signalRSGluon2500_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalRSGluon3000_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalRSGluon3000_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalRSGluon3000_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalRSGluon3000_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalRSGluon3000_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalRSGluon3000_area/card.txt > $dir/$savedir/signalRSGluon3000_area/signalRSGluon3000_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalRSGluon3000_area/signalRSGluon3000_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalRSGluon3500_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalRSGluon3500_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalRSGluon3500_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalRSGluon3500_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalRSGluon3500_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalRSGluon3500_area/card.txt > $dir/$savedir/signalRSGluon3500_area/signalRSGluon3500_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalRSGluon3500_area/signalRSGluon3500_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalRSGluon4000_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalRSGluon4000_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalRSGluon4000_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalRSGluon4000_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalRSGluon4000_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalRSGluon4000_area/card.txt > $dir/$savedir/signalRSGluon4000_area/signalRSGluon4000_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalRSGluon4000_area/signalRSGluon4000_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalRSGluon4500_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalRSGluon4500_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalRSGluon4500_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalRSGluon4500_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalRSGluon4500_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalRSGluon4500_area/card.txt > $dir/$savedir/signalRSGluon4500_area/signalRSGluon4500_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalRSGluon4500_area/signalRSGluon4500_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalRSGluon5000_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalRSGluon5000_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalRSGluon5000_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalRSGluon5000_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalRSGluon5000_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalRSGluon5000_area/card.txt > $dir/$savedir/signalRSGluon5000_area/signalRSGluon5000_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalRSGluon5000_area/signalRSGluon5000_card.txt'


# ZPRIME DM #

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime1000_DM_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime1000_DM_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime1000_DM_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime1000_DM_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime1000_DM_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime1000_DM_area/card.txt > $dir/$savedir/signalZPrime1000_DM_area/signalZPrime1000_DM_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime1000_DM_area/signalZPrime1000_DM_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime1500_DM_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime1500_DM_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime1500_DM_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime1500_DM_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime1500_DM_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime1500_DM_area/card.txt > $dir/$savedir/signalZPrime1500_DM_area/signalZPrime1500_DM_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime1500_DM_area/signalZPrime1500_DM_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime2000_DM_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime2000_DM_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime2000_DM_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime2000_DM_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime2000_DM_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime2000_DM_area/card.txt > $dir/$savedir/signalZPrime2000_DM_area/signalZPrime2000_DM_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime2000_DM_area/signalZPrime2000_DM_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime2500_DM_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime2500_DM_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime2500_DM_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime2500_DM_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime2500_DM_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime2500_DM_area/card.txt > $dir/$savedir/signalZPrime2500_DM_area/signalZPrime2500_DM_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime2500_DM_area/signalZPrime2500_DM_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime3000_DM_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime3000_DM_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime3000_DM_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime3000_DM_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime3000_DM_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime3000_DM_area/card.txt > $dir/$savedir/signalZPrime3000_DM_area/signalZPrime3000_DM_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime3000_DM_area/signalZPrime3000_DM_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime3500_DM_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime3500_DM_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime3500_DM_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime3500_DM_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime3500_DM_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime3500_DM_area/card.txt > $dir/$savedir/signalZPrime3500_DM_area/signalZPrime3500_DM_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime3500_DM_area/signalZPrime3500_DM_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime4000_DM_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime4000_DM_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime4000_DM_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime4000_DM_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime4000_DM_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime4000_DM_area/card.txt > $dir/$savedir/signalZPrime4000_DM_area/signalZPrime4000_DM_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime4000_DM_area/signalZPrime4000_DM_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime4500_DM_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime4500_DM_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime4500_DM_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime4500_DM_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime4500_DM_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime4500_DM_area/card.txt > $dir/$savedir/signalZPrime4500_DM_area/signalZPrime4500_DM_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime4500_DM_area/signalZPrime4500_DM_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime5000_DM_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime5000_DM_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime5000_DM_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime5000_DM_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime5000_DM_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime5000_DM_area/card.txt > $dir/$savedir/signalZPrime5000_DM_area/signalZPrime5000_DM_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime5000_DM_area/signalZPrime5000_DM_card.txt'

# ZPRIME 10% WIDTH # 

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime1000_10_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime1000_10_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime1000_10_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime1000_10_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime1000_10_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime1000_10_area/card.txt > $dir/$savedir/signalZPrime1000_10_area/signalZPrime1000_10_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime1000_10_area/signalZPrime1000_10_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime2000_10_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime2000_10_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime2000_10_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime2000_10_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime2000_10_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime2000_10_area/card.txt > $dir/$savedir/signalZPrime2000_10_area/signalZPrime2000_10_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime2000_10_area/signalZPrime2000_10_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime3000_10_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime3000_10_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime3000_10_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime3000_10_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime3000_10_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime3000_10_area/card.txt > $dir/$savedir/signalZPrime3000_10_area/signalZPrime3000_10_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime3000_10_area/signalZPrime3000_10_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime4000_10_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime4000_10_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime4000_10_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime4000_10_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime4000_10_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime4000_10_area/card.txt > $dir/$savedir/signalZPrime4000_10_area/signalZPrime4000_10_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime4000_10_area/signalZPrime4000_10_card.txt'



# ZPRIME 30 WIDTH #

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime1000_30_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime1000_30_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime1000_30_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime1000_30_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime1000_30_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime1000_30_area/card.txt > $dir/$savedir/signalZPrime1000_30_area/signalZPrime1000_30_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime1000_30_area/signalZPrime1000_30_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime2000_30_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime2000_30_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime2000_30_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime2000_30_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime2000_30_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime2000_30_area/card.txt > $dir/$savedir/signalZPrime2000_30_area/signalZPrime2000_30_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime2000_30_area/signalZPrime2000_30_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime3000_30_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime3000_30_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime3000_30_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime3000_30_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime3000_30_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime3000_30_area/card.txt > $dir/$savedir/signalZPrime3000_30_area/signalZPrime3000_30_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime3000_30_area/signalZPrime3000_30_card.txt'

combineCards.py Name1=$dir/ttbarfits_cen0b$tag0/signalZPrime4000_30_area/card.txt Name2=$dir/ttbarfits_fwd0b$tag0/signalZPrime4000_30_area/card.txt Name3=$dir/ttbarfits_cen1b$tag/signalZPrime4000_30_area/card.txt Name4=$dir/ttbarfits_fwd1b$tag/signalZPrime4000_30_area/card.txt Name5=$dir/ttbarfits_cen2b$tag/signalZPrime4000_30_area/card.txt Name6=$dir/ttbarfits_fwd2b$tag/signalZPrime4000_30_area/card.txt > $dir/$savedir/signalZPrime4000_30_area/signalZPrime4000_30_card.txt

echo 'combining data cards into '$dir'/'$savedir'/signalZPrime4000_30_area/signalZPrime4000_30_card.txt'




echo ''
echo 'calculating limits'
echo ''


echo "combineTool.py -M AsymptoticLimits -d signalRSGluon1000_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalRSGluon1000_area
pwd
combineTool.py -M AsymptoticLimits -d signalRSGluon1000_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalRSGluon1500_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalRSGluon1500_area
pwd
combineTool.py -M AsymptoticLimits -d signalRSGluon1500_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalRSGluon2000_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalRSGluon2000_area
pwd
combineTool.py -M AsymptoticLimits -d signalRSGluon2000_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalRSGluon2500_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalRSGluon2500_area
pwd
combineTool.py -M AsymptoticLimits -d signalRSGluon2500_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalRSGluon3000_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalRSGluon3000_area
pwd
combineTool.py -M AsymptoticLimits -d signalRSGluon3000_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalRSGluon3500_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalRSGluon3500_area
pwd
combineTool.py -M AsymptoticLimits -d signalRSGluon3500_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalRSGluon4000_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalRSGluon4000_area
pwd
combineTool.py -M AsymptoticLimits -d signalRSGluon4000_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalRSGluon4500_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalRSGluon4500_area
pwd
combineTool.py -M AsymptoticLimits -d signalRSGluon4500_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalRSGluon5000_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalRSGluon5000_area
pwd
combineTool.py -M AsymptoticLimits -d signalRSGluon5000_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'




# ZPRIME DM #

echo "combineTool.py -M AsymptoticLimits -d signalZPrime1000_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime1000_DM_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime1000_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalZPrime1500_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime1500_DM_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime1500_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalZPrime2000_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime2000_DM_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime2000_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalZPrime2500_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime2500_DM_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime2500_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalZPrime3000_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime3000_DM_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime3000_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalZPrime3500_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime3500_DM_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime3500_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalZPrime4000_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime4000_DM_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime4000_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalZPrime4500_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime4500_DM_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime4500_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalZPrime5000_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime5000_DM_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime5000_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'


# ZPRIME 10% WIDTH #

echo "combineTool.py -M AsymptoticLimits -d signalZPrime1000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime1000_10_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime1000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalZPrime2000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime2000_10_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime2000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalZPrime3000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime3000_10_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime3000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalZPrime4000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime4000_10_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime4000_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'


# ZPRIME 30% WIDTH #


echo "combineTool.py -M AsymptoticLimits -d signalZPrime1000_30_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime1000_30_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime1000_30_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalZPrime2000_30_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime2000_30_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime2000_30_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalZPrime3000_30_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime3000_30_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime3000_30_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
echo "combineTool.py -M AsymptoticLimits -d signalZPrime4000_30_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
cd $dir/$savedir/signalZPrime4000_30_area
pwd
combineTool.py -M AsymptoticLimits -d signalZPrime4000_30_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'




