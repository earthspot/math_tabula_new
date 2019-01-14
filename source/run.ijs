NB. tabby - run
0 :0
Sunday 30 December 2018  04:52:51
-
open BUILTFILE
open TESTFILE
)

IDE_z_=: 1  NB. can be assumed if this script is run

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

NOPLOT_z_=: if807''  NB. disable plot package for j807 builds

onload_z_=: do

NB. check TABBY header for assignment of: startonload
start_tabby_''