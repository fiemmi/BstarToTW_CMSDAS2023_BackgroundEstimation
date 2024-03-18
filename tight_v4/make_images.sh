#!/bin/bash



# convert \( ../ftests/ftest_cen_1x1_vs_3x1_2016.png ../ftests/ftest_cen_1x1_vs_2x1_2016.png +append \)  \( ../ftests/ftest_fwd_1x1_vs_3x1_2016.png ../ftests/ftest_fwd_1x1_vs_2x1_2016.png +append \) -append ftests_2016.png

# convert  \( ../ftests/ftest_cen_0x1_vs_1x1_2017.png ../ftests/ftest_cen_1x1_vs_3x1_2017.png +append \) \( ../ftests/ftest_fwd_0x1_vs_1x1_2017.png ../ftests/ftest_fwd_1x1_vs_3x1_2017.png +append \) -append ftests_2017.png

# convert \( ../ftests/ftest_cen_0x1_vs_1x1_2018.png ../ftests/ftest_cen_1x1_vs_3x1_2018.png +append \)  \( ../ftests/ftest_fwd_0x1_vs_1x1_2018.png ../ftests/ftest_fwd_1x1_vs_3x1_2018.png +append \)  -append ftests_2018.png


convert \( 2016/ttbarfits_cen_limit_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx1_cen16Pass.png 2017/ttbarfits_cen_limit_1x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx1_cen17Pass.png 2018/ttbarfits_cen_limit_1x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx1_cen18Pass.png +append \) \( 2016/ttbarfits_fwd_limit_2x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx1_fwd16Pass.png 2017/ttbarfits_fwd_limit_1x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx1_fwd17Pass.png 2018/ttbarfits_fwd_limit_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projx1_fwd18Pass.png +append \) -append mt_sig.png

convert \( 2016/ttbarfits_cen_limit_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_cen16Pass.png 2017/ttbarfits_cen_limit_1x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_cen17Pass.png 2018/ttbarfits_cen_limit_1x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_cen18Pass.png +append \) \( 2016/ttbarfits_fwd_limit_2x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_fwd16Pass.png 2017/ttbarfits_fwd_limit_1x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_fwd17Pass.png 2018/ttbarfits_fwd_limit_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy1_fwd18Pass.png +append \) -append mtt_sig.png

convert \( 2016/ttbarfits_cen_limit_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_cen16Pass.png 2017/ttbarfits_cen_limit_1x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_cen17Pass.png 2018/ttbarfits_cen_limit_1x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_cen18Pass.png +append \) \( 2016/ttbarfits_fwd_limit_2x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_fwd16Pass.png 2017/ttbarfits_fwd_limit_1x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_fwd17Pass.png 2018/ttbarfits_fwd_limit_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy0_fwd18Pass.png +append \) -append mtt_low.png

convert \( 2016/ttbarfits_cen_limit_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy2_cen16Pass.png 2017/ttbarfits_cen_limit_1x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy2_cen17Pass.png 2018/ttbarfits_cen_limit_1x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy2_cen18Pass.png +append \) \( 2016/ttbarfits_fwd_limit_2x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy2_fwd16Pass.png 2017/ttbarfits_fwd_limit_1x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy2_fwd17Pass.png 2018/ttbarfits_fwd_limit_3x1/ttbar-RSGluon2000_area/plots_fit_b/base_figs/postfit_projy2_fwd18Pass.png +append \) -append mtt_high.png


# convert \( ../limits/tight_v4/limits_combine_zprime1_old_20160324.png ../limits/tight_v4/limits_combine_zprime1_old_20170324.png +append \) \( ../limits/tight_v4/limits_combine_zprime1_old_20180324.png ../limits/tight_v4/limits_combine_zprime1_old_all0324.png +append \) -append zprime1.png

# convert \( ../limits/tight_v4/limits_combine_zprime10_hold_20160324.png ../limits/tight_v4/limits_combine_zprime10_hold_20170324.png +append \) \( ../limits/tight_v4/limits_combine_zprime10_hold_20180324.png ../limits/tight_v4/limits_combine_zprime10_hold_all0324.png +append \) -append zprime10.png

# convert \( ../limits/tight_v4/limits_combine_zprime30_old_20160324.png ../limits/tight_v4/limits_combine_zprime30_old_20170324.png +append \) \( ../limits/tight_v4/limits_combine_zprime30_old_20180324.png ../limits/tight_v4/limits_combine_zprime30_old_all0324.png +append \) -append zprime30.png

# convert \( ../limits/tight_v4/limits_combine_zprimeDM_20160324.png ../limits/tight_v4/limits_combine_zprimeDM_20170324.png +append \) \( ../limits/tight_v4/limits_combine_zprimeDM_20180324.png ../limits/tight_v4/limits_combine_zprimeDM_all0324.png +append \) -append zprimeDM.png

# convert \( ../limits/tight_v4/limits_combine_rsgluon_20160324.png ../limits/tight_v4/limits_combine_rsgluon_20170324.png +append \) \( ../limits/tight_v4/limits_combine_rsgluon_20180324.png ../limits/tight_v4/limits_combine_rsgluon_all0324.png +append \) -append rsgluon.png


