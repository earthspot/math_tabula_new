	NB. tabby - start.ijs
'==================== [tabby] start ===================='

cocurrent 'tabby'

VERSION=: '0.0.0'  NB. overridden by manifest.ijs

start=: 3 : 0
trace 0
wd 'timer 0'
  NB. Create the TP*_z_ nouns
if. fexist p=. (pathof CREATOR) sl 'tpathdev.ijs' do. load p
else.     load (pathof CREATOR) sl 'tpathjal.ijs'
end.
load TPMT sl 'manifest.ijs'  NB. to get VERSION
  NB. erase unwanted globals loaded by manifest
erase'CAPTION FILES DESCRIPTION RELEASE FOLDER LABCATEGORY PLATFORMS'
  NB. load class CAL
load TPCA sl 'cal.ijs'
  NB. load patch to override TABULA or CAL factory settings
load :: 0: TPAT sl 'patch.ijs'
load :: 0: USERTOOLS=: TPUT sl 'usertools.ijs'
tabengine=: tabengine_cal_  NB. override local placeholder
tx_z_=: tabenginex_tabby_  NB. to allow e.g. CAL to update UI directly
  NB. initialize and load a t-table to show in: panel
start_cal_ '$$'  NB. start with SAMPLE t-table
NB. start_tree_''  NB. open the tree window
PNG=: TPNG sl 'tabula-toolbar.png'
tab_open''
setpreci 3  NB. set numeric precision for value column
setunico 1  NB. set SI conformance level for units column
setSelection 1
updatevaluebar''
restoreFocusToInputField''
)

startonload''  NB. assigned in header.ijs