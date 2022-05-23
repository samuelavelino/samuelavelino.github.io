;===========================================================================
;Normal.St

;---------------------------------------------------------------------------
; Lose by Time Over
; CNS difficulty: basic
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 170, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 1

[State 170, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 0
ignorehitpause = 1

;---------------------------------------------------------------------------
; Win state decider
; CNS difficulty: basic
[Statedef 180]
type = S

[State 180, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 0
ignorehitpause = 1

[State 180, 1]
type = ChangeState
trigger1 = Time = 0
value = 181 + (Random > 499)

;---------------------------------------------------------------------------
; Win pose 1
[Statedef 181]
type = S
ctrl = 0
anim = 181
velset = 0,0

[State 181, 2]
type = PlaySnd
trigger1 = animelem = 3
value = 181,0

[State 181, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 1

;---------------------------------------------------------------------------
; Win pose 2
[Statedef 182]
type = S
physics = N
ctrl = 0
anim = 182
velset = 0,0

[State 182, 2]
type = PlaySnd
trigger1 = time = 0
value = 180,0

[State 182, 2]
type = PlaySnd
trigger1 = animelem = 16
value = 180,1

[State 182, VelSet]
Type = VelSet
trigger1 = animelem = 7
trigger2 = animelem = 11
y = -2.5

[State 182, Gravity]
Type = Gravity
trigger1 = animelemtime(7) > 0
trigger1 = animelemtime(10) < 0
trigger2 = animelemtime(11) > 0
trigger2 = animelemtime(14) < 0

[State 182, velSet]
Type = VelSet
trigger1 = animelem = 10
trigger2 = animelem = 14
y = 0

[State 182, velSet]
Type = PosSet
trigger1 = animelem = 10
trigger2 = animelem = 14
y = 0

[State 182, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 1

;---------------------------------------------------------------------------
; Introduction
[Statedef 191]
type = S
ctrl = 0
anim = 190
velset = 0,0

[State 190, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 0
ignorehitpause = 1

[State 191, Base Damage]
type = VarSet
trigger1 = time = 0
fvar(28) = 5

[State 191, 3]
type = VarSet
trigger1 = RoundState = 0
fvar(1) = 1

[State 190, AI Activate]
type = VarSet ;By Kamek
triggerall = var(59) = 0
trigger1 = IsHomeTeam
trigger1 = TeamSide = 2
var(59) = 1

[State 190, Give Power]
Type = PowerSet
trigger1 = time = 0
value = 1000

[State 191, 1] ;Freeze animation until PreIntro is over
type = ChangeAnim
trigger1 = RoundState = 0
value = 190

[State 191, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = animtime > 0
flag = Intro

[State 191, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0

;---------------------------------------------------------------------------
; Taunt
; CNS difficulty: easy
[Statedef 195]
type = S
ctrl = 0
anim = 195
velset = 0,0
movetype = I
physics = S

[State 195, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 0
ignorehitpause = 1

[state 195, Taunting has its costs]
Type = DefenceMulSet
trigger1 = 1
value = ifelse(life >= floor(fvar(32) * 0.85 + 0.5), 1.25, ifelse(life >= floor(fvar(32) * 0.7 + 0.5), 1.15, ifelse(life >= floor(fvar(32) * 0.55 + 0.5), 1.5, 0.95)))

[State 195, Taunt Timer]
Type = VarSet
trigger1 = 1
var(41) = 120

[State 195,3]
type = PlaySnd
trigger1 = time = 0
value = 180,0
channel = 0

[State 195, PowerAdd]
Type = PowerAdd
trigger1 = animtime = 0
value = 200

[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Stand Light Punch
[Statedef 200]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 200

[State 200, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) > 1
var(55) = 65439
persistent = 0

[State 200, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) > 1
trigger2 = time = 0
var(55) = 0

[State 200, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 200, HitDef]
type = HitDef
trigger1 = AnimElem = 2,1
trigger1 = Var(47) >= 8
attr = S, NA
damage = Floor((3 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 8, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -5, -44
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 10
ground.slidetime = 10
ground.velocity = -1.94124, 0.00000
air.velocity = -0.90506, -3.00000
air.hittime = 24
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 200, HitDef]
type = HitDef
trigger1 = AnimElem = 2,1
trigger1 = Var(47) < 8
attr = S, NA
damage = Floor((3 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = M
priority = 3, Hit
pausetime = 8, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -5, -44
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 10
ground.slidetime = 10
ground.velocity = -1.94124, 0.00000
air.velocity = -0.90506, -3.00000
air.hittime = 24
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 200, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -8
persistent = 0
ignorehitpause = 1

[State 200, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 200, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 200, 0

[State 200, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
channel = 0

;---------------------------------------------------------------------------
;Near Stand Light Punch
[Statedef 205]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 205

[State 205, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) > 1
var(55) = 65439
persistent = 0

[State 205, Chain Flag]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 205, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 205, HitDef]
type = HitDef
trigger1 = AnimElem = 2,1
trigger1 = Var(47) >= 8
attr = S, NA
damage = Floor((2 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 8, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -5, -51
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 10
ground.slidetime = 10
ground.velocity = -1.89849, 0.00000
air.velocity = -1.08372, -3.00000
air.hittime = 24
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 205, HitDef]
type = HitDef
trigger1 = AnimElem = 2,1
trigger1 = Var(47) < 8
attr = S, NA
damage = Floor((2 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = M
priority = 3, Hit
pausetime = 8, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -5, -51
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 10
ground.slidetime = 10
ground.velocity = -1.89849, 0.00000
air.velocity = -1.08372, -3.00000
air.hittime = 24
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 205, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -8
persistent = 0
ignorehitpause = 1

[State 205, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 205, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 200, 0
channel = 0

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Stand Light Kick
[Statedef 210]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 210

[State 210, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 210, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = animtime = 0
var(55) = 0

[State 210, Chain Flag]
Type = VarSet
trigger1 = animtime < 0
trigger1 = animelemtime(2) > 1
var(55) = 65439

[State 210, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = var(47) >= 8
attr = S, NA
damage = Floor((3 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 2, Hit
pausetime = 6, 6
sparkno = 0
guard.sparkno = 40
sparkxy = 0, -30
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.09849, 0.00000
air.velocity = -1.08372, -3.00000
air.hittime = 24
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 210, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = var(47) < 8
attr = S, NA
damage = Floor((3 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = M
priority = 2, Hit
pausetime = 6, 6
sparkno = 0
guard.sparkno = 40
sparkxy = 0, -30
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.09849, 0.00000
air.velocity = -1.08372, -3.00000
air.hittime = 24
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 210, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -8
persistent = 0
ignorehitpause = 1

[State 210, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 210, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 200, 0
channel = 0

[State 210, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Stand Strong Punch
[Statedef 220]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 220

[State 220, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) > 1
var(55) = 60292

[State 220, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) > 0
var(55) = 0

[State 220, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 220, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) >= 8
attr = S, NA
damage = Floor((8 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 6, Hit
pausetime = 12, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -40
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.88715, 0.00000
air.velocity = -1.79407, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 60, 90
givepower = 60, 90

[State 220, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) < 8
attr = S, NA
damage = Floor((8 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = M
priority = 6, Hit
pausetime = 12, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -40
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.88715, 0.00000
air.velocity = -1.79407, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 60, 90
givepower = 60, 90

[State 220, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -8
persistent = 0
ignorehitpause = 1

[State 215, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 220, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 210, 0
channel = 0

[State 220, HitDef]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Near Stand Strong Punch
[Statedef 225]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 225

[State 220, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) > 1
var(55) = 65412

[State 220, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(4) > 0
var(55) = 0

[State 220, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 220, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) >= 8
attr = S, NA
damage = Floor((7 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 6, Hit
pausetime = 12, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -30
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.88715, 0.00000
air.velocity = -1.79407, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 60, 90
givepower = 60, 90

[State 220, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) < 8
attr = S, NA
damage = Floor((7 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = M
priority = 6, Hit
pausetime = 12, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -30
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.88715, 0.00000
air.velocity = -1.79407, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 60, 90
givepower = 60, 90

[State 220, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -8
persistent = 0
ignorehitpause = 1

[State 215, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 220, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 210, 0
channel = 0

[State 220, HitDef]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Stand Strong Kick
[Statedef 230]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 230

[State 230, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(4) = 0
var(55) = 0

[State 230, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) > 1
var(55) = 64264

[State 230, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 230, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) >= 8
attr = S, NA
damage = Floor((10 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -54
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -3.78022, 0.00000
air.velocity = -1.91319, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 60, 90
givepower = 60, 90

[State 230, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) < 8
attr = S, NA
damage = Floor((10 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = M
priority = 4, Hit
pausetime = 12, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -54
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -3.78022, 0.00000
air.velocity = -1.91319, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 60, 90
givepower = 60, 90

[State 230, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -8
persistent = 0
ignorehitpause = 1

[State 230, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 230, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 210, 0
channel = 0

[State 230, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Near Stand Strong Kick
[Statedef 235]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 235

[State 230, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) = 0
var(55) = 0

[State 230, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) > 1
var(55) = 65412

[State 230, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 230, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) >= 8
attr = S, NA
damage = Floor((7 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -47
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -3.78022, 0.00000
air.velocity = -1.91319, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 60, 90
givepower = 60, 90

[State 230, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) < 8
attr = S, NA
damage = Floor((7 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = M
priority = 4, Hit
pausetime = 12, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -47
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -3.78022, 0.00000
air.velocity = -1.91319, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 60, 90
givepower = 60, 90

[State 230, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -8
persistent = 0
ignorehitpause = 1

[State 230, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 230, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 210, 0
channel = 0

[State 230, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Light Punch
[Statedef 400]
type    = C
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 400

[State 400, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) > 1
var(55) = 65435

[State 400, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) = 0
var(55) = 0

[State 400, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 400, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) >= 8
attr = C, NA
damage = Floor((2 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 10, 10
sparkno = 0
guard.sparkno = 40
sparkxy = 0, -26
hitsound = 5, 0
guardsound = 6, 0
ground.type = Low
ground.hittime = 10
ground.slidetime = 10
ground.velocity = -1.86770, 0.00000
air.velocity = -1.58755, -3.00000
air.hittime = 20
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 400, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) < 8
attr = C, NA
damage = Floor((2 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 10, 10
sparkno = 0
guard.sparkno = 40
sparkxy = 0, -26
hitsound = 5, 0
guardsound = 6, 0
ground.type = Low
ground.hittime = 10
ground.slidetime = 10
ground.velocity = -1.86770, 0.00000
air.velocity = -1.58755, -3.00000
air.hittime = 20
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 400, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -8
persistent = 0
ignorehitpause = 1

[State 400, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 400, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 200, 0
channel = 0

[State 400, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Light Kick
[Statedef 410]
type    = C
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 410

[State 410, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) > 0
var(55) = 65435

[State 410, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) > 2
var(55) = 0

[State 410, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) >= 8
attr = C, NA
damage = Floor((2 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = L
hitflag = MAF
priority = 3, Hit
pausetime = 10, 10
sparkno = 0
guard.sparkno = 40
sparkxy = 0, 0
hitsound = 5, 0
guardsound = 6, 0
ground.type = Low
ground.hittime = 8
ground.slidetime = 8
ground.velocity = -2.06183, 0.00000
air.velocity = -1.25000, -3.00000
air.hittime = 16
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 410, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) < 8
attr = C, NA
damage = Floor((2 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = L
hitflag = M
priority = 3, Hit
pausetime = 10, 10
sparkno = 0
guard.sparkno = 40
sparkxy = 0, 0
hitsound = 5, 0
guardsound = 6, 0
ground.type = Low
ground.hittime = 8
ground.slidetime = 8
ground.velocity = -2.06183, 0.00000
air.velocity = -1.25000, -3.00000
air.hittime = 16
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 410, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -8
persistent = 0
ignorehitpause = 1

[State 410, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 410, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 200, 0
channel = 0

[State 410, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Strong Punch
[Statedef 420]
type    = C
movetype= A
physics = S
juggle = 8
velset = 0,0
ctrl = 0
anim = 420

[State 420, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) > 0
var(55) = 65408

[State 420, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) > 3
var(55) = 0

[State 420, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 420, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = var(47) >= 8
attr = C, NA
damage = Floor((6 + (Random/1000.0) * 2) * Fvar(28) + 0.5), 0
animtype = Heavy
air.animtype = Up
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 12, 12
sparkno = 2
guard.sparkno = 40
sparkxy = 0, -26
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.88715, 0.00000
air.velocity = -1.79407, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

[State 420, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = var(47) < 8
attr = C, NA
damage = Floor((6 + (Random/1000.0) * 2) * Fvar(28) + 0.5), 0
animtype = Heavy
air.animtype = Up
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 12, 12
sparkno = 2
guard.sparkno = 40
sparkxy = 0, -26
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.88715, 0.00000
air.velocity = -1.79407, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

[State 420, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -8
persistent = 0
ignorehitpause = 1

[State 420, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 420, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 210, 0
channel = 0

[State 420, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Strong Kick
[Statedef 430]
type    = C
movetype= A
physics = S
juggle = 8
velset = 0,0
ctrl = 0
anim = 430

[State 430, Chain Flag]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 430, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 430, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) >= 8
attr = C, NA
damage = Floor((7 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Back
guardflag = L
hitflag = MAF
priority = 3, Hit
pausetime = 10, 11
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -35
hitsound = 5, 1
guardsound = 6, 0
ground.type = Trip
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.79407, -4.00000
guard.velocity = -3.28715
air.velocity = -2.79407, -3.00000
air.hittime = 30
air.type = Trip
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

[State 430, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) < 8
attr = C, NA
damage = Floor((7 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Back
guardflag = L
hitflag = M
priority = 3, Hit
pausetime = 10, 11
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -35
hitsound = 5, 1
guardsound = 6, 0
ground.type = Trip
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.79407, -4.00000
guard.velocity = -3.28715
air.velocity = -2.79407, -3.00000
air.hittime = 30
air.type = Trip
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

[State 430, Juggle]
Type = VarAdd
trigger1 = MoveHit
v = 47
value = -8
persistent = 0
ignorehitpause = 1

[State 430, DamageDampner]
Type = VarAdd
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 430, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 210, 0
channel = 0

[State 430, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Jump Light Punch
[Statedef 600]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 600

[State 600, Chain Flag]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 600, Chain Flag]
Type = VarSet
trigger1 = Animelemtime(2) > 1
var(55) = 37572

[State 600, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 600, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) >= 8
attr = A, NA
damage = Floor((4 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = H
hitflag = MAF
priority = 1, Hit
pausetime = 8, 12
sparkno = 0
guard.sparkno = 40
sparkxy = 0, -40
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.21467, 0.00000
guard.velocity = -2.55843
air.velocity = -1.61467, -3.00000
air.hittime = 30
air.type = High
getpower = 30, 45
givepower = 30, 45

[State 600, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) < 8
attr = A, NA
damage = Floor((4 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = H
hitflag = MA
priority = 1, Hit
pausetime = 8, 12
sparkno = 0
guard.sparkno = 40
sparkxy = 0, -40
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.21467, 0.00000
guard.velocity = -2.55843
air.velocity = -1.61467, -3.00000
air.hittime = 30
air.type = High
getpower = 30, 45
givepower = 30, 45

[State 600, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -3
persistent = 0
ignorehitpause = 1

[State 600, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 600, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 200, 0
channel = 0

;---------------------------------------------------------------------------
; Jump Light Kick
[Statedef 610]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 610

[State 610, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 610, Chain Flag]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 610, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) > 1
var(55) = 37572

[State 610, HitDef]
type = HitDef
trigger1 = time = 0
trigger1 = Var(47) >= 8
attr = A, NA
damage = Floor((3 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = 8, 12
sparkno = 0
guard.sparkno = 40
sparkxy = 0, -40
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.09556, 0.00000
guard.velocity = -2.46536
air.velocity = -1.29556, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45
persistent = 0
ignorehitpause = 1

[State 610, HitDef]
type = HitDef
trigger1 = time = 0
trigger1 = Var(47) < 8
attr = A, NA
damage = Floor((3 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = H
hitflag = MA
priority = 4, Hit
pausetime = 8, 12
sparkno = 0
guard.sparkno = 40
sparkxy = 0, -40
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.09556, 0.00000
guard.velocity = -2.46536
air.velocity = -1.29556, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45
persistent = 0
ignorehitpause = 1

[State 610, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -3
persistent = 0
ignorehitpause = 1

[State 610, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 610, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 200, 0
channel = 0

;---------------------------------------------------------------------------
; Head Stomp
[Statedef 615]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 615

[State 610, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 610, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) > 2
var(55) = 644

[State 615, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelem = 5
var(55) = 0

[State 615, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) >= 0
attr = A, NA
damage = Floor((5 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = 8, 10
sparkno = 0
guard.sparkno = 40
sparkxy = 0, 0
hitsound = 5, 0
guardsound = 6, 0
ground.type = Low
ground.hittime = 14
ground.slidetime = 14
ground.velocity = -2.09556, 0.00000
guard.velocity = -2.46536
air.velocity = -1.29556, -3.50000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 50, 75
givepower = 50, 75
persistent = 0
ignorehitpause = 1

[State 615, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) < 0
attr = A, NA
damage = Floor((5 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = H
hitflag = MA
priority = 4, Hit
pausetime = 8, 10
sparkno = 0
guard.sparkno = 40
sparkxy = 0, 0
hitsound = 5, 0
guardsound = 6, 0
ground.type = Low
ground.hittime = 14
ground.slidetime = 14
ground.velocity = -2.09556, 0.00000
guard.velocity = -2.46536
air.velocity = -1.29556, -3.50000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 50, 75
givepower = 50, 75
persistent = 0
ignorehitpause = 1

[State 615, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -4
persistent = 0
ignorehitpause = 1

[State 615, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 615, VelSet]
type = VelSet
trigger1 = Movecontact
trigger1 = hitpausetime = 0
y = -5.5
x = 1.5
persistent = 0

[State 615, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 200, 0
channel = 0

;---------------------------------------------------------------------------
; Jump Strong Punch
[Statedef 620]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 620

[State 620, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 37508

[State 620, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 620, HitDef]
type = HitDef
trigger1 = time = 0
trigger1 = var(47) >= 8
attr = S, NA
damage = Floor((6 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Hard
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = 10, 12
sparkno = 1
guard.sparkno = 40
sparkxy = 0, -40
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -2.49407, 0.00000
guard.velocity = -3.28715
air.velocity = -1.89407, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

[State 620, HitDef]
type = HitDef
trigger1 = time = 0
trigger1 = var(47) < 8
attr = S, NA
damage = Floor((6 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Hard
guardflag = H
hitflag = MA
priority = 4, Hit
pausetime = 10, 12
sparkno = 1
guard.sparkno = 40
sparkxy = 0, -40
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -2.49407, 0.00000
guard.velocity = -3.28715
air.velocity = -1.89407, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

[State 620, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -3
persistent = 0
ignorehitpause = 1

[State 620, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 620, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 210, 0
channel = 0

;---------------------------------------------------------------------------
; Jump Strong Kick
[Statedef 630]
type    = A
movetype= A
physics = A
juggle = 0
ctrl = 0
anim = 630

[State 630, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 37508

[State 630, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 630, HitDef]
type = HitDef
trigger1 = time = 0
trigger1 = Var(47) >= 8
attr = S, NA
damage = Floor((6 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Hard
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = 10, 12
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -37
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -2.77348, 0.00000
guard.velocity = -3.61586
air.velocity = -1.97348, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
hitonce = 1
getpower = 50, 75
givepower = 50, 75

[State 630, HitDef]
type = HitDef
trigger1 = time = 0
trigger1 = Var(47) < 8
attr = S, NA
damage = Floor((6 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Hard
guardflag = H
hitflag = MA
priority = 4, Hit
pausetime = 10, 12
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -37
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -2.77348, 0.00000
guard.velocity = -3.61586
air.velocity = -1.97348, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
hitonce = 1
getpower = 50, 75
givepower = 50, 75

[State 630, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -5
persistent = 0
ignorehitpause = 1

[State 630, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 630, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 210, 0
channel = 0

;---------------------------------------------------------------------------
; Throw Start
[StateDef 800]
type    = S
movetype= A
physics = S
juggle = 8
ctrl = 0
anim = 800
velset = 0,0
poweradd = 0
sprpriority = 2

[State 800, ChangeState]
Type = NotHitBy
trigger1 = MoveHit
value = SCA
ignorehitpause = 1

[State 800, HitDef]
Type = HitDef
trigger1 = time = 0
trigger1 = enemy, stateno != [130,160]
trigger1 = p2bodydist x = [-5, 20]
attr = S, NT
guardflag = 
hitflag = M
guard.dist = -1
priority = 1, Miss
sparkno = S4000
guard.sparkno = S4000
id = 800
sparkxy = -5, -41
sprpriority = 2
hitonce = 1
p2facing = 1
p2stateno = 802
p1stateno = 801
fall = 1
;hitsound = 5,0

[State 800, ChangeState]
Type = ChangeState
trigger1 = MoveHit
value = 801

[State 800, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 1305

;---------------------------------------------------------------------------
; Shoulder Slam
[StateDef 801]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 801
poweradd = 0
velset = 0,0

[State 801, TargetState]
Type = TargetState
trigger1 = time = 0
value = 802

[State 801, No Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 801, PlayerPush]
Type = PlayerPush
trigger1 = animelemtime(3) < 3
value = 0

[State 810, PosAdd]
Type = Width
trigger1 = 1
edge = 30,30

[State 801, Turn]
Type = Turn
trigger1 = var(50) = 2
trigger1 = time = 0

[State 801, TargetFacing]
Type = TargetFacing
trigger1 = facing = target, facing
trigger1 = var(50) = 2
value = -1

[State 801, TargetBind]
Type = TargetBind
trigger1 = animelemtime(2) < 0
pos = 15, 0

[State 801, TargetBind 2]
Type = TargetBind
trigger1 = animelemtime(3) < 0
trigger1 = animelemtime(2) >= 0
pos = 5, 15

[State 801, TargetBind 3]
Type = TargetBind
trigger1 = animelemtime(3) = 0
pos = 7, -5

[State 801, That Hurts]
type = TargetLifeAdd
trigger1 = animelem = 3
value = -Floor((9 + (Random/1000.0)* 3) * Fvar(28) + 0.5)

[State 801, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 2
trigger1 = Random > 499
value = 220, 0
channel = 0

[State 801, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Being Thrown by Shoulder Slam
[StateDef 802]
type    = S
movetype= H
physics = N
ctrl = 0
poweradd = 0
sprpriority = 1

[State 802, ChangeAnim2]
Type = ChangeAnim2
trigger1 = time = 0
value = 802

[State 811, VelSet]
Type = VelSet
trigger1 = animelem = 3,1
x = -3
y = -1.5

[State 811, 6]
Type = ChangeState
trigger1 = animtime = 0
trigger2 = time > 3
trigger2 = animelemtime(3) < 0
trigger2 = !gethitvar(isbound)
trigger3 = animelemtime(3) > 0
trigger3 = pos y >= 0
value = 822

[State 811, Gravity]
Type = Gravity
trigger1 = animelemtime(3) > 0

;---------------------------------------------------------------------------
;Air Throw Start
[StateDef 809]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 809
poweradd = 0
sprpriority = 2

[State 800, ChangeState]
Type = NotHitBy
trigger1 = MoveHit
value = SCA
ignorehitpause = 1

[State 809, HitDef]
Type = HitDef
trigger1 = time = 0
trigger1 = var(47) >= 0
;trigger1 = p2dist y = [-45,45]
attr = S, NT
guardflag =  
hitflag = AFD
guard.dist = -1
priority = 1, Miss
id = 800
nochainid = 800
sparkno = S4000
guard.sparkno = S4000
sparkxy = -5, -41
sprpriority = 2
hitonce = 1
p2facing = 1
p2stateno = 812
p1stateno = 810
fall = 1
;hitsound = 5,0

[State 800, ChangeState]
Type = ChangeState
trigger1 = MoveHit
value = 810

[State 800, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 815

;---------------------------------------------------------------------------
;Air Shoulder Slam
[StateDef 810]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 810
poweradd = 0
velset = 2.5, 0

[State 801, TargetState]
Type = TargetState
trigger1 = time = 0
value = 812

[State 801, No Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 801, PlayerPush]
Type = PlayerPush
trigger1 = 1
value = 0

[State 810, PosAdd]
Type = Width
trigger1 = 1
edge = 30,30

[State 801, TargetBind]
Type = TargetBind
trigger1 = animelemtime(2) < 0
pos = 15, 0

[State 801, TargetBind 2]
Type = TargetBind
trigger1 = animelemtime(2) >= 0
pos = 5, 15

[State 810, Gravity]
Type = Gravity
trigger1 = 1

[State 810, ChangeState]
Type = ChangeState
trigger1 = pos y >= 0
value = 811

;---------------------------------------------------------------------------
;Air Shoulder Slam
[StateDef 811]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 811
poweradd = 0
velset = 0,0

[State 811, PosSet]
Type = PosSet
trigger1 = time = 0
y = 0

[State 801, TargetBind 3]
Type = TargetBind
trigger1 = time = 0
pos = 7, -5

[State 801, That Hurts]
type = TargetLifeAdd
trigger1 = time = 0
value = -Floor((9 + (Random/1000.0)* 3) * Fvar(28) + 0.5)

[State 811, TargetState]
Type = TargetState
trigger1 = time = 0
value = 813

[State 801, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 2
trigger1 = Random > 499
value = 220, 0
channel = 0

[State 801, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Being Thrown by Air Shoulder Slam
[StateDef 812]
type    = S
movetype= H
physics = N
ctrl = 0
poweradd = 0
sprpriority = 1

[State 802, ChangeAnim2]
Type = ChangeAnim2
trigger1 = time = 0
value = 812

[State 811, 6]
Type = ChangeState
trigger1 = time > 3
trigger1 = !gethitvar(isbound)
value = 5021

;---------------------------------------------------------------------------
; Being Thrown by Air Shoulder Slam
[StateDef 813]
type    = S
movetype= H
physics = N
ctrl = 0
poweradd = 0
sprpriority = 1

[State 802, ChangeAnim2]
Type = ChangeAnim2
trigger1 = time = 0
value = 813

[State 811, VelSet]
Type = VelSet
trigger1 = animelem = 1,1
x = -3
y = -1.2

[State 811, Gravity]
Type = Gravity
trigger1 = 1

[State 813, ChangeState]
Type = ChangeState
trigger1 = pos y >= 0
value = 822

;---------------------------------------------------------------------------
;Air Shoulder Slam Miss
[StateDef 815]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 105
poweradd = 0

[State 815, Don't Move]
Type = VarSet
trigger1 = 1
var(55) = 0

;---------------------------------------------------------------------------
;Flip Kick Throw Start
[StateDef 816]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 800
poweradd = 0
sprpriority = 2

[State 800, ChangeState]
Type = NotHitBy
trigger1 = MoveHit
value = SCA
ignorehitpause = 1

[State 816, HitDef]
Type = HitDef
trigger1 = time = 0
trigger1 = enemy, stateno != [130,160]
trigger1 = p2bodydist x = [-5, 20]
attr = S, NT
guardflag = 
hitflag = M
guard.dist = -1
priority = 1, Hit
sparkno = S4000
guard.sparkno = S4000
sparkxy = -5, -41
sprpriority = 2
hitonce = 1
p2facing = 1
p2stateno = 820
p1stateno = 817
fall = 1
;hitsound = 5,0

[State 816, ChangeState]
Type = ChangeState
trigger1 = MoveHit
value = 817

[State 816, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 1305

;---------------------------------------------------------------------------
;Flip Kick Throw Connected
[StateDef 817]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 816
poweradd = 0
sprpriority = 2

[State 801, TargetState]
Type = TargetState
trigger1 = time = 0
value = 820

[State 816, TargetBind]
Type = TargetBind
trigger1 = animelemtime(3) < 0
pos = 18, 0

[State 816, VelSet]
Type = VelSet
trigger1 = animelemtime(3) = 1
x = -0.2
y = -3.7

[State 816, StateTypeSet]
Type = StateTypeSet
trigger1 = animelemtime(3) = 1
Physics = A

[State 816, Don't Move]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 816, Sprpriority]
Type = SprPriority
trigger1 = 1
value = 3

;Bite, bite, bite. :D
[State 816, HitDef]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NT
damage = Floor((8 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = 
hitflag = MAFD
priority = 3, Hit
pausetime = 8, 8
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -63
hitsound = 5, 3
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = .18312, -9.50000
air.velocity = .18965, -9.50000
fall = 1
fall.recover = 0
air.hittime = 24
air.type = High
air.juggle = 0
getpower = 50, 75
givepower = 50, 75

[State 801, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 1
trigger1 = random < 500
value = 210, 0
channel = 0

;---------------------------------------------------------------------------
; Being Thrown by Flip Kick
[StateDef 820]
type    = S
movetype= H
physics = N
ctrl = 0
poweradd = 0
velset = 0, 0
sprpriority = 1

[State 802, ChangeAnim2]
Type = ChangeAnim
trigger1 = 1
value = 5000

[State 820, NotHitBy]
Type = NotHitBy
trigger1 = time < 11
value = SCA

[State 811, VelSet]
Type = VelSet
trigger1 = time > 13
x = -3
y = -1.5

[State 811, 6]
Type = ChangeState
trigger1 = time > 13
value = 822

;---------------------------------------------------------------------------
;Air Throw Start
[StateDef 830]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 809
poweradd = 0
sprpriority = 2

[State 800, ChangeState]
Type = NotHitBy
trigger1 = MoveHit
value = SCA
ignorehitpause = 1

[State 809, HitDef]
Type = HitDef
trigger1 = time = 0
trigger1 = var(47) >= 0
;trigger1 = p2dist y = [-45,45]
attr = S, NT
guardflag =  
hitflag = AFD
guard.dist = -1
priority = 1, Miss
id = 801
nochainid = 801
sparkno = S4000
guard.sparkno = S4000
sparkxy = -5, -41
sprpriority = 2
hitonce = 1
p2facing = 1
p2stateno = 832
p1stateno = 831
fall = 1
;hitsound = 5,0

[State 800, ChangeState]
Type = ChangeState
trigger1 = MoveHit
value = 831

[State 800, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 815

;---------------------------------------------------------------------------
;Air Shoulder Slam
[StateDef 831]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 820
poweradd = 0
velset = 0, 0

[State 801, TargetState]
Type = TargetState
trigger1 = time = 0
value = 832

[State 801, No Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 801, PlayerPush]
Type = PlayerPush
trigger1 = 1
value = 0

[State 810, PosAdd]
Type = Width
trigger1 = 1
edge = 30,30

[State 801, TargetBind]
Type = TargetBind
trigger1 = animelemtime(4) < 0
pos = 15, -5

[State 801, TargetBind 2]
Type = TargetBind
trigger1 = animelemtime(5) < 0
trigger1 = animelemtime(4) >= 0
pos = 21, -63

[State 801, TargetBind 2]
Type = TargetBind
trigger1 = animelemtime(5) = 0
pos = 9, -42

[State 831, TargetVelSet]
Type = TargetVelSet
trigger1 = animelemtime(5) = 1
x = 1.2
y = -7.5

[State 801, That Hurts]
type = TargetLifeAdd
trigger1 = animelemtime(5) = 0
value = -Floor((12 + (Random/1000.0)* 3) * Fvar(28) + 0.5)

[State 801, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 5
trigger1 = Random > 499
value = 220, 0
channel = 0

[State 831, StateTypeSet]
Type = StateTypeSet
trigger1 = animelemtime(6) = 0
physics = A

;---------------------------------------------------------------------------
; Being Thrown by Air Shoulder Slam
[StateDef 832]
type    = A
movetype= H
physics = N
ctrl = 0
poweradd = 0
sprpriority = 1

[State 802, ChangeAnim2]
Type = ChangeAnim2
trigger1 = time = 0
value = 821

[State 802, Gravity]
Type = Gravity
trigger1 = time > 10

[State 832, ChangeState]
Type = SelfState
trigger1 = pos y >= 0
value = 822

;---------------------------------------------------------------------------
; Throw_BOUNCE (hit ground)
[Statedef 822]
type    = L
movetype= H
physics = N

[State 822, 1]
type = VelSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
trigger1 = vel x > 1
x = 1

[State 822, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 822, Var] ;Save fall velocity
type = VarSet
trigger1 = Time = 0
sysvar(1) = floor(vel y)

[State 822, 2] ;Hit ground anim (normal)
type = ChangeAnim
trigger1 = time = 0
value = 5100

[State 822, 4]
type = PosSet
trigger1 = Time = 0
y = 0

[State 822, 5]
type = VelSet
trigger1 = Time = 0
y = 0

[State 822, 6] ;Reduce speed
type = VelMul
trigger1 = Time = 0
x = 0.75

[State 822, 7]
type = ChangeState
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
value = 824 ;Throw_LIEDOWN

[State 822, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 60 + (sysvar(1) > 5) + (sysvar(1) > 14)
pos = 0, 0
under = sysvar(1) <= 10

[State 822, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 822, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 822, 11]
type = PosFreeze
trigger1 = 1

[State 822, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 823

[State 822, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;---------------------------------------------------------------------------
; Throw_BOUNCE (bounce into air)
[Statedef 823]
type    = L
movetype= H
physics = N

[State 823, 1] ;Coming hit ground anim (normal)
type = ChangeAnim
trigger1 = time = 0
value = 5160

[State 823, 3]
type = HitFallVel
trigger1 = Time = 0

[State 823, 5] ;Acceleration
type = VelAdd
trigger1 = 1
y = .4

[State 823, 6] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 12
type = ChangeState
value = 824

;---------------------------------------------------------------------------
; HIT_LIEDOWN
[Statedef 824]
type    = L
movetype= H
physics = N

[State 824, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 824, 2] ;Hit ground anim (normal)
type = ChangeAnim
trigger1 = time = 0
value = 5170

[State 824, 4]
type = HitFallDamage
trigger1 = Time = 0

[State 824, 5]
type = PosSet
trigger1 = Time = 0
y = 0

[State 824, Var] ;Get fall velocity
type = VarSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) != 0
sysvar(1) = floor(vel y)

[State 824, 6]
type = PlaySnd
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 824, 7]
type = GameMakeAnim
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = 60 + (sysvar(1) > 5) + (sysvar(1) > 14)
pos = 0, 0
under = sysvar(1) <= 10

[State 824, 8]
type = VelSet
trigger1 = Time = 0
y = 0

[State 824, 10] ;For normal
type = ChangeAnim
persistent = 0
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
value = 5110

[State 824, 11] ;If just died
type = ChangeState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
value = 5150

[State 824, 12]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 824, 13] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

[State 824, 14]
type = ForceFeedback
trigger1 = alive
trigger1 = Time = 0
time = 8
ampl = 240
waveform = sine

[State 824, 15]
type = ForceFeedback
trigger1 = !alive
trigger1 = Time = 0
ampl = 200, 7, -.467
time = 30
waveform = sine

[State 824, ChangeState]
Type = SelfState
trigger1 = anim = 5110
trigger1 = time > 40
value = 5120