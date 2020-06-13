import json
import scipy.io as sio

f=open("H:/data/10.json",'r').read()
list=json.loads(f)

i=0
n=0
for i in range(1000):
    data=[[list[str(i) + '.jpg']['bodies'][0]['joints'][0], list[str(i) + '.jpg']['bodies'][0]['joints'][1]],
          [list[str(i) + '.jpg']['bodies'][0]['joints'][3], list[str(i) + '.jpg']['bodies'][0]['joints'][4]],
          [list[str(i) + '.jpg']['bodies'][0]['joints'][6], list[str(i) + '.jpg']['bodies'][0]['joints'][7]],
          [list[str(i) + '.jpg']['bodies'][0]['joints'][9], list[str(i) + '.jpg']['bodies'][0]['joints'][10]],
          [list[str(i) + '.jpg']['bodies'][0]['joints'][12], list[str(i) + '.jpg']['bodies'][0]['joints'][13]],
          [list[str(i) + '.jpg']['bodies'][0]['joints'][15], list[str(i) + '.jpg']['bodies'][0]['joints'][16]],
          [list[str(i) + '.jpg']['bodies'][0]['joints'][18], list[str(i) + '.jpg']['bodies'][0]['joints'][19]],
          [list[str(i) + '.jpg']['bodies'][0]['joints'][21], list[str(i) + '.jpg']['bodies'][0]['joints'][22]],
          [list[str(i) + '.jpg']['bodies'][0]['joints'][24], list[str(i) + '.jpg']['bodies'][0]['joints'][25]],
          [list[str(i) + '.jpg']['bodies'][0]['joints'][27], list[str(i) + '.jpg']['bodies'][0]['joints'][28]],
          [list[str(i) + '.jpg']['bodies'][0]['joints'][30], list[str(i) + '.jpg']['bodies'][0]['joints'][31]],
          [list[str(i) + '.jpg']['bodies'][0]['joints'][33], list[str(i) + '.jpg']['bodies'][0]['joints'][34]],
          [list[str(i) + '.jpg']['bodies'][0]['joints'][36], list[str(i) + '.jpg']['bodies'][0]['joints'][37]],
          [list[str(i) + '.jpg']['bodies'][0]['joints'][39], list[str(i) + '.jpg']['bodies'][0]['joints'][40]],
    ]



    m=str(n)
    Strname='H:\Pycharm\data processing\data10\data'+m+'.mat'
    sio.savemat(Strname,{'prediction':data})
    n=n+1

