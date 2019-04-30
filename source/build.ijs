NB. math_tabula_new repo - build
0 :0
Monday 15 April 2019  05:00:00
-
open BUILTFILE
)

NB. TO LOAD JUST THIS BUILTFILE:	fn⌘F9
NB. DITTO THEN RUN:		fnF9

smoutput '--- TABBY build: started'

date_z_=: 6!:0 bind 'YYYY-MM-DD  hh:mm:ss'

NOW=: date''
HEADERFILE_z_=: '~Gittab/source/header.ijs'
BUILTFILE_z_=: 1!:1 <jpath'~Gittab/builtfile'	NB. '~Gittab/tabula.ijs'

RB=: ')'

  NB. Modify header.ijs with current date written into it
HEADERFILE fappend~ LF,'AABUILT=: ',quote NOW

  NB. build BUILTFILE
writesourcex_jp_ '~Gittab/source';BUILTFILE

smoutput '--- TABBY build: completed'
