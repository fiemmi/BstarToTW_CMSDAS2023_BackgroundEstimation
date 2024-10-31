# 𝑍′→𝑡𝑡¯  Background Estimation
Adapted from background estimation for the 2023 CMSDAS $b^\ast \to tW$ exercise, using the updated version of 2DAlphabet

## Getting started (in bash shell)

First, ensure that you have [SSH keys tied to your github account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and that they've been added to the ssh-agent:
```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_xyz
```
This step is necessary for cloning some of the Combine tools used in the 2DAlphabet installation.

### Setup CMSSW and 2DAlphabet environment:
Assuming you've already created the `~/public/CMSDAS2023/` directory, first create the CMSSW environment:
```
ssh -XY USERNAME@lxplus.cern.ch
export SCRAM_ARCH=slc7_amd64_gcc700
cd public/CMSDAS2023/
cmsrel CMSSW_10_6_14
cd CMSSW_10_6_14/src
cmsenv
```

Now set up 2DAlphabet:
```
cd ~/public/CMSDAS2023/CMSSW_10_6_14/src/
git clone https://github.com/mdmorris/2DAlphabet.git
git clone --branch 102x https://github.com/cms-analysis/HiggsAnalysis-CombinedLimit.git HiggsAnalysis/CombinedLimit
curl -s https://raw.githubusercontent.com/lcorcodilos/CombineHarvester/master/CombineTools/scripts/sparse-checkout-ssh.sh | bash
scram b clean; scram b -j 4
cmsenv
```

Now, create a virtual environment in which to install 2DAlphabet:
```
python -m virtualenv twoD-env
source twoD-env/bin/activate
cd 2DAlphabet
python setup.py develop
```

Then, check that the 2DAlphabet installation worked by opening a python shell:
```
python
```
then, inside the python shell:
```
import ROOT
r = ROOT.RooParametricHist()
```

### Finally, clone this repo to the `src` directory as well:
```
cd ~/public/CMSDAS2023/CMSSW_10_6_14/src/
git clone https://github.com/mdmorris/BstarToTW_CMSDAS2023_BackgroundEstimation.git
```
OR fork the code onto your own personal space and set the upstream:
```
https://github.com/<USERNAME>/BstarToTW_CMSDAS2023_BackgroundEstimation.git
cd BstarToTW_CMSDAS2023_BackgroundEstimation
git remote add upstream https://github.com/mdmorris/BstarToTW_CMSDAS2023_BackgroundEstimation.git
git remote -v
```

## What to do after reconnecting to LXPLUS:
Go back to the directory where you installed 2DAlphabet and where the virtual environment resides:
```
ssh -XY USERNAME@lxplus.cern.ch
cd ~/public/CMSDAS2023/CMSSW_10_6_14/src/
cmsenv
source twoD-env/bin/activate
```
Then you should be good to go!

## Background estimate
For this exercise we will use the [`2DAlphabet`](https://github.com/mdmorris/2DAlphabet) github package. This package uses `.json` configuration files to specify the input histograms (to perform the fit) and the uncertainties. These uncertainties will be used inside of the `Higgs Combine` backend, the fitting package used widely within CMS. The 2DAlphabet package serves as a nice interface with Combine to allow the user to use the 2DAlphabet method without having to create their own custom version of combine. 

# Input root files

Root files with the pass and fail histograms can be found in:

`/afs/cern.ch/user/m/mmorris/public/ttbarAllHad/twodalphabet/`

# Configuration file

The configuration file that you will be using is called `bstar.json`, located in this repository. Let's take a look at this file and see the various parts:

* `GLOBAL`
  - This section contains meta information regarding the location (`path`), filenames (`FILE`), and input histogram names (`HIST`) for all ROOT files used in the background estimation procedure.
  - Everything in this section will be used in a file-wide find-and-replace. So wherever you see the name of the sub-objects in this file, it will be expanded by the value assigned to it in this section. 
  - Additionally, the `SIGNAME` list should include the name(s) of all signals you wish to investigate, so that they are added to the workspace when you run the python script.
    - If you wanted to investigate limits for only three signals, for example, you'd just add their names as given in the ROOT files to this list. 
    - For this exercise, the default is `signalLH2400`, the 2.4 TeV signal sample. You'll want to change this as the exercise progresses

* `REGIONS`
  - This section contains the various regions we are interested in transferring between.
  - Each region contains a `PROCESSES` object, listing the signals and backgrounds to be included in the fit, as well as  `BINNING` object, which is defined elsewhere in the config file.
  - The name of each region in `REGIONS` is dependent on the input histogram name, as well as your choice of `HIST` name in the `GLOBAL` section above
    - For instance, in this file we declared `HIST = MtwvMt$region`, where `$region` will be expanded as the name given in `REGIONS`. 
    - We chose this name because the input histograms are titled `MtwvMtPass` and `MtwvMtFail` for the Pass and Fail regions, respectively. 

* `PROCESSES`
  - In this section we define all of the various process ROOT files that will be used to produce the fit. These include data, signals, and backgrounds.
  - Each process contains its own set of options:
    - `SYSTEMATICS`: a list of systematic uncertainties, whose properties are defined elsewhere in the config file
    - `SCALE`: how much to scale this process by in the fit
    - `COLOR`: color to plot in the fit (ROOT color schema)
    - `TYPE`: `DATA`, `BKG`, `SIGNAL`
    - `TITLE`: label in the plot legend (LaTeX compatible)
    - `ALIAS`: if the process has a different filename than standard, this will be what replaces `process` in the 
`GLOBAL` section's `FILE` option, so that this process gets picked up properly
    - `LOC`: the location of the file, using the definitions laid out in `GLOBAL`

* `SYSTEMATICS`
  - This contains the names of all systematic uncertainties you want to apply to the various processes.
  - The `CODE` key describes the type of systematic that will be used in Combine.
  - The `VAL` key is how we assign the value of that uncertainty. For instance, a `VAL` of `1.018` in the `lumi` (luminosity) means that this systematic has a 1.8\% uncertainty on the yield.

* `BINNING`
  - This section allows us to name and define custom binning schema. After naming the schema, one would define several variables for both `X` and `Y`:
    - `NAME`: allows us to denote what is being plotted on the given axis
    - `TITLE`: the axis label for the plot (LaTeX enabled)
    - `BINS`: a list of bins
    - `SIGSTART`, `SIGEND`: the bins defining a window `[SIGSTART, SIGEND]` around which to blind (if the blinded option is selected)

* `OPTIONS`
  - A list of boolean and other options to be considered when generating the fit
  - (explanation WIP)

# Running the Background Estimate

The files for running the background esimate are located in the `results` directory. To run the background estimate for the three years:

```
cd results/
python run2dAlphabet.py 2016
python run2dAlphabet.py 2017
python run2dAlphabet.py 2018
```

The transfer functions each year are specified in the dictionary 

```
params_dict = {
    
    '2016/cen/':'0x0',
    '2016/fwd/':'0x0',
    '2017/cen/':'0x0',
    '2017/fwd/':'0x0',
    '2018/cen/':'0x0',
    '2018/fwd/':'0x0',
}
```

These should be determined by [FTests](#FTests) and entered by hand.

The `run2dalphabet.py` script is set to run over the central and forward regions, and all specified signal samples. To change the signal samples, change the file defined in the runLimits() function:

```
# run the bkg estimate to get the limits
# signal files
# ../../../one_signal.txt for 2 TeV rsgluon only
# ../../../rsgluon_signals.txt for rsgluon signals only
# ../../../all_signals.txt for all signal samples

runLimits(signal_file='../../../one_signal.txt')  
```

The script takes about 2 minutes to run over one signal sample for central and forward regions for one year. For all 59 signal samples in `all_signals.txt`, this takes about 30 minutes, so it speeds up to process to run the 2016, 2017, 2018 on three different lxplus nodes in parallel.


The output is stored in the `results/2016/cen/ttbarfits_cen2016_test_0x0`, for the 2016 central region for example.


# Statistical Tests

## FTests

To run the FTest comparisons, first run 2dalphabet using all of the transfer functions you wish to compare. Save the directories in the format

```
ttbarfits_cen_ftest_1x2
ttbarfits_fwd_ftest_1x2
```

for the central and forward 1x2 transfer function, and then the same for all the other transfer functions.

These transfer fucntion scenarios can be run automatically with the `results/run2dAlphabet.py` script, with the function `runAllTransferFunctions()`

To compare 1x2 to 2x2 for central and forward, in the `FTest.py` code, add the line to the end (below `if __name__=="__main__":`):

```
    directory = '/eos/home-m/mmorris/Documents/TTbarResonance/backgroundEstimate/CMSSW_10_6_14/src/BstarToTW_CMSDAS2023_BackgroundEstimation/tight/2018/'
    
    FTest('1x2','2x2', directory, 'cen')
    FTest('1x2','2x2', directory, 'fwd')

```
and change the `directory` variable to the appropriate directory.

Run the FTests and find the plots saved in the `ftests` directory:

```
mkdir ftests
python FTest.py
```

To choose the optimal transfer function, start by comparing the transfer functions with the lowest parameters. If any of those comparisons has a p-value < 0.3, then the transfer function with the greater number of parameters is optimal. Proceed to compare that transfer function with the transfer function with 1 additional parameter, and repeat the p-value comparison.



# Systematics
Systematic uncertainties were described in the config file section above. Add the Top pT uncertainties to the appropriate processes in the config file, then re-run the fit after having copied the old Combine card somewhere safe. Compare the pre- and post-Top pT Combine cards using `diff`.

# Limit setting

Limits for each signal are calculated using the `perform_limit` function in `ttbar.py`. The limits can then be plotted using the `set_limits.py` script, or interactively with the `limits.ipynb` notebook. The mass points and cross sections for each signal are located in `signal_xs.json`

