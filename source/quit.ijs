	NB. quit - main.ijs
'==================== [quit] main ===================='
0 :0
Saturday 12 January 2019  07:46:33
-
Adapted from TABULA[OLD]
CONTAINS IN-LINE ERROR/CONFIRMATION MESSAGES
--replace if MESSAGE table provided in due course.
-
if. -. preload'' do. return. end.
…In TABULA[OLD], called at top of: newtt opens opent quit
)

coclass 'tabby'

invalplot=: 3 : 0
  NB. close the plot window and neutralize Plot pkg
tabengine 'plox'
)

inval_nuterm=: 3 : 0
  NB. terminate nuterm (if in use)
NB. wd :: 0: 'psel nuterm; pclose'
try. nuterm_close_nut_'' catch. end.
)

preload=: 3 : 0
  NB. execute on entry to every tt-destroying verb:
  NB.   if. -. preload'' do. return. end.
NB. smoutput '+++ preload: called'
if. tabengine'DIRT' do.
  par=. 'Save current t-table?'
  mg=. 'The t-table: ', tabengine'TITL'	
  mg=. mg,LF, '-has significant unsaved changes'	
  mg=. mg,LF, '-which will be lost if you continue.' 	
  mg=. mg,LF,LF, '(To rescue this t-table, press No)'	
  mg=. mg,LF,LF,LF, 'OK to continue?'	
  if. wdquery par;mg do.
    confirm '>>> User cancelled: New/Load t-table'	
    0 return.
  end.
end.
invalplot''
1 return.
)

quit=: 3 : 0
  NB. this version calls: preload
if. -. preload'' do. return. end.
window_close''
if. IDE do. return. end.  NB. exit to J session
  NB. terminate TABULA (and J itself) however appropriate…
exit''
)