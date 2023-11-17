#!/bin/sh

dir=/eos/home-m/mmorris/Documents/TTbarResonance/backgroundEstimate/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/regions/2016
savedir=ttbarfits_inclusive
tag0=_2x1
tag=_2x1


job=$1
copy="copy"

if [ "$job" = "copy" ]; then

    mkdir $dir/$savedir
    cp -rp ttbarfits_cen2b$tag/signal* $dir/$savedir
    cp ttbarfits_cen2b$tag/*root $dir/$savedir
    
    
elif [ "$job" = "rsgluon" ]; then

    # RS Gluon # 

    for MASS in 1000 1500 2000 2500 3000 3500 4000 4500 5000 5500 6000
    do

        combineCards.py cen0b=$dir/ttbarfits_cen0b$tag0/signalRSGluon${MASS}_area/card.txt fwd0b=$dir/ttbarfits_fwd0b$tag0/signalRSGluon${MASS}_area/card.txt cen1b=$dir/ttbarfits_cen1b$tag/signalRSGluon${MASS}_area/card.txt fwd1b=$dir/ttbarfits_fwd1b$tag/signalRSGluon${MASS}_area/card.txt cen2b=$dir/ttbarfits_cen2b$tag/signalRSGluon${MASS}_area/card.txt fwd2b=$dir/ttbarfits_fwd2b$tag/signalRSGluon${MASS}_area/card.txt > $dir/$savedir/signalRSGluon${MASS}_area/signalRSGluon${MASS}_card.txt

        echo 'combining data cards into '$dir'/'$savedir'/signalRSGluon'${MASS}'_area/signalRSGluon'${MASS}'_card.txt'


        echo "combineTool.py -M AsymptoticLimits -d signalRSGluon${MASS}_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
        cd $dir/$savedir/signalRSGluon${MASS}_area
        pwd
#         combineTool.py -M AsymptoticLimits -d signalRSGluon${MASS}_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
        combineTool.py -M AsymptoticLimits -d signalRSGluon${MASS}_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0

    done
    

elif [ "$job" = "zprimedm" ]; then

    # ZPrime DM # 

    for MASS in 1000 1500 2000 2500 3000 3500 4000 4500 5000
    do

        combineCards.py cen0b=$dir/ttbarfits_cen0b$tag0/signalZPrime${MASS}_DM_area/card.txt fwd0b=$dir/ttbarfits_fwd0b$tag0/signalZPrime${MASS}_DM_area/card.txt cen1b=$dir/ttbarfits_cen1b$tag/signalZPrime${MASS}_DM_area/card.txt fwd1b=$dir/ttbarfits_fwd1b$tag/signalZPrime${MASS}_DM_area/card.txt cen2b=$dir/ttbarfits_cen2b$tag/signalZPrime${MASS}_DM_area/card.txt fwd2b=$dir/ttbarfits_fwd2b$tag/signalZPrime${MASS}_DM_area/card.txt > $dir/$savedir/signalZPrime${MASS}_DM_area/signalZPrime${MASS}_DM_card.txt

        echo 'combining data cards into '$dir'/'$savedir'/signalZPrime'${MASS}'_DM_area/signalZPrime'${MASS}'_DM_card.txt'


        echo "combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
        cd $dir/$savedir/signalZPrime${MASS}_DM_area
        pwd
#         combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
        combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_DM_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0

    done
    
    
    
elif [ "$job" = "zprime1" ]; then

    # ZPrime 1% #

    for MASS in 1000 1200 1400 1600 1800 2000 2500 3000 3500 4000 4500
    do

        combineCards.py cen0b=$dir/ttbarfits_cen0b$tag0/signalZPrime${MASS}_1_area/card.txt fwd0b=$dir/ttbarfits_fwd0b$tag0/signalZPrime${MASS}_1_area/card.txt cen1b=$dir/ttbarfits_cen1b$tag/signalZPrime${MASS}_1_area/card.txt fwd1b=$dir/ttbarfits_fwd1b$tag/signalZPrime${MASS}_1_area/card.txt cen2b=$dir/ttbarfits_cen2b$tag/signalZPrime${MASS}_1_area/card.txt fwd2b=$dir/ttbarfits_fwd2b$tag/signalZPrime${MASS}_1_area/card.txt > $dir/$savedir/signalZPrime${MASS}_1_area/signalZPrime${MASS}_1_card.txt

        echo 'combining data cards into '$dir'/'$savedir'/signalZPrime'${MASS}'_1_area/signalZPrime'${MASS}'_1_card.txt'


        echo "combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_1_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
        cd $dir/$savedir/signalZPrime${MASS}_1_area
        pwd
#         combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_1_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
        combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_1_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0

    done



elif [ "$job" = "zprime10" ]; then


    # ZPrime 10 % #

    for MASS in 1000 1200 1400 1800 2000 2500 3000 3500 4000 4500 5000 6000 7000
    do

        combineCards.py cen0b=$dir/ttbarfits_cen0b$tag0/signalZPrime${MASS}_10_area/card.txt fwd0b=$dir/ttbarfits_fwd0b$tag0/signalZPrime${MASS}_10_area/card.txt cen1b=$dir/ttbarfits_cen1b$tag/signalZPrime${MASS}_10_area/card.txt fwd1b=$dir/ttbarfits_fwd1b$tag/signalZPrime${MASS}_10_area/card.txt cen2b=$dir/ttbarfits_cen2b$tag/signalZPrime${MASS}_10_area/card.txt fwd2b=$dir/ttbarfits_fwd2b$tag/signalZPrime${MASS}_10_area/card.txt > $dir/$savedir/signalZPrime${MASS}_10_area/signalZPrime${MASS}_10_card.txt

        echo 'combining data cards into '$dir'/'$savedir'/signalZPrime'${MASS}'_10_area/signalZPrime'${MASS}'_10_card.txt'


        echo "combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
        cd $dir/$savedir/signalZPrime${MASS}_10_area
        pwd
#         combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
        combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_10_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0

    done


elif [ "$job" = "zprime30" ]; then


# ZPrime 30% # 


    for MASS in 1000 1200 1400 1800 2000 2500 3000 3500 4000 4500 5000 6000 7000
    do

        combineCards.py cen0b=$dir/ttbarfits_cen0b$tag0/signalZPrime${MASS}_30_area/card.txt fwd0b=$dir/ttbarfits_fwd0b$tag0/signalZPrime${MASS}_30_area/card.txt cen1b=$dir/ttbarfits_cen1b$tag/signalZPrime${MASS}_30_area/card.txt fwd1b=$dir/ttbarfits_fwd1b$tag/signalZPrime${MASS}_30_area/card.txt cen2b=$dir/ttbarfits_cen2b$tag/signalZPrime${MASS}_30_area/card.txt fwd2b=$dir/ttbarfits_fwd2b$tag/signalZPrime${MASS}_30_area/card.txt > $dir/$savedir/signalZPrime${MASS}_30_area/signalZPrime${MASS}_30_card.txt

        echo 'combining data cards into '$dir'/'$savedir'/signalZPrime'${MASS}'_30_area/signalZPrime'${MASS}'_30_card.txt'


        echo "combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_30_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'"
        cd $dir/$savedir/signalZPrime${MASS}_30_area
        pwd
#         combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_30_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0 --job-mode condor --sub-opts='+JobFlavour="longlunch"'
        combineTool.py -M AsymptoticLimits -d signalZPrime${MASS}_30_card.txt --saveWorkspace --cminDefaultMinimizerStrategy 0   -v 0

    done
    

fi

