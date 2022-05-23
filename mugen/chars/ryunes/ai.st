;--------------------------------------------------------------------------------
;Ralf AI file and -3 States

;===========================================================================
;[-2 states]

[StateDef -2]

[State -2, Combo Reset]
Type = VarSet
trigger1 = MoveType = H
trigger1 = Stateno != [130, 153]
trigger2 = roundstate != 2
trigger3 = stateno = [150, 155]
trigger4 = stateno = [800, 820]
var(55) = 0

[State -2, Active Defense]
Type = VarSet
triggerall = time >= 0
trigger1 = stateno = 150
trigger2 = stateno = 152
var(55) = 131072
ignorehitpause = 1

[State -2, Active Defense]
Type = VarSet
triggerall = time >= 0
trigger1 = stateno = [150,153]
var(54) = 4
ignorehitpause = 1

[State -2, Taunt]
Type = VarAdd
trigger1 = var(41) > 0
var(41) = -1
ignorehitpause = 1

[State -2, ComboCounter Reset]
Type = VarSet
trigger1 = P2MoveType != H
var(51) = 0

[State -2, Projhit counts toward damage dampner]
Type = VarAdd
trigger1 = var(44) = 15
v = 51
value = 1

[State -2, Damage Dampner]
Type = VarSet
trigger1 = MoveType != A
var(42) = 1

[State -2, ProjPause]
Type = Pause
trigger1 = var(44) % 2
time = 2

[State -2, VarDec]
Type = VarAdd
trigger1 = var(44) > 0
v = 44
value = -1

[State -2, Special Cancel Limiter Reset]
Type = VarSet
trigger1 = movetype != A
var(49) = 1

[State -2, Chain Flag reset]
Type = VarSet
trigger1 = movetype = I
var(54) = 0

[State -2, Check for limit]
Type = VarSet
trigger1 = var(49) = 0
var(55) = var(55) & 57344

[State -2, HitWeak]
type = PlaySnd
triggerall = Time = 1
triggerall = alive
triggerall = Random < 333
trigger1 = movetype = H
trigger1 = anim % 10 = 0
trigger1 = (StateNo != [130, 155])
value = 5000,(random > 499)
ignorehitpause = 1
channel = 0

[State -2, HitStrong]
type = PlaySnd
triggerall = Time = 1
triggerall = alive
triggerall = Random < 333
trigger1 = movetype = H
trigger1 = anim % 10 = 2
trigger1 = (StateNo != [130, 155])
value = 5000,10+(random > 499)
ignorehitpause = 1
channel = 0

[State -2, Stop Channel 1 if Hit]
type = StopSnd
trigger1 = movetype = H
trigger1 = time = 0
ignorehitpause = 1
channel = 1

[State -2, Base Damage]
Type = VarSet
trigger1 = 1
fvar(28) = ifelse(var(51) <= 4, 4.25, ifelse(var(51) <= 10, 3.7, ifelse(var(51) <= 15, 3, ifelse(var(51) <= 20, 2.35, 2))))

[State -2, NoAirGuard]
Type = AssertSpecial
trigger1 = 1
flag = noairguard
ignorehitpause= 1

;----------------------------------------------------------------------
;Jump Control
[State -2, Jump Control Time]
Type = VarAdd
trigger1 = var(1) > 0
trigger1 = stateno != [11, 12]
v = 1
value = -1 * (Stateno != [40, 50])

[State -2, Jump Control Time End]
Type = VarSet
trigger1 = var(1) = 0
var(0) = 0

;----------------------------------------------------------------------
;Super finish
[State -2, Explod]
Type = Helper
trigger1 = WinKO
trigger1 = NumHelper(6000) = 0
stateno = 6000
id = 6000
pos = 0,0
postype = left
ignorehitpause = 1

;===========================================================================
;Super finish background
[Statedef 6000]
Type = S
MoveType = I
anim = 4000

[State 6000, Explod]
Type = Explod
triggerall = numexplod(105) = 0
trigger1 = Parent, Stateno=[3000, 3600]
trigger1 = Parent, NumTarget > 0
trigger2 = Parent, Var(2) = 1
id = 105
anim = F105
postype = left
pos = 160, 0
ignorehitpause = 1
under = 1
persistent = 0
bindtime = -1

[State 6000, AssertSpecial]
Type = AssertSpecial
trigger1 = NumExplod(105) = 1
flag = noBG
flag2 = noFG
ignorehitpause = 1


;===========================================================================
;StateDef - 3

[StateDef -3]

[State -3, JuggleVarSet]
Type = VarSet
trigger1 = NumTarget = 0
trigger1 = MoveType != A
trigger2 = (P2MoveType != H)
trigger3 = var(36) > 0 
trigger4 = var(45) = 10
trigger4 = (var(49) > 0) || (var(54) = 3)
var(47) = 15

[State -3, Special Flag Reset]
Type = VarSet
trigger1 = NumTarget = 0
var(40) = 0

[State -3, Special Cancel Time]
Type = VarAdd
trigger1 = var(45) > 0
v = 45
value = -1

[State -3, Counter Juggle Time]
Type = VarAdd
trigger1 = var(36) > 0
v = 36
value = -1
ignorehitpause = 1

[State -3, Debug]
Type = DisplayToClipBoard
trigger1 = 1
text = "fvar(28) : %f, var(51) : %d, var(55): %d, var(47): %d, Var(49): %d"
params = fvar(28), var(51), var(55), var(47), var(49)


