NB. tpathjal.ijs - defines symbolic paths for TABULA
NB. DISTRIBUTION (JAL) VERSION
0 :0
Monday 15 April 2019  02:59:19
)

cocurrent 'z'

TPPP=: sort 2}. >cutopen 0 : 0
Name	Owner	Points to…
====	=====	=========
TPAR	CAL 	t-table archive
TPAT	TAB 	patch.ijs
TPCA	TAB 	cal.ijs
TPCL	CAL 	cal_log.txt
TPMC	CAL 	manifest in CAL
TPMT	TAB 	manifest in TABULA
TPMU	UU  	manifest in UU
TPNG	TAB 	toolbar png
TPSA	CAL 	SAMPLE*s (-:TPCA)
TPTA	TAB 	tabula.ijs
TPTT	CAL 	t-table library
TPUC	UU  	uuc.ijs
TPUF	UU  	uuf.ijs
TPUM	UU  	uum.ijs
TPUT	TAB 	usertools.ijs
TPUU	CAL  	uu.ijs
)

TPCA=: jpath'~addons/math/cal'		NB. path to CAL addon
TPTA=: jpath'~addons/math/tabula'	NB. path to TABULA addon
TPMT=: TPTA				NB. manifest in TABULA
TPAT=: TPTA				NB. patch.ijs
TPUT=: TPTA				NB. usertools.ijs
TPNG=: TPTA				NB. toolbar png
