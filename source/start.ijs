	NB. tabby - start.ijs
'==================== [tabby] start ===================='

cocurrent 'tabby'

start=: 3 : 0
traceverbs 'OFF'
wd 'timer 0'
load :: 0: USERTOOLS_z_
load '~CAL/cal.ijs'  NB. makes UU available too
  NB. ...but all access to UU should be done via CAL instructions
tabengine=: tabengine_cal_  NB. replace dummy local CAL link
tx_z_=: tabenginex_tabby_  NB. to allow e.g. CAL to update UI directly
  NB. initialize and load a t-table to show in: panel
start_cal_ '$$'  NB. start with SAMPLE t-table
tab_open''
setpreci 3  NB. set numeric precision for value column
setunico 1  NB. set SI conformance level for units column
setSelection 1
updatevaluebar''
restoreFocusToInputField''
)

startonload''  NB. switchable in _z_