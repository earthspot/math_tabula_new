0 :0
Monday 25 February 2019  02:53:57
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

AABUILT=: '2019-02-25  05:27:47'
AABUILT=: '2019-02-25  05:47:44'
AABUILT=: '2019-02-25  13:04:29'
AABUILT=: '2019-02-25  13:15:18'
AABUILT=: '2019-02-25  13:17:37'
AABUILT=: '2019-02-26  07:44:43'
AABUILT=: '2019-02-26  07:59:11'
AABUILT=: '2019-03-04  12:51:41'
AABUILT=: '2019-03-04  13:00:57'
AABUILT=: '2019-03-04  13:20:59'
AABUILT=: '2019-03-04  13:22:12'
AABUILT=: '2019-03-04  15:47:29'
AABUILT=: '2019-03-04  15:53:43'
AABUILT=: '2019-03-05  04:27:07'
AABUILT=: '2019-03-05  04:53:42'
AABUILT=: '2019-03-06  09:22:50'
AABUILT=: '2019-03-06  09:33:08'
AABUILT=: '2019-03-06  10:01:17'
AABUILT=: '2019-03-06  10:02:51'
AABUILT=: '2019-03-26  01:52:52'
AABUILT=: '2019-03-26  02:00:02'
AABUILT=: '2019-03-26  02:54:21'
AABUILT=: '2019-03-26  02:57:56'
AABUILT=: '2019-03-26  03:02:01'
AABUILT=: '2019-03-26  04:37:08'
AABUILT=: '2019-03-29  13:33:03'
AABUILT=: '2019-03-30  20:15:33'