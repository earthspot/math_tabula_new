0 :0
Tuesday 2 April 2019  17:37:29
-
TABULA: scientific units calculator
-simplified architecture
)

NB. clear 'tabby'	NB. >>>>> DELETE THIS LINE IN RELEASED ADDON
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

PNG=: jpath '~Gittab/tabula-toolbar.png'

  NB. path to the ALTERNATIVE usertools script
  NB. for remembering user tools redefined in-session
]USERTOOLS_z_=: jpath '~Gittab/usertools.ijs'

AABUILT=: '2019-04-03  12:54:29'