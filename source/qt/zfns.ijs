NB. zfns

NB. ========== z-LOCALE ==========

cocurrent 'z'

TPATH_TABULA=: 3 : 0 ''
NB. returns directory containing this script
NB. also assigns global: WHEREAMI -the folder in question
NB. plus SEP -the platform-dependent path-separator.
ws=. [: 'Not from script'"_`({ 4!:3@(0&$))@.(0&<:) [: 4!:4 [: < >
WHEREAMI=: '<UNSET>' NB. needed for ws to work with
z=. >ws 'WHEREAMI'
SEP=: '/\' {~ '\' e. z
WHEREAMI=: (>: z i: SEP) {.z
)

NB. Load: cal -by looking for sibling folder
NB. load (TPATH_TABULA,'tabula.ijs') rplc ;:'tabula cal'

NB. Permit manual reset of window posn by entering: repos 0
repos=: repos_tab_

NB. =========================================================
start_tab_''
