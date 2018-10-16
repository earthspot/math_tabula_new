	NB. tabby - start.ijs
'==================== [tabby] start ===================='

cocurrent 'tabby'

start=: 3 : 0
traceverbs 'OFF'
wd 'timer 0'
load '~Gitcal/cal.ijs'   NB. makes UU available too
  NB. ...but all access to UU should be done via CAL instructions
tabengine=: tabengine_cal_  NB. replace dummy local CAL link
 sesi_z_=: smoutput NB. FUDGE to make sesi visible
  NB. initialize and load a t-table to show in: panel
if. y-:0 do. tabengine 'Inic'  NB. start with vacant t-table
else.        tabengine 'Init'  NB. start with SAMPLE t-table
end.
TPATH_TTABLES=: tabengine'TPTT'  NB. make a local copy
tab_open''
setpreci 3  NB. set numeric precision for value column
setunico 1  NB. set SI conformance level for units column
setSelection 1
updatevaluebar''
restoreFocusToInputField''
)

start''