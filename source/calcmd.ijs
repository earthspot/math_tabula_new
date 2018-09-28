	NB. tabby - calcmd.ijs
'==================== [tabby] calcmd.ijs ===================='
0 :0
Friday 28 September 2018  20:40:53
-
TABULA input line interpreter
-
tabenginex 'ad1p 1'
tabenginex 'sb1p 1'
)

interpretCalco=: 3 : 0
  NB. interpret the user-input command string: y
  NB. If y is empty then ASSUME called as a wd-handler
  NB. In which case interpret contents of TABU wd-cache: calco
if. 0=#y do. y=. dltb calco end.
theItem=. line 0
select. {.y
case. '/' do. tabenginex }.y           NB. general CAL-instruction
case. '$' do. tabenginex 'open' ; }.y  NB. load SAMPLE*
case.  QT do. tabenginex 'name' ; theItem ; }.y
case.     do.
  if. SP e. y do. tabenginex 'quan' ; theItem ; y
  else.           tabenginex 'valu' ; theItem ; y
  end.
end.
)
