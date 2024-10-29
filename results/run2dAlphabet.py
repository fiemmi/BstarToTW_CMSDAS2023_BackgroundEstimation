from time import time
import os, sys
import json



if (len(sys.argv) > 1) and (sys.argv[1] in ['2016', '2017', '2018']):
    
    year = sys.argv[1]

else:

    year = '2016'


directories = [
    '2016/cen/ftests',
    '2016/fwd/ftests',
    '2017/cen/ftests',
    '2017/fwd/ftests',
    '2018/cen/ftests',
    '2018/fwd/ftests',
    '2016/cen/ttbar_xsec',
    '2016/fwd/ttbar_xsec',
    '2017/cen/ttbar_xsec',
    '2017/fwd/ttbar_xsec',
    '2018/cen/ttbar_xsec',
    '2018/fwd/ttbar_xsec'
    'limits',
    'stat_tests'
]

for path in directories:
    if not os.path.exists(path):
        os.makedirs(path)



regions = [
    'cen',
    'fwd'
]

params_list = [
    '0x0',
    '0x1',
    '0x2',
    '1x0',
    '1x1',
    '1x2',
    '2x1',
    '2x2'
]


params_dict = {
    
    '2016/cen/':'0x0',
    '2016/fwd/':'0x0',
    '2017/cen/':'0x0',
    '2017/fwd/':'0x0',
    '2018/cen/':'0x0',
    '2018/fwd/':'0x0',
}

# params_dict = {
    
#     '2016/cen/':'0x2',
#     '2016/fwd/':'2x1',
#     '2017/cen/':'0x0',
#     '2017/fwd/':'2x2',
#     '2018/cen/':'2x2',
#     '2018/fwd/':'0x0',
# }

# params_dict = {
    
#     '2016/cen/':'0x1',
#     '2016/fwd/':'2x1',
#     '2017/cen/':'0x1',
#     '2017/fwd/':'1x1',
#     '2018/cen/':'2x1',
#     '2018/fwd/':'1x1',
# }

def runLimits():
    
    

    for region in regions:

        wdir = year + '/' + region + '/'

        os.system('pwd')
        os.chdir(wdir)
        os.system('pwd')

        jsonfile = 'ttbar_' + region + year +'.json'

        print 'using json file ' + jsonfile


        newfile = open('new.json', 'w')

        replace_signals = False
        replace_error = False
        replace_value = False
        i = 0


        for line in open('../../'+jsonfile):

            if '"ttbar_xsec": {' in line: 
                replace_error = True


            if '_TTbar": {' in line:
                print line
                replace_value = True


            if replace_error and '"VAL":' in line:
                line = '            "VAL": ' + str(2.0) + '\n'
                replace_error = False


            if replace_value and '"SCALE":' in line:
                print line
                line = '                "SCALE": ' + str(1.0) + ', \n'
                print line
                replace_value = False


            if '	"SIGNAME": [' in line: 
                replace_signals = True
                i += 1
            elif replace_signals and i == 2:
                i = 0
                replace_signals = False
                with open('../../../one_signal.txt', 'r') as file:
                    all_signals = file.read()
                    newfile.write(line.replace(line, all_signals) + '\n')
            elif replace_signals:
                i += 1



            else:
                newfile.write(line)

        newfile.close()


        params = params_dict[wdir]
        print wdir, 'params', params
        os.system('cp ttbar_'+region+year+'.json ttbar_'+region+year+'_1p0.json')
        os.system('cp new.json ttbar_'+region+year+'.json')

        os.system('python ../../ttbar.py '+region+year+' rebin ' + params)

        os.chdir('../../')
        os.system('pwd')




def runAllTransferFunctions():


    for region in regions:

        wdir = year + '/' + region + '/'

        jsonfile = 'ttbar_' + region + year +'.json'

        print 'using json file ' + jsonfile

        print 'cd ' + region
        os.chdir(wdir)
        os.system('pwd')

        for params in params_list:


            replace_error = False
            replace_value = False
            newfile = open('new.json', 'w')

            for line in open('../../'+jsonfile):

                if '"ttbar_xsec": {' in line: 
                    replace_error = True


                if '_TTbar": {' in line:
                    print line
                    replace_value = True


                if replace_error and '"VAL":' in line:
                    line = '            "VAL": ' + str(2.0) + '\n'
                    replace_error = False


                if replace_value and '"SCALE":' in line:
                    print line
                    line = '                "SCALE": ' + str(1.0) + ', \n'
                    print line
                    replace_value = False




                newfile.write(line)

            newfile.close()


            os.system('cp '+jsonfile+' '+jsonfile.replace('.json','_1p0.json'))
            os.system('cp new.json '+jsonfile)



#                 i = 1

#                 cmd = 'python ../../ttbar_get_xsec.py '+region+year+' test' + str(i) + ' ' + params

#                 print 'running command: ' + cmd

#                 os.system(cmd)


#                 fitparams_file = open('fitparams.json')
#                 fitparams = json.load(fitparams_file)

#                 print 'ttbar_xsec value', fitparams['ttbar_xsec']['val']
#                 print 'ttbar_xsec error', fitparams['ttbar_xsec']['error']

#                 ttbar_xsec_difference = fitparams['ttbar_xsec']['val']

#                 ttbar_xsec = 1.0 + ttbar_xsec_difference

#                 while (abs(ttbar_xsec_difference) > 0.001):

#                     print 'ttbar_xsec_difference', ttbar_xsec_difference




#                     fitparams_file = open('fitparams.json')
#                     fitparams = json.load(fitparams_file)
#                     newfile = open('new.json', 'w')

#                     ttbar_xsec_difference = fitparams['ttbar_xsec']['val']




#                     replace_error = False
#                     replace_value = False
#                     for line in open('../../'+jsonfile):

#                         if '"ttbar_xsec": {' in line: 
#                             replace_error = True


#                         if '_TTbar": {' in line:
#                             replace_value = True


#                         if replace_error and '"VAL":' in line:
#                             line = '            "VAL": ' + str(fitparams['ttbar_xsec']['error']) + '\n'
#                             replace_error = False


#                         if replace_value and '"SCALE":' in line:
#                             line = '                "SCALE": ' + str(ttbar_xsec + fitparams['ttbar_xsec']['val']) + ', \n'
#                             replace_value = False




#                         newfile.write(line)

#                     newfile.close()


#                     ttbar_xsec = ttbar_xsec + fitparams['ttbar_xsec']['val']


#                     print 'new ttbar xsec ', ttbar_xsec

#                     os.system('cp '+jsonfile+' ttbar_'+region+'_'+str(i)+'.json')
#                     os.system('cp new.json '+jsonfile)


#                     move_cmd = 'mv fitparams.json fitparams' + str(i) + '.json'
#                     os.system(move_cmd)


#                     i += 1
#                     cmd = 'python ../../ttbar_get_xsec.py '+region+year+' test' + str(i) + ' ' + params
#                     os.system(cmd)



            os.system('python ../../ttbar.py '+region+year+' ftest ' + params)
            os.system('cp '+jsonfile+' ttbar_'+region+year+'_' + params + '.json')


            os.system('mv *_test* ttbar_xsec')
            os.system('mv fitparams*json ttbar_xsec')
            os.system('mv ttbar_'+region+'_*json ttbar_xsec')
            os.system('rm new.json')
            os.system('mv ttbar_'+region+year+'_*json ttbar_xsec')
            os.system('mv *_ftest* ftests')


        os.chdir('../../')
        os.system('pwd')

            
# runAllTransferFunctions()
runLimits()            

