NB. tabby - build
0 :0
Friday 31 August 2018  21:27:06
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

  NB. Re-create header.ijs with current date written into it
ferase HEADERFILE
HEADERFILE fappend~ sw 0 :0
0 :0
(NOW)
-
TABBY: scientific units conversion package
(RB)

clear 'tabby'	NB. >>>>> DELETE THIS LINE IN RELEASED ADDON
coclass 'tabby'
coinsert 'jgl2'
AABUILT=: '(NOW)'
)

  NB. build BUILTFILE
writesourcex_jp_ '~Gittab/source';BUILTFILE

smoutput '--- TABBY build: completed'
