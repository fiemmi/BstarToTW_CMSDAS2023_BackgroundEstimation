#!/bin/bash


fig1=ttbarfits_cen0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_cen0bPass_logy.png
fig2=ttbarfits_cen1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_cen1bPass_logy.png
fig3=ttbarfits_cen2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_cen2bPass_logy.png
fig4=ttbarfits_fwd0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_fwd0bPass_logy.png
fig5=ttbarfits_fwd1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_fwd1bPass_logy.png
fig6=ttbarfits_fwd2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_fwd2bPass_logy.png



sig1=ttbarfits_cen0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_cen0bPass_logy.png
sig2=ttbarfits_cen1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_cen1bPass_logy.png
sig3=ttbarfits_cen2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_cen2bPass_logy.png
sig4=ttbarfits_fwd0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_fwd0bPass_logy.png
sig5=ttbarfits_fwd1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_fwd1bPass_logy.png
sig6=ttbarfits_fwd2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_fwd2bPass_logy.png




mt1=ttbarfits_cen0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_cen0bPass_logy.png
mt2=ttbarfits_cen1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_cen1bPass_logy.png
mt3=ttbarfits_cen2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_cen2bPass_logy.png
mt4=ttbarfits_fwd0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_fwd0bPass_logy.png
mt5=ttbarfits_fwd1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_fwd1bPass_logy.png
mt6=ttbarfits_fwd2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_fwd2bPass_logy.png



convert \( $fig1 $fig2 $fig3 +append \) \( $fig4 $fig5 $fig6 +append \) -append mtt.png

convert \( $mt1 $mt2 $mt3 +append \) \( $mt4 $mt5 $mt6 +append \) -append jetm.png

convert \( $sig1 $sig2 $sig3 +append \) \( $sig4 $sig5 $sig6 +append \) -append mtt_sig.png




fig1_pdf=ttbarfits_cen0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_cen0bPass_logy.pdf
fig2_pdf=ttbarfits_cen1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_cen1bPass_logy.pdf
fig3_pdf=ttbarfits_cen2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_cen2bPass_logy.pdf
fig4_pdf=ttbarfits_fwd0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_fwd0bPass_logy.pdf
fig5_pdf=ttbarfits_fwd1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_fwd1bPass_logy.pdf
fig6_pdf=ttbarfits_fwd2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_fwd2bPass_logy.pdf

mt1_pdf=ttbarfits_cen0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_cen0bPass_logy.pdf
mt2_pdf=ttbarfits_cen1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_cen1bPass_logy.pdf
mt3_pdf=ttbarfits_cen2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_cen2bPass_logy.pdf
mt4_pdf=ttbarfits_fwd0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_fwd0bPass_logy.pdf
mt5_pdf=ttbarfits_fwd1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_fwd1bPass_logy.pdf
mt6_pdf=ttbarfits_fwd2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_fwd2bPass_logy.pdf

fig1_pdf_high=ttbarfits_cen0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy2_cen0bPass_logy.pdf
fig2_pdf_high=ttbarfits_cen1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy2_cen1bPass_logy.pdf
fig3_pdf_high=ttbarfits_cen2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy2_cen2bPass_logy.pdf
fig4_pdf_high=ttbarfits_fwd0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy2_fwd0bPass_logy.pdf
fig5_pdf_high=ttbarfits_fwd1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy2_fwd1bPass_logy.pdf
fig6_pdf_high=ttbarfits_fwd2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy2_fwd2bPass_logy.pdf

mt1_pdf_high=ttbarfits_cen0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx2_cen0bPass_logy.pdf
mt2_pdf_high=ttbarfits_cen1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx2_cen1bPass_logy.pdf
mt3_pdf_high=ttbarfits_cen2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx2_cen2bPass_logy.pdf
mt4_pdf_high=ttbarfits_fwd0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx2_fwd0bPass_logy.pdf
mt5_pdf_high=ttbarfits_fwd1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx2_fwd1bPass_logy.pdf
mt6_pdf_high=ttbarfits_fwd2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx2_fwd2bPass_logy.pdf


fig1_pdf_sig=ttbarfits_cen0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_cen0bPass_logy.pdf
fig2_pdf_sig=ttbarfits_cen1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_cen1bPass_logy.pdf
fig3_pdf_sig=ttbarfits_cen2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_cen2bPass_logy.pdf
fig4_pdf_sig=ttbarfits_fwd0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_fwd0bPass_logy.pdf
fig5_pdf_sig=ttbarfits_fwd1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_fwd1bPass_logy.pdf
fig6_pdf_sig=ttbarfits_fwd2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_fwd2bPass_logy.pdf

mt1_pdf_sig=ttbarfits_cen0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx1_cen0bPass_logy.pdf
mt2_pdf_sig=ttbarfits_cen1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx1_cen1bPass_logy.pdf
mt3_pdf_sig=ttbarfits_cen2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx1_cen2bPass_logy.pdf
mt4_pdf_sig=ttbarfits_fwd0b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx1_fwd0bPass_logy.pdf
mt5_pdf_sig=ttbarfits_fwd1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx1_fwd1bPass_logy.pdf
mt6_pdf_sig=ttbarfits_fwd2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx1_fwd2bPass_logy.pdf








cp $fig1_pdf ../../images/2018
cp $fig2_pdf ../../images/2018
cp $fig3_pdf ../../images/2018
cp $fig4_pdf ../../images/2018
cp $fig5_pdf ../../images/2018
cp $fig6_pdf ../../images/2018

cp $mt1_pdf ../../images/2018
cp $mt2_pdf ../../images/2018
cp $mt3_pdf ../../images/2018
cp $mt4_pdf ../../images/2018
cp $mt5_pdf ../../images/2018
cp $mt6_pdf ../../images/2018

cp $fig1_pdf_high ../../images/2018
cp $fig2_pdf_high ../../images/2018
cp $fig3_pdf_high ../../images/2018
cp $fig4_pdf_high ../../images/2018
cp $fig5_pdf_high ../../images/2018
cp $fig6_pdf_high ../../images/2018

cp $mt1_pdf_high ../../images/2018
cp $mt2_pdf_high ../../images/2018
cp $mt3_pdf_high ../../images/2018
cp $mt4_pdf_high ../../images/2018
cp $mt5_pdf_high ../../images/2018
cp $mt6_pdf_high ../../images/2018




# move paramater text file #


cp ttbarfits_cen0b_3x1/ttbar-RSGluon2000_area/rpf_params_QCD_cen0brpf_fitb.txt rpf_params_2018_cen0b_3x1.txt
cp ttbarfits_cen1b_3x1/ttbar-RSGluon2000_area/rpf_params_QCD_cen1brpf_fitb.txt rpf_params_2018_cen1b_3x1.txt
cp ttbarfits_cen2b_3x1/ttbar-RSGluon2000_area/rpf_params_QCD_cen2brpf_fitb.txt rpf_params_2018_cen2b_3x1.txt
cp ttbarfits_fwd0b_3x1/ttbar-RSGluon2000_area/rpf_params_QCD_fwd0brpf_fitb.txt rpf_params_2018_fwd0b_3x1.txt
cp ttbarfits_fwd1b_3x1/ttbar-RSGluon2000_area/rpf_params_QCD_fwd1brpf_fitb.txt rpf_params_2018_fwd1b_3x1.txt
cp ttbarfits_fwd2b_3x1/ttbar-RSGluon2000_area/rpf_params_QCD_fwd2brpf_fitb.txt rpf_params_2018_fwd2b_3x1.txt





















