NB. tabby - run
0 :0
Thursday 6 September 2018  17:45:29
-
open BUILTFILE
open TESTFILE
)

cocurrent 'base'

BUILTFILE_z_=: 1!:1 <jpath'~Gittab/builtfile'	NB. effectively: '~Gittab/tabula.ijs'
TESTFILE_z_=: '~Gittab/test/test.ijs'

NB. ---------------------------------------------------------

clear 'tabby'
load BUILTFILE	
smoutput '--- run.ijs: BUILTFILE loaded: ',BUILTFILE

load TESTFILE
smoutput '--- run.ijs: TESTFILE completed without discrepancies: ',TESTFILE
smoutput 4$LF