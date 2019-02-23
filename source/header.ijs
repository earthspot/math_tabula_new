0 :0
Friday 22 February 2019  23:05:25
-
TABULA: scientific units calculator
-simplified architecture
)

clear 'tabby'	NB. >>>>> DELETE THIS LINE IN RELEASED ADDON
coclass LOC=.'tabby'
clear LOC
coinsert 'jgl2'	NB. use gl2 verbs to paint the window
onload_z_=: empty
startonload_z_=: start_tabby_	NB. or: empty

fixfont=: 3 : 0
  NB. the appropriate fixed-font for the platform
NB. if. if807'' do. 'fixfont' end.
'"Menlo" 14'
)

NB. FORM_POSITION=: _1     NB. upper left
FORM_POSITION=: _2     NB. upper right
NB. FORM_POSITION=: _3     NB. lower left
NB. FORM_POSITION=: _4     NB. lower right
NB. FORM_POSITION=: _5     NB. center

  NB. path to the ALTERNATIVE usertools script
  NB. for remembering user tools redefined in-session
]USERTOOLS_z_=: jpath '~Gittab/usertools.ijs'

AABUILT=: '2019-02-22  23:12:25'
AABUILT=: '2019-02-22  23:19:40'
AABUILT=: '2019-02-22  23:22:12'
AABUILT=: '2019-02-23  03:43:24'
AABUILT=: '2019-02-23  03:46:26'
AABUILT=: '2019-02-23  03:48:55'
AABUILT=: '2019-02-23  03:52:44'
AABUILT=: '2019-02-23  04:01:31'