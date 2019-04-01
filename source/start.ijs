	NB. tabby - start.ijs
'==================== [tabby] start ===================='

cocurrent 'tabby'

start=: 3 : 0
trace 0
wd 'timer 0'
load :: 0: USERTOOLS_z_
load 'math/cal'  NB. (CAL loads UU)
  NB. ...MUST DO all access to UU suite via CAL instructions
tabengine=: tabengine_cal_  NB. replace dummy local CAL link
tx_z_=: tabenginex_tabby_  NB. to allow e.g. CAL to update UI directly
  NB. initialize and load a t-table to show in: panel
start_cal_ '$$'  NB. start with SAMPLE t-table
start_tre_''  NB. open the tree window
tab_open''
setpreci 3  NB. set numeric precision for value column
setunico 1  NB. set SI conformance level for units column
setSelection 1
updatevaluebar''
restoreFocusToInputField''
)

startonload''  NB. switchable in _z_