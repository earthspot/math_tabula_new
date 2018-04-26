'==================== main uuinterface.ijs ===================='
NB. IAC Sun 28 Jun 2015  18:41:30

cocurrent 'tab'

NB. INTERFACE WITH THE SCIENTIFIC UNITS ADDON: math/uu
NB.
NB. All verbs used by math/tabula from math/uu are shown below.
NB. All such verbs are covered by aliases in locale _tab_
NB. Therefore, _uu_ should not appear anywhere else
NB.  in the source code of this project: math/tabula.

NB. NOTE:
NB. start_uu_ (alias startuu_tab_) is called by
NB. the script of math/uu itself when it is first loaded.
NB. Therefore start_tab_ (see [qt] start.ijs) does not need
NB. to call it.
NB. However handler: restart_tab_ DOES need to call it,
NB. which is why startuu is provided below for this purpose.
NB. It also needs calling if UUC is changed.

convert=: convert_uu_
scino=: scino_uu_
set_ucase=: set_ucase_uu_
sig=: sig_uu_
startuu=: start_uu_
uurowsc=: uurowsc_uu_
uurowsf=: uurowsf_uu_
