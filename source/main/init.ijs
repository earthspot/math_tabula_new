'==================== main init.ijs ===================='
NB. IAC Mon 29 Jun 2015  01:33:44

require 'format/zulu  ide/qt'

coclass 'tab'
require 'gl2'
coinsert'jgl2'

  NB. Use any CAL if already loaded
  NB. (CAL loads the right UU)
  NB. Else load CAL from my: jpath '~Release/'
3 : 0''
absent=. [: +./ 0 > [: nc ;:
if. absent'start_cal_' do.
  load '~Release/cal.ijs'
end.
i.0 0
)

clear 'tab'

erase 'TPATH_TABULA_z_' NB. not updated if already there
