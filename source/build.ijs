NB. tabula - build
0 :0
Monday 3 September 2018  00:45:57
-
open BUILTFILE
)

NB. TO LOAD JUST THIS BUILTFILE:	fn⌘F9
NB. DITTO THEN RUN:		fnF9

smoutput '--- TABBY build: started'

NOW=: date''
HEADERFILE_z_=: '~Gittab/source/header.ijs'
BUILTFILE_z_=: 1!:1 <jpath'~Gittab/builtfile'	NB. '~Gittab/tabula.ijs'

RB=: ')'

  NB. Modify header.ijs with current date written into it
HEADERFILE fappend~ LF,'AABUILT=: ',quote NOW

  NB. build BUILTFILE
writesourcex_jp_ '~Gittab/source';BUILTFILE

smoutput '--- TABBY build: completed'
