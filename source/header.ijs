0 :0
Saturday 12 January 2019  08:41:56
-
TABULA: scientific units calculator
-simplified architecture
)

clear 'tabby'	NB. >>>>> DELETE THIS LINE IN RELEASED ADDON
coclass LOC=.'tabby'
clear LOC
coinsert 'jgl2'	NB. use gl2 verbs to paint the window
onload_z_=: empty
startonload_z_=: start_tabby_
NB. startonload_z_=: empty

fixfont=: 3 : 0
  NB. the appropriate fixed-font for the platform
if. if807'' do. 'fixfont'
else.           '"Menlo" 14'
end.
)

AABUILT=: '2019-01-12  08:51:42'
AABUILT=: '2019-01-12  09:05:52'
AABUILT=: '2019-01-12  09:19:15'
AABUILT=: '2019-01-12  16:03:01'
AABUILT=: '2019-01-13  23:56:01'
AABUILT=: '2019-01-13  23:57:45'
AABUILT=: '2019-01-13  23:58:19'