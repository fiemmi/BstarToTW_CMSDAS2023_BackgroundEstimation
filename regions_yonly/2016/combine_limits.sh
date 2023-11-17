#!/bin/sh

dir=/afs/cern.ch/user/m/mmorris/BackgroundEstimation/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/regions_yonly/2016
savedir=ttbarfits_inclusive
tag0=_2x1
tag=_2x3


# echo 'making dir' $savedir

# if [ -d $dir/$savedir ]
# then
#     rm -rf $dir/$savedir
# fi


# mkdir $dir/$savedir
# cp -rp ttbarfits_cen$tag0/signal* $dir/$savedir
# cp ttbarfits_fwd$tag/*root $dir/$savedir



# # RS Gluon # 

# for MASS in 1000 1500 2000 2500 3000 3500 4000 4500 5000 5500 6000
# do

#     echo ''

#     combineCards.py cen=$dir/ttbarfits_cen$tag0/signalRSGluon${MASS}_area/card.txt fwd=$dir/ttbarfits_fwd$tag/signalRSGluon${MASS}_area/card.txt > $dir/$savedir/signalRSGluon${MASS}_area/signalRSGluon${MASS}_card.txt

#     echo 'combining data cards into '$dir'/'$savedir'/signalRSGluon'${MASS}'_area/signalRSGluon'${MASS}'_card.txt'
    
    
#     echo "combineTool.py -M AsymptoticLimits -d signalRSGluon${MASS}_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
#     cd $dir/$savedir/signalRSGluon${MASS}_area
#     pwd    
# #    combineTool.py -M AsymptoticLimits -d signalRSGluon${MASS}_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
#     combineTool.py -M AsymptoticLimits -d signalRSGluon${MASS}_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 


# done


# ZPrime DM #

for MASS in 1000 1500 2000 2500 3000 3500 4000 4500 5000
do

    echo ''

    combineCards.py cen=$dir/ttbarfits_cen$tag0/signalZPrime${MASS}_DM_area/card.txt fwd=$dir/ttbarfits_fwd$tag/signalZPrime${MASS}_DM_area/card.txt > $dir/$savedir/signalZPrime${MASS}_DM_area/signalZPrime${MASS}_DM_card.txt

    echo 'combining data cards into '$dir'/'$savedir'/signalZPrime'${MASS}'_DM_area/signalZPrime'${MASS}'_DM_card.txt'
    
    
    echo "combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
    cd $dir/$savedir/signalZPrime${MASS}_DM_area
    pwd    
   combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
#     combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 


done





# ZPrime 10% # 

for MASS in 1000 1200 1400 1800 2000 2500 3000 3500 4000 4500 5000 6000 7000
do

    echo ''

    combineCards.py cen=$dir/ttbarfits_cen$tag0/signalZPrime${MASS}_10_area/card.txt fwd=$dir/ttbarfits_fwd$tag/signalZPrime${MASS}_10_area/card.txt > $dir/$savedir/signalZPrime${MASS}_10_area/signalZPrime${MASS}_10_card.txt

    echo 'combining data cards into '$dir'/'$savedir'/signalZPrime'${MASS}'_10_area/signalZPrime'${MASS}'_10_card.txt'
    
    
    echo "combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
    cd $dir/$savedir/signalZPrime${MASS}_10_area
    pwd    
   combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
#     combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 


done


# ZPrime 30% #

for MASS in 1000 1200 1400 1800 2000 2500 3000 3500 4000 4500 5000 6000 7000
do

    echo ''

    combineCards.py cen=$dir/ttbarfits_cen$tag0/signalZPrime${MASS}_30_area/card.txt fwd=$dir/ttbarfits_fwd$tag/signalZPrime${MASS}_30_area/card.txt > $dir/$savedir/signalZPrime${MASS}_30_area/signalZPrime${MASS}_30_card.txt

    echo 'combining data cards into '$dir'/'$savedir'/signalZPrime'${MASS}'_30_area/signalZPrime'${MASS}'_30_card.txt'
    
    
    echo "combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_30_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
    cd $dir/$savedir/signalZPrime${MASS}_30_area
    pwd    
   combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_30_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
#     combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_30_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 


done

# # ZPrime 1% #

# for MASS in 1000 1200 1400 1600 1800 2000 2500 3000 3500 4000 4500
# do

#     echo ''

#     combineCards.py cen=$dir/ttbarfits_cen$tag0/signalZPrime${MASS}_1_area/card.txt fwd=$dir/ttbarfits_fwd$tag/signalZPrime${MASS}_1_area/card.txt > $dir/$savedir/signalZPrime${MASS}_1_area/signalZPrime${MASS}_1_card.txt

#     echo 'combining data cards into '$dir'/'$savedir'/signalZPrime'${MASS}'_1_area/signalZPrime'${MASS}'_1_card.txt'
    
    
#     echo "combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_1_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
#     cd $dir/$savedir/signalZPrime${MASS}_1_area
#     pwd    
# #    combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_1_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
#     combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_1_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 


# done

















