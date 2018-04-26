'==================== main common.ijs ===================='

cocurrent 'tab'

NB. =========================================================
invalplot=: 3 : 'erase listnameswithprefix ''PLOT'''

NB. =========================================================
assignments=: 3 : 0
NB. assignment phrases of name list (y)
NB. used by: winpos
]dummy=. 3 : 'y, 5}.crr''UNSET'''
b2f crr :: dummy each a2b y
)

NB. =========================================================
preload=: 3 : 0
NB. called by verbs which invalidate old table
if. dirty'' and not heldshift'' do.
  par=. 24 message'' NB. Save current t-table?
  msg=. 25 message tabengine'TITL'
  msg=. msg,LF, 26 message''
  msg=. msg,LF, 27 message''
  msg=. msg,LF,LF, 28 message''
  msg=. msg,LF,LF,LF,~ 29 message''
  if. wdquery par;msg do.
    confirm 10 message'' NB. New/Load t-table -cancelled
    0 return.
  end.
end.
invalplot''
1 return.
)

NB. wd_probed - eliminated
NB. wde - eliminated

NB. =========================================================
window_close=: (wd :: 0:) bind 'psel tab; pclose'

NB. =========================================================
RECALL=: 'XY0_z_ XY1_z_ TPATH_TTABLES_z_ HTMIN HTLINE MAXNOSCROLL RECALL' NB. winpos

HTMIN=: 213
HTMAX=: 308
HTLINE=: 19
MAXNOSCROLL=: 7

	NB. manage form position and size
	NB. Assumes "factory" globals defined in this script
	NB.   MAXNOSCROLL  max lines before scrolling (-->HTMAX)
	NB.   HTMAX   max form height (px)
	NB.   HTMIN   min form height (px)
	NB.   HTLINE  line height (px) -depends on font
	NB.   WDF     window width (never changes)
	NB.   XYF     window position (last-ditch fallback)
winpos=: 3 : 0
configfile=: TPATH_CONFIG,CONFIGNAME
select. y
case. 'Quit' do.
  winpos 'Here-'
NB.   z=.      'XY0_z_=:' c XY0_z_
NB.   z=. z,LF,'XY1_z_=:' c XY1_z_
NB.   z=. z,LF,'TPATH_TTABLES_z_=:' c quote TPATH_TTABLES
  z=. assignments RECALL	NB. nouns to remember next session
  z=. z,~ 'cocurrent ''tab''',LF  NB. default unlocated nouns
  z fwrite configfile
NB. ----
case. 'Init' do.		NB. fetch config data, init
  winpos 'Dflt'		NB. apply defaults
  load :: 0: configfile	NB. override settings from config
  XY0_z_=: XY1_z_		NB. establish at old XY1
NB. ----
case. 'Dflt' do.		NB. apply defaults
  HTMAX=: HTMIN + HTLINE * MAXNOSCROLL
  if. absent'XY0_z_' do. NB. smoutput 'XY0<--XYF'
 XY0_z_=: XYF end.
  if. absent'XY1_z_' do. NB. smoutput 'XY1<--XY0'
 XY1_z_=: XY0 end.
  if. absent'HT1_z_' do. HT1_z_=: HTMIN end.
NB. ----
fcase. 1 do.		NB. tool clicked
case. 'Blit' do.		NB. redraw at NEW screen pos
  winpos 'Here'
  XY0_z_=: XY1_z_		NB. bring up the rearguard
NB. ----
case. 'Here-' do.		NB. XY1 to new screen pos
  xynow=. 2{. ".wd :: (''"_) 'psel tab; qform;'
  if. 0<:{:xynow do. XY1_z_=: xynow end.
NB. ----
case. 'Here' do.		NB. redraw at screen pos
  winpos 'Here-'
  winpos 'Redraw'
NB. ----
fcase. 0 do.		NB. tool clicked
case. 'Back' do.		NB. redraw at former position
  XY1_z_=: XY0_z_		NB. revert XY1 to XY0
  winpos 'Redraw'
NB. ----
case. 'Redraw' do.		NB. redraw at existing XY1
  winpos 'Dflt'		NB. apply defaults
  HT1_z_=: HTMAX >. HTMIN + HTLINE*nitems 0
  wd 'psel tab; pmove' c XY1,WDF,HT1
case. '?' do.		NB. show XY0, XY1, currentpos
  xynow=. 2{. ".wd :: (''"_) 'psel tab; qform;'
  xynow ; XY1_z_ ; XY0_z_ return.
case. do. smoutput '>>> winpos: unknown y=',quote":y
end.
)

sm 0 :0
TEST.........
erase 'XY0_z_ XY1_z_'
smoutput winpos 'Quit'	NB. saves config jscript
smoutput winpos 'Init'	NB. loads config
smoutput winpos 'Dflt'
smoutput winpos 1
smoutput winpos 'Blit'
smoutput winpos 'Here-'
smoutput winpos 'Here'
smoutput winpos 0
smoutput winpos 'Back'
smoutput winpos 'Redraw'
smoutput winpos '?'
)