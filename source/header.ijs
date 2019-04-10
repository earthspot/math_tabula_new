	NB. tabby - header.ijs
'==================== [tabby] header ===================='
0 :0
Wednesday 10 April 2019  06:57:29
-
TABULA: scientific units calculator
-simplified architecture
)

coclass LOC=.'tabby'
coinsert 'jgl2'	NB. use gl2 verbs to paint the window

CREATOR=: ;(4!:4<'zx'){4!:3''[zx=.''
onload_z_=: empty
startonload_z_=: start_tabby_	NB. or: empty

fixfont=: 3 : 0
  NB. the appropriate fixed-font for the platform
NB. if. if807'' do. 'fixfont' end.
'"Menlo" 14'
)

FORM_POSITION=: _1     NB. upper left
NB. FORM_POSITION=: _2     NB. upper right
NB. FORM_POSITION=: _3     NB. lower left
NB. FORM_POSITION=: _4     NB. lower right
NB. FORM_POSITION=: _5     NB. center

PNG=: CREATOR rplc 'tabula.ijs' ; 'tabula-toolbar.png'

  NB. path to the ALTERNATIVE usertools script
  NB. for remembering user tools redefined in-session
]USERTOOLS_z_=: CREATOR rplc 'tabula.ijs' ; 'usertools.ijs'

AABUILT=: '2019-04-10  06:54:36'
AABUILT=: '2019-04-10  06:57:34'
AABUILT=: '2019-04-10  06:58:41'
AABUILT=: '2019-04-10  06:59:34'