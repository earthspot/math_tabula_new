NB. math_tabula_new - run
0 :0
Monday 15 April 2019  05:14:20
-
open BUILTFILE
open TESTFILE
)

NB.==================================
GIT=. '~Gittab'  NB. for DEV bluesky
NB.==================================

IDE_z_=: 1  NB. can be assumed if this script is run

cocurrent 'base'

]BUILTFILE_z_=: 1!:1 <jpath GIT,'/builtfile'
]TESTFILE_z_=: GIT,'/test/test.ijs'

NB. ---------------------------------------------------------

clear 'tabby'
load BUILTFILE	
smoutput '--- run.ijs: BUILTFILE loaded: ',BUILTFILE

load TESTFILE
smoutput '--- run.ijs: TESTFILE completed without discrepancies: ',TESTFILE
smoutput 4$LF

onload_z_=: do

NB. check TABBY header for assignment of: startonload
start_tabby_''