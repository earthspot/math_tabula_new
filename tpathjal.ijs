NB. tpathjal.ijs - defines symbolic paths for TABULA
NB. DISTRIBUTION (JAL) VERSION
0 :0
Saturday 13 April 2019  16:42:01
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

TPCA=: jpath'~addon/math/cal'          NB. path to CAL addon
TPTA=: jpath'~addon/math/tabula'       NB. path to TABULA addon
TPMT=: TPTA				NB. manifest in TABULA
TPAT=: TPTA				NB. patch.ijs
TPUT=: TPTA				NB. usertools.ijs
TPNG=: TPTA				NB. toolbar png
