'==================== main zfns.ijs ===================='
NB. IAC Mon 29 Jun 2015  01:36:24

cocurrent 'z'

  NB. These constants are used also by CAL and UU
  NB. but they (re-) create them as well.
INVALID=: _.j_.
UNDEFINED=: _.

NB. UNSET=: '<UNSET>'  NB. moved to: consts.ijs

NB. =========================================================
NB. begins=: ] -: [ {.~ [: # ]  NB. moved to util.ijs

NB. =========================================================
  NB. debug'' -is called by toolbar handler: restart
debug=: 3 : 0
ide ''   NB. toggle IDE hide/show, status saved in IDE_z_
NB. sst 51
)

NB. =========================================================

NB. =========================================================
IDE=: 0

ide=: 3 : 0
select. y
  case. 0 do. wd 'ide hide' [IDE_z_=: y
  case. 1 do. wd 'ide show' [IDE_z_=: y
  case.   do. ide -.IDE_z_	NB. toggle status
end.
)

reconfigtabula=: ''&$: : (4 : 0)
NB. reload the config file, e.g. after editing it
NB. x=1 - save it for editing
if. x-:1 do. winpos_tab_ 'Quit' end.
winpos_tab_ 'Init'
)

NB. =========================================================
NB. start=: start_tab_	NB. not needed, or advisable

NB. =========================================================
TPATH_CONFIG_z_=: jpath '~config/'
TPATH_TABULA_z_=: whereami 'TPATH_TABULA_z_'
TPATH_RELEASE_z_=: jpath '~Release/'

0 : 0
smoutput VERSION_tab_ ; TPATH_RELEASE_z_
getversion_tab_ TPATH_RELEASE_z_
erase 'TPATH_TABULA_z_'
whereami 'TPATH_TABULA_z_'
)
