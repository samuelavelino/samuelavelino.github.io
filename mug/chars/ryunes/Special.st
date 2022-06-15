;===========================================================================
;Special.St

;---------------------------------------------------------------------------
; Hadouken
[Statedef 1000]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1000 + (10 * (var(50) = 2))
poweradd = 100

[State 1000, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) = 15 + 5 * (var(50) = 2)
var(55) = 0

[State 1000, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) > 0
var(55) = 61184

[State 1000, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1000, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1000, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1000, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1000, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 2

[State 1000, Projectile]
Type = Helper
trigger1 = animelem = 3,1
name = "Hadouken"
id = 1000
pos = 27, -38
StateNo = 1001
ownpal = 1

[State 1000, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
value = 1000, 0
channel = 0

[State 1000, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Hadouken Fireball
[Statedef 1001]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1001
SprPriority = 2

[State 1001, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1001, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1000, 1
channel = 0

[State 1001, Var(50)]
type = VarSet
trigger1 = time = 0
var(50) = Parent, var(50)

[State 1001, fvar(28)]
Type = VarSet
trigger1 = parent, Fvar(28) > Fvar(28)
fvar(28) = Parent, fvar(28)

[State 1001, Counter Flag Reset]
Type = VarSet
trigger1 = time = 0
var(59) = 0

[State 1001, Var(50)]
type = VarSet
trigger1 = time = 0
var(50) = Parent, var(50)

[State 1001, Var(49)]
type = VarSet
trigger1 = time = 0
var(49) = Parent, var(49)

[State 1001, fvar(28)]
Type = VarSet
trigger1 = parent, Fvar(28) > Fvar(28)
fvar(28) = Parent, fvar(28)

[State 1001, Counter Flag Reset]
Type = VarSet
trigger1 = time = 0
var(59) = 0

[State 1001, VelSet]
Type = VelSet
trigger1 = time = 0
x = ifelse(var(50) = 2, 3.5, 2.15)

[State 1001, HitOverride]
Type = HitOverride
trigger1 = 1
attr = SCA, AP
stateno = 1002

[State 1001, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AT

;HitDef
[State 1001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) >= 0)
trigger1 = time = 0
attr = S, SP
damage = Floor(((3 + ifelse(Parent, Var(50) = 2, 4, 2) + (2 * Random/1000.0)) * Fvar(28) + 0.5)), Floor(1 + (Var(50) / 2.0) + (Random/1000.0) * Fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0, 12
guard.pausetime = 0,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -4.68145, -4.00000 * (var(49) <= 0)
air.velocity = -3.97923, -4.00000
air.hittime = 50
air.type = High
getpower = 40, 60
givepower = 40, 60
fall = (var(49) <= 0)
air.fall = 1
ground.cornerpush.veloff = 0

;HitDef
[State 1001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) < 0)
trigger1 = time = 0
attr = S, SP
damage = Floor(((3 + ifelse(Parent, Var(50) = 2, 4, 2) + (2 * Random/1000.0)) * Fvar(28) + 0.5)), Floor(1 + (Var(50) / 2.0) + (Random/1000.0) * Fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 0, 12
guard.pausetime = 0,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -4.68145, -4.00000 * (var(49) <= 0)
air.velocity = -3.97923, -4.00000
air.hittime = 50
air.type = High
getpower = 40, 60
givepower = 40, 60
fall = (var(49) <= 0)
air.fall = 1
ground.cornerpush.veloff = 0

[State 1001, Juggle]
Type = ParentVarAdd
triggerall = NumTarget > 0
trigger1 = Target, stateno = 5020
trigger1 = Target, Time = 0
v = 47
value = -8
ignorehitpause = 1

[State 1001, FireBall Hit SlowDown]
Type = ParentVarSet
trigger1 = MoveHit = 1
var(44) = 16
ignorehitpause = 1

[State 1001, ChangeState]
Type = ChangeState
trigger1 = MoveContact = 1
trigger2 = FrontEdgeDist < -50
value = 1002
ignorehitpause = 1

;---------------------------------------------------------------------------
;Hadouken end
[Statedef 1002]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
SprPriority = 2
anim = 1002

[State 1002, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1002, DestroySelf]
type = DestroySelf
trigger1 = time = 25

;---------------------------------------------------------------------------
;Air Hadouken
[Statedef 1005]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 1050
poweradd = 100

[State 1005, Null]
Type = Null
trigger1 = time = 0
trigger1 = 1 || fvar(0) := vel x
trigger1 = 1 || fvar(1) := vel y

[State 1005, Null]
Type = Null
trigger1 = animelemtime(2) = 1
trigger1 = 1 || fvar(0) := 0
trigger1 = 1 || fvar(1) := 0

[State 1005, VelSet]
Type = VelSet
trigger1 = animelemtime(2) < 0
x = 0
y = 0

[State 1005, VelSet 2]
Type = VelSet
trigger1 = animelemtime(2) = 0
x = fvar(0)
y = fvar(1)

[State 1005, VelAdd]
Type = VelAdd
trigger1 = animelemtime(2) = 0
x = -0.3
y = -0.6

[State 1000, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(4) = 0
var(55) = 0

[State 1000, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) = 1
var(55) = 512

[State 1000, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1000, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1000, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1000, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 2

[State 1000, Projectile]
Type = Helper
trigger1 = animelem = 2,0
name = "Hadouken"
id = 1000
pos = 25, -37
StateNo = 1008
ownpal = 1

[State 1000, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 1
value = 1000, 0
channel = 0

;---------------------------------------------------------------------------
; Hadouken Fireball
[Statedef 1008]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1008
SprPriority = 2

[State 1001, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1001, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1000, 1
channel = 0

[State 1001, Var(50)]
type = VarSet
trigger1 = time = 0
var(50) = Parent, var(50)

[State 1001, fvar(28)]
Type = VarSet
trigger1 = parent, Fvar(28) > Fvar(28)
fvar(28) = Parent, fvar(28)

[State 1001, Counter Flag Reset]
Type = VarSet
trigger1 = time = 0
var(59) = 0

[State 1001, Var(50)]
type = VarSet
trigger1 = time = 0
var(50) = Parent, var(50)

[State 1001, Var(49)]
type = VarSet
trigger1 = time = 0
var(49) = Parent, var(49)

[State 1001, fvar(28)]
Type = VarSet
trigger1 = parent, Fvar(28) > Fvar(28)
fvar(28) = Parent, fvar(28)

[State 1001, Counter Flag Reset]
Type = VarSet
trigger1 = time = 0
var(59) = 0

[State 1001, VelSet]
Type = VelSet
trigger1 = time = 0
x = ifelse(var(50) = 2, 2.4, 1.8)
y = 4

[State 1001, HitOverride]
Type = HitOverride
trigger1 = 1
attr = SCA, AP
stateno = 1002

[State 1001, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AT

;HitDef
[State 1001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) >= 0)
trigger1 = time = 0
attr = S, SP
damage = Floor(((Parent, Var(50) * 2 + (2 * Random/1000.0)) * Fvar(28) + 0.5)), Floor(1 + (Var(50) / 2.0) + (Random/1000.0) * Fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 12
guard.pausetime = 0,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -4.68145, 0
air.velocity = -2.97923, 4.00000
air.hittime = 50
air.type = High
getpower = 40, 60
givepower = 40, 60
fall = 0
air.fall = 1
down.bounce = 1
ground.cornerpush.veloff = 0

;HitDef
[State 1001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) < 0)
trigger1 = time = 0
attr = S, SP
damage = Floor(((Parent, Var(50) * 2 + (2 * Random/1000.0)) * Fvar(28) + 0.5)), Floor(1 + (Var(50) / 2.0) + (Random/1000.0) * Fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 0, 12
guard.pausetime = 0,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -4.68145, 0
air.velocity = -2.97923, 4.00000
air.hittime = 50
air.type = High
getpower = 40, 60
givepower = 40, 60
fall = 0
air.fall = 1
down.bounce = 1
ground.cornerpush.veloff = 0

[State 1001, Juggle]
Type = ParentVarSet
triggerall = NumTarget > 0
trigger1 = Target, statetype = A
trigger1 = Target, Time = 0
v = 47
value = -1
ignorehitpause = 1

[State 1001, FireBall Hit SlowDown]
Type = ParentVarSet
trigger1 = MoveHit = 1
var(44) = 16
ignorehitpause = 1

[State 1001, ChangeState]
Type = ChangeState
trigger1 = MoveContact = 1
trigger2 = FrontEdgeDist < -50
trigger3 = Pos Y >= -5
value = 1002
ignorehitpause = 1

;---------------------------------------------------------------------------
; Fake Hadouken
[Statedef 1060]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1060
poweradd = 100

[State 1000, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) = 15
var(55) = 0

[State 1000, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) > 0
var(55) = 59136

[State 1000, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1000, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1000, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1000, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 2

[State 1000, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
value = 1000, 0
channel = 0

[State 1000, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Air Hadouken 2
[Statedef 1070]
type    = A
movetype= A
physics = A
velset = 0,0
ctrl = 0
anim = 1070
poweradd = 100

[State 1000, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) = 2
var(55) = 0

[State 1060, Gravity]
Type = VelSet
trigger1 = animelemtime(3) < 0
y = 0

[State 1000, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) > 0
var(55) = 512

[State 1000, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1005, VelAdd]
Type = VelAdd
trigger1 = animelemtime(2) = 0
x = -0.7

[State 1000, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1000, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1000, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1000, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 2

[State 1000, Projectile]
Type = Helper
trigger1 = animelem = 2,1
name = "Hadouken"
id = 1070
pos = 17, -54
StateNo = 1061
ownpal = 1

[State 1000, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
value = 1000, 0
channel = 0

;---------------------------------------------------------------------------
; Hadouken Fireball
[Statedef 1061]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1001
SprPriority = 2

[State 1001, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1001, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1000, 1
channel = 0

[State 1001, Var(50)]
type = VarSet
trigger1 = time = 0
var(50) = Parent, var(50)

[State 1001, fvar(28)]
Type = VarSet
trigger1 = parent, Fvar(28) > Fvar(28)
fvar(28) = Parent, fvar(28)

[State 1001, Counter Flag Reset]
Type = VarSet
trigger1 = time = 0
var(59) = 0

[State 1001, Var(50)]
type = VarSet
trigger1 = time = 0
var(50) = Parent, var(50)

[State 1001, Var(49)]
type = VarSet
trigger1 = time = 0
var(49) = Parent, var(49)

[State 1001, fvar(28)]
Type = VarSet
trigger1 = parent, Fvar(28) > Fvar(28)
fvar(28) = Parent, fvar(28)

[State 1001, Counter Flag Reset]
Type = VarSet
trigger1 = time = 0
var(59) = 0

[State 1001, VelSet]
Type = VelSet
trigger1 = time = 0
x = ifelse(var(50) = 2, 3.5, 2.15)

[State 1001, HitOverride]
Type = HitOverride
trigger1 = 1
attr = SCA, AP
stateno = 1002

[State 1001, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AT

;HitDef
[State 1001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) >= 0)
trigger1 = time = 0
attr = S, SP
damage = Floor(((3 + ifelse(Parent, Var(50) = 2, 2, 0) + (2 * Random/1000.0)) * Fvar(28) + 0.5)), Floor(1 + (Var(50) / 2.0) + (Random/1000.0) * Fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0, 12
guard.pausetime = 0,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -4.68145, -4.00000 * (var(49) <= 0)
air.velocity = -3.97923, -4.00000
air.hittime = 50
air.type = High
getpower = 40, 60
givepower = 40, 60
fall = (var(49) <= 0)
air.fall = 1
ground.cornerpush.veloff = 0

;HitDef
[State 1001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) < 0)
trigger1 = time = 0
attr = S, SP
damage = Floor(((3 + ifelse(Parent, Var(50) = 2, 2, 0) + (2 * Random/1000.0)) * Fvar(28) + 0.5)), Floor(1 + (Var(50) / 2.0) + (Random/1000.0) * Fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 0, 12
guard.pausetime = 0,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -4.68145, -4.00000 * (var(49) <= 0)
air.velocity = -3.97923, -4.00000
air.hittime = 50
air.type = High
getpower = 40, 60
givepower = 40, 60
fall = (var(49) <= 0)
air.fall = 1
ground.cornerpush.veloff = 0

[State 1001, Juggle]
Type = ParentVarAdd
triggerall = NumTarget > 0
trigger1 = Target, stateno = 5020
trigger1 = Target, Time = 0
v = 47
value = -8
ignorehitpause = 1

[State 1001, FireBall Hit SlowDown]
Type = ParentVarSet
trigger1 = MoveHit = 1
var(44) = 16
ignorehitpause = 1

[State 1001, ChangeState]
Type = ChangeState
trigger1 = MoveContact = 1
trigger2 = FrontEdgeDist < -50
value = 1002
ignorehitpause = 1

;---------------------------------------------------------------------------
;Shoryuken Start
[Statedef 1100]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1100 + 10 * (var(50) = 2)
poweradd = 100

[State 1100, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1100,0
channel = 0

[State 1100, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AA, AP, NT
time = 20

[State 1100, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1100, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1100, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = time = 12
var(55) = 0

[State 1100, Chain Flag]
Type = VarSet
trigger1 = time = 6
var(55) = 59904

[State 1100, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1100, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 2

[State 1100, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = !movecontact
attr = S, SA
damage = Floor((14 + 3 * (Random/1000.0) + 3 * (var(50) = 2)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 12
guard.pausetime = 10,16
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
id = 1100
nochainid = 1100
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1.25282, -4.50000
guard.velocity = -3.12097
air.velocity = -1.25282, -6.50000
air.hittime = 40
air.type = High
getpower = 60, 90
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1100, HitDef]
type = HitDef
triggerall = (Var(47) < 0)
trigger1 = !movecontact
attr = S, SA
damage = Floor((14 + 3 * (Random/1000.0) + 3 * (var(50) = 2)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 10, 12
guard.pausetime = 10,16
id = 1100
nochainid = 1100
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1.25282, -4.50000
guard.velocity = -3.12097
air.velocity = -1.25282, -6.50000
air.hittime = 40
air.type = High
getpower = 60, 90
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1100, Juggle]
Type = VarSet
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = 0
;persistent = 0
ignorehitpause = 1

[State 1100, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1100, ChangeState]
type = ChangeState
trigger1 = animelemtime(3) = 0
value = 1105

;---------------------------------------------------------------------------
; Shoryuken Jump
[Statedef 1105]
type    = A
movetype= A
physics = N
velset = 3 + (1.2 * (var(50) = 2)),-3.9 -(2 * (var(50) = 2)) 
ctrl = 0
poweradd = 0

[State 1105, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1100, 1

[State 1105, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.32

[State 1105, Air Drag]
Type = VelMul
trigger1 = 1
x = 0.80

[State 1105, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 1105, HitDef]
type = HitDef
triggerall = (Var(47) >= 8)
trigger1 = time = 0
attr = A, SA
damage = Floor((6 + 2 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
guard.pausetime = 8,12
id = 1100
nochainid = 1100
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -1.45282, -8.700000
guard.velocity = -3.12097
air.velocity = -1.45282, -7.500000
air.hittime = 30
air.type = High
getpower = 60, 90
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1105, HitDef]
type = HitDef
triggerall = (Var(47) < 8)
trigger1 = time = 0
attr = A, SA
damage = Floor((6 + 2 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 8, 8
guard.pausetime = 8,12
id = 1100
nochainid = 1100
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -1.45282, -8.700000
guard.velocity = -3.12097
air.velocity = -1.45282, -7.500000
air.hittime = 30
air.type = High
getpower = 60, 90
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1105, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1105, Juggle]
Type = VarSet
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = 0
;persistent = 0
ignorehitpause = 1

[State 1105, Pos Y]
Type = PosSet
trigger1 = pos y >= 0
trigger1 = time > 0
y = 0

[State 1105, ChangeState]
Type = ChangeState
trigger1 = pos y >= 0
trigger1 = time > 0
value = 1110
ctrl = 1

;---------------------------------------------------------------------------
; Shoryuken Land
[Statedef 1110]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 1120
ctrl = 0
poweradd = 0

[State 1110, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Kaze no Ken
[Statedef 1150]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1150
poweradd = -200

[State 1100, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 220,0
channel = 0

[State 1100, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AP, NT
time = 20

[State 1100, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1100, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1100, Chain Flag]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 1100, Chain Flag]
Type = VarSet
trigger1 = animelemtime(5) > 0
var(55) = 61440

[State 1100, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1100, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 2

[State 1100, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = !movecontact
attr = S, SA
damage = Floor((22 + 3 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 12
guard.pausetime = 10,16
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -38
hitsound = 5, 2
guardsound = 6, 0
id = 1100
nochainid = 1100
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -3.25282, -4.50000
guard.velocity = -7.12097
air.velocity = -3.25282, -6.50000
air.hittime = 40
air.type = High
getpower = 0, 0
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1100, HitDef]
type = HitDef
triggerall = (Var(47) < 0)
trigger1 = !movecontact
attr = S, SA
damage = Floor((22 + 3 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 10, 12
guard.pausetime = 10,16
id = 1100
nochainid = 1100
sparkno = 2
guard.sparkno = 0
sparkxy = -10, -38
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -3.25282, -4.50000
guard.velocity = -7.12097
air.velocity = -3.25282, -6.50000
air.hittime = 40
air.type = High
getpower = 0, 0
givepower = 60, 90
fall = 1
air.fall = 1
envshake.time = 12

[State 1100, Juggle]
Type = VarSet
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = 0
;persistent = 0
ignorehitpause = 1

[State 1100, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1100, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Tsu Maki Sempu Kyako Start
[Statedef 1200]
type    = A
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1200
poweradd = 100

[State 1200, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1200,0
channel = 0

[State 1200, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 1200, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1200, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1200, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1200, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 2

[State 1200, VelSet]
Type = VelSet
trigger1 = time = 0
x = 1.5
y = -2.5

[State 1200, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.12

[State 1200, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := var(50) + 1
value = 1210

;---------------------------------------------------------------------------
; Tsu Maki Sempu Kyako Whirl around
[Statedef 1210]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 1210
poweradd = 0

[State 1200, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1200, 1

[State 1210, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0 

[State 1210, Gravity]
Type = VelAdd
trigger1 = vel y < 0
y = 0.12 ;- 0.03 * (var(50) = 2)

[State 1210, HitDef]
Type = HitDef
triggerall = var(47) >= ifelse(var(50) = 2, 0, 8)
trigger1 = !movecontact
type = HitDef
attr = A, SA
damage = Floor((5 + 2 * (Random/1000.0) + 9 * (var(50) = 2)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = HAF
priority = 4, Hit
pausetime = 10, 12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 18 ;+ 5 * (var(50) = 1)
ground.slidetime = 18 ;+ 5 * (var(50) = 1)
ground.velocity = -2.79407 + 2 * (var(50) = 1), -5.0000;ifelse(var(50) = 2, -2.79407,-3.28715), -4.00000 * (var(50) = 2)
guard.velocity = -3.28715
air.velocity = -2.79407 + 2 * (var(50) = 1), -5.00000 -1 * (var(50) = 1)
air.hittime = 30
air.type = High
getpower = var(50) * 30, 45
givepower = 30, 45
fall = 1;(var(50) = 2)
air.fall = 1
ground.cornerpush.veloff = 0

[State 1210, HitDef]
Type = HitDef
triggerall = var(47) < ifelse(var(50) = 2, 0, 8)
trigger1 = !movecontact
type = HitDef
attr = A, SA
damage = Floor((5 + 2 * (Random/1000.0) + 9 * (var(50) = 2)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = HA
priority = 4, Hit
pausetime = 10, 12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 18 ;+ 5 * (var(50) = 1)
ground.slidetime = 18 ;+ 5 * (var(50) = 1)
ground.velocity = -2.79407 + 2 * (var(50) = 1), -5.0000;ifelse(var(50) = 2, -2.79407,-3.28715), -4.00000 * (var(50) = 2)
guard.velocity = -3.28715
air.velocity = -2.79407 + 2 * (var(50) = 1), -5.00000 -1 * (var(50) = 1)
air.hittime = 30
air.type = High
getpower = var(50) * 30, 45
givepower = 30, 45
fall = 1;(var(50) = 2)
air.fall = 1
ground.cornerpush.veloff = 0

[State 1210, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1210, Juggle]
Type = VarAdd
trigger1 = MoveHit
v = 47
value = -16 + 13 * (var(50) = 1)
persistent = 0
ignorehitpause = 1

[State 1210, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := var(43) -1
value = 1210

[State 1210, ChangeState]
Type = ChangeState
trigger1 = var(43) = 1
trigger1 = animelem = 3
value = 1220

;---------------------------------------------------------------------------
;Tsu Maki Sempu Kyako Landing
[Statedef 1220]
type    = A
movetype = A
physics = N
anim = 1220

[State 1220, Gravity]
Type = Gravity
trigger1 = 1

[State 1220, Chain]
type = VarSet
trigger1 = Time = 0
var(50) = 0

[State 1220, PosSet]
Type = PosSet
trigger1 = pos y >= 0
y = 0

[State 1220, ChangeState]
Type = ChangeState
trigger1 = pos y >= 0
value = 1230

;---------------------------------------------------------------------------
;Tsu Maki Sempu Kyako Land
[Statedef 1230]
type = S
movetype = A
physics = S
velset = 0,0
anim = 1230

[State 1230, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 57600

[State 1230, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Air Tsu Maki Sempu Kyako Start
[Statedef 1250]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 1200
poweradd = 100

[State 1250, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1200,0
channel = 0

[State 1250, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 1250, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1250, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1250, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1250, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 2

[State 1250, VelSet]
Type = VelAdd
trigger1 = time = 0
x = 1 * ifelse(vel x >= 0, 1, -1)
y = -1.5

[State 1250, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := 6
value = 1260

;---------------------------------------------------------------------------
;Air Tsu Maki Sempu Kyako Whirl around
[Statedef 1260]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 1250
poweradd = 0

[State 1260, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0 

[State 1260, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
value = 1200, 1

[State 1260, Gravity]
Type = VelAdd
trigger1 = 1
y = -0.32 ;- 0.03 * (var(50) = 2)

[State 1260, HitDef]
Type = HitDef
triggerall = var(47) >= 8
trigger1 = !movecontact
type = HitDef
attr = A, SA
damage = Floor((4 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = HAF
priority = 4, Hit
pausetime = 10, 12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 18
ground.slidetime = 18
ground.velocity = -0.79407, -7.00000
guard.velocity = -2.79407
air.velocity = -0.79407 - (vel x/2.0), -7.00000
air.hittime = 30
air.type = High
getpower = 40, 60
givepower = 40, 60
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0
p2facing = 1

[State 1260, HitDef]
Type = HitDef
triggerall = var(47) < 8
trigger1 = !movecontact
type = HitDef
attr = A, SA
damage = Floor((4 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = H
priority = 4, Hit
pausetime = 10, 12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 18
ground.slidetime = 18
ground.velocity = -0.79407, -7.00000
guard.velocity = -2.79407
air.velocity = -0.79407 - (vel x/2.0), -7.00000
air.hittime = 30
air.type = High
getpower = 40, 60
givepower = 40, 60
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0
p2facing = 1

[State 1260, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1260, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -2
persistent = 0
ignorehitpause = 1

[State 1260, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := var(43) -1
value = 1260

[State 1260, ChangeState]
Type = ChangeState
trigger1 = var(43) = 0
trigger2 = pos y > -10
value = 1220

;---------------------------------------------------------------------------
;EX Tsu Maki Sempu Kyako Start
[Statedef 1280]
type    = A
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1200
poweradd = -200

[State 1200, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1200,0
channel = 0

[State 1200, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 1200, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1200, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1200, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1200, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 2

[State 1200, VelSet]
Type = VelSet
trigger1 = time = 0
x = 0
y = -2.5

[State 1200, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.12

[State 1200, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := 6
value = 1290

;---------------------------------------------------------------------------
; Tsu Maki Sempu Kyako Whirl around
[Statedef 1290]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 3210
poweradd = 0

[State 1200, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1200, 1

[State 1210, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0 

[State 1210, Gravity]
Type = VelAdd
trigger1 = vel y < 0
y = 0.12

[State 1210, HitDef]
Type = HitDef
triggerall = var(47) >= 8
trigger1 = !movecontact
type = HitDef
attr = A, SA
damage = Floor((2 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = HAF
priority = 4, Hit
pausetime = 2, 8
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 18 ;+ 5 * (var(50) = 1)
ground.slidetime = 18 ;+ 5 * (var(50) = 1)
ground.velocity = .29407, -5.0000
guard.velocity = -3.28715
air.velocity = 0.19407, -3.00000 - 5 * (var(43) <= 2)
air.hittime = 30
air.type = High
getpower = 0,0
givepower = 30, 45
fall = 1;(var(50) = 2)
air.fall = 1
ground.cornerpush.veloff = 0

[State 1210, HitDef]
Type = HitDef
triggerall = var(47) < 8
trigger1 = !movecontact
type = HitDef
attr = A, SA
damage = Floor((2 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = HA
priority = 4, Hit
pausetime = 2, 8
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 18 ;+ 5 * (var(50) = 1)
ground.slidetime = 18 ;+ 5 * (var(50) = 1)
ground.velocity = .29407, -5.0000
guard.velocity = -3.28715
air.velocity = 0.19407, -3.00000 - 5 * (var(43) <= 2)
air.hittime = 30
air.type = High
getpower = 0,0
givepower = 30, 45
fall = 1;(var(50) = 2)
air.fall = 1
ground.cornerpush.veloff = 0

[State 1210, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1210, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := var(43) -1
value = 1290

[State 1210, Juggle]
Type = VarAdd
trigger1 = MoveHit
trigger1 = var(43) = 1
v = 47
value = -8
persistent = 0
ignorehitpause = 1

[State 1210, ChangeState]
Type = ChangeState
trigger1 = var(43) = 1
trigger1 = animelem = 3
value = 1220

;---------------------------------------------------------------------------
; Fire Hadouken
[Statedef 1300]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1300 + (10 * (var(50) = 2))
poweradd = 100

[State 1000, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) = 15 + 5 * (var(50) = 2)
var(55) = 0

[State 1300, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) > 0
var(55) = 60160

[State 1300, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1300, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1300, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1300, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 2

[State 1300, Projectile]
Type = Helper
trigger1 = animelem = 3,1
name = "Hadouken"
id = 1300
pos = 27, -38
StateNo = 1301
ownpal = 1

[State 1300, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
value = 1000, 0
channel = 0

[State 1300, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Fire Hadouken Fireball
[Statedef 1301]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1003
SprPriority = 2

[State 1301, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1301, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1000, 1
channel = 0

[State 1301, Var(50)]
type = VarSet
trigger1 = time = 0
var(50) = Parent, var(50)

[State 1301, fvar(28)]
Type = VarSet
trigger1 = parent, Fvar(28) > Fvar(28)
fvar(28) = Parent, fvar(28)

[State 1301, Counter Flag Reset]
Type = VarSet
trigger1 = time = 0
var(59) = 0

[State 1301, Var(50)]
type = VarSet
trigger1 = time = 0
var(50) = Parent, var(50)

[State 1301, fvar(28)]
Type = VarSet
trigger1 = time = 0
var(49) = Parent, var(49)

[State 1301, Counter Flag Reset]
Type = VarSet
trigger1 = time = 0
var(59) = 0

[State 1301, VelSet]
Type = VelSet
trigger1 = time = 0
x = ifelse(var(50) = 2, 3.5, 2.15)

[State 1301, HitOverride]
Type = HitOverride
trigger1 = 1
attr = SCA, AP
stateno = 1302

[State 1301, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AT

;HitDef
[State 1301, HitDef]
type = HitDef
trigger1 = (Parent, Var(47) >= 0)
trigger1 = 1
attr = S, SP
damage = Floor(((6 + ifelse(Var(50) = 2, 4, 2) + (3 * Random/1000.0)) * Fvar(28) + 0.5)), Floor(1 + (Var(50) / 2.0) + (Random/1000.0) * Fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0, 12
guard.pausetime = 0,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
air.type = High
getpower = 60, 90
givepower = 60, 90
ground.cornerpush.veloff = 0
ground.velocity = ifelse(time < 5 || var(49) <= 0, -1.50000, -3.97923), ifelse(time < 5 || var(49) <= 0, -4.50000, 0)
guard.velocity = -4.68145
air.velocity = -1.67923, -4.00000
air.hittime = 40
palfx.add = 128, 64, 64
palfx.mul = 192, 192, 64
palfx.sinadd = 64, 32, 16, 15
palfx.color = 32
palfx.time = 28
fall = ifelse(time < 5 || var(49) <= 0, 1, 0)
air.fall = 1
ground.hittime = 15
ground.slidetime = 15
ignorehitpause = 1

;HitDef
[State 1301, HitDef]
type = HitDef
trigger1 = (Parent, Var(47) < 0)
trigger1 = 1
attr = S, SP
damage = Floor(((6 + ifelse(Var(50) = 2, 4, 2) + (3 * Random/1000.0)) * Fvar(28) + 0.5)), Floor(1 + (Var(50) / 2.0) + (Random/1000.0) * Fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 0, 12
guard.pausetime = 0,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
air.type = High
getpower = 60, 90
givepower = 60, 90
ground.cornerpush.veloff = 0
ground.velocity = ifelse(time < 5 || var(49) <= 0, -1.50000, -3.97923), ifelse(time < 5 || var(49) <= 0, -4.50000, 0)
guard.velocity = -4.68145
air.velocity = -1.67923, -4.00000
air.hittime = 40
palfx.add = 128, 64, 64
palfx.mul = 192, 192, 64
palfx.sinadd = 64, 32, 16, 15
palfx.color = 32
palfx.time = 28
fall = ifelse(time < 5 || var(49) <= 0, 1, 0)
air.fall = 1
ground.hittime = 15
ground.slidetime = 15
ignorehitpause = 1

[State 1301, Juggle]
Type = ParentVarAdd
triggerall = NumTarget > 0
trigger1 = Target, stateno = 5020
trigger1 = Target, Time = 0
v = 47
value = -8
ignorehitpause = 1

[State 1301, FireBall Hit SlowDown]
Type = ParentVarSet
trigger1 = MoveHit = 1
var(44) = 16
ignorehitpause = 1

[State 1301, ChangeState]
Type = ChangeState
trigger1 = MoveContact = 1
trigger2 = FrontEdgeDist < -50
value = 1302
ignorehitpause = 1

;---------------------------------------------------------------------------
;Hadouken end
[Statedef 1302]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
SprPriority = 2
anim = 1004

[State 1301, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1302, DestroySelf]
type = DestroySelf
trigger1 = time = 25

;---------------------------------------------------------------------------
; Ooki Hadouken
[Statedef 1400]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1400
poweradd = -200

[State 1000, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) = 15
var(55) = 0

[State 1300, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) > 0
var(55) = 61440

[State 1300, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1300, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1300, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1300, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 2

[state 1400, Recoil]
Type = VelSet
trigger1 = animelem = 3,1
x = -4.5

[State 1300, Projectile]
Type = Helper
trigger1 = animelem = 3,1
name = "Hadouken"
id = 1400
pos = 27, -38
StateNo = 1401
ownpal = 1

[State 1300, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
value = 1000, 0
channel = 0

[State 1300, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Ooki Hadouken Fireball
[Statedef 1401]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
SprPriority = 2

[State 1301, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1301, PlaySnd]
Type = PlaySnd
trigger1 = var(1) = 0
value = 1000, 1
channel = 0

[State 1401, Anim]
Type = ChangeAnim
trigger1 = var(1) = 0
value = 1401

[State 1301, Var(50)]
type = VarSet
trigger1 = time = 0
var(50) = Parent, var(50)

[State 1301, fvar(28)]
Type = VarSet
trigger1 = parent, Fvar(28) > Fvar(28)
fvar(28) = Parent, fvar(28)

[State 1301, Counter Flag Reset]
Type = VarSet
trigger1 = time = 0
var(59) = 0

[State 1301, Var(50)]
type = VarSet
trigger1 = time = 0
var(50) = Parent, var(50)

[State 1301, fvar(28)]
Type = VarSet
trigger1 = time = 0
var(49) = Parent, var(49)

[State 1301, Counter Flag Reset]
Type = VarSet
trigger1 = time = 0
var(59) = 0

[State 1301, VelSet]
Type = VelSet
trigger1 = time = 0
x = 2.5

[State 3001, HitOverride]
Type = HitOverride
trigger1 = 1
attr = SCA, AP
stateno = ifelse(var(2) < 2, 1401, 1402)
ignorehitpause = 1

[State 3001, Counter Flag Reset]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(1) > 0
v = 2
value = 1

[State 1301, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AT

;HitDef
[State 1301, HitDef]
type = HitDef
trigger1 = (Parent, Var(47) >= 0)
trigger1 = var(2) < 2
trigger1 = 1
attr = S, SP
damage = Floor(((6 + (3 * Random/1000.0)) * Fvar(28) + 0.5)), Floor(1 + (Var(50) / 2.0) + (Random/1000.0) * Fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0, 6
guard.pausetime = 0,6
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
air.type = High
getpower = 0, 0
givepower = 60, 90
ground.cornerpush.veloff = 0
ground.velocity = -1.90000,-4.50000
guard.velocity = -4.68145
air.velocity = -2.17923, -4.00000
air.hittime = 40
fall = 1
air.fall = 1
ground.hittime = 15
ground.slidetime = 15
ignorehitpause = 1

;HitDef
[State 1301, HitDef]
type = HitDef
trigger1 = (Parent, Var(47) < 0)
trigger1 = 1
attr = S, SP
damage = Floor(((6 + (3 * Random/1000.0)) * Fvar(28) + 0.5)), Floor(1 + (Var(50) / 2.0) + (Random/1000.0) * Fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 0, 6
guard.pausetime = 0,6
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
air.type = High
getpower = 0, 0
givepower = 60, 90
ground.cornerpush.veloff = 0
ground.velocity = -1.50000,-4.50000
guard.velocity = -4.68145
air.velocity = -1.67923, -4.00000
air.hittime = 40
fall = 1
air.fall = 1
ground.hittime = 15
ground.slidetime = 15
ignorehitpause = 1

[State 1301, Juggle]
Type = ParentVarAdd
trigger1 = movehit
v = 47
value = -8
ignorehitpause = 1
persistent = 0

[State 1301, FireBall Hit SlowDown]
Type = ParentVarSet
trigger1 = MoveHit = 1
var(44) = 16
ignorehitpause = 1

[State 3301, VarAdd]
Type = VarAdd
trigger1 = movecontact
trigger2 = var(0) > 0
v = 0
value = 1
ignorehitpause = 1

[State 3301, VarAdd]
type = VarAdd
triggerall = Movecontact
trigger1 = Target, time = 0
trigger1 = Target, stateno = 5000
trigger2 = Target, stateno = 5030
trigger2 = Target, time = 0
trigger3 = Target, stateno = 5020
trigger3 = Target, time = 0
trigger4 = Target, stateno = 5010
trigger4 = Target, time = 0
trigger5 = Target, stateno = [150, 155]
trigger5 = Target, time = 0
v = 2
value = 1
ignorehitpause = 1

[State 1301, ChangeState]
Type = ChangeState
trigger1 = var(2) = 2
trigger2 = animtime = 0
value = 1402
ignorehitpause = 1

[State 3301, VarAdd]
type = VarAdd
trigger1 = 1
v = 1
value = 1
ignorehitpause = 1

;---------------------------------------------------------------------------
;Hadouken end
[Statedef 1402]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
SprPriority = 2
anim = 1402

[State 1301, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1302, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---------------------------------------------------------------------------
;JOUDAN-SOKUTOU-GERI
[Statedef 1600]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1600 + 10 * (var(50) = 2)
poweradd = 100

[State 1100, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 210,0
channel = 0

[State 1600, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1600, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1600, VelSet]
Type = VelSet
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(3) <= 6 + ifelse(var(50) = 2, 4, 0)
x = 3

[State 1600, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(5) = 0
var(55) = 0

[State 1600, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) = 1
var(55) = 63360

[State 1600, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1600, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 2

[State 1600, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = !movecontact
attr = S, SA
damage = Floor((9 + 3 * (Random/1000.0) + 3 * (var(50) = 2)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
id = 1600
nochainid = 1600
pausetime = 10, 12
guard.pausetime = 10,16
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1.25282, -4.50000
guard.velocity = -3.12097
air.velocity = -1.25282, -6.50000
air.hittime = 40
air.type = High
getpower = 60, 90
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1600, HitDef]
type = HitDef
triggerall = (Var(47) < 0)
trigger1 = !movecontact
attr = S, SA
damage = Floor((9 + 3 * (Random/1000.0) + 3 * (var(50) = 2)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
id = 1600
nochainid = 1600
pausetime = 10, 12
guard.pausetime = 10,16
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1.25282, -4.50000
guard.velocity = -3.12097
air.velocity = -1.25282, -6.50000
air.hittime = 40
air.type = High
getpower = 60, 90
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1600, Juggle]
Type = VarSet
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -1
;persistent = 0
ignorehitpause = 1

[State 1600, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1600, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX JOUDAN-SOKUTOU-GERI
[Statedef 1610]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1620
poweradd = -200

[State 1100, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 210,0
channel = 0

[State 1600, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1600, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1600, VelSet]
Type = VelSet
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(3) <= 6
x = 3.5

[State 1600, Chain Flag]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 1600, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1600, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 2

[State 1600, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = !movecontact
attr = S, SA
damage = Floor((11 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
id = 1600
nochainid = 1600
pausetime = 10, 12
guard.pausetime = 10,16
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -6.25282, -4.50000
guard.velocity = -3.12097
air.velocity = -6.25282, -4.50000
air.hittime = 40
air.type = High
getpower = 0, 0
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0
p2stateno = 1615

[State 1600, HitDef]
type = HitDef
triggerall = (Var(47) < 0)
trigger1 = !movecontact
attr = S, SA
damage = Floor((11 + 3 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
id = 1600
nochainid = 1600
pausetime = 10, 12
guard.pausetime = 10,16
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -6.25282, -4.50000
guard.velocity = -3.12097
air.velocity = -6.25282, -4.50000
air.hittime = 40
air.type = High
getpower = 0, 0
givepower = 0, 0
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0
p2stateno = 1615
p2facing = 1

[State 1600, Juggle]
Type = VarSet
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = 8
;persistent = 0
ignorehitpause = 1

[State 1600, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1600, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Hit by EX JOUDAN-SOKUTOU-GERI
[Statedef 1615]
type    = A
movetype= H
physics = N
velset = 0,0

[State 1615, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
value = 5030

[State 1615, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 1025, State]
type = ChangeState
trigger1 = HitShakeOver = 1
value = 1616

;---------------------------------------------------------------------------
;Hit by EX JOUDAN-SOKUTOU-GERI
[Statedef 1616]
type    = A
movetype= H
physics = N

[State 1616, Velocity]
type = HitVelSet
trigger1 = Time = 0
x = 8
y = -6

[State 1616, Gravity]
type = VelAdd
trigger1 = 1
y = 0.28

[State 1616, No scroll]
type = ScreenBound
triggerall = Pos y < -15
trigger1 = BackEdgeBodyDist < 65
trigger2 = FrontEdgeBodyDist < 65
value = 1
movecamera = 0,1

[State 1616, Hit wall]
type = ChangeState
triggerall = Pos y < -15
trigger1 = BackEdgeBodyDist <= 15
trigger2 = FrontEdgeBodyDist <= 15
value = 1617

[State 1616, Hit ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 822

;------------------
; Hit by Fast Kung Fu Palm - hit wall
; (a custom gethit state)
[Statedef 1617]
type    = A
movetype= H
physics = N

[State 1617, Turn]
type = Turn
trigger1 = (Time = 0) && (FrontEdgeBodyDist <= 5)

[State 1617, Pos]
type = PosAdd
trigger1 = Time = 0
trigger1 = backedgebodydist <= 5
x = 5 - BackEdgeBodyDist

[State 1617, Stop moving]
type = PosFreeze
trigger1 = 1
x = 1
y = 1

[State 1617, No scroll]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 1617, Anim]
type = ChangeAnim
trigger1 = Time = 0
value = 5015

[State 1617, Sound]
type = PlaySnd
trigger1 = Time = 0
value = F7,0

[State 1617, State]
type = ChangeState
trigger1 = time = 3
value = 1618

;------------------
; Hit by Fast Kung Fu Palm - bounce off wall
; (a custom gethit state)
[Statedef 1618]
type    = A
movetype= H
physics = N

[State 1618, Vel Y]
type = VelSet
trigger1 = Time = 0
y = -4

[State 1618, Vel X]
type = VelSet
trigger1 = Time = 0
trigger1 = frontedgedist < backedgedist
x = -1.8

[State 1618, Vel X]
type = VelSet
trigger1 = Time = 0
trigger1 = frontedgedist >= backedgedist
x = 1.8

[State 1618, Turn]
type = Turn
trigger1 = (Time = 0) && (BackEdgeDist < 15)

[State 1618, Gravity]
type = VelAdd
trigger1 = 1
y = .35

[State 1618, Anim 5050] ;Self falling animation
type = ChangeAnim
trigger1 = Time = 0
trigger1 = !SelfAnimExist(5052)
value = 5050

[State 1618, Anim 5052] ;Self falling animation (diagup type)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5052)
value = 5052

[State 1618, Anim 5060] ;Coming down - normal
type = ChangeAnim
trigger1 = Vel Y > -2
trigger1 = Anim = 5050
trigger1 = SelfAnimExist(5060)
persistent = 0
value = 5060

[State 1618, Anim 5062] ;Coming down - diagup type
type = ChangeAnim
trigger1 = Vel Y > -2
trigger1 = Anim = 5052
trigger1 = SelfAnimExist(5062)
persistent = 0
value = 5062

[State 1618, Hit ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 822

;---------------------------------------------------------------------------
;Shinkuu Hadouken
[StateDef 3000]
Type = S
movetype = A
Physics = S
ctrl = 0
anim = 3010
velset = 0,0

[State 3000, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 3000,0
channel = 0

[State 3000, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
value = 1000,0
channel = 0
ignorehitpause = 1

[State 3000, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 3000, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 1
v = 51
value = 5 + 5 * (var(54) > 2)
ignorehitpause = 1
persistent = 0

[State 3000, PowerAdd]
Type = PowerAdd
trigger1 = time = 0
value = -1000

[State 3000, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = time = 30
var(55) = 0

[State 3000, Chain Flag]
Type = VarSet
trigger1 = time = 15
var(55) = 49152

[State 3000, MoveType]
Type = VarSet
trigger1 = time = 0
var(54) = 3

[State 3001, After Image]
Type = AfterImage
trigger1 = time = 0
time = 2
length = 9
timegap = 3
trans = add

[State 3001, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3001, AfterImagetime]
Type = AfterImageTime
trigger1 = animtime = 0
time = 1

[State 3000, SuperPause]
Type = SuperPause
trigger1 = time = 0
time = 40
anim = 100
pos = -3, -34
movetime = 4
sound = 20, 0
p2defmul = 1

[State 3000, Width]
Type = Width
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(4) < 0
player = 20, 30

[State 3000, Projectile]
Type = Helper
trigger1 = animelem = 3,1
name = "Hadouken"
id = 3000
pos = 37, -38
StateNo = 3001
ownpal = 1

[State 3000, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Shinkuu Hadouken Fireball
[Statedef 3001]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3000
SprPriority = 3

[State 3001, PlaySnd]
Type = PlaySnd
trigger1 = var(1) = 0
value = 1000, 1
channel = 0

[State 3001, Var(50)]
type = VarSet
trigger1 = var(1) = 0
var(50) = Parent, var(50)

[State 3001, fvar(28)]
Type = VarSet
trigger1 = parent, Fvar(28) > Fvar(28)
fvar(28) = Parent, fvar(28)

[State 3001, Counter Flag Reset]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(1) > 0
v = 2
value = 1

[State 3001, VelSet]
Type = VelSet
trigger1 = time = 0
x = 4.8

[State 3002, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1


[State 3001, HitOverride]
Type = HitOverride
trigger1 = 1
attr = SCA, AP
stateno = ifelse(var(2) < 4, 3001, 3002)
ignorehitpause = 1

[State 3001, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AT

[State 3001, See if it should make my opponent fall]
Type = VarSet
triggerall = var(2) = 4
trigger1 = parent, stateno < 3100
trigger2 = parent, stateno > 4000
var(3) = 1

[State 3001, PosFreeze]
Type = Velset
trigger1 = movecontact = 1
x = 2.4

;HitDef
[State 3001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) >= 0)
trigger1 = var(2) < 5
trigger1 = (var(0) % 2) = 0
attr = S, HP
damage = Floor(ifelse(var(2) = 0, 20 + (3 * Random/1000.0), 3 + (random/1000.0)) *  Parent, fvar(28) + 0.5), Floor(2 * Parent, fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 12
guard.pausetime = 2,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1.97923, ifelse(!var(3), 0.00000, -4.50000)
;air.velocity = -1.57923, -4.00000
air.velocity = -1.57923, ifelse(var(2) < 4, -1 ** (p2bodydist y > 0) ,-4.00000)
guard.velocity = -4.68145
id = 3000
air.hittime = 50
air.type = High
getpower = 0,0
givepower = 60, 90
fall = (var(3))
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0

;HitDef
[State 3001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) < 0)
trigger1 = var(2) < 5
trigger1 = (var(0) % 2) = 0
attr = S, HP
damage = Floor(ifelse(var(2) = 0, 20 + (3 * Random/1000.0), 3 + (random/1000.0)) *  Parent, fvar(28) + 0.5), Floor(2 * Parent, fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 2, 12
guard.pausetime = 2,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1.97923, ifelse(!var(3), 0.00000, -4.50000)
;air.velocity = -1.57923, -4.00000
air.velocity = -1.57923, ifelse(var(2) < 4, -1 ** (p2bodydist y > 0) ,-4.00000)
guard.velocity = -4.68145
id = 3000
air.hittime = 50
air.type = High
getpower = 0,0
givepower = 60, 90
fall = (var(3))
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0

[State 3001, Juggle]
Type = ParentVarSet
triggerall = NumTarget > 0
trigger1 = Target, stateno = 5020
trigger1 = Target, Time = 0
v = 47
value = 0
ignorehitpause = 1
persistent = 0

[State 3301, VarAdd]
Type = VarAdd
trigger1 = movecontact
trigger2 = var(0) > 0
v = 0
value = 1
ignorehitpause = 1

[State 3301, VarAdd]
type = VarAdd
triggerall = numtarget(3000) > 0
triggerall = Movecontact
trigger1 = Target, time = 0
trigger1 = Target, stateno = 5000
trigger2 = Target, stateno = 5030
trigger2 = Target, time = 0
trigger3 = Target, stateno = 5020
trigger3 = Target, time = 0
trigger4 = Target, stateno = 5010
trigger4 = Target, time = 0
trigger5 = Target, stateno = [150, 155]
trigger5 = Target, time = 0
trigger6 = Numtarget(3000) > 1
trigger6 = var(0) % 2 = 0
v = 2
value = 1
ignorehitpause = 1

[State 3001, FireBall Hit SlowDown]
Type = ParentVarSet
trigger1 = MoveHit = 1
var(44) = 16
ignorehitpause = 1

[State 3001, FireBall Hit SlowDown]
Type = ParentVarSet
trigger1 = NumTarget > 0
trigger1 = !target, alive
var(2) = 1
ignorehitpause = 1
persistent = 0

[State 3001, ChangeState]
Type = ChangeState
trigger1 = var(2) = 5
trigger2 = frontedgedist < -100
value = 3002
ignorehitpause = 1

[State 3301, VarAdd]
type = VarAdd
trigger1 = 1
v = 1
value = 1
ignorehitpause = 1

;---------------------------------------------------------------------------
; Shinkuu Hadouken Fireball End
[Statedef 3002]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3002
SprPriority = 3

[State 3002, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3001, FireBall Hit SlowDown]
Type = ParentVarSet
trigger1 = NumTarget > 0
trigger1 = !target, alive
var(2) = 1
ignorehitpause = 1
persistent = 0

[State 3001, FireBall Hit SlowDown]
Type = ParentVarSet
trigger1 = time = 25
var(2) = 0
ignorehitpause = 1
persistent = 0

[State 3002, DestroySelf]
Type = DestroySelf
trigger1 = time = 25

;---------------------------------------------------------------------------
;Shin Shoryuken
[StateDef 3100]
Type = S
movetype = A
Physics = S
ctrl = 0
anim = 3300
velset = 0,0

[State 3100, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 3300,0
channel = 0

[State 3100, After Image]
Type = AfterImage
trigger1 = time = 0
time = 2
length = 9
timegap = 3
trans = add

[State 3100, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3100, PowerAdd]
Type = PowerAdd
trigger1 = time = 0
value = -1000

[State 3100, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 3100, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(51) < 5
v = 51
value = 5
ignorehitpause = 1
persistent = 0

[State 3100, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 3100, MoveType]
Type = VarSet
trigger1 = time = 0
var(54) = 3

[State 3100, SuperPause]
Type = SuperPause
trigger1 = time = 0
time = 30
anim = 100
pos = 2, -48
movetime = 9
sound = 20, 0
p2defmul = 1

[State 3100, NotHitBy]
Type = NotHitBy
trigger1 = time < 40
value = , AA, AP, NT
ignorehitpause = 1

;Needs flag
[State 3100, HitDef]
Type = HitDef
triggerall = var(47) >= 0
trigger1 = time = 0
type = HitDef
attr = A, HA
damage = Floor((4 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 6, Hit
nochainid = 3100
pausetime = 30, 34
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 3
guardsound = 6, 0
ground.type = Low
ground.hittime = 20
ground.slidetime = 20
ground.velocity = 0, 0
guard.velocity = 0
air.velocity = -1.79407, -5.50000
air.hittime = 30
air.type = High
getpower = 0, 0
givepower = 60, 90
air.fall = 1
ground.cornerpush.veloff = 0
envshake.time = 30
envshake.freq = 60
envshake.ampl = -8
down.bounce = 1

[State 3100, I Hit]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = movehit
value = 3120

[State 3100, I miss]
Type = ChangeState
trigger1 = !Movehit
trigger1 = animtime = 0
value = 3110

;---------------------------------------------------------------------------
;Shin Shoryuken Miss
[Statedef 3110]
type    = A
movetype= A
physics = N
velset = 4.2,-5.9
ctrl = 0
anim = 3310
poweradd = 0

[State 3310, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1100,0
channel = 0

[State 3310, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1100, 1
channel = 1

[State 3310, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 2

[State 3310, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.32

[State 3310, Air Drag]
Type = VelMul
trigger1 = 1
x = 0.80

[State 3310, Chain]
Type = VarSet
trigger1 = time = 5
var(55) = 16384

[State 3310, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = !(time % 3)
attr = S, SA
damage = Floor((5 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 6
guard.pausetime = 4,6
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -1.65282, -5.50000
guard.velocity = -3.12097
air.velocity = -1.65282, -6.50000
air.hittime = 30
air.type = High
getpower = 0, 0
givepower = 60, 90
fall = 1
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0

[State 3310, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 2

[State 3310, Pos Y]
Type = PosSet
trigger1 = pos y >= 0
trigger1 = time > 0
y = 0

[State 3310, Juggle]
Type = VarSet
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
trigger1 = pos y < -25
v = 47
value = 0
persistent = 0
ignorehitpause = 1

[State 3310, ChangeState]
Type = ChangeState
trigger1 = pos y >= 0
trigger1 = time > 0
value = 3130
ctrl = 1

;---------------------------------------------------------------------------
;Shin Shoryuken Hit
[Statedef 3120]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 3320
poweradd = 0

[State 3110, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 2

[State 3120, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1100,0
channel = 0

[State 3120, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AA, AP, NT
time = 15

[State 3120, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) = 1
var(55) = 24576

[State 3320, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 3

[State 3320, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = time = 0
attr = S, HA
damage = Floor((12 + 5 * (Random/1000.0)) * fvar(28) + 0.5), Floor((3 + random/1000.0) * fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 30, 29
guard.pausetime = 30,29
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -0.65282, 0
guard.velocity = -3.12097
air.velocity = -0.65282, -3.00000
air.hittime = 40
air.type = High
getpower = 0,0
givepower = 60, 90
air.fall = 1
ground.cornerpush.veloff = 0
envshake.time = 30
envshake.freq = 60
envshake.ampl = -8

[State 3320, HitDef]
type = HitDef
triggerall = (Var(47) < 0)
trigger1 = time = 0
attr = S, HA
damage = Floor((12 + 5 * (Random/1000.0)) * fvar(28) + 0.5), Floor((3 + random/1000.0) * fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 30, 29
guard.pausetime = 30,29
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -0.65282, 0
guard.velocity = -3.12097
air.velocity = -0.65282, -3.00000
air.hittime = 40
air.type = High
getpower = 0,0
givepower = 60, 90
air.fall = 1
ground.cornerpush.veloff = 0
envshake.time = 30
envshake.freq = 60
envshake.ampl = -8

[State 3320, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 3320, ChangeState]
type = ChangeState
trigger1 = animelemtime(3) = 0
value = 3125

;---------------------------------------------------------------------------
; Shoryuken Jump
[Statedef 3125]
type    = A
movetype= A
physics = N
velset = 4.2,-5.7
ctrl = 0
poweradd = 0

[State 1100, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1100, 1

[State 3125, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 2

[State 3125, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.32

[State 3125, Air Drag]
Type = VelMul
trigger1 = 1
x = 0.80

[State 3125, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 16384

[State 3125, Chain]
Type = VarSet
trigger1 = animelemtime(4) = 0
var(55) = 0

[State 3125, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = time = 0
attr = A, HA
damage = Floor((12 + 2 * (Random/1000.0)) * fvar(28) + 0.5), Floor((2 + (random/1000.0)) * fvar(28) + 0.5)
animtype = Up
air.animtype = Up
guardflag = M
hitflag = MAF
id = 3100
priority = 4, Hit
pausetime = 8, 12
guard.pausetime = 8,12
sparkno = 3
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 3
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -0.45282, -10.700000
guard.velocity = -3.12097
air.velocity = -0.45282, -10.70000
air.hittime = 30
air.type = High
getpower = 0,0
givepower = 60, 90
fall = 1
fall.recover = 0
air.fall = 1
ground.cornerpush.veloff = 0

[State 3125, HitDef]
type = HitDef
triggerall = (Var(47) < 0)
trigger1 = time = 0
attr = A, HA
damage = Floor((12 + 2 * (Random/1000.0)) * fvar(28) + 0.5), Floor((2 + (random/1000.0)) * fvar(28) + 0.5)
animtype = Up
air.animtype = Up
guardflag = M
hitflag = MA
id = 3100
priority = 4, Hit
pausetime = 8, 12
guard.pausetime = 8,12
sparkno = 3
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 3
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -0.45282, -10.700000
guard.velocity = -3.12097
air.velocity = -0.45282, -10.70000
air.hittime = 30
air.type = High
getpower = 0,0
givepower = 60, 90
fall = 1
fall.recover = 0
air.fall = 1
ground.cornerpush.veloff = 0

[State 3320, Juggle]
Type = VarSet
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = 0
persistent = 0
ignorehitpause = 1

[State 3125, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 3125, Pos Y]
Type = PosSet
trigger1 = pos y >= 0
trigger1 = time > 0
y = 0

[State 3125, ChangeState]
Type = ChangeState
trigger1 = pos y >= 0
trigger1 = time > 0
value = 3130
ctrl = 1

;---------------------------------------------------------------------------
;Shinku Shoryuken Land
[Statedef 3130]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 1120
ctrl = 0
poweradd = 0

[State 3101, AfterImagetime]
Type = AfterImageTime
trigger1 = time = 0
time = 4

[State 3310, Chain]
Type = VarAdd
trigger1 = time = 0
trigger1 = prevstateno = 3125
var(51) = 5

[State 3310, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 3130, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Shinkuu Tsumaki Senpuu Kyako
[StateDef 3200]
Type = S
movetype = A
Physics = S
ctrl = 0
anim = 3200
velset = 0,0

[State 3200, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 3000,0
channel = 0

[State 3200, PowerAdd]
Type = PowerAdd
trigger1 = time = 0
value = -1000

[State 3200, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 3200, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 3200, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 1
v = 51
value = 5 + 5 *(var(54) > 2)
ignorehitpause = 1
persistent = 0

[State 3001, After Image]
Type = AfterImage
trigger1 = time = 0
time = 2
length = 9
timegap = 3
trans = add

[State 3200, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3200, MoveType]
Type = VarSet
trigger1 = time = 0
var(54) = 3

[State 3100, SuperPause]
Type = SuperPause
trigger1 = time = 0
time = 30
anim = 100
pos = 2, -25
movetime = 9
sound = 20, 0
p2defmul = 1

[State 3200, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := 12
value = 3201

;---------------------------------------------------------------------------
;Shinkuu Tsumaki Senpuu Kyako
[StateDef 3250]
Type = A
movetype = A
Physics = N
ctrl = 0
anim = 3250
velset = 0,0

[State 3200, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 3000,0
channel = 0

[State 3250, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 3250, PowerAdd]
Type = PowerAdd
trigger1 = time = 0
value = -1000

[State 3250, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 3250, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 5 + 5 *(var(54) > 2)
ignorehitpause = 1
persistent = 0

[State 3250, MoveType]
Type = VarSet
trigger1 = time = 0
var(54) = 3

[State 3250, SuperPause]
Type = SuperPause
trigger1 = time = 0
time = 40
anim = 100
pos = 2, -45
movetime = 9
sound = 20, 0
p2defmul = 1

[State 3001, After Image]
Type = AfterImage
trigger1 = time = 0
time = 2
length = 9
timegap = 3
trans = add

[State 3200, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3250, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := 12
value = 3201

;---------------------------------------------------------------------------
;Shinkuu Tsumaki Senpuu Kyako Jump
[StateDef 3201]
Type = A
movetype = A
Physics = N
ctrl = 0
anim = 1200

[State 3201, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3201, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1200,0
channel = 0

[State 3201, Jump]
Type = VelSet
trigger1 = time = 0
x = 1.5
y = -2.5

[State 3200, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.30

[State 3201, ChangeState 3]
Type = VelSet
trigger1 = animtime = 0
y = -0.5
x = 0

[State 3201, ChangeState 3]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := 12
value = 3202

;---------------------------------------------------------------------------
;Shinku Tsu Maki Sempu Kyako Whirl around
[Statedef 3202]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 3210
poweradd = 0

[State 3202, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3202, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1200, 1

[State 3202, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0 

[State 3202, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.01 ;- 0.03 * (var(50) = 2)

[State 3202, Width]
Type = Width
trigger1 = 1
player = 0,0

[State 3202, HitDef]
Type = HitDef
triggerall = var(47) >= 0
trigger1 = !movecontact
type = HitDef
attr = A, HA
damage = Floor((3 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 4 + (8 * enemynear,statetype = A) - (3 + 5 * (enemynear,statetype = A)) * (var(43) > 10)
air.pausetime = 2, 12 - 11 * (var(43) > 10)
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = 0.5 + (2 * hitcount = 0), -2.0
guard.velocity = 0.5
air.velocity = ifelse(var(43) > 10, 0.5, -2.79407), ifelse(var(43) > 10, -1 ** (p2bodydist y > 0) ,-2.00000)
air.hittime = 30
air.type = High
getpower = 0, 0
givepower = 30, 45
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 3202, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 3202, Juggle]
Type = VarSet
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = 0
persistent = 0
ignorehitpause = 1

[State 3202, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := var(43) -1
value = 3202

[State 3202, ChangeState]
Type = ChangeState
trigger1 = var(43) = 1
trigger1 = animelem = 2
value = 3203

;---------------------------------------------------------------------------
;Shinku Tsu Maki Sempu Kyako Whirl around
[Statedef 3203]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 3210
poweradd = 0

[State 3203, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3203, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1200, 1

[State 3203, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0 

[State 3203, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.001 ;- 0.03 * (var(50) = 2)

[State 3202, Width]
Type = Width
trigger1 = 1
player = 0,0

[State 3203, HitDef]
Type = HitDef
triggerall = var(47) >= 0
trigger1 = !movecontact
type = HitDef
attr = A, HA
damage = Floor((14 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 20, 20
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 3
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -0.88715, -5.5
guard.velocity = -3.28715
air.velocity = -0.79407, -5.0000
air.hittime = 30
air.type = High
getpower = 0, 0
givepower = 30, 45
fall = 1
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
envshake.time = 30
envshake.freq = 60
envshake.ampl = -15
down.bounce = 1

[State 3203, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 3203, Juggle]
Type = VarSet
trigger1 = MoveHit
v = 47
value = 0
persistent = 0
ignorehitpause = 1

[State 3203, ChangeState]
Type = ChangeState
trigger1 = animelemtime(2) = 2
value = 3204

;---------------------------------------------------------------------------
;Shinkuu Tsu Maki Sempu Kyako Landing
[Statedef 3204]
type    = A
movetype = A
physics = N
anim = 3220

[State 3204, Gravity]
Type = Gravity
trigger1 = 1

[State 3204, Chain]
type = VarSet
trigger1 = Time = 0
var(50) = 0

[State 3204, PosSet]
Type = PosSet
trigger1 = pos y >= 0
y = 0

[State 3204, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3204, ChangeState]
Type = ChangeState
trigger1 = pos y >= 0
value = 3205

;---------------------------------------------------------------------------
;Shinkuu Tsu Maki Sempu Kyako Land
[Statedef 3205]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3230

[State 3200, AfterImagetime]
Type = AfterImageTime
trigger1 = time = 0
time = 2

[State 3205, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 40960

[State 3205, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Shinkuu Shoryuken
[StateDef 3300]
Type = S
movetype = A
Physics = S
ctrl = 0
anim = 3150
velset = 0,0

[State 3100, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 3000,0
channel = 0

[State 3100, PowerAdd]
Type = PowerAdd
trigger1 = time = 0
value = -3000

[State 3100, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 3000, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 1
v = 51
value = 5 + 5 * (var(54) > 2)
ignorehitpause = 1
persistent = 0

[State 3100, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 3100, MoveType]
Type = VarSet
trigger1 = time = 0
var(54) = 3

[State 3100, SuperPause]
Type = SuperPause
trigger1 = time = 0
time = 40
anim = 100
pos = -7, -39
movetime = 7
sound = 20, 0
p2defmul = 1

[State 3101, After Image]
Type = AfterImage
trigger1 = time = 0
time = 2
length = 9
timegap = 3
trans = add

[State 3101, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 1100, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AA, AP, NT
time = 40

[State 3101, PosAdd]
Type = Width
trigger1 = 1
player = 15, 20
ignorehitpause = 1

[State 3001, HitDef]
type = HitDef
triggerall = Var(47) >= 0
trigger1 = animelemtime(4) = 0
attr = S, HA
damage = Floor((20 + (3 * Random/1000.0)) * fvar(28) + 0.5), Floor(2 * fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 25, 32
guard.pausetime = 25,32
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -35
hitsound = 5, 2
guardsound = 6, 0
ground.type = Low
ground.hittime = 30
ground.slidetime = 30
ground.velocity = -0.97923, 0
air.velocity = -1.57923, -4.00000
guard.velocity = -0.68145
id = 3000
air.hittime = 50
air.type = Low
getpower = 0,0
givepower = 60, 90
fall = 0
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
envshake.time = 30
envshake.freq = 60
envshake.ampl = -8

;HitDef
[State 3001, HitDef]
type = HitDef
triggerall = Var(47) < 0
trigger1 = animelemtime(4) = 0
attr = S, HP
damage = Floor((20 + (3 * Random/1000.0)) * fvar(28) + 0.5), Floor(2 * fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 25, 32
guard.pausetime = 25,32
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -32
hitsound = 5, 2
guardsound = 6, 0
ground.type = Low
ground.hittime = 30
ground.slidetime = 30
ground.velocity = -0.97923, 0
air.velocity = -1.57923, -4.00000
guard.velocity = -0.68145
id = 3000
air.hittime = 50
air.type = Low
getpower = 0,0
givepower = 60, 90
fall = 0
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
envshake.time = 30
envshake.freq = 60
envshake.ampl = -8

[State 3001, Juggle]
Type = ParentVarSet
triggerall = NumTarget > 0
trigger1 = Target, stateno = 5020
trigger1 = Target, Time = 0
v = 47
value = 0
ignorehitpause = 1
persistent = 0

[State 3301, VarAdd]
Type = VarAdd
trigger1 = movecontact
trigger2 = var(0) > 0
v = 0
value = 1
ignorehitpause = 1

[State 3100, ChangeState]
Type = ChangeState
trigger1 = animelemtime(8) = 0
value = 3301

;---------------------------------------------------------------------------
;Shinkuu Shoryuken
[StateDef 3301]
Type = S
movetype = A
Physics = S
ctrl = 0
velset = 0,0

[State 3101, PosAdd]
Type = Width
trigger1 = time <= 3
player = 15, 20
ignorehitpause = 1

[State 3101, PosAdd]
Type = PosAdd
trigger1 = time = 0
x = 12

[State 3101, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3001, HitDef]
type = HitDef
triggerall = Var(47) >= 0
trigger1 = animelemtime(10) = 0
attr = S, HA
damage = Floor((8 + (3 * Random/1000.0)) * fvar(28) + 0.5), Floor(2 * fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 25, 25
guard.pausetime = 25,32
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -45
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 30
ground.slidetime = 30
ground.velocity = 0.97923, 0
air.velocity = 0.57923, -4.00000
guard.velocity = -0.68145
id = 3000
air.hittime = 50
air.type = High
getpower = 0,0
givepower = 60, 90
fall = 0
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
envshake.time = 30
envshake.freq = 60
envshake.ampl = -8

;HitDef
[State 3001, HitDef]
type = HitDef
triggerall = Var(47) < 0
trigger1 = animelemtime(10) = 0
attr = S, HP
damage = Floor((8 + (3 * Random/1000.0)) * fvar(28) + 0.5), Floor(2 * fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 25, 32
guard.pausetime = 25,32
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -45
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 30
ground.slidetime = 30
ground.velocity = 0.97923, 0
air.velocity = -1.57923, -1.00000
guard.velocity = -0.68145
id = 3000
air.hittime = 50
air.type = High
getpower = 0,0
givepower = 60, 90
fall = 0
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
envshake.time = 30
envshake.freq = 60
envshake.ampl = -8

[State 3101, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 3302 

;---------------------------------------------------------------------------
;Shoryuken Start
[Statedef 3302]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1110

[State 1100, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1100,0
channel = 0

[State 1100, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AA, AP, NT
time = 20

[State 3101, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 1100, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1100, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1100, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = time = 12
var(55) = 0

[State 1100, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) = 0
var(55) = 24576

[State 1100, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) = 0
var(55) = 0

[State 1100, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = time = 0
attr = S, HA
damage = Floor((26 + 3 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 30, 32
guard.pausetime = 30,32
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1.25282, -4.50000
guard.velocity = -3.12097
air.velocity = -1.25282, -5.50000
air.hittime = 40
air.type = High
getpower = 0, 0
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0
envshake.time = 30
envshake.freq = 60
envshake.ampl = -8

[State 1100, HitDef]
type = HitDef
triggerall = (Var(47) < 0)
trigger1 = time = 0
attr = S, HA
damage = Floor((26 + 3 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 30, 32
guard.pausetime = 30,32
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1.25282, -4.50000
guard.velocity = -3.12097
air.velocity = -1.25282, -6.50000
air.hittime = 40
air.type = High
getpower = 0, 0
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0
envshake.time = 30
envshake.freq = 60
envshake.ampl = -8

[State 1100, Juggle]
Type = VarSet
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = 0
;persistent = 0
ignorehitpause = 1

[State 1100, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1100, ChangeState]
type = ChangeState
trigger1 = animelemtime(3) = 0
value = 3305

;---------------------------------------------------------------------------
; Shoryuken Jump
[Statedef 3305]
type    = A
movetype= A
physics = N
velset = 4.2,-5.9
ctrl = 0
poweradd = 0

[State 1105, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1100, 1

[State 3101, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 1105, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.32

[State 1105, Air Drag]
Type = VelMul
trigger1 = 1
x = 0.80

[State 1105, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 16384

[State 1105, Chain]
Type = VarSet
trigger1 = vel y >= 0
var(55) = 0

[State 1105, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = time = 0
attr = A, HA
damage = Floor((20 + 2 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
guard.pausetime = 8,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -1.45282, -8.700000
guard.velocity = -3.12097
air.velocity = -1.45282, -7.500000
air.hittime = 30
air.type = High
getpower = 0, 0
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1105, HitDef]
type = HitDef
triggerall = (Var(47) < 0)
trigger1 = time = 0
attr = A, SA
damage = Floor((20 + 2 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = HA
priority = 4, Hit
pausetime = 8, 8
guard.pausetime = 8,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -1.45282, -8.700000
guard.velocity = -3.12097
air.velocity = -1.45282, -7.500000
air.hittime = 30
air.type = High
getpower = 0, 0
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1105, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1105, Juggle]
Type = VarSet
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = 0
;persistent = 0
ignorehitpause = 1

[State 1105, Pos Y]
Type = PosSet
trigger1 = pos y >= 0
trigger1 = time > 0
y = 0

[State 1105, ChangeState]
Type = ChangeState
trigger1 = pos y >= 0
trigger1 = time > 0
value = 3310
ctrl = 1

;---------------------------------------------------------------------------
; Shoryuken Land
[Statedef 3310]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 1120
ctrl = 0
poweradd = 0

[State 3101, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 1105, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 1110, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Shinryuuken
[StateDef 3500]
Type = S
movetype = A
Physics = S
ctrl = 0
anim = 3500
velset = 0,0

[State 3100, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 3000,0
channel = 0

[State 3100, PowerAdd]
Type = PowerAdd
trigger1 = time = 0
value = -3000

[State 3100, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 3000, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 1
v = 51
value = 5 + 5 * (var(54) > 2)
ignorehitpause = 1
persistent = 0

[State 3100, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 3100, MoveType]
Type = VarSet
trigger1 = time = 0
var(54) = 3

[State 3100, SuperPause]
Type = SuperPause
trigger1 = time = 0
time = 45
anim = 100
pos = 0, -41
movetime = 44
sound = 20, 0
p2defmul = 1

[State 3101, After Image]
Type = AfterImage
trigger1 = time = 0
time = 2
length = 9
timegap = 3
trans = add

[State 3101, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 1100, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AA, AP, NT
time = 45

[State 3101, VelSet]
Type = VelSet
trigger1 = animelemtime(5) >= 0
x = 1.2
ignorehitpause = 1

[State 200, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit = 1
trigger1 = Target, StateType = A
v = 47
value = -2
persistent = 2
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
trigger1 = AnimElem = 6
trigger2 = AnimElem = 8
trigger3 = AnimElem = 15
trigger4 = AnimElem = 17
value = 200, 0

[State 200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 12
trigger2 = AnimElem = 21
value = 210, 0

;Let the bashing beging
[State 3500, HitDef]
type = HitDef
triggerall = Var(47) >= 0
trigger1 = AnimElem = 6
trigger2 = AnimElem = 8
trigger3 = AnimElem = 15
trigger4 = AnimElem = 17
attr = S, HA
damage = Floor((6 + (2 * Random/1000.0)) * Fvar(28) + 0.5), Floor(2 * Fvar(28) + 0.5)
animtype = Light
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 4, 10
sparkno = 1
guard.sparkno = 0
sparkxy = -5, -44
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -2.24124, 0.00000
air.velocity = -1.20506, -3.00000
air.hittime = 24
air.type = High
air.juggle = 15
getpower = 0, 0
givepower = 30, 45

[State 3500, HitDef]
type = HitDef
triggerall = Var(47) <= 0
trigger1 = AnimElem = 6
trigger2 = AnimElem = 8
trigger3 = AnimElem = 15
trigger4 = AnimElem = 17
attr = S, HA
damage = Floor((6 + (2 * Random/1000.0)) * Fvar(28) + 0.5), Floor(2 * Fvar(28) + 0.5)
animtype = Light
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 4, 10
sparkno = 1
guard.sparkno = 0
sparkxy = -5, -44
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -2.24124, 0.00000
air.velocity = -1.20506, -3.00000
air.hittime = 24
air.type = High
air.juggle = 15
getpower = 0, 0
givepower = 30, 45

[State 3500, HitDef]
type = HitDef
triggerall = Var(47) >= 0
trigger1 = AnimElem = 12
trigger2 = AnimElem = 21
attr = S, HA
damage = Floor((7 + (2 * Random/1000.0)) * Fvar(28) + 0.5), Floor(2 * Fvar(28) + 0.5)
animtype = Light
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 6, 20
sparkno = 2
guard.sparkno = 1
sparkxy = -5, -30
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -2.24124, 0.00000
air.velocity = -1.20506, -3.00000
air.hittime = 24
air.type = High
air.juggle = 15
getpower = 0, 0
givepower = 30, 45

[State 3500, HitDef]
type = HitDef
triggerall = Var(47) < 0
trigger1 = AnimElem = 12
trigger2 = AnimElem = 21
attr = S, HA
damage = Floor((8 + (2 * Random/1000.0)) * Fvar(28) + 0.5), Floor(2 * Fvar(28) + 0.5)
animtype = Light
guardflag = M
hitflag = MA
priority = 3, Hit
pausetime = 6, 20
sparkno = 2
guard.sparkno = 1
sparkxy = -5, -30
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -2.24124, 0.00000
air.velocity = -1.20506, -3.00000
air.hittime = 24
air.type = High
air.juggle = 15
getpower = 0, 0
givepower = 30, 45

[State 3500, ChangeState]
Type = ChangeState
trigger1 = animelemtime(23) = 0
value = 3501

;---------------------------------------------------------------------------
;Shinryuuken
[StateDef 3501]
Type = S
movetype = A
Physics = S
ctrl = 0
velset = 0,0

[State 3101, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 25
value = 220, 0

[State 225, HitDef]
type = HitDef
triggerall = Var(47) >= 0
trigger1 = AnimElem = 25
attr = S, HA
damage = Floor((9 + (Random/1000.0)* 2) * Fvar(28) + 0.5), Floor(2 * Fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 32
sparkno = 1
guard.sparkno = 0
sparkxy = -5, -55
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 32
ground.slidetime = 32
ground.velocity = -0.95843, -4.00000
air.velocity = -0.51467, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 0, 0
givepower = 50, 75
fall = 1

[State 225, Last HitDef]
type = HitDef
triggerall = Var(47) < 0
trigger1 = AnimElem = 25
attr = S, HA
damage = Floor((9 + (Random/1000.0)* 2) * Fvar(28) + 0.5), Floor(2 * Fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 32
sparkno = 1
guard.sparkno = 0
sparkxy = -5, -55
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 32
ground.slidetime = 32
ground.velocity = -0.95843, -4.00000
air.velocity = -0.51467, -3.00000
air.hittime = 30
air.type = High
air.juggle = 15
getpower = 0, 0
givepower = 50, 75
fall = 1

[State 3100, ChangeState]
Type = ChangeState
trigger1 = Animelemtime(25) = 12
trigger1 = movehit
value = 3502

[State 3100, ChangeState]
Type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Shoryuken Start
[Statedef 3502]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1110

[State 1100, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1100,0
channel = 0

[State 1100, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AA, AP, NT
time = 20

[State 3101, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 1100, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1100, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1100, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = time = 12
var(55) = 0

[State 1100, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) = 0
var(55) = 24576

[State 1100, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(3) = 0
var(55) = 0

[State 1100, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = time = 0
attr = S, HA
damage = Floor((16 + 3 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 30, 32
guard.pausetime = 30,32
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1.25282, -4.50000
guard.velocity = -3.12097
air.velocity = -1.25282, -5.50000
air.hittime = 40
air.type = High
getpower = 0, 0
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0
envshake.time = 30
envshake.freq = 60
envshake.ampl = -8

[State 1100, HitDef]
type = HitDef
triggerall = (Var(47) < 0)
trigger1 = time = 0
attr = S, HA
damage = Floor((16 + 3 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 30, 32
guard.pausetime = 30,32
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1.25282, -4.50000
guard.velocity = -3.12097
air.velocity = -1.25282, -6.50000
air.hittime = 40
air.type = High
getpower = 0, 0
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0
envshake.time = 30
envshake.freq = 60
envshake.ampl = -8

[State 1100, Juggle]
Type = VarSet
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = 0
;persistent = 0
ignorehitpause = 1

[State 1100, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1100, ChangeState]
type = ChangeState
trigger1 = animelemtime(3) = 0
value = 3505

;---------------------------------------------------------------------------
; Shoryuken Jump
[Statedef 3505]
type    = A
movetype= A
physics = N
velset = 4.2,-5.9
ctrl = 0
poweradd = 0

[State 1105, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1100, 1

[State 3101, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 1105, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.32

[State 1105, Air Drag]
Type = VelMul
trigger1 = 1
x = 0.80

[State 1105, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 16384

[State 1105, Chain]
Type = VarSet
trigger1 = vel y >= 0
var(55) = 0

[State 1105, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = time = 0
attr = A, HA
damage = Floor((10 + 2 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
guard.pausetime = 8,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -1.45282, -8.700000
guard.velocity = -3.12097
air.velocity = -1.45282, -7.500000
air.hittime = 30
air.type = High
getpower = 0, 0
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1105, HitDef]
type = HitDef
triggerall = (Var(47) < 0)
trigger1 = time = 0
attr = A, SA
damage = Floor((10 + 2 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = HA
priority = 4, Hit
pausetime = 8, 8
guard.pausetime = 8,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -1.45282, -8.700000
guard.velocity = -3.12097
air.velocity = -1.45282, -7.500000
air.hittime = 30
air.type = High
getpower = 0, 0
givepower = 60, 90
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1105, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1105, Juggle]
Type = VarSet
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = 0
;persistent = 0
ignorehitpause = 1

[State 1105, Pos Y]
Type = PosSet
trigger1 = pos y >= 0
trigger1 = time > 0
y = 0

[State 1105, ChangeState]
Type = ChangeState
trigger1 = pos y >= 0
trigger1 = time > 0
value = 3310
ctrl = 1

;---------------------------------------------------------------------------
;Metsu Hadouken
[StateDef 3600]
Type = S
movetype = A
Physics = S
ctrl = 0
anim = 3010
velset = 0,0

[State 3000, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 3000,0
channel = 0

[State 3000, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
value = 1000,0
channel = 0
ignorehitpause = 1

[State 3000, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 3000, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 1
v = 51
value = 5 + 5 * (var(54) > 2)
ignorehitpause = 1
persistent = 0

[State 3000, PowerAdd]
Type = PowerAdd
trigger1 = time = 0
value = -3000

[State 3000, Chain Flag]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 3000, MoveType]
Type = VarSet
trigger1 = time = 0
var(54) = 3

[State 3001, After Image]
Type = AfterImage
trigger1 = time = 0
time = 2
length = 9
timegap = 3
trans = add

[State 3001, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3001, AfterImagetime]
Type = AfterImageTime
trigger1 = animtime = 0
time = 1

[State 3000, SuperPause]
Type = SuperPause
trigger1 = time = 0
time = 40
anim = 100
pos = -3, -34
movetime = 4
sound = 20, 0
p2defmul = 1

[State 3000, Width]
Type = Width
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(4) < 0
player = 20, 30

[State 3000, Projectile]
Type = Helper
trigger1 = animelem = 3,1
name = "Hadouken"
id = 3000
pos = 37, -38
StateNo = 3601
ownpal = 1

[State 3000, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Metsu Hadouken Fireball
[Statedef 3601]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3600
SprPriority = 3

[State 3001, PlaySnd]
Type = PlaySnd
trigger1 = var(1) = 0
value = 1000, 1
channel = 0

[State 3001, Var(50)]
type = VarSet
trigger1 = var(1) = 0
var(50) = Parent, var(50)

[State 3001, fvar(28)]
Type = VarSet
trigger1 = parent, Fvar(28) > Fvar(28)
fvar(28) = Parent, fvar(28)

[State 3001, Counter Flag Reset]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(1) > 0
v = 2
value = 1

[State 3001, VelSet]
Type = VelSet
trigger1 = time = 0
x = 6.8

[State 3002, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1


[State 3001, HitOverride]
Type = HitOverride
trigger1 = 1
attr = SCA, AP
stateno = ifelse(var(2) < 11, 3001, 3002)
ignorehitpause = 1

[State 3001, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AT

[State 3001, See if it should make my opponent fall]
Type = VarSet
trigger1 = var(2) = 11
var(3) = 1

[State 3001, PosFreeze]
Type = Velset
trigger1 = movecontact = 1
x = 0.8

;HitDef
[State 3001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) >= 0)
trigger1 = var(2) < 12
trigger1 = (var(0) % 2) = 0
attr = S, HP
damage = Floor(ifelse(var(2) = 0, 14 + (3 * Random/1000.0), 4 + (random/1000.0)) *  Parent, fvar(28) + 0.5), Floor(2 * Parent, fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 1, 12
guard.pausetime = 1,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1.97923, ifelse(!var(3), 0.00000, -4.50000)
air.velocity = -1.57923, -4.00000
guard.velocity = -4.68145
id = 3000
air.hittime = 50
air.type = High
getpower = 0,0
givepower = 20, 30
fall = (var(3))
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0

;HitDef
[State 3001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) < 0)
trigger1 = var(2) < 12
trigger1 = (var(0) % 2) = 0
attr = S, HP
damage = Floor(ifelse(var(2) = 0, 14 + (3 * Random/1000.0), 4 + (random/1000.0)) *  Parent, fvar(28) + 0.5), Floor(2 * Parent, fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 1, 12
guard.pausetime = 1,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1.97923, ifelse(!var(3), 0.00000, -4.50000)
air.velocity = -1.57923, -4.00000
guard.velocity = -4.68145
id = 3000
air.hittime = 50
air.type = High
getpower = 0,0
givepower = 20, 30
fall = (var(3))
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0

[State 3001, Juggle]
Type = ParentVarSet
triggerall = NumTarget > 0
trigger1 = Target, stateno = 5020
trigger1 = Target, Time = 0
v = 47
value = 0
ignorehitpause = 1
persistent = 0

[State 3301, VarAdd]
Type = VarAdd
trigger1 = movecontact
trigger2 = var(0) > 0
v = 0
value = 1
ignorehitpause = 1

[State 3301, VarAdd]
type = VarAdd
triggerall = numtarget(3000) > 0
triggerall = Movecontact
trigger1 = Target, time = 0
trigger1 = Target, stateno = 5000
trigger2 = Target, stateno = 5030
trigger2 = Target, time = 0
trigger3 = Target, stateno = 5020
trigger3 = Target, time = 0
trigger4 = Target, stateno = 5010
trigger4 = Target, time = 0
trigger5 = Target, stateno = [150, 155]
trigger5 = Target, time = 0
trigger6 = Numtarget(3000) > 1
trigger6 = var(0) % 2 = 0
v = 2
value = 1
ignorehitpause = 1

[State 3001, FireBall Hit SlowDown]
Type = ParentVarSet
trigger1 = MoveHit = 1
var(44) = 16
ignorehitpause = 1

[State 3001, FireBall Hit SlowDown]
Type = ParentVarSet
trigger1 = NumTarget > 0
trigger1 = !target, alive
var(2) = 1
ignorehitpause = 1
persistent = 0

[State 3001, ChangeState]
Type = ChangeState
trigger1 = var(2) = 12
trigger2 = frontedgedist < -100
value = 3002
ignorehitpause = 1

[State 3301, VarAdd]
type = VarAdd
trigger1 = 1
v = 1
value = 1
ignorehitpause = 1


;---------------------------------------------------------------------------
; Special Shake Fall State
[Statedef 5021]
type    = A
movetype= H
physics = N
velset = 0,0

[State 5020, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
value = 5030

[State 5020, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5020, 5]
type = ChangeState
trigger1 = HitShakeOver
value = 5031

;---------------------------------------------------------------------------
; Special Fall State
[Statedef 5031]
type    = A
movetype= H
physics = N
ctrl = 0
velset = -5,-4.5

[State 5030, 1]
type = VelAdd;Gravity
trigger1 = 1
y = GetHitVar(yaccel)

[State 5030, 4]
type = SelfState
triggerall = HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= 10  ;.
value = 5050 ;HITA_FALL

[State 5030, 5]
type = SelfState
trigger1 = AnimTime = 0
value = 5035 ;HITA_UP (transition)

;-------------------------------------------------------------------------
;Zero counter
[Statedef 2000]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 2000
poweradd = -250

[State 2000, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1100,0
channel = 0

[State 2000, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AP, NT
time = 1

[State 2000, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 2000, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 2000, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = time = 12
var(55) = 0

[State 2000, Chain Flag]
Type = VarSet
trigger1 = time = 6
var(55) = 57856

[State 2000, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 2000, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 3

[State 2000, After Image]
Type = AfterImage
trigger1 = time = 0
time = 2
length = 9
timegap = 3
trans = add

[State 2000, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 2000, HitDef]
type = HitDef
triggerall = (Var(47) >= 8)
trigger1 = time = 0
attr = S, ST
damage = Floor((3 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = 
hitflag = MAF
priority = 4, Hit
pausetime = 10, 12
guard.pausetime = 10,16
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1.25282, -7.50000
guard.velocity = -3.12097
air.velocity = -1.25282, -8.50000
air.hittime = 40
air.type = High
getpower = 0, 0
givepower = 40, 60
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 2000, HitDef]
type = HitDef
triggerall = (Var(47) < 8)
trigger1 = time = 0
attr = S, ST
damage = Floor((3 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = 
hitflag = MA
priority = 4, Hit
pausetime = 10, 12
guard.pausetime = 10,16
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1.25282, -7.50000
guard.velocity = -3.12097
air.velocity = -1.25282, -8.50000
air.hittime = 40
air.type = High
getpower = 0, 0
givepower = 40, 60
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 2000, Juggle]
Type = VarSet
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = 0
;persistent = 0
ignorehitpause = 1

[State 2000, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 2000, ChangeState]
type = ChangeState
trigger1 = animelemtime(3) = 0
value = 2005

;---------------------------------------------------------------------------
; Shoryuken Jump
[Statedef 2005]
type    = A
movetype= A
physics = N
velset = 3,-3.9
ctrl = 0
poweradd = 0

[State 1105, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1100, 1

[State 2000, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 2000, NotHitBy]
Type = NotHitBy
trigger1 = vel y < 0
value = , AA, AP, NT
time = 1

[State 1105, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.32

[State 1105, Air Drag]
Type = VelMul
trigger1 = 1
x = 0.80

[State 1105, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 16384

[State 1105, Chain]
Type = VarSet
trigger1 = animelemtime(4) = 0
var(55) = 0

[State 1105, HitDef]
type = HitDef
triggerall = (Var(47) >= 8)
trigger1 = time = 0
attr = A, ST
damage = Floor((3 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag =
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
guard.pausetime = 8,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -1.45282, -8.700000
guard.velocity = -3.12097
air.velocity = -1.45282, -7.500000
air.hittime = 30
air.type = High
getpower = 0, 0
givepower = 40, 60
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1105, HitDef]
type = HitDef
triggerall = (Var(47) < 8)
trigger1 = time = 0
attr = A, SA
damage = Floor((3 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag =
hitflag = MA
priority = 4, Hit
pausetime = 8, 8
guard.pausetime = 8,12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -48
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -1.45282, -8.700000
guard.velocity = -3.12097
air.velocity = -1.45282, -7.500000
air.hittime = 30
air.type = High
getpower = 0, 0
givepower = 40, 60
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1105, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1105, Juggle]
Type = VarSet
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = 0
;persistent = 0
ignorehitpause = 1

[State 1105, Pos Y]
Type = PosSet
trigger1 = pos y >= 0
trigger1 = time > 0
y = 0

[State 1105, ChangeState]
Type = ChangeState
trigger1 = pos y >= 0
trigger1 = time > 0
value = 1110
ctrl = 1

;---------------------------------------------------------------------------
;Emergency Escape RUN_FWD
[Statedef 2100]
type    = S
physics = S
anim = 100
sprpriority = 1
poweradd = -250
ctrl = 0

[State 2100, After Image]
Type = AfterImage
trigger1 = time = 0
time = 2
length = 9
timegap = 3
trans = add

[State 2100, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 2100, PlayerPush]
Type = PlayerPush
trigger1 = 1
value = 0

[State 2100, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AP, NT
time = 1

[State 2100, 1]
type = VelSet
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 2100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 2100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 2100, Moveability]
Type = VarSet
trigger1 = ctrl
var(55) = 64895

[State 2100, Moveability]
Type = VarSet
trigger1 = !ctrl
var(55) = 0

[State 2100, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 3

[State 2100, 4]
type = ChangeState
trigger1 = animelem = 6
value = 2101

;---------------------------------------------------------------------------
; RUN_FWD End
[Statedef 2101]
type    = S
physics = S
sprpriority = 1

[State 101, Moveability]
Type = VarSet
trigger1 = time > 3
var(55) = 65535

[State 2100, AfterImagetime]
Type = AfterImageTime
trigger1 = time < 4
time = 1

[State 101, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 101, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Evade
[Statedef 2200]
type    = S
physics = S
anim = 100
sprpriority = 1
ctrl = 0

[State 2100, After Image]
Type = AfterImage
trigger1 = time = 0
time = 2
length = 9
timegap = 3
trans = add

[State 2100, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 2100, PlayerPush]
Type = PlayerPush
trigger1 = 1
value = 0

[State 2100, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AP
time = 1

[State 2100, 1]
type = VelSet
trigger1 = 1
x = const(velocity.run.fwd.x) * 0.75

[State 2100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 2100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 2100, Moveability]
Type = VarSet
trigger1 = ctrl
var(55) = 64895

[State 2100, Moveability]
Type = VarSet
trigger1 = !ctrl
var(55) = 0

[State 2100, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 3

[State 2100, 4]
type = ChangeState
trigger1 = animelem = 6
value = 2101
