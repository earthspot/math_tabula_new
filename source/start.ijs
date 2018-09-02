	NB. tabby - start.ijs
'==================== [tabby] start ===================='

cocurrent 'tabby'

start=: 3 : 0
wd 'timer 0'
tabengine=: tabengine_cal_
tt_z_=: tabengine_z_=: tabengine

tab_open''
NB. fillttable''
tabengine'Init'
wd 'psel tab; set panel items *',tabengine'CTBU'
)

start''