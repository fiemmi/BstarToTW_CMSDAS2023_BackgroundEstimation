#!/bin/bash


fig1=ttbarfits_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_cen0bPass_logy.png
fig2=ttbarfits_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_cen1bPass_logy.png
fig3=ttbarfits_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_cen2bPass_logy.png
fig4=ttbarfits_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_fwd0bPass_logy.png
fig5=ttbarfits_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_fwd1bPass_logy.png
fig6=ttbarfits_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_fwd2bPass_logy.png



# sig1=ttbarfits_cen0b_0x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_cen0bPass_logy.png
# sig2=ttbarfits_cen1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_cen1bPass_logy.png
# sig3=ttbarfits_cen2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_cen2bPass_logy.png
# sig4=ttbarfits_fwd0b_0x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_fwd0bPass_logy.png
# sig5=ttbarfits_fwd1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_fwd1bPass_logy.png
# sig6=ttbarfits_fwd2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_fwd2bPass_logy.png




# mt1=ttbarfits_cen0b_0x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_cen0bPass_logy.png
# mt2=ttbarfits_cen1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_cen1bPass_logy.png
# mt3=ttbarfits_cen2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_cen2bPass_logy.png
# mt4=ttbarfits_fwd0b_0x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_fwd0bPass_logy.png
# mt5=ttbarfits_fwd1b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_fwd1bPass_logy.png
# mt6=ttbarfits_fwd2b_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx0_fwd2bPass_logy.png



convert \( $fig1 $fig2 $fig3 +append \) \( $fig4 $fig5 $fig6 +append \) -append mtt-sim.png

# convert \( $mt1 $mt2 $mt3 +append \) \( $mt4 $mt5 $mt6 +append \) -append jetm.png

# convert \( $sig1 $sig2 $sig3 +append \) \( $sig4 $sig5 $sig6 +append \) -append mtt_sig.png

