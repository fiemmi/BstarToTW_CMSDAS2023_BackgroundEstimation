from time import time
import os, sys
import json




params_list = [
#     '0x0',
#     '0x1',
#     '0x2',
#     '1x0',
#     '1x1',
    '1x2',
    '2x2'
]


for params in params_list:
    
    
    replace_error = False
    replace_value = False
    newfile = open('new.json', 'w')

    for line in open('ttbar_cen.json'):

        if '"ttbar_xsec": {' in line: 
            replace_error = True


        if '"18_TTbar": {' in line:
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


    os.system('cp new.json ttbar_cen.json')



    i = 1
    cmd = 'python ttbar_get_xsec.py cen test' + str(i) + ' ' + params

    print 'running command: ' + cmd

    os.system(cmd)


    fitparams_file = open('fitparams.json')
    fitparams = json.load(fitparams_file)

    print 'ttbar_xsec value', fitparams['ttbar_xsec']['val']
    print 'ttbar_xsec error', fitparams['ttbar_xsec']['error']

    ttbar_xsec_difference = fitparams['ttbar_xsec']['val']

    ttbar_xsec = 1.0 + ttbar_xsec_difference

    while (abs(ttbar_xsec_difference) > 0.001):

        print 'ttbar_xsec_difference', ttbar_xsec_difference




        fitparams_file = open('fitparams.json')
        fitparams = json.load(fitparams_file)
        newfile = open('new.json', 'w')

        ttbar_xsec_difference = fitparams['ttbar_xsec']['val']




        replace_error = False
        replace_value = False
        for line in open('ttbar_cen.json'):

            if '"ttbar_xsec": {' in line: 
                replace_error = True


            if '"18_TTbar": {' in line:
                print line
                replace_value = True


            if replace_error and '"VAL":' in line:
                line = '            "VAL": ' + str(1 + fitparams['ttbar_xsec']['error']) + '\n'
                replace_error = False


            if replace_value and '"SCALE":' in line:
                print line
                line = '                "SCALE": ' + str(ttbar_xsec + fitparams['ttbar_xsec']['val']) + ', \n'
                print line
                replace_value = False




            newfile.write(line)

        newfile.close()


        ttbar_xsec = ttbar_xsec + fitparams['ttbar_xsec']['val']

        os.system('cp ttbar_cen.json ttbar_cen'+str(i)+'.json')
        os.system('cp new.json ttbar_cen.json')


        move_cmd = 'mv fitparams.json fitparams' + str(i) + '.json'
        os.system(move_cmd)


        i += 1
        cmd = 'python ttbar_get_xsec.py cen test' + str(i) + ' ' + params
        os.system(cmd)



    os.system('python ttbar.py cen ftest ' + params)
    os.system('cp ttbar_cen.json ttbar_cen_' + params + '.json')
