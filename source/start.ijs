	NB. tabby - start.ijs
'==================== [tabby] start ===================='

cocurrent 'tabby'

start=: 3 : 0
 sllog=: smoutput@llog
 sllog=: empty	NB. <<<<<<<<<<<<<<<<<<<<< DISABLE NEW TRACING
 TRACI=: 0
wd 'timer 0'
require '~Gitcal/cal.ijs'   NB. makes UU available too
  NB. ...but all access to UU should be done via CAL instructions
tabengine=: tabengine_cal_  NB. replace dummy local CAL link
tt_z_=: tabengine_z_=: tabengine f.  NB. make visible everywhere
tab_open''
NB. fillttable'' --no longer need dummy data.
tabengine'Init'
wd 'psel tab; set panel items *',tabengine'CTBU'
)

start''