;===========================================================================
;Special.St

;---------------------------------------------------------------------------
; Kikouken
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
trigger1 = animelemtime(3) = 4
var(55) = 63232

[State 1000, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(4) > 1
var(55) = 0

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

[State 1000, Width]
Type = Width
trigger1 = animelem = 3
value = 12, -12

[State 1000, Projectile]
Type = Helper
trigger1 = animelem = 3,1
name = "Kikouken"
id = 1000
pos = 30, -28
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
; Kikouken Fireball
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
x = 2.5 + var(50)

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
damage = Floor(((2 + Var(50) + (2 * Random/1000.0)) * Fvar(28) + 0.5)), Floor(1 + (Var(50) / 2.0) + (Random/1000.0) * Fvar(28) + 0.5)
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
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -4.68145, -4.00000 * (var(49) <= 0)
air.velocity = -1.97923, -4.00000
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
damage = Floor(((2 + Var(50) + (2 * Random/1000.0)) * Fvar(28) + 0.5)), Floor(1 + (Var(50) / 2.0) + (Random/1000.0) * Fvar(28) + 0.5)
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
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -4.68145, -4.00000 * (var(49) <= 0)
air.velocity = -1.97923, -4.00000
air.hittime = 50
air.type = High
getpower = 40,60
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
; Kikoushou
[Statedef 1050]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1010
poweradd = -200

[State 1000, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) = 4
var(55) = 65280

[State 1000, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(4) > 1
var(55) = 0

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

[State 1000, Width]
Type = Width
trigger1 = animelem = 3
value = 12, -12

[State 1000, Projectile]
Type = Helper
trigger1 = animelem = 3,1
name = "Kikouken"
id = 1000
pos = 37, -28
StateNo = 1051
ownpal = 1

[State 1000, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
value = 3000, 0
channel = 0

[State 1000, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Kikoushou Fireball
[Statedef 1051]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1050
SprPriority = 5

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
trigger1 = var(1) = 0
trigger2 = parent, Fvar(28) < Fvar(28)
fvar(28) = Parent, fvar(28)

[State 3001, Counter Flag Reset]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(1) > 0
v = 2
value = 1

[State 3002, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3001, HitOverride]
Type = HitOverride
trigger1 = 1
attr = SCA, AP
stateno = 1051
ignorehitpause = 1

[State 3001, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AT

[State 3001, PosFreeze]
Type = PosFreeze
trigger1 = movecontact % 2

;HitDef
[State 3001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) >= 0)
trigger1 = (var(1) % 6) = 0
attr = S, SP
damage = Floor((2 + (Random/1000.0)) *  fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 6
guard.pausetime = 2,6
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -1.97923, -3
air.velocity = -1.97923, -3
guard.velocity = -4.68145
air.hittime = 50
air.type = High
getpower = 0,0
givepower = 10, 15
fall = 1
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
sprpriority = 5

;HitDef
[State 3001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) < 0)
trigger1 = (var(1) % 6) = 0
attr = S, SP
damage = Floor((2 + (Random/1000.0)) *  fvar(28) + 0.5), Floor(fvar(28) + 0.5)
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
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -1.97923, -3
air.velocity = -1.97923, -3
guard.velocity = -4.68145
air.hittime = 50
air.type = High
getpower = 0,0
givepower = 10, 15
fall = 1
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
sprpriority = 5

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
v = 2
value = 1
ignorehitpause = 1

[State 3001, FireBall Hit SlowDown]
Type = ParentVarSet
trigger1 = var(0) = 1
var(44) = 16
ignorehitpause = 1

[State 1050, ChangeState]
Type = ChangeState
trigger1 = animelem = 23
trigger2 = frontedgedist < -50
trigger3 = parent, stateno != 1050
value = 1052
ignorehitpause = 1

[State 3301, VarAdd]
type = VarAdd
trigger1 = 1
v = 1
value = 1
ignorehitpause = 1

;---------------------------------------------------------------------------
; Kikoushou Fireball End
[Statedef 1052]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
SprPriority = 3

[State 3002, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3001, Juggle]
Type = ParentVarSet
trigger1 = time = 15
var(2) = 0
ignorehitpause = 1
persistent = 0

[State 3002, DestroySelf]
Type = DestroySelf
trigger1 = animelemtime(23) = 15

;---------------------------------------------------------------------------
;Air Kikouken
[Statedef 1060]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 620
poweradd = 100

[State 1000, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) = 2
var(55) = 37376

[State 1000, Chain Flag]
Type = VarSet
trigger1 = time = 0
trigger2 = animelemtime(4) > 1
var(55) = 0

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

[State 1000, Width]
Type = Width
trigger1 = animelem = 3
value = 12, -12

[State 1000, Projectile]
Type = Helper
trigger1 = animelem = 3,1
name = "Kikouken"
id = 1000
pos = 30, -30
StateNo = 1061
ownpal = 1

[State 1000, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
value = 1000, 0
channel = 0

;---------------------------------------------------------------------------
; Kikouken Fireball
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

[State 1061, AngleDraw]
Type = AngleDraw
trigger1 = 1
value = ifelse(var(50) = 1, -30, -45)

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
trigger1 = var(50) = 1
x = 8 * sin(pi/6.0)
y = 8 * sin(pi/3.0)

[State 1061, Trans]
Type = Trans
Trigger1 = 1
trans = add
ignorehitpause = 1

[State 1001, VelSet]
Type = VelSet
trigger1 = time = 0
trigger1 = var(50) = 2
x = 8 * sin(pi/4.0)
y = 8 * sin(pi/4.0)

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
attr = A, SP
damage = Floor(((2 + Var(50)) * Fvar(28) + 0.5)), Floor(Fvar(28) + 0.5)
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
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -4.68145, 6.00000 * (var(49) <= 0)
air.velocity = -1.97923, 6.00000
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
attr = A, SP
damage = Floor(((2 + Var(50)) * Fvar(28) + 0.5)), Floor(Fvar(28) + 0.5)
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
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -4.68145, 6.00000 * (var(49) <= 0)
air.velocity = -1.97923, 6.00000
air.hittime = 50
air.type = High
getpower = 40,60
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
trigger3 = pos y >= 0
value = 1002
ignorehitpause = 1


;---------------------------------------------------------------------------
;Lightning Kick Start
[Statedef 1100]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1100 + 10 * (var(50) = 2)
poweradd = 100

[State 1100, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1300,0
channel = 0

[State 1100, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AA, AP
time = 7

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

[State 1100, VelSet]
Type = VelSet
trigger1 = animelem = 2
x = 3.5

[State 1100, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = time = 0
attr = S, SA
damage = Floor((3 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = L
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 7, 12
guard.pausetime = 7,16
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -30
hitsound = 5, 2
guardsound = 6, 0
ground.type = Low
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -.65282, 0
guard.velocity = -3.12097
air.velocity = -.65282, -6.50000
air.hittime = 40
air.type = L
hitonce = 1
getpower = 10, 15
givepower = 10, 15
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0

[State 1100, HitDef]
type = HitDef
triggerall = (Var(47) < 0)
trigger1 = time = 0
attr = S, SA
damage = Floor((3 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = L
guardflag = M
hitflag = M
priority = 4, Hit
pausetime = 7, 16
guard.pausetime = 7,16
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -30
hitsound = 5, 2
guardsound = 6, 0
ground.type = Low
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -.65282, 0
guard.velocity = -3.12097
air.velocity = -.65282, -1.50000
air.hittime = 40
air.type = L
hitonce = 1
getpower = 10, 15
givepower = 10, 15
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0

[State 1100, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -2
persistent = 0
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
trigger1 = var(43) := 3 + (var(50))
value = 1105

;---------------------------------------------------------------------------
;Lighting Kick Cont
[Statedef 1105]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1105
poweradd = 0

[State 1105, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1100, 1

[State 1105, Air Drag]
Type = VelMul
trigger1 = 1
x = 0.80

[State 1105, Chain]
Type = VarSet
trigger1 = time = 0
trigger1 = var(43) = 1
var(55) = 63104

[State 1105, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = !(movecontact % 4)
attr = S, SA
damage = Floor(fvar(28) * (ifelse(var(43) % 2, 1.4, 1)) + 0.5), Floor(0.5 * fvar(28) + 0.5)
animtype = L
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 3, 8
guard.pausetime = 3,8
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -30 -(ifelse(animelemtime(2) >= 0 && animelemtime(3) < 0, -20, ifelse(animelemtime(4) >= 0 && animelemtime(5) < 0, 20, 0)))
hitsound = 5, 2
guardsound = 6, 0
ground.type = L
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -0.65282 - 3.5 * (var(43) = 1), -4 * (var(49) = 0)
guard.velocity = -0.52097
air.velocity = -2.65282, -3.500000
air.hittime = 30
air.type = High
getpower = 10, 15
givepower = 10, 15
fall = (var(49) = 0)
air.fall = 1
ground.cornerpush.veloff = -4.2 * (var(43) = 1)

[State 1105, HitDef]
type = HitDef
triggerall = (Var(47) < 0)
trigger1 = !(movecontact % 4)
attr = S, SA
damage = Floor(fvar(28) * (ifelse(var(43) % 2, 1.4, 1)) + 0.5), Floor(0.5 * fvar(28) + 0.5)
animtype = L
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 3, 8
guard.pausetime = 3,8
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -30 -(ifelse(animelemtime(2) >= 0 && animelemtime(3) < 0, -20, ifelse(animelemtime(4) >= 0 && animelemtime(5) < 0, 20, 0)))
hitsound = 5, 2
guardsound = 6, 0
ground.type = L
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -0.65282 - 3.5 * (var(43) = 1), -4 * (var(49) = 0)
guard.velocity = -0.52097
air.velocity = -2.65282, -3.500000
air.hittime = 30
air.type = High
getpower = 10, 15
givepower = 10, 15
fall = (var(49) = 0)
air.fall = 1
ground.cornerpush.veloff = -4.2 * (var(43) = 1)

[State 1105, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = var(43) % 2 = 0
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1105, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -2
persistent = 0
ignorehitpause = 1

[State 1105, VarAdd]
Type = VarAdd
trigger1 = animtime = 0
var(43) = -1

[State 1105, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 1110 - (5 * (var(43) > 0))

;---------------------------------------------------------------------------
; Lightning Kick End
[Statedef 1110]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 1120
ctrl = 0
poweradd = 0

[State 1110, Chain Flag]
Type = VarSet
trigger1 = time = 2
var(55) = 0

[State 1110, ChangeState]
Type = ChangeState
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
poweradd = 80

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
y = -2

[State 1200, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.12

[State 1200, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := 6
value = 1210

;---------------------------------------------------------------------------
;Air Tsu Maki Sempu Kyako Start
[Statedef 1201]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 1201
poweradd = 80

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

[State 1200, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.12

[State 1200, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := 6
value = 1211

;---------------------------------------------------------------------------
; Tsu Maki Sempu Kyako Whirl around
[Statedef 1210]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 1210
poweradd = 0

[State 1200, VelSet]
Type = VelSet
trigger1 = time = 0
trigger1 = var(43) = 6
y = -6 + var(50)
x = var(50) * 1.5

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
trigger1 = 1
y = 0.24 ;- 0.03 * (var(50) = 2)

[State 1210, HitDef]
Type = HitDef
triggerall = var(47) >= 0
trigger1 = !movecontact
type = HitDef
attr = A, SA
damage = Floor((3 + (Random/1000.0) - (var(43) % 2)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = HAF
priority = 4, Hit
pausetime = 8, 9
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 24 ;+ 5 * (var(50) = 1)
ground.slidetime = 24 ;+ 5 * (var(50) = 1)
ground.velocity = -1.79407, -5.5
guard.velocity = -3.28715
air.velocity = -1.29407, -4.5
air.hittime = 33
air.type = High
getpower = 10, 15
givepower = 10, 15
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1210, HitDef]
Type = HitDef
triggerall = var(47) < 0
trigger1 = !movecontact
type = HitDef
attr = A, SA
damage = Floor((3 + (Random/1000.0) - (var(43) % 2)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = HA
priority = 4, Hit
pausetime = 8, 9
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 24 ;+ 5 * (var(50) = 1)
ground.slidetime = 24 ;+ 5 * (var(50) = 1)
ground.velocity = -1.79407, -6.5 + var(50)
guard.velocity = -3.28715
air.velocity = -1.29407, -5.5 + var(50)
air.hittime = 33
air.type = High
getpower = 20, 30
givepower = 20, 30
fall = 1
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
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -3
persistent = 0
ignorehitpause = 1

[State 1210, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := var(43) -1
trigger1 = pos y < 0
value = 1210

[State 1210, ChangeState]
Type = ChangeState
trigger1 = var(43) = 1
trigger1 = animelem = 3
trigger2 = pos y >= 0
value = 1220

;---------------------------------------------------------------------------
;Air Tsu Maki Sempu Kyako Whirl around
[Statedef 1211]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 1210
poweradd = 0

[State 1200, VelSet]
Type = VelAdd
trigger1 = time = 0
trigger1 = var(43) = 6
x = 1 * ifelse(vel x >= 0, 1, -1)
y = -2

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
trigger1 = 1
y = 0.24 ;- 0.03 * (var(50) = 2)

[State 1210, HitDef]
Type = HitDef
triggerall = var(47) >= 0
trigger1 = !movecontact
type = HitDef
attr = A, SA
damage = Floor((3 + (Random/1000.0) - (var(43) % 2)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = HAF
priority = 4, Hit
pausetime = 8, 9
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 24 ;+ 5 * (var(50) = 1)
ground.slidetime = 24 ;+ 5 * (var(50) = 1)
ground.velocity = -1.79407, -5.5
guard.velocity = -3.28715
air.velocity = -1.29407, -0.5
air.hittime = 33
air.type = High
getpower = 10, 15
givepower = 10, 15
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1210, HitDef]
Type = HitDef
triggerall = var(47) < 0
trigger1 = !movecontact
type = HitDef
attr = A, SA
damage = Floor((3 + (Random/1000.0) - (var(43) % 2)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = HA
priority = 4, Hit
pausetime = 8, 9
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 24 ;+ 5 * (var(50) = 1)
ground.slidetime = 24 ;+ 5 * (var(50) = 1)
ground.velocity = -1.79407, -5.5
guard.velocity = -3.28715
air.velocity = -1.29407, -0.5
air.hittime = 33
air.type = High
getpower = 20, 30
givepower = 20, 30
fall = 1
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
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -3
persistent = 0
ignorehitpause = 1

[State 1210, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := var(43) -1
trigger1 = pos y < 0
value = 1210

[State 1210, ChangeState]
Type = ChangeState
trigger1 = var(43) = 1
trigger1 = animelem = 3
trigger2 = pos y >= 0
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
var(55) = 64896

[State 1230, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Tsu Maki Sempu Kyako Start
[Statedef 1250]
type    = A
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1250
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
trigger1 = animtime = 0
x = 0
y = -5

[State 1200, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := 5
value = 1260

;---------------------------------------------------------------------------
; Tsu Maki Sempu Kyako Whirl around
[Statedef 1260]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 1210
poweradd = 0

[State 1200, VelAdd]
Type = VelAdd
trigger1 = 1
y = 0.10

[State 1200, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1200, 1

[State 1210, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0 

[State 1210, HitDef]
Type = HitDef
triggerall = var(47) >= 0
trigger1 = !movecontact
type = HitDef
attr = A, SA
damage = Floor((3 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = HAF
priority = 5, Hit
pausetime = 8, 10
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 24 ;+ 5 * (var(50) = 1)
ground.slidetime = 24 ;+ 5 * (var(50) = 1)
ground.velocity = -0.19407, -5.5
guard.velocity = -3.28715
air.velocity = -.19407, -7
air.hittime = 33
air.type = High
getpower = 0, 0
givepower = 20, 30
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1210, HitDef]
Type = HitDef
triggerall = var(47) < 0
trigger1 = !movecontact
type = HitDef
attr = A, SA
damage = Floor((3 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = HA
priority = 5, Hit
pausetime = 8, 10
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 24 ;+ 5 * (var(50) = 1)
ground.slidetime = 24 ;+ 5 * (var(50) = 1)
ground.velocity = -0.19407, -5.5
guard.velocity = -3.28715
air.velocity = -.19407, -7
air.hittime = 33
air.type = High
getpower = 0, 0
givepower = 20, 30
fall = 1
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
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -2
persistent = 0
ignorehitpause = 1

[State 1210, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := var(43) -1
value = 1260

[State 1210, ChangeState]
Type = ChangeState
trigger1 = var(43) = 1
trigger1 = animelem = 3
value = 1220

;---------------------------------------------------------------------------
;Classic Tsu Maki Sempu Kyako Start
[Statedef 1270]
type    = A
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1250
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
x = 0
y = -2

[State 1200, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.12

[State 1200, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := 2 * var(50)
value = 1280

;---------------------------------------------------------------------------
; Tsu Maki Sempu Kyako Whirl around
[Statedef 1280]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 1210
poweradd = 0

[State 1200, VelSet]
Type = VelSet
trigger1 = time = 0
x = 2
y = 0

[State 1200, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1200, 1

[State 1210, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0 

[State 1210, HitDef]
Type = HitDef
triggerall = var(47) >= 0
trigger1 = !movecontact
type = HitDef
attr = A, SA
damage = Floor((3 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = HAF
priority = 4, Hit
pausetime = 8, 12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 30 ;+ 5 * (var(50) = 1)
ground.slidetime = 30;+ 5 * (var(50) = 1)
ground.velocity = -2.79407, 0
guard.velocity = -3.28715
air.velocity = -1.79407, -4.5
air.hittime = 33
air.type = High
getpower = 20, 30
givepower = 20, 30
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0

[State 1210, HitDef]
Type = HitDef
triggerall = var(47) < 0
trigger1 = !movecontact
type = HitDef
attr = A, SA
damage = Floor((3 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = HA
priority = 4, Hit
pausetime = 8, 12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 30;+ 5 * (var(50) = 1)
ground.slidetime = 30;+ 5 * (var(50) = 1)
ground.velocity = -2.79407, 0
guard.velocity = -3.28715
air.velocity = -1.79407, -4.5
air.hittime = 33
air.type = High
getpower = 20, 30
givepower = 20, 30
fall = 0
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
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -4
persistent = 0
ignorehitpause = 1

[State 1210, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := var(43) -1
value = 1280

[State 1210, ChangeState]
Type = ChangeState
trigger1 = var(43) = 0
trigger1 = animelem = 3
value = 1220

;---------------------------------------------------------------------------
;Spinning Bird bomb
[Statedef 1300]
Type = S
movetype = A
Physics = N
velset = 0,0
anim = 1300
ctrl = 0
poweradd = 200

[State 1300, Don't move]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 1300, Width]
Type = Width
trigger1 = 1
player = 0,0

[State 3100, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AP

[State 1300, HitDef]
Type = HitDef
trigger1 = time = 0
trigger1 = enemynear, stateno != [150, 153]
attr = S, ST
guardflag =
hitflag = M
guard.dist = -1
priority = 4, Miss
sparkno = S4000
guard.sparkno = S4000
sparkxy = -5, -50
sprpriority = 2
hitonce = 1
p2facing = 1
p2stateno = 1320
p1stateno = 1310
fall = 1
;hitsound = 5,0

[State 1300, ChangeState]
Type = ChangeState
trigger1 = MoveHit
value = 1310

[State 1300, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 1305

;---------------------------------------------------------------------------
;Spinning Pile Drive (Miss)
[Statedef 1305]
Type = S
movetype = A
velset = 0,0
Physics = N
anim = 1305
ctrl = 0

[State 1305, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 210, 0
channel = 0

[State 1305, Don't move]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 1305, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Spinning Pile Drive (Hit)
[Statedef 1310]
Type = S
movetype = A
velset = 0,0
Physics = N
anim = 1310
poweradd = 50

[State 1310, TargetState]
Type = TargetState
trigger1 = time = 0
value = 1320

[State 1310, No Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 1310, No Juggle]
Type = VarSet
trigger1 = 1
var(47) = -1

[State 1310, PlayerPush]
Type = PlayerPush
trigger1 = 1
value = 0

[State 1310, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
value = 220, 0
channel = 0

[State 1310, PosSet]
Type = PosSet
trigger1 = animelemtime(2) = 0
y = target,const(size.head.pos.y) * target, const(size.yscale) + 20
x = target, pos x - target,const(size.head.pos.x)

[State 1310, PosSet]
Type = VelSet
trigger1 = animelemtime(2) = 0
y = 0
x = 0.7

[State 1310, PosSet]
Type = PosSet
trigger1 = animelemtime(6) = 0
y = 0

[State 1310, VelSet]
Type = VelSet
trigger1 = animelemtime(6) = 0
x = 0

[State 1310, TargetBind 2]
Type = TargetBind
trigger1 = animelemtime(7) >= 0
trigger1 = animelemtime(8) < 0
pos = 0, -57

[State 1310, TargetBind 3]
Type = TargetBind
trigger1 = animelemtime(8) = 0
pos = 23, -27

[State 1310, Width]
Type = Width
trigger1 = 1
edge = 15, 15

[State 1313, TargetLifeAdd]
Type = TargetLifeAdd
trigger1 = animelemtime(8) = 0
value = -Floor((15 + (Random/1000.0)* 5) * Fvar(28) + 0.5)

[State 1212, TargetPowerAdd]
Type = TargetPowerAdd
trigger1 = animelemtime(8) = 0
value = 100

[State 1313, TargetLifeAdd]
Type = TargetVelSet
trigger1 = animelemtime(8) = 0
x = 12.5
y = -1

[State 1310, TargetState]
Type = TargetState
trigger1 = animelemtime(8) = 0
value = 1321

[State 1310, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Being Thrown by Spinning Pile Drive (Start)
[StateDef 1320]
type    = S
movetype= H
physics = N
ctrl = 0
velset = 0,0
poweradd = 0
sprpriority = 1

[State 1320, Width]
Type = Width
trigger1 = 1
edge = 23,23

[State 1320, ChangeAnim2]
Type = ChangeAnim2
trigger1 = time = 0
value = 1320

[State 811, 6]
Type = SelfState
trigger1 = animtime = 0
value = 5050

;---------------------------------------------------------------------------
; Being Thrown by Spinning Pile Drive (Going Down)
[StateDef 1321]
type    = A
movetype= H
physics = N
ctrl = 0
poweradd = 0
sprpriority = 1

[State 811, VelSet]
Type = VelSet
trigger1 = !GetHitVar(IsBound)
x = -3
y = -4.5

[State 811, 6]
Type = SelfState
trigger1 = animtime = 0
trigger2 = !GetHitVar(IsBound)
value = 5050

[State 1321, Gravity]
Type = Gravity
trigger1 = 1

[State 811, 6]
Type = ChangeState
trigger1 = animtime = 0
trigger2 = !GetHitVar(IsBound)
trigger3 = pos y >= 0
value = 822

;---------------------------------------------------------------------------
; Being Thrown by Spinning Pile Drive (Land)
[StateDef 1322]
type    = S
movetype= H
physics = N
ctrl = 0
poweradd = 0
sprpriority = 1

[State 1320, ChangeAnim2]
Type = ChangeAnim2
trigger1 = time = 0
value = 1322

[State 811, VelSet]
Type = VelSet
trigger1 = !GetHitVar(IsBound)
trigger2 = animtime = 0
x = -1.7
y = -4.5

[State 811, 6]
Type = SelfState
trigger1 = animtime = 0
trigger2 = !GetHitVar(IsBound)
value = 5050

;---------------------------------------------------------------------------
; Tenshou Kyako Start
[Statedef 1400]
type    = C
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1400 + 10 * (var(50) - 1)
poweradd = 150

[State 1400, Chain]
Type = VarSet
trigger1 = time = 0
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

[State 1400, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1100,0
channel = 0

[State 3100, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AP
time = 14

[State 1400, ChangeState]
Type = ChangeState
trigger1 = animelem = 2
value = 1410

;---------------------------------------------------------------------------
; Tenshou Kyako Cont
[Statedef 1410]
type    = A
movetype= A
physics = N
velset = var(50), ifelse(var(50) = 1, -4.1, -5.2)
ctrl = 0
poweradd = 0

[State 1400, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1400, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1400, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1400, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 2

[State 1400, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.17

[State 1400, Friction]
Type = VelMul
trigger1 = 1
x = 0.95

[State 1400, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 3
trigger2 = animelem = 6
value = 1200, 1

[State 1400, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0 

[State 1400, HitDef]
Type = HitDef
triggerall = var(47) >= 0
trigger1 = animelem = 3
trigger2 = animelem = 6
trigger3 = animelem = 9
type = HitDef
attr = A, SA
damage = Floor((4 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 9
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 24 ;+ 5 * (var(50) = 1)
ground.slidetime = 24 ;+ 5 * (var(50) = 1)
ground.velocity = -0.9407, -5.5 - 1.5 * (var(50))
guard.velocity = -3.28715
air.velocity = -0.9407, -5.5 - 1.5 * (var(50))
air.hittime = 33
air.type = High
getpower = 30, 45
givepower = 30, 45
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1400, HitDef]
Type = HitDef
triggerall = var(47) < 0
trigger1 = animelem = 3
trigger2 = animelem = 6
trigger3 = animelem = 9
type = HitDef
attr = A, SA
damage = Floor((4 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 8, 9
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 24 ;+ 5 * (var(50) = 1)
ground.slidetime = 24 ;+ 5 * (var(50) = 1)
ground.velocity = -0.9407, -5.5 - 1.5 * (var(50))
guard.velocity = -3.28715
air.velocity = -0.9407, -5.5 - 1.5 * (var(50))
air.hittime = 33
air.type = High
getpower = 30, 45
givepower = 30, 45
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1400, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1400, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -8 + 3 * (var(50) = 2)
persistent = 0
ignorehitpause = 1

[State 1400, ChangeState]
Type = ChangeState
trigger1 = animelemtime(8 + (4 * (var(50) = 2))) = 0
value = 1420

;---------------------------------------------------------------------------
;Tsu Maki Sempu Kyako Landing
[Statedef 1420]
type    = A
movetype = A
physics = N

[State 1220, Gravity]
Type = Gravity
trigger1 = 1

[State 1220, Chain]
type = VarSet
trigger1 = Time = 0
var(55) = 512

[State 1220, PosSet]
Type = PosSet
trigger1 = pos y >= 0
y = 0

[State 1220, ChangeState]
Type = ChangeState
trigger1 = pos y >= 0
value = 1430

;---------------------------------------------------------------------------
;Tsu Maki Sempu Kyako Land
[Statedef 1430]
type = S
movetype = A
physics = S
velset = 0,0
anim = 1230

[State 1230, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 64384

[State 1230, ChangeState]
Type = ChangeState
trigger1 = time = 20
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Shoulder Bash Start
[Statedef 1500]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1500
poweradd = 100

[State 1100, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 220,0
channel = 0

[State 1100, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AP
time = 10

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
trigger1 = animelemtime(2) > 6
var(55) = 63360

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

[State 1100, VelSet]
Type = VelSet
trigger1 = animelem = 2
x = 4.5 + var(50)

[State 1100, HitDef]
type = HitDef
triggerall = (Var(47) >= 1)
trigger1 = time = 0
attr = S, SA
damage = Floor((8 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = H
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 7, 8
guard.pausetime = 7, 8
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -30
hitsound = 5, 2
guardsound = 6, 0
ground.type = Low
ground.hittime = 25
ground.slidetime = 25
ground.velocity = -3.65282, 0
guard.velocity = -3.12097
air.velocity = -2.65282, -6.50000
air.hittime = 40
air.type = L
hitonce = 1
getpower = 20, 30
givepower = 20, 30
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0

[State 1100, HitDef]
type = HitDef
triggerall = (Var(47) < 1)
trigger1 = time = 0
attr = S, SA
damage = Floor((8 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = H
guardflag = M
hitflag = M
priority = 4, Hit
pausetime = 7, 10
guard.pausetime = 7, 10
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -30
hitsound = 5, 2
guardsound = 6, 0
ground.type = Low
ground.hittime = 25
ground.slidetime = 25
ground.velocity = -1.65282, 0
guard.velocity = -3.12097
air.velocity = -1.65282, -6.50000
air.hittime = 40
air.type = L
hitonce = 1
getpower = 20, 30
givepower = 20, 30
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0

[State 1100, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -2
persistent = 0
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
triggerall = movecontact
trigger1 = command = "a"
trigger2 = command = "b"
value = 1515
ignorehitpause = 1

[State 1100, ChangeState]
type = ChangeState
triggerall = movecontact
triggerall = power >= 200
trigger1 = command = "z"
trigger2 = command = "c"
value = 1600
ignorehitpause = 1

[State 1100, ChangeState]
type = ChangeState
triggerall = movecontact
trigger1 = command = "x"
trigger1 = var(50) := 1
trigger2 = command = "y"
trigger2 = var(50) := 1
value = 1800
ignorehitpause = 1

[State 1100, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger2 = movecontact = 12
value = 1510
ignorehitpause = 1

;---------------------------------------------------------------------------
;Shoulder Bash End
[Statedef 1510]
type = S
movetype = A
physics = S
velset = 0,0
anim = 1510

[State 1230, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 63360

[State 1230, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Tenshou Kyako Start
[Statedef 1515]
type    = C
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 2000

[State 2000, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 2000, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 200,0
channel = 0

[State 2000, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AP, NT

[State 2000, ChangeState]
Type = ChangeState
trigger1 = animelem = 2
value = 1520

;---------------------------------------------------------------------------
; Tenshou Kyako Cont
[Statedef 1520]
type    = A
movetype= A
physics = N
velset = 1.5, -3.9
ctrl = 0
poweradd = 0

[State 1520, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 1520, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 1520, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1520, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1520, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 2

[State 1520, NotHitBy]
Type = NotHitBy
trigger1 = vel y < 0
value = , AA, AP

[State 1520, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.21

[State 1520, Friction]
Type = VelMul
trigger1 = 1
x = 0.95

[State 1520, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 3
value = 1200, 1

[State 1520, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0 

[State 1520, HitDef]
Type = HitDef
triggerall = var(47) >= 0
trigger1 = animelem = 3
type = HitDef
attr = A, SA
damage = Floor((3) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 10
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 24 ;+ 5 * (var(50) = 1)
ground.slidetime = 24 ;+ 5 * (var(50) = 1)
ground.velocity = -0.6407, -10.5
guard.velocity = -3.28715
air.velocity = -0.6407, -10.5
air.hittime = 33
air.type = High
getpower = 0, 0
givepower = 20, 30
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1520, HitDef]
Type = HitDef
triggerall = var(47) < 0
trigger1 = animelem = 3
type = HitDef
attr = A, SA
damage = Floor((3) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 8, 10
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 24 ;+ 5 * (var(50) = 1)
ground.slidetime = 24 ;+ 5 * (var(50) = 1)
ground.velocity = -0.6407, -11
guard.velocity = -3.28715
air.velocity = -0.6407, -11
air.hittime = 33
air.type = High
getpower = 0, 0
givepower = 20, 30
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1520, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1520, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -1
persistent = 0
ignorehitpause = 1

[State 1520, ChangeState]
Type = ChangeState
trigger1 = animelem = 6
value = 1525

;---------------------------------------------------------------------------
;Tsu Maki Sempu Kyako Landing
[Statedef 1525]
type    = A
movetype = A
physics = N

[State 2010, Gravity]
Type = Gravity
trigger1 = 1

[State 2010, Chain]
type = VarSet
trigger1 = Time = 0
var(50) = 0

[State 2010, PosSet]
Type = PosSet
trigger1 = pos y >= 0
y = 0

[State 2010, ChangeState]
Type = ChangeState
trigger1 = pos y >= 0
value = 1530

;---------------------------------------------------------------------------
;Tsu Maki Sempu Kyako Land
[Statedef 1530]
type = S
movetype = A
physics = S
velset = 0,0
anim = 1230

[State 1230, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 62336

[State 1230, ChangeState]
Type = ChangeState
trigger1 = time = 10
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Spinning Pile Drive (Start)
[Statedef 1600]
Type = S
movetype = A
Physics = N
velset = 0,0
anim = 1300
ctrl = 0
poweradd = -200

[State 1300, Don't move]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 1300, Width]
Type = Width
trigger1 = 1
player = 0,0

[State 3100, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AP

[State 1300, HitDef]
Type = HitDef
trigger1 = time = 0
trigger1 = enemynear, stateno != [150, 153]
attr = S, ST
guardflag =
hitflag = M
guard.dist = -1
priority = 4, Miss
sparkno = S4000
guard.sparkno = S4000
sparkxy = -5, -50
sprpriority = 2
hitonce = 1
p2facing = 1
p2stateno = 1620
p1stateno = 1610
fall = 1
;hitsound = 5,0

[State 1300, ChangeState]
Type = ChangeState
trigger1 = MoveHit
value = 1610

[State 1300, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 1305

;---------------------------------------------------------------------------
;Spinning Pile Drive (Hit)
[Statedef 1610]
Type = S
movetype = A
velset = 0,0
Physics = N
anim = 1610
poweradd = 0

[State 1610, No Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 1610, No Juggle]
Type = VarSet
trigger1 = 1
var(47) = -1

[State 1610, PlayerPush]
Type = PlayerPush
trigger1 = 1
value = 0

[State 1610, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
value = 220, 0
channel = 0

[State 1610, TargetBind]
Type = TargetBind
trigger1 = animelemtime(2) < 0
trigger1 = animelemtime(1) >= 0
pos = 24, 0

[State 1610, StateTypeSet]
Type = StateTypeSet
trigger1 = animelemtime(2) = 0
statetype = A

[State 1610, VelSet]
Type = VelSet
trigger1 = animelemtime(2) = 0
x = 0.8
y = -5.6

[State 1610, Gravity]
Type = VelAdd
trigger1 = animelemtime(2) >= 0
y = 0.2

[State 1610, TargetBind 2]
Type = TargetBind
trigger1 = animelemtime(2) >= 0
pos = 14, -50

[State 1610, Width]
Type = Width
trigger1 = 1
edge = 20, 20

[State 1610, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 1611

;---------------------------------------------------------------------------
;Spinning Pile Drive (Spinning Down!)
[Statedef 1611]
Type = A
movetype = A
Physics = N
anim = 1611

[State 1610, Width]
Type = Width
trigger1 = 1
edge = 20, 20

[State 1611, VarSet]
Type = VarSet
trigger1 = time = 0
var(43) = 0

[State 1611, PlayerPush]
Type = PlayerPush
trigger1 = 1
value = 0

[State 1611, TargetState]
Type = TargetState
trigger1 = time = 0
value = 1621

[State 1610, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.2

[State 1611, TargetBind 1]
Type = TargetBind
trigger1 = animelemtime(1) >= 0
trigger1 = animelemtime(2) < 0
trigger2 = animelemtime(5) >= 0
trigger2 = animelemtime(6) < 0
trigger3 = animelemtime(9) >= 0
trigger3 = animelemtime(10) < 0
pos = 0, -40

[State 1611, TargetBind 2]
Type = TargetBind
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(3) < 0
trigger2 = animelemtime(6) >= 0
trigger2 = animelemtime(7) < 0
trigger3 = animelemtime(10) >= 0
trigger3 = animelemtime(11) < 0
pos = -13, -40

[State 1611, TargetBind 3]
Type = TargetBind
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(4) < 0
trigger2 = animelemtime(7) >= 0
trigger2 = animelemtime(8) < 0
trigger3 = animelemtime(11) >= 0
trigger3 = animelemtime(12) < 0
pos = 0, -40

[State 1611, TargetBind 4]
Type = TargetBind
trigger1 = animelemtime(4) >= 0
trigger1 = animelemtime(5) < 0
trigger2 = animelemtime(8) >= 0
trigger2 = animelemtime(9) < 0
trigger3 = animelemtime(12) >= 0
pos = 13, -40

[State 1611, SprPriority]
Type = SprPriority
trigger1 = animelemtime(1) >= 0
trigger1 = animelemtime(2) < 0
trigger2 = animelemtime(5) >= 0
trigger2 = animelemtime(6) < 0
trigger3 = animelemtime(9) >= 0
trigger3 = animelemtime(10) < 0
value = 0

[State 1611, SprPriority]
Type = SprPriority
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(3) < 0
trigger2 = animelemtime(6) >= 0
trigger2 = animelemtime(7) < 0
trigger3 = animelemtime(10) >= 0
trigger3 = animelemtime(11) < 0
value = 2

[State 1611, VarAdd]
Type = VarAdd
trigger1 = animelemtime(4) = 0
trigger2 = animelemtime(8) = 0
trigger3 = animelemtime(12) = 0
v = 43
value = 1

[State 1611, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 1
trigger2 = animelem = 4
trigger3 = animelem = 7
trigger4 = animelem = 10
trigger5 = animelem = 12
value = 1200, 1

[State 1611, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger2 = pos y > 0
value = 1612

;---------------------------------------------------------------------------
;Spinning Pile Drive (Landing!)
[Statedef 1612]
Type = C
movetype = A
velset = 0,0
Physics = N
anim = 1612

[State 1613, PosSet]
Type = PosSet
trigger1 = time = 0
y = 0

[State 1613, VarSet]
Type = VarSet
trigger1 = time = 0
var(43) = 0

[State 1313, TargetState]
Type = TargetState
trigger1 = time = 0
value = 1622

[State 1313, PlayerPush]
Type = PlayerPush
trigger1 = 1
value = 0

[State 1310, Width]
Type = Width
trigger1 = 1
edge = 20, 20

[State 1313, TargetBind]
Type = TargetBind
trigger1 = animelemtime(2) < 9
pos = 10, -3

[State 1313, TargetLifeAdd]
Type = TargetLifeAdd
trigger1 = time = 0
value = -Floor((17 + (Random/1000.0)* 2) * Fvar(28) + 0.5)

[State 1313, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = F5,3
channel = 2

[State 1313, EnvShake]
Type = EnvShake
trigger1 = time = 0
time = 30

[State 1313, Explod]
Type = Explod
trigger1 = time = 0
anim = F60
pos = 0, 0
pausemovetime = 4

[State 1313, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 1613

;---------------------------------------------------------------------------
; Hop back from SPD
[Statedef 1613]
type    = A
physics = A
ctrl = 0
anim = 105
sprpriority = 1

[State 105, Moveability]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 105, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 105, 1]
type = VelSet
trigger1 = Time = 0
x = -2.1
y = -3.2

[State 105, 2]
type = CtrlSet
trigger1 = Time = 2
value = 1

[State 105, 3]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 106

;---------------------------------------------------------------------------
; Being Thrown by Spinning Pile Drive (Start)
[StateDef 1620]
type    = S
movetype= H
physics = N
ctrl = 0
poweradd = 0
sprpriority = 1

[State 1320, ChangeAnim2]
Type = ChangeAnim2
trigger1 = time = 0
value = 1620

[State 811, VelSet]
Type = VelSet
trigger1 = !GetHitVar(IsBound)
x = -3
y = -4.5

[State 811, 6]
Type = SelfState
trigger1 = animtime = 0
trigger2 = !GetHitVar(IsBound)
value = 5050

;---------------------------------------------------------------------------
; Being Thrown by Spinning Pile Drive (Going Down)
[StateDef 1621]
type    = S
movetype= H
physics = N
ctrl = 0
poweradd = 0
sprpriority = 1

[State 1620, ChangeAnim2]
Type = ChangeAnim2
trigger1 = time = 0
value = 1621

[State 811, VelSet]
Type = VelSet
trigger1 = !GetHitVar(IsBound)
x = -3
y = -4.5

[State 811, 6]
Type = SelfState
trigger1 = animtime = 0
trigger2 = !GetHitVar(IsBound)
value = 5050

;---------------------------------------------------------------------------
; Being Thrown by Spinning Pile Drive (Land)
[StateDef 1622]
type    = S
movetype= H
physics = N
ctrl = 0
poweradd = 0
sprpriority = 1

[State 1320, ChangeAnim2]
Type = ChangeAnim2
trigger1 = time = 0
value = 1622

[State 811, VelSet]
Type = VelSet
trigger1 = !GetHitVar(IsBound)
trigger2 = animtime = 0
x = -1.7
y = -4.5

[State 811, 6]
Type = SelfState
trigger1 = animtime = 0
trigger2 = !GetHitVar(IsBound)
value = 5050

;---------------------------------------------------------------------------
;Air Kick Start
[Statedef 1700]
type    = A
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1700
poweradd = 100

[State 1200, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 210,0
channel = 0

[State 1200, Chain Flag]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 1200, Chain Flag]
Type = VarSet
trigger1 = animelemtime(2) = 0
var(55) = 37376

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
trigger1 = animelemtime(2) = 0
x = 4.5 + var(50)
y = -1

[State 1200, VelAdd]
Type = VelAdd
trigger1 = animelemtime(2) >= 0
y = 0.20

[State 1100, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = time = 0
attr = S, SA
damage = Floor((7 + 2 * var(50) + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = L
guardflag = M
hitflag = MAF
priority = 2, Hit
pausetime = 7, 12
guard.pausetime = 7,16
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -30
hitsound = 5, 2
guardsound = 6, 0
ground.type = Low
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -1.65282, -6
guard.velocity = -3.12097
air.velocity = -1.65282, -7.50000
air.hittime = 40
air.type = L
hitonce = 1
getpower = 30, 45
givepower = 30, 45
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1100, HitDef]
type = HitDef
triggerall = (Var(47) < 0)
trigger1 = time = 0
attr = A, SA
damage = Floor((7 + 2 * var(50) + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = L
guardflag = M
hitflag = M
priority = 2, Hit
pausetime = 7, 16
guard.pausetime = 7,16
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -30
hitsound = 5, 2
guardsound = 6, 0
ground.type = Low
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -1.65282, -6
guard.velocity = -3.12097
air.velocity = -1.65282, -7.50000
air.hittime = 40
air.type = L
hitonce = 1
getpower = 30, 45
givepower = 30, 45
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1100, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -2
persistent = 0
ignorehitpause = 1

[State 1100, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1700, ChangeState]
Type = ChangeState
trigger1 = time = 5 + 5 * (var(50))
value = 1705

;---------------------------------------------------------------------------
;Tsu Maki Sempu Kyako Landing
[Statedef 1705]
type    = A
movetype = A
physics = N
anim = 1201
x = vel x / 2.0

[State 2010, Gravity]
Type = Gravity
trigger1 = 1

[State 2010, Chain]
type = VarSet
trigger1 = Time = 0
var(50) = 0

[State 2010, PosSet]
Type = PosSet
trigger1 = pos y >= 0
y = 0

[State 2010, ChangeState]
Type = ChangeState
trigger1 = pos y >= 0
value = 1530

;---------------------------------------------------------------------------
;Palm strike
[Statedef 1800]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1800 + 10 * (var(50) = 2)
poweradd = 100

[State 1100, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 220,0
channel = 0

[State 1100, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AP, NT
time = 5

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
var(55) = 65280

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
attr = S, SP
damage = Floor((7 + 4 * (var(50) = 2) + 3 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 12
guard.pausetime = 10,16
sparkno = 2
guard.sparkno = 0
sparkxy = -10, -32
hitsound = 5, 2
guardsound = 6, 0
id = 1100
nochainid = 1100
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -3.25282, -4.5
guard.velocity = -7.12097
air.velocity = -5.25282, -6.50000
air.hittime = 40
air.type = High
getpower = 60, 90
givepower = 60, 90
fall = 1
air.fall = 1
envshake.time = 12
p2stateno = ifelse(var(50) = 2, 1815, -1)
p2getp1state = ifelse(var(50) = 2, 1, 0)

[State 1100, HitDef]
type = HitDef
triggerall = (Var(47) < 0)
trigger1 = !movecontact
attr = S, SP
damage = Floor((7 + 4 * (var(50) = 2) + 3 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
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
sparkxy = -10, -32
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -3.25282, -4.5
guard.velocity = -7.12097
air.velocity = -5.25282, -6.50000
air.hittime = 40
air.type = High
getpower = 60, 90
givepower = 60, 90
fall = 1
air.fall = 1
envshake.time = 12
p2stateno = ifelse(var(50) = 2, 1815, -1)
p2getp1state = ifelse(var(50) = 2, 1, 0)

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
;Hit by EX JOUDAN-SOKUTOU-GERI
[Statedef 1815]
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
value = 1816

;---------------------------------------------------------------------------
;Hit by EX JOUDAN-SOKUTOU-GERI
[Statedef 1816]
type    = A
movetype= H
physics = N

[State 1616, Velocity]
type = HitVelSet
trigger1 = Time = 0
x = 8
y = -7

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
value = 1817

[State 1616, Hit ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 822

;------------------
; Hit by Fast Kung Fu Palm - hit wall
; (a custom gethit state)
[Statedef 1817]
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
value = 1818

;------------------
; Hit by Fast Kung Fu Palm - bounce off wall
; (a custom gethit state)
[Statedef 1818]
type    = A
movetype= H
physics = N

[State 1618, Vel Y]
type = VelSet
trigger1 = Time = 0
y = -6

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
;Kikoushou
[StateDef 3000]
Type = S
movetype = A
Physics = S
ctrl = 0
anim = 3000
velset = 0,0

[State 3000, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 3000,0
channel = 0

[State 3000, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
value = 3000,1
channel = 0
ignorehitpause = 1

[State 3000, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 3000, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AA, AP
time = 15

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
trigger2 = animelemtime(4) = 3
var(55) = 0

[State 3000, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) = 20
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
pos = -7, -38
movetime = 4
sound = 20, 0
p2defmul = 1

[State 3000, Projectile]
Type = Helper
trigger1 = animelem = 3,1
name = "Kikoushou"
id = 3000
pos = 40,-34
StateNo = 3001
ownpal = 1

[State 3000, ChangeAnim]
Type = ChangeAnim
trigger1 = NumHelper(3000) = 1
trigger1 = helper(3000), stateno = 3002
trigger1 = helper(3000), time = 5
value = 3000
elem = 4
persistent = 0

[State 3000, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Kikoushou Fireball
[Statedef 3001]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3010
SprPriority = 5

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
trigger1 = var(1) = 0
trigger2 = parent, Fvar(28) < Fvar(28)
fvar(28) = Parent, fvar(28)

[State 3001, Counter Flag Reset]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(1) > 0
v = 2
value = 1

[State 3002, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3001, HitOverride]
Type = HitOverride
trigger1 = 1
attr = SCA, AP
stateno = 3001
ignorehitpause = 1

[State 3001, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AT

[State 3001, PosFreeze]
Type = PosFreeze
trigger1 = movecontact % 2

;HitDef
[State 3001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) >= 0)
trigger1 = (var(1) % 3) = 0
attr = S, HP
damage = Floor((2 + (Random/1000.0)) *  fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 6
guard.pausetime = 2,6
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -1.97923, -6.50000
air.velocity = -1.97923, -6.5
guard.velocity = -4.68145
id = 3000
air.hittime = 50
air.type = High
getpower = 0,0
givepower = 10, 15
fall = 1
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
sprpriority = 5

;HitDef
[State 3001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) < 0)
trigger1 = (var(1) % 3) = 0
attr = S, HP
damage = Floor((2 + (Random/1000.0)) *  fvar(28) + 0.5), Floor(fvar(28) + 0.5)
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
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -1.97923, -6.50000
air.velocity = -1.97923, -6.5
guard.velocity = -4.68145
id = 3000
air.hittime = 50
air.type = High
getpower = 0,0
givepower = 10, 15
fall = 1
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
sprpriority = 5

[State 3001, Juggle]
Type = ParentVarSet
triggerall = NumTarget > 0
trigger1 = Target, stateno = 5020
trigger1 = Target, Time = 0
v = 47
value = 0
ignorehitpause = 1
persistent = 0

[State 3001, Juggle]
Type = ParentVarSet
triggerall = NumTarget > 0
trigger1 = !Target, Alive
var(2) = 1
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
v = 2
value = 1
ignorehitpause = 1

[State 3001, ChangeState]
Type = ChangeState
trigger1 = animelem = 23
trigger2 = frontedgedist < -50
trigger3 = parent, stateno != 3000
value = 3002
ignorehitpause = 1

[State 3301, VarAdd]
type = VarAdd
trigger1 = 1
v = 1
value = 1
ignorehitpause = 1

;---------------------------------------------------------------------------
; Kikoushou Fireball End
[Statedef 3002]
type    = S
movetype= A
physics = N
velset = 0,0
anim = 3011
ctrl = 0
SprPriority = 3

[State 3002, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3001, Juggle]
Type = ParentVarSet
triggerall = NumTarget > 0
trigger1 = !Target, Alive
var(2) = 1
ignorehitpause = 1
persistent = 0

[State 3001, Juggle]
Type = ParentVarSet
trigger1 = time = 15
var(2) = 0
ignorehitpause = 1
persistent = 0

[State 3002, DestroySelf]
Type = DestroySelf
trigger1 = animtime = 0

;---------------------------------------------------------------------------
;Senretsu Kyaku
[StateDef 3100]
Type = S
movetype = A
Physics = N
ctrl = 0
anim = 3100
velset = 0,0

[State 3100, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 3000,0
channel = 0

[State 3100, PowerAdd]
Type = PowerAdd
trigger1 = time = 0
value = -1000

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
pos = 13, -25
movetime = 9
sound = 20, 0
p2defmul = 1

[State 3100, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AA, AP
time = 40

[State 3100, VelSet]
Type = VelSet
trigger1 = animelem = 2
x = 3.5

[State 3100, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = time = 0
attr = S, HA
damage = Floor((5 + (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = L
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 12
guard.pausetime = 6,16
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -30
hitsound = 5, 2
guardsound = 6, 0
ground.type = Low
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -.65282, -4 * (var(49) = 0)
guard.velocity = -3.12097
air.velocity = -.65282, -6.50000
air.hittime = 40
air.type = L
hitonce = 1
getpower = 0, 0
givepower = 20, 30
fall = (var(49) = 0)
air.fall = 1
ground.cornerpush.veloff = 0

[State 1100, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -2
persistent = 0
ignorehitpause = 1

[State 3100, ChangeState]
Type = ChangeState
triggerall = var(43) := 8
trigger1 = animtime = 0
trigger2 = MoveContact > 3
trigger2 = P2BodyDist X < 8
value = 3101

;---------------------------------------------------------------------------
;Senretsu Kyaku Cont
[Statedef 3101]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 3110

[State 3101, PlaySnd]
Type = PlaySnd
trigger1 = var(43) = 6
trigger1 = time = 0
value = 3200, 0
channel = 0

[State 3101, Chain Flag]
Type = VarSet
trigger1 = time = 0
var(55) = 0

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

[State 3101, Chain Flag]
Type = VarSet
trigger1 = var(43) = 1
var(55) = 24576

[State 3101, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = !(movecontact % 3)
attr = S, HA
damage = Floor(fvar(28) * (ifelse(var(43) % 2, 1.8, 1)) + 0.5), Floor(0.5 * fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 3, 8
guard.pausetime = 3,8
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -30 -(ifelse(animelemtime(1) >= 0 && animelemtime(2) < 0, -20, ifelse(animelemtime(3) >= 0 && animelemtime(4) < 0, 20, 0)))
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -0.76312, 0.00000
air.velocity = -0.64866, -3.50000
air.hittime = 50
air.type = High
hitonce = 1
getpower = 0,0
givepower = 10, 15
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0

[State 3101, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -1
persistent = 0
ignorehitpause = 1

[State 3101, Dec]
Type = VarAdd
trigger1 = animtime = 0
var(43) = -1

[State 3101, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3101 + 4 * (var(43) = 4)

;---------------------------------------------------------------------------
; Senretsu Kyaku Cont
[Statedef 3105]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 3111
poweradd = 0

[State 3105, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3105, PosAdd]
Type = PosAdd
trigger1 = time = 0
x = 5

[State 3105, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 3110

;---------------------------------------------------------------------------
;Senretsu Kyaku Cont
[Statedef 3110]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 3120

[State 3101, Chain Flag]
Type = VarSet
trigger1 = var(43) = 1
var(55) = 24576

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

[State 3101, Chain Flag]
Type = VarSet
trigger1 = var(43) <= 2
var(55) = 24576

[State 3101, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = !(movecontact % 3)
attr = S, HA
damage = Floor(fvar(28) * (ifelse(var(43) % 2, 1.8, 1)) + 0.5), Floor(0.5 * fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 6
guard.pausetime = 4,6
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -30 -(ifelse(animelemtime(3) >= 0 && animelemtime(4) < 0, -20, ifelse(animelemtime(1) >= 0 && animelemtime(2) < 0, 20, 0)))
hitsound = 5, 2
guardsound = 6, 0
ground.type = L
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -0.65282 - 2 * (var(43) = 1), -4 * (var(43) = 1)
guard.velocity = -0.52097
air.velocity = -2.65282, -3.500000
air.hittime = 30
air.type = High
getpower = 0, 0
givepower = 10, 15
fall = (var(43) = 1)
air.fall = 1
ground.cornerpush.veloff = -3.5 * (var(43) = 1)

[State 3101, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -1
persistent = 0
ignorehitpause = 1

[State 3101, Dec]
Type = VarAdd
trigger1 = animtime = 0
var(43) = -1

[State 3101, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3110 + 10 * (var(43) = 0)

;---------------------------------------------------------------------------
;Senretsu Kyaku
[Statedef 3120]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 3111

[State 3101, Chain Flag]
Type = VarSet
trigger1 = time = 3
var(55) = 0

[State 3101, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3130, ChangeState]
Type = ChangeState
trigger1 = time = 15
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Air Senretsu Kyaku
[StateDef 3150]
Type = A
movetype = A
Physics = N
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
value = -1000

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
pos = 13, -25
movetime = 1
sound = 20, 0
p2defmul = 1

[State 3100, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AA, AP
time = 40

[State 3100, VelSet]
Type = VelSet
trigger1 = time = 1
x = 3.5

[State 3150, ChangeState]
Type = ChangeState
triggerall = time >= 2
triggerall = P2BodyDist X < 15
trigger1 = P2Dist Y = [-20,20]
trigger2 = Enemynear, Pos Y = 0
trigger2 = P2Dist Y = [-15, 70]
value = 3145 + (var(43) := 6)

[State 3100, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 3160

;---------------------------------------------------------------------------
;Senretsu Kyaku Cont
[Statedef 3151]
type    = A
movetype= A
physics = S
velset = 0,0
anim = 3151
ctrl = 0

[State 3101, PlaySnd]
Type = PlaySnd
trigger1 = var(43) = 16
trigger1 = time = 0
value = 3200, 0
channel = 0

[State 3101, Chain Flag]
Type = VarSet
trigger1 = time = 0
var(55) = 0

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

[State 3101, HitDef]
type = HitDef
triggerall = (Var(47) >= 0)
trigger1 = !(movecontact % 4)
attr = S, HA
damage = Floor(fvar(28) * (ifelse(var(43) % 2, 1.2, 1)) + 0.5), Floor(0.5 * fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 3, 16
guard.pausetime = 3, 16
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -30 -(ifelse(animelemtime(1) >= 0 && animelemtime(2) < 0, -20, ifelse(animelemtime(3) >= 0 && animelemtime(4) < 0, 20, 0)))
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -0.76312, -3.50000
air.velocity = -0.64866, -3.50000
air.hittime = 50
air.type = High
hitonce = 1
getpower = 0,0
givepower = 10, 15
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 3101, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -1
persistent = 0
ignorehitpause = 1

[State 3101, Dec]
Type = VarAdd
trigger1 = animtime = 0
var(43) = -1

[State 3101, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) > 0
value = 3151

[State 3101, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) = 0
value = 3152

;---------------------------------------------------------------------------
; Strong Kick
[Statedef 3152]
type    = A
movetype= A
physics = A
juggle = 0
ctrl = 0
anim = 630

[State 630, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 3101, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 630, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 1

[State 630, HitDef]
type = HitDef
trigger1 = time = 0
trigger1 = Var(47) >= 0
attr = A, HA
damage = Floor((2 + (Random/1000.0)) * Fvar(28) + 0.5), 0
animtype = Hard
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = 10, 12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -37
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -.707348, -6.00000
guard.velocity = -3.61586
air.velocity = -.77348, -6.50000
fall = 1
air.hittime = 30
air.type = High
air.juggle = 15
hitonce = 1
getpower = 0, 0
givepower = 50, 75

[State 630, HitDef]
type = HitDef
trigger1 = time = 0
trigger1 = Var(47) < 0
attr = A, HA
damage = Floor((5 + (Random/1000.0)* 2) * Fvar(28) + 0.5), 0
animtype = Hard
guardflag = H
hitflag = MA
priority = 4, Hit
pausetime = 10, 12
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -37
hitsound = 5, 1
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -.707348, -6.00000
guard.velocity = -3.61586
air.velocity = -.77348, -6.50000
fall = 1
air.hittime = 30
air.type = High
air.juggle = 15
hitonce = 1
getpower = 0, 0
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

[State 3152, ChangeState]
Type = ChangeState
trigger1 = animelem = 3
value = 3160

;---------------------------------------------------------------------------
;Tsu Maki Sempu Kyako Landing
[Statedef 3160]
type    = A
movetype = A
physics = N
anim = 3320

[State 1220, Gravity]
Type = Gravity
trigger1 = 1

[State 3001, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

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
value = 3230

;---------------------------------------------------------------------------
;Hazan Tenchou Kyako
[StateDef 3200]
Type = S
movetype = A
Physics = S
ctrl = 0
anim = 3200
velset = 0,0

[State 3000, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 3300,0
channel = 0

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

[State 3100, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AA, AP
time = 20

[State 3000, SuperPause]
Type = SuperPause
trigger1 = time = 0
time = 40
anim = 100
pos = 7, -28
movetime = 4
sound = 20, 0
p2defmul = 1

[State 3200, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 3210

;---------------------------------------------------------------------------
;Hazan Tenshou Kyako Cont
[Statedef 3210]
type    = A
movetype= A
physics = N
velset = 3.2, -6.7
ctrl = 0
anim = 3210
juggle = 0
poweradd = 0

[State 3001, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3210, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 3100, 0
channel = 0

[State 1400, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 1400, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 1400, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 1400, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 1400, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.22

[State 1400, Friction]
Type = VelMul
trigger1 = 1
x = 0.95

[State 1400, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 5
trigger3 = animelem = 8
trigger4 = animelem = 11
trigger5 = animelem = 15
trigger6 = animelem = 18
value = 1200, 1

[State 1400, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0 

[State 1400, HitDef]
Type = HitDef
triggerall = var(47) >= 0
trigger1 = animelem = 2
trigger2 = animelem = 5
trigger3 = animelem = 8
trigger4 = animelem = 11
trigger5 = animelem = 15
trigger6 = animelem = 18
type = HitDef
attr = A, SA
damage = Floor((5 + 2 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 24 ;+ 5 * (var(50) = 1)
ground.slidetime = 24 ;+ 5 * (var(50) = 1)
ground.velocity = -0.9407, -8.0
guard.velocity = -3.28715
air.velocity = -0.9407, -8
air.hittime = 33
air.type = High
getpower = 0, 0
givepower = 20, 30
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1400, HitDef]
Type = HitDef
triggerall = var(47) < 0
trigger1 = animelem = 2
trigger2 = animelem = 5
trigger3 = animelem = 8
trigger4 = animelem = 11
trigger5 = animelem = 15
trigger6 = animelem = 18
type = HitDef
attr = A, SA
damage = Floor((5 + 2 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 8, 8
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 24 ;+ 5 * (var(50) = 1)
ground.slidetime = 24 ;+ 5 * (var(50) = 1)
ground.velocity = -0.9407, -8.0
guard.velocity = -3.28715
air.velocity = -0.9407, -8
air.hittime = 33
air.type = High
getpower = 0, 0
givepower = 20, 30
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 1400, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 1400, Juggle]
Type = VarSet
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = 0
persistent = 0
ignorehitpause = 1

[State 1400, ChangeState]
Type = ChangeState
trigger1 = animelem = 19
value = 3220

;---------------------------------------------------------------------------
;Tsu Maki Sempu Kyako Landing
[Statedef 3220]
type    = A
movetype = A
physics = N

[State 1220, Gravity]
Type = Gravity
trigger1 = 1

[State 3001, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

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
value = 3230

;---------------------------------------------------------------------------
;Tsu Maki Sempu Kyako Land
[Statedef 3230]
type = S
movetype = A
physics = S
velset = 0,0
anim = 1230

[State 1230, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 45056

[State 3001, AfterImagetime]
Type = AfterImageTime
trigger1 = time < 15
trigger1 = time % 2
time = 3

[State 1230, ChangeState]
Type = ChangeState
trigger1 = time = 25
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Lightning Ciclone Kick
[StateDef 3300]
Type = S
movetype = A
Physics = S
ctrl = 0
anim = 3300
velset = 0,0

[State 3200, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 3000,0
channel = 0

[State 3200, PowerAdd]
Type = PowerAdd
trigger1 = time = 0
value = -3000

[State 3200, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 3300, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AA, AP
time = 25

[State 3200, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 3300, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(51) < 5
v = 51
value = 5
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
time = 42
anim = 100
pos = 8, -25
movetime = 9
sound = 20, 0
p2defmul = 1

[State 3200, ChangeState]
Type = ChangeState
trigger1 = animelemtime(2) = 0
trigger1 = var(43) := 30
value = 3301

;---------------------------------------------------------------------------
;Lightning Ciclone Kick Jump
[StateDef 3301]
Type = A
movetype = A
Physics = N
ctrl = 0

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
x = 0
y = -0.3

[State 3200, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.003

[State 3201, ChangeState 3]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := 15
value = 3302

;---------------------------------------------------------------------------
;Lightning Ciclone Kick around
[Statedef 3302]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 3310
poweradd = 0

[State 3302, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3302, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1200, 1

[State 3302, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0 

[State 3302, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.003 ;- 0.03 * (var(50) = 2)

[State 3302, Width]
Type = Width
trigger1 = 1
player = 0,0

[State 3302, HitDef]
Type = HitDef
triggerall = var(47) >= 0
trigger1 = !(movecontact % 4)
type = HitDef
attr = A, HA
damage = Floor((2 + (var(43) % 2 = 0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 6
air.pausetime = 2, 6
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = 0.5 + (2 * hitcount = 0), -2.0
guard.velocity = 0.5
air.velocity = -0.19407, -1.50000
air.hittime = 30
air.type = High
getpower = 0, 0
givepower = 10, 15
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 3302, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 3302, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -1
persistent = 0
ignorehitpause = 1

[State 3302, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) := var(43) -1
value = 3302

[State 3202, ChangeState]
Type = ChangeState
trigger1 = var(43) = 0
trigger1 = animtime = 0
value = 3303

;---------------------------------------------------------------------------
;Shinku Tsu Maki Sempu Kyako Whirl around
[Statedef 3303]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 3310
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
y = 0.01 ;- 0.03 * (var(50) = 2)

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
damage = Floor((19 + 3 * (Random/1000.0)) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
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
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -2.28715, -6.5
guard.velocity = -3.78715
air.velocity = -2.59407, -6.0000
air.hittime = 30
air.type = High
getpower = 0, 0
givepower = 10, 15
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
value = 3304

;---------------------------------------------------------------------------
;Shinkuu Tsu Maki Sempu Kyako Landing
[Statedef 3304]
type    = A
movetype = A
physics = N
anim = 3320

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
value = 3305

;---------------------------------------------------------------------------
;Shinkuu Tsu Maki Sempu Kyako Land
[Statedef 3305]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3330

[State 3300, AfterImagetime]
Type = AfterImageTime
trigger1 = time = 0
time = 2

[State 3305, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 3305, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Air Lightning Ciclone Kick
[StateDef 3350]
Type = S
movetype = A
Physics = S
ctrl = 0
anim = 3350
velset = 0,0

[State 3200, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 3000,0
channel = 0

[State 3200, PowerAdd]
Type = PowerAdd
trigger1 = time = 0
value = -3000

[State 3200, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 3300, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AA, AP
time = 25

[State 3200, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 3300, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(51) < 5
v = 51
value = 5
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
time = 42
anim = 100
pos = 8, -25
movetime = 14
sound = 20, 0
p2defmul = 1

[State 3200, ChangeState]
Type = ChangeState
trigger1 = animelemtime(2) = 0
trigger1 = var(43) := 30
value = 3301

;---------------------------------------------------------------------------
;Kikoushou
[StateDef 3400]
Type = S
movetype = A
Physics = S
ctrl = 0
anim = 3000
velset = 0,0

[State 3000, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 3000,0
channel = 0

[State 3000, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
value = 3000,1
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
trigger2 = animelemtime(4) = 3
var(55) = 0

[State 3000, Chain Flag]
Type = VarSet
trigger1 = animelemtime(3) = 48
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

[State 3000, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AA, AP
time = 15

[State 3000, SuperPause]
Type = SuperPause
trigger1 = time = 0
time = 40
anim = 100
pos = -7, -38
movetime = 4
sound = 20, 0
p2defmul = 1

[State 3000, Projectile]
Type = Helper
trigger1 = animelem = 3,1
name = "Kikoushou"
id = 3000
pos = 21,-30
StateNo = 3401
ownpal = 1

[State 3000, ChangeAnim]
Type = ChangeAnim
trigger1 = NumHelper(3000) = 1
trigger1 = helper(3000), stateno = 3402
value = 3000
elem = 4
persistent = 0

[State 3000, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Kikoushou Fireball
[Statedef 3401]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3410
SprPriority = 5

[State 3001, PlaySnd]
Type = PlaySnd
trigger1 = var(1) = 0
value = 3000, 2
channel = 0

[State 3001, Var(50)]
type = VarSet
trigger1 = var(1) = 0
var(50) = Parent, var(50)

[State 3001, fvar(28)]
Type = VarSet
trigger1 = var(1) = 0
trigger2 = parent, Fvar(28) < Fvar(28)
fvar(28) = Parent, fvar(28)

[State 3001, Counter Flag Reset]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(1) > 0
v = 2
value = 1

[State 3002, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3001, HitOverride]
Type = HitOverride
trigger1 = 1
attr = SCA, AP
stateno = 3401
ignorehitpause = 1

[State 3001, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AT

[State 3001, PosFreeze]
Type = PosFreeze
trigger1 = movecontact % 2

;HitDef
[State 3001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) >= -1)
trigger1 = (var(1) % 3) = 0
attr = S, HP
damage = Floor(ifelse(var(2) = 0, 8, 2 - (var(2) % 2))* fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = M
hitflag = MAFD
priority = 4, Hit
pausetime = 2, 6
guard.pausetime = 2,6
sparkno = 2
guard.sparkno = 0
sparkxy = -5, 0
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -3.97923, ifelse(var(1) <= 48, 0.00000, -6.50000)
air.velocity = -1.97923, ifelse(var(1) <= 48, -2.00000, -6.50000)
guard.velocity = -4.68145
id = 3000
air.hittime = 50
air.type = High
getpower = 0,0
givepower = 10, 15
fall = (var(1) > 48)
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
sprpriority = 5

;HitDef
[State 3001, HitDef]
type = HitDef
triggerall = (Parent, Var(47) < -1)
trigger1 = (var(1) % 3) = 0
attr = S, HP
damage = Floor(ifelse(var(2) = 0, 8, 2 - (var(2) % 2))* fvar(28) + 0.5), Floor(fvar(28) + 0.5)
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
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -1.97923, ifelse(var(1) <= 48, 0.00000, -6.50000)
air.velocity = -1.97923, ifelse(var(1) <= 48, -2.00000, -6.50000)
guard.velocity = -4.68145
id = 3000
air.hittime = 50
air.type = High
getpower = 0,0
givepower = 10, 15
fall = (var(1) >= 48)
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
sprpriority = 5

[State 3001, Juggle]
Type = ParentVarSet
trigger1 = movehit = 0
v = 47
value = -1
ignorehitpause = 1
persistent = 0

[State 3001, Juggle]
Type = ParentVarSet
triggerall = NumTarget > 0
trigger1 = !Target, Alive
var(2) = 1
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
v = 2
value = 1
ignorehitpause = 1

[State 3001, ChangeAnim]
Type = ChangeAnim
trigger1 = Parent, StateNo != 3400
value = 3410
elem = 27

[State 3401, ChangeState]
Type = ChangeState
trigger1 = animelem = 27
trigger2 = frontedgedist < -50
value = 3402
ignorehitpause = 1

[State 3301, VarAdd]
type = VarAdd
trigger1 = 1
v = 1
value = 1
ignorehitpause = 1

;---------------------------------------------------------------------------
; Kikoushou Fireball End
[Statedef 3402]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
SprPriority = 3

[State 3002, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3001, Juggle]
Type = ParentVarSet
triggerall = NumTarget > 0
trigger1 = !Target, Alive
var(2) = 1
ignorehitpause = 1
persistent = 0

[State 3001, Juggle]
Type = ParentVarSet
trigger1 = time = 15
var(2) = 0
ignorehitpause = 1
persistent = 0

[State 3002, DestroySelf]
Type = DestroySelf
trigger1 = time = 15


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

;---------------------------------------------------------------------------
; Tenshou Kyako Start
[Statedef 2000]
type    = C
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 2000
poweradd = -250

[State 2000, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0

[State 2000, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 1100,0
channel = 0

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

[State 2000, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AP

[State 2000, ChangeState]
Type = ChangeState
trigger1 = animelem = 2
value = 2005

;---------------------------------------------------------------------------
; Tenshou Kyako Cont
[Statedef 2005]
type    = A
movetype= A
physics = N
velset = 1.5, -3.9
ctrl = 0
poweradd = 0

[State 2005, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 2005, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 2005, Special Cancel Flag]
Type = VarSet
trigger1 = time = 0
trigger1 = var(54) >= 2
var(45) = 10

[State 2005, Special Cancel Limiter]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >= 2
v = 49
value = -1

[State 2005, DamageDampner]
Type = VarAdd
trigger1 = time = 0
trigger1 = var(54) >=2
v = 51
value = 2 + Floor(4.0/ifelse(var(49) > 0, var(49), 1) + 0.5)
ignorehitpause = 1
persistent = 0

[State 2005, MoveType]
Type = VarSet
trigger1 = 1
var(54) = 4

[State 2005, NotHitBy]
Type = NotHitBy
trigger1 = vel y < 0
value = , AA, AP

[State 2005, Gravity]
Type = VelAdd
trigger1 = 1
y = 0.17

[State 2005, Friction]
Type = VelMul
trigger1 = 1
x = 0.95

[State 2005, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 3
value = 1200, 1

[State 2005, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 0 

[State 2005, HitDef]
Type = HitDef
triggerall = var(47) >= 0
trigger1 = animelem = 3
type = HitDef
attr = A, ST
damage = Floor((3) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = 
hitflag = MAF
priority = 4, Hit
pausetime = 8, 9
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 24 ;+ 5 * (var(50) = 1)
ground.slidetime = 24 ;+ 5 * (var(50) = 1)
ground.velocity = -0.9407, -7.5
guard.velocity = -3.28715
air.velocity = -0.9407, -7.5
air.hittime = 33
air.type = High
getpower = 0, 0
givepower = 20, 30
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 2005, HitDef]
Type = HitDef
triggerall = var(47) < 0
trigger1 = animelem = 3
type = HitDef
attr = A, ST
damage = Floor((0) * fvar(28) + 0.5), Floor(fvar(28) + 0.5)
animtype = Heavy
guardflag = 
hitflag = MA
priority = 4, Hit
pausetime = 8, 9
sparkno = 2
guard.sparkno = 0
sparkxy = -5, -40
hitsound = 5, 2
guardsound = 6, 0
ground.type = High
ground.hittime = 24 ;+ 5 * (var(50) = 1)
ground.slidetime = 24 ;+ 5 * (var(50) = 1)
ground.velocity = -0.9407, -7.5
guard.velocity = -3.28715
air.velocity = -0.9407, -7.5
air.hittime = 33
air.type = High
getpower = 0, 0
givepower = 20, 30
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0

[State 2005, DamageDampner]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
v = 51
value = 1
ignorehitpause = 1
persistent = 0

[State 2005, Juggle]
Type = VarAdd
trigger1 = NumTarget > 0
trigger1 = MoveHit
trigger1 = Target, StateType = A
v = 47
value = -5
persistent = 0
ignorehitpause = 1

[State 2005, ChangeState]
Type = ChangeState
trigger1 = animelem = 6
value = 2010

;---------------------------------------------------------------------------
;Tsu Maki Sempu Kyako Landing
[Statedef 2010]
type    = A
movetype = A
physics = N

[State 2010, Gravity]
Type = Gravity
trigger1 = 1

[State 2010, Chain]
type = VarSet
trigger1 = Time = 0
var(50) = 0

[State 2010, PosSet]
Type = PosSet
trigger1 = pos y >= 0
y = 0

[State 2005, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 2010, ChangeState]
Type = ChangeState
trigger1 = pos y >= 0
value = 2015

;---------------------------------------------------------------------------
;Tsu Maki Sempu Kyako Land
[Statedef 2015]
type = S
movetype = A
physics = S
velset = 0,0
anim = 1230

[State 2005, AfterImagetime]
Type = AfterImageTime
trigger1 = time < 4
time = 3

[State 1230, Chain]
Type = VarSet
trigger1 = time = 0
var(55) = 62336

[State 1230, ChangeState]
Type = ChangeState
trigger1 = time = 10
value = 0
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
value = , AA, AP
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
trigger1 = animelem = 3
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
trigger1 = animelem = 3
value = 2101