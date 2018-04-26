'==================== qt idle.ijs ===================='

cocurrent 'tab'

NB. From wd help...
NB. timer i ; set session interval timer to i milliseconds. 
NB. The sentence sys_timer_z_ '' is executed when time has elapsed. 
NB. The timer keeps triggering events until the timer is turned off. 
NB. An argument of 0 turns the timer off. 
NB. The systimer event may be delayed if J is busy, 
NB. and it is possible for several delayed events to be reported 
NB. as a single event. 
NB. See also ptimer.
NB.
NB. ptimer i ; set form interval timer to i milliseconds. 
NB. This has the same behavior as timer, but is signaled as a form 
NB. event, using the formname of the selected parent at the time 
NB. ptimer i is executed. 
NB. When the time has elapsed, the sentence
NB.  formname_timer_formlocale_ '' 
NB. is executed. 
NB. The parent is not automatically psel'd before the sentence is 
NB. executed.

0 :0
idle 'Init'
idle 'Go'
idle 'Quit'
)

sess_idle =: smoutput

IDLE_INTERVAL=: 500 NB. millisecs
IDLE_COUNTDOWN=: 0	 NB. delays task performance when >0
IDLE_COUNTDOWN_MAX=: 3  NB. max delay of task performance

tab_timer=: idle		NB. timer event handler for: idle

wdbad=: 3 : 0
sess_idle '>>> bad wd arg in idle: ',y
sess_idle '>>> stopping idle event stream...'
idle 'Quit'
)

idle=: 3 : 0
  NB. Manage housekeeping tasks to perform when app is idle
sess_idle=. empty	NB. turn off trace messages
select. y
case. 'DoTask' do.
  sess_idle 'idle: do idle_task now'
  idle_task''	NB. alter this as req'd
NB. ---------------------------------------
case. 'Quit' do.
  sess_idle 'idle: event stream stopped'
  wd :: wdbad 'psel tab; ptimer 0'
NB. ---------------------------------------
case. 'Init' do.
  sess_idle 'idle: event stream started'
  wd :: wdbad 'psel tab; ptimer ',":IDLE_INTERVAL
NB. ---------------------------------------
case. 'Go' do.
NB. idle_task is performed ONCE when count is 1
NB. idle_task is finished/inactivated when count is 0
  sess_idle 'idle: countdown (re-)started'
  IDLE_COUNTDOWN=: IDLE_COUNTDOWN_MAX
NB. ---------------------------------------
case. '' do.
  Handler 'idle'  NB. handles the actual timer event
  seeProgress''   NB. display progress on long-running CAL task
  sess_idle 'idle: event called; countdown=',":IDLE_COUNTDOWN
  if. 1=IDLE_COUNTDOWN do. idle 'DoTask' end.
  if. 0<IDLE_COUNTDOWN do. IDLE_COUNTDOWN=: IDLE_COUNTDOWN-1 end.
end.
EMPTY
)

idle_task=: confirm  NB. all that needs doing for now

seeProgress=: 3 : 0
  NB. display progress if any
if. _ = PROGRESS_z_ do. return. end.
confirm 'PROGRESS: ',":PROGRESS
NB. idle 'Go'
wd 'msgs'
)
