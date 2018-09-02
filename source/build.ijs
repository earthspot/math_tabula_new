NB. tabby - build
0 :0
Sunday 2 September 2018  17:18:32
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
NB. ferase HEADERFILE
NB. HEADERFILE fappend~ sw 0 :0
NB. 0 :0
NB. (NOW)
NB. -
NB. TABBY: scientific units conversion package
NB. (RB)
NB.
NB. clear 'tabby'	NB. >>>>> DELETE THIS LINE IN RELEASED ADDON
NB. coclass 'tabby'
NB. coinsert 'jgl2'
NB. AABUILT=: '(NOW)'
NB. )

  NB. build BUILTFILE
writesourcex_jp_ '~Gittab/source';BUILTFILE

smoutput '--- TABBY build: completed'
