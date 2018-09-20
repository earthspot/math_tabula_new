NB. tabby - run
0 :0
Thursday 20 September 2018  09:32:07
-
open BUILTFILE
open TESTFILE
)

  NB. Since neither TABBY nor CAL create TPATH_UU or sl
  NB. but CAL needs BOTH in [cal] start
  NB. --make sure they are set up here
  NB. for a build/run of TABBY from cold...
require '~Gituu/source/paths.ijs' NB. the definitive source for TPATH_UU*
NB. TPATH_UU=: jpath'~Gituu'

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