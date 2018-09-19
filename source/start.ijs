	NB. tabby - start.ijs
'==================== [tabby] start ===================='

cocurrent 'tabby'

start=: 3 : 0
sllog=: smoutput@llog
NB.  sllog=: empty	NB. <<<<<<<<<<<<<<<<<<<<< DISABLE NEW TRACING
wd 'timer 0'
load '~Gitcal/cal.ijs'   NB. makes UU available too
  NB. ...but all access to UU should be done via CAL instructions
tabengine=: tabengine_cal_  NB. replace dummy local CAL link
 sesi_z_=: smoutput NB. FUDGE to make sesi visible
tt_z_=: tabengine_z_=: tabengine  NB. make visible everywhere
tabengine'Init' NB. initialize and load a t-table to show in: panel
TPATH_TTABLES=: tabengine'TPTT'  NB. make a local copy
tab_open''
setpreci 3  NB. set numeric precision for value column
setunico 1  NB. set SI conformance level for units column
NB. wd 'psel tab; set panel items *',tabengine'CTBU' ---redundant
tab_panel_select 1
)

start''