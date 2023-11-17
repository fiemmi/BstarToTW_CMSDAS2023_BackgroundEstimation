#!/bin/bash


cp ttbar_cen0b.json ttbar_cen1b.json
sed -i s/cen0b/cen1b/g ttbar_cen1b.json

cp ttbar_cen0b.json ttbar_cen2b.json
sed -i s/cen0b/cen2b/g ttbar_cen2b.json

cp ttbar_cen0b.json ttbar_fwd0b.json
sed -i s/cen0b/fwd0b/g ttbar_fwd0b.json

cp ttbar_cen0b.json ttbar_fwd1b.json
sed -i s/cen0b/fwd1b/g ttbar_fwd1b.json

cp ttbar_cen0b.json ttbar_fwd2b.json
sed -i s/cen0b/fwd2b/g ttbar_fwd2b.json


#cp *.json ../2017
#cp *.json ../2018

#cd ../2017
#sed -i s/16/17/g *json

#cd ../2018
#sed -i s/16/18/g *json

#cd ../2016
