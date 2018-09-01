	NB. tabby - constants.ijs
'==================== [tabby] constants ===================='

cocurrent 'tabby'

sysmodifiers=: ,'0'
	NB. >>> ought we init ALL (wd) 'sys' caches?

CONTENT_TTABLE=: 0 : 0
Pseudogravity by rotation
  ┌    {1}        0.017 Hz      Frequency; hertz=
┌ │ ┌  {2}        0.338 km      r:radius of circuit
│ ├ └> {3}        2.126 km      circumference
├ └>   {4}        0.035 km/s    v:rotational speed
└>┌    {5}        3.710 m/(s²)  c:centripetal acceleration
  │ ┌  {6}            0 /       i:selector (1 or 2)
  │ ├  {7}        9.810 m/(s²)  g:earth gravity unit=
  │ ├  {8}        3.710 m/(s²)  a:mars gravity unit=
  ├ └> {9}        9.810 *       target pseudogravity
  └>   {10}       0.378 *       Set "U" to force equal
)

CONTENT_CONSTANTS=: 0 : 0
dummy content for Constants tab
Second line
line 3 --
)

CONTENT_FUNCTIONS=: 0 : 0
dummy content for Functions tab
Second line
line 3 --
)

TABENGINE_RESPONSE_Init=: 0 : 0
dummy tabengine Init confirmation
)

TABENGINE_RESPONSE_INFO=: 0 : 0
dummy tabengine INFO content
)

TABENGINE_RESPONSE_NOT_IMPLEMENTED=: 0 : 0
dummy tabengine NOT IMPLEMENTED--
)

COLOR_HOVER=: 255 200 0
COLOR_CLICK=: 255 100 0
COLOR_WHITE=: 255 255 255
COLOR_CLICK=: COLOR_WHITE
DESELECT=: 1
DIAMETER=: 30
NAME_TTABLE=: 'SAMPLE'
PEN_WIDTH=: 3
PNG=: temp 'tabula-toolbar.png'
TABNDX=: 0
TIMER_HOVER=: 1000 NB. (millisecs) delay before sys_timer_z_''
UNSET=: '<UNSET>'
XYWH=: 1500 22 536 450
