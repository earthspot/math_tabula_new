'==================== qt show.ijs ===================='

NB. =========================================================
drawallico=: 3 : 0
wd 'psel tab;'
glclear''
0 drawico&>i.32
glpaint''   NB. needed for isidraw
)

drawclear=: 3 : 0
wd 'psel tab;'
glclear''
glpaint''   NB. needed for isidraw
)

drawico=: 3 : 0
if. y -: '' do. y=. 1 end.
0 drawico y
:
wd 'psel tab;'
icn=. 'ICO',nom=. firstword y ffrom BNS
if. 0>nc <icn do.
  smoutput '>>> unknown icon: [',(":y),']  ', icn
  return.
end.
NB. if x=1, draws icon "pressed"
empty y pix x pressed ". icn
)

pressed=: 4 : 0
if. x=0 do. y return. end.
NB. symbolic pixels: alter button to show it pressed
assert. 1056=#y
assert. 1056=#ICOhilit
i=. I. ICOhilit='/'
'y' i} y
)

NB. =========================================================
tab_open=: 3 : 0
window_close''	 NB. close any existing window
TABNDX=: 0
if. IFWIN do.	wd mswin TABU
else.		wd darwin TABU
end.
wd 'psel tab'
wd 'set g wh _1 64'
NB. wd 'set info font ',FONT
wd 'set info text *' , tabengine 'INFO'
try.
  t=. uurowsc searchc	NB. c/f fillconsts
  assert. 2=#$t
  NB. therefore must use x2f with wd 'set cons items...'
catch.
  t=. ,:UNSET
end.
NB. wd 'set cons font ',FONT
wd 'set cons font fixfont'
wd 'set cons items *',x2f t
try.
  t=. uurowsf searchf	NB. c/f fillfuncts
  assert. 2=#$t
  NB. therefore must use x2f with wd 'set cons items...'
catch.
  t=. ,:UNSET
end.
NB. wd 'set func font ',FONT
wd 'set func font fixfont'
wd 'set func items *',x2f t
wd 'set preci items *', o2f ": i.16
NB. wd 'set panel font ',FONT
wd 'set panel font fixfont'
wd 'set panel items *',UNSET
putsb 22 message''
NB. wd 'pshow'	NB. now done by: start
)
