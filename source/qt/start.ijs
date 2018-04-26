'==================== [qt] start.ijs ===================='
NB. New source script
NB. IAC Mon 29 Jun 2015  12:28:46

cocurrent 'tab'

NB. =========================================================
Handler=: Handler1 	NB. to see each handler announce itself
Handler=: empty
NB. =========================================================
NB. sess_/smoutput settings now handled by script: sesses.ijs
NB. =========================================================

VERSION=: UNSET

start=: 3 : 0
coldstart=. 0=#y
sss''		NB. set sess* probes to "ordinary"
getversion TPATH_TABULA
PROGRESS_z_=: _	NB. init CAL progress in idle state
BNDOWN=: BN=: _	NB. selected button# in toolbar g
public_uu_'tab'	NB. make aliases in this locale
tabengine 'Init'
L0=: 1 [L1=: 0
sysmodifiers=: ,'0'
searchc=: searchf=: ''
MAXLINE=: 0	NB. increased by: putpanel
winpos 'Init'
if. coldstart do. tab_open'' end. 	NB. tab_open --see: [qt] show.ijs
''refresh'' 	NB. creates constants used by: tabenginex
calco=: ''
paneL0'' [panel_select=: ,'1'
setpreci sig''
setunits 0
wd 'pshow'
drawallico''	NB. needs form to be showing
idle 'Init'	NB. start the "idle" event stream
ide 0 		NB. hide the diagnostic J IDE
inputfocus''
)

NB. =========================================================
start''
