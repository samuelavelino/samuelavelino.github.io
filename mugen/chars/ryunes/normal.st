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
ctrl = 0
anim = 182
velset = 0,0

[State 182, 2]
type = PlaySnd
trigger1 = time = 0
value = 182,0

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

[State 191, 3]
type = PlaySnd
trigger1 = Time = 0
value = 190,0
channel = 0

[State 191, 3]
type = PlaySnd
trigger1 = animelem = 7
value = 190,1
channel = 0

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

[State 195, Taunt counter]
Type = VarSet
trigger1 = 1
var(41) = 120

[State 195,3]
type = PlaySnd
trigger1 = time = 0
value = 195,0
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
trigger1 = animelemtime(2) = 0
var(55) = 61343
persistent = 0

[State 200, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) = 0
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
damage = Floor((4 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 7, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -5, -44
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 10
ground.slidetime = 10
ground.velocity = -2.24124, 0.00000
air.velocity = -1.20506, -3.00000
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
damage = Floor((4 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = M
priority = 3, Hit
pausetime = 7, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -5, -44
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 10
ground.slidetime = 10
ground.velocity = -2.24124, 0.00000
air.velocity = -1.20506, -3.00000
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
trigger1 = animelemtime(2) = 1
var(55) = 61343
persistent = 0

[State 205, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) = 0
trigger2 = time = 0
var(55) = 0

[State 205, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 205, Width]
Type = Width
trigger1 = 1
player = 12, 8

[State 205, HitDef]
type = HitDef
trigger1 = AnimElem = 2,1
trigger1 = Var(47) >= 8
attr = S, NA
damage = Floor((3 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 7, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -5, -51
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 10
ground.slidetime = 10
ground.velocity = -2.09849, 0.00000
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
damage = Floor((3 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = M
priority = 3, Hit
pausetime = 7, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -5, -51
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 10
ground.slidetime = 10
ground.velocity = -2.09849, 0.00000
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

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
channel = 0

;---------------------------------------------------------------------------
; Stand Light Kick
[Statedef 210]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 210
poweradd = 0

[State 210, MoveType]
Type = VarSet
trigger1 = time = 0
var(54) = 1

[State 210, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) = 0
var(55) = 61343

[State 210, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(4) = 0
var(55) = 0

[State 210, HitDef]
type = HitDef
trigger1 = AnimElem = 3, 1
trigger1 = var(47) >= 8
attr = S, NA
damage = Floor((5 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 2, Hit
pausetime = 5, 6
sparkno = 0
guard.sparkno = 40
sparkxy = 0, -50
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 10
ground.slidetime = 10
ground.velocity = -2.09849, 0.00000
air.velocity = -1.08372, -3.00000
air.hittime = 24
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 210, HitDef]
type = HitDef
trigger1 = AnimElem = 3, 1
trigger1 = var(47) < 8
attr = S, NA
damage = Floor((5 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = M
priority = 2, Hit
pausetime = 5, 6
sparkno = 0
guard.sparkno = 40
sparkxy = 0, -50
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 10
ground.slidetime = 10
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
;Near Stand Light Kick
[Statedef 215]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 215
poweradd = 0

[State 215, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 210, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) = 0
var(55) = 61343

[State 210, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) = 0
var(55) = 0

[State 215, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = var(47) >= 8
attr = S, NA
damage = Floor((3 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 2, Hit
pausetime = 5, 6
sparkno = 0
guard.sparkno = 40
sparkxy = -5, -12
hitsound = 5, 0
guardsound = 6, 0
ground.type = Low
ground.hittime = 10
ground.slidetime = 10
ground.velocity = -2.09900, 0.00000
air.velocity = -1.38915, -3.00000
air.hittime = 24
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 215, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = var(47) < 8
attr = S, NA
damage = Floor((3 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = M
priority = 2, Hit
pausetime = 5, 6
sparkno = 0
guard.sparkno = 40
sparkxy = -5, -12
hitsound = 5, 0
guardsound = 6, 0
ground.type = Low
ground.hittime = 10
ground.slidetime = 10
ground.velocity = -2.09900, 0.00000
air.velocity = -1.38915, -3.00000
air.hittime = 24
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 215, Juggle]
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

[State 215, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 200, 0
channel = 0

[State 215, ChangeState]
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
poweradd = 0

[State 220, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) = 1
var(55) = 9348

[State 220, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(4) = 0
var(55) = 0

[State 220, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 220, HitDef]
type = HitDef
trigger1 = AnimElem = 3, 1
trigger1 = Var(47) >= 8
attr = S, NA
damage = Floor((10 + (Random/1000.0)* 3) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 11, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -40
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -3.28715, 0.00000
air.velocity = -1.79407, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

[State 220, HitDef]
type = HitDef
trigger1 = AnimElem = 3, 1
trigger1 = Var(47) < 8
attr = S, NA
damage = Floor((10 + (Random/1000.0)* 3) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = M
priority = 5, Hit
pausetime = 11, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -40
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -3.28715, 0.00000
air.velocity = -1.79407, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

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
; Near Stand Strong Punch
[Statedef 225]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 225
poweradd = 0

[State 225, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) = 0
var(55) = 61332

[State 225, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(5) = 0
var(55) = 0

[State 225, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 225, HitDef]
type = HitDef
triggerall = Var(47) >= 8
trigger1 = AnimElem = 3,1
attr = S, NA
damage = Floor((8 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 11, 12
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -55
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -2.95843, 0.00000
air.velocity = -1.51467, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

[State 225, HitDef]
type = HitDef
triggerall = Var(47) < 8
trigger1 = AnimElem = 3,1
attr = S, NA
damage = Floor((8 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = M
priority = 4, Hit
pausetime = 11, 12
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -55
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -2.95843, 0.00000
air.velocity = -1.51467, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

[State 225, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -8
persistent = 0
ignorehitpause = 1

[State 225, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 225, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 210, 0
channel = 0

[State 225, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Stand Strong Kick
[Statedef 230]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 230
poweradd = 0

[State 230, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) = 0
var(55) = 0

[State 230, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) = 0
var(55) = 60288

[State 230, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 230, HitDef]
type = HitDef
trigger1 = AnimElem = 3, 1
trigger1 = Var(47) >= 8
attr = S, NA
damage = Floor((11 + (Random/1000.0)* 4) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 11, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -47
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -3.78022, 0.00000
air.velocity = -2.21319, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

[State 230, HitDef]
type = HitDef
trigger1 = AnimElem = 3, 1
trigger1 = Var(47) < 8
attr = S, NA
damage = Floor((11 + (Random/1000.0)* 4) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = M
priority = 4, Hit
pausetime = 11, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -47
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -3.78022, 0.00000
air.velocity = -2.21319, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

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
; Near Stand Strong Kick
[Statedef 235]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 235
poweradd = 0

[State 235, Player Width]
Type = Width
trigger1 = 1
value = -7,1

[State 235, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 235, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 235, HitDef 1]
type = HitDef
trigger1 = AnimElem = 2,1
trigger1 = Animelemtime(3) < 0
trigger1 = Var(47) >= 8
attr = S, NA
damage = Floor((5 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 9, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -60
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -0.82179, 0.00000
air.velocity = -0.69852, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 235, HitDef 1]
type = HitDef
trigger1 = AnimElem = 2,1
trigger1 = Animelemtime(3) < 0
trigger1 = Var(47) < 8
attr = S, NA
damage = Floor((5 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = M
priority = 4, Hit
pausetime = 9, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -60
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -0.82179, 0.00000
air.velocity = -0.69852, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 235, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger1 = Random > 499
value = 210, 0
channel = 0

[State 235, ChangeState]
type = ChangeState
trigger1 = AnimElemtime(3) = 0
value = 236
ctrl = 0

;---------------------------------------------------------------------------
; Near Stand Strong Kick
[Statedef 236]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
poweradd = 0

[State 235, Player Width]
Type = Width
trigger1 = 1
value = -7,1

[State 235, Chain Flag]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 235, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 235, HitDef 2]
type = HitDef
trigger1 = AnimElem = 3,1
trigger1 = Var(47) >= 8
attr = S, NA
damage = Floor((5 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 9, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -60
hitsound = 5, 1
guardsound = 6, 0
ground.type = Low
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -2.95843, 0.00000
air.velocity = -1.91467, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 235, HitDef 2]
type = HitDef
trigger1 = AnimElem = 3,1
trigger1 = Var(47) < 8
attr = S, NA
damage = Floor((5 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = M
hitflag = M
priority = 4, Hit
pausetime = 9, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -60
hitsound = 5, 1
guardsound = 6, 0
ground.type = Low
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -2.95843, 0.00000
air.velocity = -1.91467, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 30, 45
givepower = 30, 45

[State 235, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 235, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -8
persistent = 0
ignorehitpause = 1

[State 235, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Axe Punch
[Statedef 240]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 240
poweradd = 0

[State 240, Chain Flag]
Type = VarSet
trigger1 = animelemtime(4) = 1
var(55) = 61312

[State 220, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(6) = 0
var(55) = 0

[State 240, VelSet]
Type = VelSet
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(5) < 0
x = 0.7

[State 220, MoveType]
Type = VarSet
trigger1 = time = 0
var(54) = 1

[State 220, HitDef]
type = HitDef
trigger1 = AnimElem = 4, 1
trigger1 = Var(47) >= 8
attr = S, NA
damage = Floor((10 + (Random/1000.0)* 3) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = H
hitflag = MAF
priority = 5, Hit
pausetime = 11, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -33
hitsound = 5, 1
guardsound = 6, 0
ground.type = Low
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -3.28715, 0.00000
air.velocity = -1.79407, -3.00000
air.hittime = 30
air.type = Low
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

[State 220, HitDef]
type = HitDef
trigger1 = AnimElem = 3, 1
trigger1 = Var(47) < 8
attr = S, NA
damage = Floor((10 + (Random/1000.0)* 3) * Fvar(28) + 0.5), 0
animtype = Heavy
guardflag = H
hitflag = MA
priority = 5, Hit
pausetime = 11, 13
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -33
hitsound = 5, 1
guardsound = 6, 0
ground.type = Low
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -3.28715, 0.00000
air.velocity = -1.79407, -3.00000
air.hittime = 30
air.type = Low
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

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
; Crouch Light Punch
[Statedef 400]
type    = C
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 400
poweradd = 0

[State 400, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) = 1
var(55) = 61343

[State 400, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) = 1
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
damage = Floor((4 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 7, 8
sparkno = 0
guard.sparkno = 40
sparkxy = 0, -26
hitsound = 5, 0
guardsound = 6, 0
ground.type = Low
ground.hittime = 10
ground.slidetime = 10
ground.velocity = -2.09900, 0.00000
air.velocity = -1.38915, -3.00000
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
damage = Floor((4 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = M
hitflag = M
priority = 3, Hit
pausetime = 7, 8
sparkno = 0
guard.sparkno = 40
sparkxy = 0, -26
hitsound = 5, 0
guardsound = 6, 0
ground.type = Low
ground.hittime = 10
ground.slidetime = 10
ground.velocity = -1.86770, 0.00000
air.velocity = -0.98755, -3.00000
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
poweradd = 0

[State 410, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) = 1
var(55) = 61343

[State 410, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) = 1
var(55) = 0

[State 410, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) >= 8
attr = C, NA
damage = Floor((3 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = L
hitflag = MAF
priority = 3, Hit
pausetime = 7, 8
sparkno = 0
guard.sparkno = 40
sparkxy = 0, 0
hitsound = 5, 0
guardsound = 6, 0
ground.type = Low
ground.hittime = 8
ground.slidetime = 8
ground.velocity = -2.06183, 0.00000
air.velocity = -1.05000, -3.00000
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
damage = Floor((3 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = L
hitflag = M
priority = 3, Hit
pausetime = 7, 8
sparkno = 0
guard.sparkno = 40
sparkxy = 0, 0
hitsound = 5, 0
guardsound = 6, 0
ground.type = Low
ground.hittime = 8
ground.slidetime = 8
ground.velocity = -2.06183, 0.00000
air.velocity = -1.05000, -3.00000
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
poweradd = 0

[State 420, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) = 0
var(55) = 61316

[State 420, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(5) = 0
var(55) = 0

[State 420, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 420, HitDef]
type = HitDef
trigger1 = AnimElem = 3, 1
trigger1 = var(47) >= 8
attr = C, NA
damage = Floor((9 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
air.animtype = Up
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 11, 12
sparkno = 2
guard.sparkno = 40
sparkxy = 0, -60
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -3.28715, 0.00000
air.velocity = -1.79407, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

[State 420, HitDef]
type = HitDef
trigger1 = AnimElem = 3, 1
trigger1 = var(47) < 8
attr = C, NA
damage = Floor((9 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Heavy
air.animtype = Up
guardflag = M
hitflag = M
priority = 3, Hit
pausetime = 11, 12
sparkno = 2
guard.sparkno = 40
sparkxy = 0, -60
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -3.28715, 0.00000
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
poweradd = 0

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
damage = Floor((8 + (Random/1000.0)* 3) * Fvar(28) + 0.5), 0
animtype = Back
guardflag = L
hitflag = MAF
priority = 3, Hit
pausetime = 9, 11
sparkno = 1
guard.sparkno = 40
sparkxy = -5, 0
hitsound = 5, 1
guardsound = 6, 0
ground.type = Trip
ground.hittime = 15
ground.slidetime = 15
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
damage = Floor((8 + (Random/1000.0)* 3) * Fvar(28) + 0.5), 0
animtype = Back
guardflag = L
hitflag = M
priority = 3, Hit
pausetime = 9, 11
sparkno = 1
guard.sparkno = 40
sparkxy = -5, 0
hitsound = 5, 1
guardsound = 6, 0
ground.type = Trip
ground.hittime = 15
ground.slidetime = 15
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
poweradd = 0

[State 600, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(2) = 15
var(55) = 0

[State 600, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) = 0
var(55) = 17088

[State 600, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 600, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) >= 8
attr = A, NA
damage = Floor((3 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = H
hitflag = MAF
priority = 3, Hit
pausetime = 7, 10
sparkno = 0
guard.sparkno = 40
sparkxy = 0, -40
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.51467, 0.00000
guard.velocity = -2.95843
air.velocity = -1.51467, -3.00000
air.hittime = 30
air.type = High
getpower = 30, 45
givepower = 30, 45

[State 600, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) < 8
attr = A, NA
damage = Floor((3 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = H
hitflag = M
priority = 3, Hit
pausetime = 7, 10
sparkno = 0
guard.sparkno = 40
sparkxy = 0, -40
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -2.51467, 0.00000
guard.velocity = -2.95843
air.velocity = -1.51467, -3.00000
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
value = -8
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
anim = 610 + (5*(vel x= 0))
poweradd = 0

[State 610, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 600, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(2) = 15
trigger3 = anim = 615
trigger3 = animelemtime(3) = 5
var(55) = 0

[State 600, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) = 0
var(55) = 17088

[State 610, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) >= 8
attr = A, NA
damage = Floor((4 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = H
hitflag = MAF
priority = 2, Hit
pausetime = 7, 10
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
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) < 8
attr = A, NA
damage = Floor((4 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Light
guardflag = H
hitflag = MAF
priority = 2, Hit
pausetime = 7, 10
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
value = -8
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
; Jump Strong Punch
[Statedef 620]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 620
poweradd = 0

[State 620, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) = 3
var(55) = 0

[State 620, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) = 1
var(55) = 17024

[State 620, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 620, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = var(47) >= 8
attr = S, NA
damage = Floor((8 + (Random/1000.0)* 3) * Fvar(28) + 0.5), 0
animtype = Hard
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = 9, 12
sparkno = 1
guard.sparkno = 40
sparkxy = 0, -40
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 14
ground.slidetime = 14
ground.velocity = -2.79407, 0.00000
guard.velocity = -3.28715
air.velocity = -1.99407, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 50, 75
givepower = 50, 75

[State 620, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = var(47) < 8
attr = S, NA
damage = Floor((8 + (Random/1000.0)* 3) * Fvar(28) + 0.5), 0
animtype = Hard
guardflag = H
hitflag = M
priority = 4, Hit
pausetime = 9, 12
sparkno = 1
guard.sparkno = 40
sparkxy = 0, -40
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 14
ground.slidetime = 14
ground.velocity = -2.79407, 0.00000
guard.velocity = -3.28715
air.velocity = -1.99407, -3.00000
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
value = -8
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
juggle = 8
ctrl = 0
anim = 630 + 5 * (vel x = 0)
poweradd = 0

[State 620, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) = 3
var(55) = 0

[State 620, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) = 1
var(55) = 17024

[State 630, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 630, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) >= 8
attr = S, NA
damage = Floor((9 + (Random/1000.0)* 4) * Fvar(28) + 0.5), 0
animtype = Hard
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = 9, 12
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -37
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 14
ground.slidetime = 14
ground.velocity = -3.07348, 0.00000
guard.velocity = -3.61586
air.velocity = -2.07348, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
hitonce = 1
getpower = 50, 75
givepower = 50, 75

[State 630, HitDef]
type = HitDef
trigger1 = AnimElem = 2, 1
trigger1 = Var(47) <= 8
attr = S, NA
damage = Floor((9 + (Random/1000.0)* 4) * Fvar(28) + 0.5), 0
animtype = Hard
guardflag = H
hitflag = M
priority = 4, Hit
pausetime = 9, 12
sparkno = 1
guard.sparkno = 40
sparkxy = -5, -37
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 14
ground.slidetime = 14
ground.velocity = -3.07348, 0.00000
guard.velocity = -3.61586
air.velocity = -2.07348, -3.00000
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
value = -8
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
velset = 0,0
anim = 800
poweradd = 0
sprpriority = 2

[State 800, ChangeState]
Type = NotHitBy
trigger1 = MoveHit
value = SCA
ignorehitpause = 1

[State 800, VarSet]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 800, HitDef]
Type = HitDef
trigger1 = animelem = 4
trigger1 = enemy, stateno != [130,160]
trigger1 = p2bodydist x = [-5, 25]
attr = S, NT
guardflag = 
hitflag = M
guard.dist = -1
priority = 2, Miss
sparkno = S4000
guard.sparkno = S4000
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
value = 830

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
trigger1 = animelemtime(4) < 0
value = 0

[State 810, PosAdd]
Type = Width
trigger1 = 1
edge = 30,30

[State 801, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 4
trigger1 = random < 500
value = 220, 0
channel = 0

[State 801, Turn]
Type = Turn
trigger1 = animelemtime(2) = 0
trigger1 = var(50) = 2

[State 801, TargetFacing]
Type = TargetFacing
trigger1 = facing = target, facing
trigger1 = animelemtime(2) = 0
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
pos = -18, -7

[State 801, TargetBind 3]
Type = TargetBind
trigger1 = animelemtime(4) < 0
trigger1 = animelemtime(3) >= 0
pos = 0, -47

[State 801, TargetBind 4]
Type = TargetBind
trigger1 = animelemtime(4) = 0
pos = 36, -47

[State 801, That Hurts]
type = TargetLifeAdd
trigger1 = animelem = 4
value = -Floor((12 + (Random/1000.0)* 3) * Fvar(28) + 0.5)

[State 801, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 1
trigger1 = Random > 499
value = 800, 0
channel = 0

[State 801, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Being Thrown by Shoulder Slam
[StateDef 802]
type    = A
movetype= H
physics = N
ctrl = 0
poweradd = 0
sprpriority = 1

[State 802, ChangeAnim2]
Type = ChangeAnim2
trigger1 = time = 0
value = 802

[State 811, Turn]
Type = Turn
trigger1 = animelem = 4,0

[State 811, VelSet]
Type = VelSet
trigger1 = animelem = 4,1
x = 1.6
y = -5.5

[State 811, 6]
Type = ChangeState
trigger1 = animtime = 0
trigger2 = time > 3
trigger2 = animelemtime(4) < 0
trigger2 = !gethitvar(isbound)
trigger3 = animelemtime(4) > 0
trigger3 = pos y >= 0
value = 822

[State 811, Gravity]
Type = Gravity
trigger1 = animelemtime(4) > 0

;---------------------------------------------------------------------------
; Tomoe Nage Start
[StateDef 810]
type    = S
movetype= A
physics = S
juggle = 8
ctrl = 0
velset = 0,0
anim = 800
poweradd = 0
sprpriority = 2

[State 800, ChangeState]
Type = NotHitBy
trigger1 = MoveHit
value = SCA
ignorehitpause = 1

[State 800, VarSet]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 800, HitDef]
Type = HitDef
trigger1 = animelem = 4
trigger1 = enemy, stateno != [130,160]
trigger1 = p2bodydist x = [-5, 25]
attr = S, NT
guardflag = 
hitflag = M
guard.dist = -1
priority = 2, Miss
sparkno = S4000
guard.sparkno = S4000
sparkxy = -5, -41
sprpriority = 2
hitonce = 1
p2facing = 1
p2stateno = 812
p1stateno = 811
fall = 1
;hitsound = 5,0

[State 800, ChangeState]
Type = ChangeState
trigger1 = MoveHit
value = 811

[State 800, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 830

;---------------------------------------------------------------------------
; Tomoe Nage
[StateDef 811]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 810
poweradd = 0
velset = 0,0

[State 801, TargetState]
Type = TargetState
trigger1 = time = 0
value = 812

[State 811, No Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 801, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 4
trigger1 = random < 500
value = 220, 0
channel = 0

[State 811, PlayerPush]
Type = PlayerPush
trigger1 = animelemtime(4) < 0
value = 0

[State 811, Turn]
Type = Turn
trigger1 = animelemtime(2) = 0
trigger1 = var(50) = 2

[State 811, TargetFacing]
Type = TargetFacing
trigger1 = facing = target, facing
trigger1 = animelemtime(2) = 0
trigger1 = var(50) = 2
value = -1

[State 811, TargetBind]
Type = TargetBind
trigger1 = animelemtime(2) < 0
pos = 15, 0

[State 811, TargetBind 2]
Type = TargetBind
trigger1 = animelemtime(3) < 0
trigger1 = animelemtime(2) >= 0
pos = 15, 0

[State 810, PosAdd]
Type = Width
trigger1 = 1
edge = 30,30

[State 811, TargetBind 3]
Type = TargetBind
trigger1 = animelemtime(4) < 0
trigger1 = animelemtime(3) >= 0
pos = 10, -32

[State 811, TargetBind 4]
Type = TargetBind
trigger1 = animelemtime(4) = 0
pos = -10, -37

[State 811, That Hurts]
type = TargetLifeAdd
trigger1 = animelem = 4
value = -Floor((14 + (Random/1000.0)* 3) * Fvar(28) + 0.5)

[State 811, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 2
trigger1 = Random > 499
value = 800, 0
channel = 0

[State 811, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Being Thrown by Tomoe Nage
[StateDef 812]
type    = S
movetype= H
physics = N
ctrl = 0
poweradd = 0
sprpriority = 1

[State 812, ChangeAnim2]
Type = ChangeAnim2
trigger1 = time = 0
value = 812

[State 812, VelSet]
Type = VelSet
trigger1 = animelem = 4,1
x = 2
y = -3.5

[State 812, 6]
Type = ChangeState
trigger1 = animtime = 0
trigger2 = time > 3
trigger2 = animelemtime(4) < 0
trigger2 = !gethitvar(isBound)
trigger3 = animelemtime(4) > 0
trigger3 = pos y >= 0
value = 822

[State 812, Gravity]
Type = Gravity
trigger1 = animelemtime(4) > 0


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

;---------------------------------------------------------------------------
; Throw recover
[StateDef 830]
type    = S
movetype= A
physics = S
juggle = 8
ctrl = 0
anim = 820
poweradd = 0
sprpriority = 2

[State 830, Do Nothing]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 830, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1
