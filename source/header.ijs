0 :0
Wednesday 1 May 2019  05:24:35
-
TABULA: scientific units calculator
-simplified architecture
)

require 'format/zulu'
require 'math/uu/handy4uu'

coclass 'tabby'
coinsert 'jgl2'	NB. uses gl2 verbs to display the toolbar

PARENTDIR=: (zx i:'/'){.zx=.jpathsep>(4!:4<'zx'){4!:3''[zx=.''
onload_z_=: empty
startonload_z_=: start_tabby_	NB. or: empty
