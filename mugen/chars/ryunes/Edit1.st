
;---------------------------------------------------------------------------
;Jigoku Gokuraku Otoshi
[StateDef 3300]
Type = S
movetype = A
Physics = S
ctrl = 0
anim = 3400
velset = 0,0

[State 3300, PlaySnd]
Type = PlaySnd
trigger1 = time = 0
value = 3300,0
channel = 0

[State 3300, After Image]
Type = AfterImage
trigger1 = time = 0
time = 2
length = 9
timegap = 3
trans = add

[State 3300, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3300, PowerAdd]
Type = PowerAdd
trigger1 = time = 0
value = -3000

[State 3300, VarSet]
Type = VarSet
trigger1 = time = 0
var(43) = 0

[State 3300, Special Cancel Flag]
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

[State 3300, Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 3300, MoveType]
Type = VarSet
trigger1 = time = 0
var(54) = 3

[State 3300, SuperPause]
Type = SuperPause
trigger1 = time = 0
time = 30
anim = 100
pos = 2, -48
movetime = 2
sound = 20, 0
p2defmul = 1

[State 3300, NotHitBy]
Type = NotHitBy
trigger1 = time = 0
value = , AA, AP
time = 40

[State 800, HitDef]
Type = HitDef
trigger1 = p2stateno != [130,160]
trigger1 = animelem = 4
attr = S, HT
guardflag = 
hitflag = MAF
guard.dist = -1
priority = 7, Miss
sparkno = S4000
guard.sparkno = S4000
sparkxy = -5, -41
sprpriority = 2
hitonce = 1
p2facing = 1
p2stateno = 3350
p1stateno = 3310
fall = 1
;hitsound = 5,0

[State 3300, I miss]
Type = ChangeState
trigger1 = animtime = 0
value = 830

;---------------------------------------------------------------------------
;Jigoku Gokuraku Otoshi Hit
[Statedef 3310]
type    = A
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3410
poweradd = 0

[State 3001, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3001, AfterImagetime]
Type = AfterImageTime
trigger1 = animtime = 0
time = 1

[State 3310, Number of kneebashes]
Type = VarSet
trigger1 = var(43) = 0
var(43) = 8

[State 3310, TargetState]
Type = TargetState
trigger1 = animelemtime(1) = 0
value = 3350

[State 3310, No Chain Flag]
Type = VarSet
trigger1 = 1
var(55) = 0

[State 3310, PlayerPush]
Type = PlayerPush
trigger1 = 1
value = 0

[State 3310, PosAdd]
Type = Width
trigger1 = 1
edge = 30,30

[State 3310, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
trigger1 = var(43) % 3 = 0
value = 220, 0
channel = 0

[State 3310, TargetBind]
Type = TargetBind
trigger1 = 1
pos = 23, 0

[State 3310, That Hurts]
type = TargetLifeAdd
trigger1 = animelem = 2
value = -Floor((3 + (Random/1000.0)) * Fvar(28) + 0.5)
kill = 0

[State 3310, HitAdd]
type = HitAdd
trigger1 = animelem = 2
value = 1

[State 3310, PlaySnd]
Type = PlaySnd
trigger1 = animelem = 2
value = F5,1

[State 3310, Explod]
Type = Explod
trigger1 = animelem = 2
id = 2
anim = F2
pos = 28,-32
bindtime = -1
ownpal = 0
sprpriority = 4

[State 3310, Explod]
Type = Explod
trigger1 = time = 0
id = 3405
anim = 3405
pos = 12,-42
bindtime = -1
ownpal = 0
sprpriority = 0

[State 801, Decrease bite number]
Type = VarAdd
trigger1 = animtime = 0
v = 43
value = -1

[State 3310, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) = 0
value = 3311

[State 3310, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) > 0
value = 3310

;---------------------------------------------------------------------------
;Jigoku Gokuraku Otoshi Hit Cont
[Statedef 3311]
type    = A
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3411
poweradd = 0

[State 3001, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3310, Number of kneebashes]
Type = VarSet
trigger1 = var(43) = 0
var(43) = 6

[State 3310, Turn]
Type = Turn
trigger1 = animelemtime(2) = 0

[State 801, TargetFacing]
Type = TargetFacing
trigger1 = animelemtime(1) = 0
trigger1 = facing = target, facing
value = -1

[State 3310, TargetState]
Type = TargetState
trigger1 = animelemtime(1) = 0
value = 3351

[State 3311, TargetBind]
Type = TargetBind
trigger1 = animelemtime(2) < 0
pos = 15, 0

[State 3311, TargetBind 2]
Type = TargetBind
trigger1 = animelemtime(3) < 0
trigger1 = animelemtime(2) >= 0
pos = -18, -7

[State 3311, TargetBind 3]
Type = TargetBind
trigger1 = animelemtime(4) < 0
trigger1 = animelemtime(3) >= 0
pos = 0, -47

[State 3311, TargetBind 4]
Type = TargetBind
trigger1 = animelemtime(4) >= 0
pos = 36, 0

[State 3311, PlaySnd]
Type = PlaySnd
trigger1 = animelemtime(4) = 2
value = F5,1
channel = 2

[State 1212, EnvShake]
Type = EnvShake
trigger1 = animelemtime(4) = 2
time = 10
freq = 60

[State 1212, Explod]
Type = Explod
trigger1 = animelemtime(4) = 2
anim = F60
pos = 36, 0
pausemovetime = 4

[State 3310, That Hurts]
type = TargetLifeAdd
trigger1 = animelem = 4
value = -Floor((4 + (Random/1000.0)) * Fvar(28) + 0.5)
kill = 0

[State 3310, HitAdd]
type = HitAdd
trigger1 = animelem = 4
value = 1

[State 801, Decrease bite number]
Type = VarAdd
trigger1 = animtime = 0
v = 43
value = -1

[State 3310, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) = 0
value = 3312

[State 3310, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
trigger1 = var(43) > 0
value = 3311

;---------------------------------------------------------------------------
;Jigoku Gokuraku Otoshi Hit Cont
[Statedef 3312]
type    = A
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3411
poweradd = 0

[State 3001, AfterImagetime]
Type = AfterImageTime
trigger1 = time % 2
time = 3

[State 3310, Turn]
Type = Turn
trigger1 = animelemtime(2) = 0

[State 801, TargetFacing]
Type = TargetFacing
trigger1 = animelemtime(1) = 0
value = 1

[State 801, TargetFacing]
Type = TargetFacing
trigger1 = animelemtime(2) = 0
value = -1

[State 3310, TargetState]
Type = TargetState
trigger1 = animelemtime(1) = 0
value = 3352

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

[State 3310, HitAdd]
type = HitAdd
trigger1 = animelem = 4
value = 1

[State 801, That Hurts]
type = TargetLifeAdd
trigger1 = animelem = 4
value = -Floor((4 + (Random/1000.0)) * Fvar(28) + 0.5)
kill = 0

[State 801, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 1
trigger1 = Random > 499
value = 800, 0
channel = 0

[State 801, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 3313

;---------------------------------------------------------------------------
;Shinkuu Hadouken
[StateDef 3313]
Type = S
movetype = A
Physics = S
ctrl = 0
anim = 1010
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

[State 3000, Chain Flag]
Type = VarSet
trigger1 = time = 0
var(55) = 0

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

[State 3000, Width]
Type = Width
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(4) < 0
player = 20, 30

[State 3000, Projectile]
Type = Helper
trigger1 = animelem = 3,1
name = "Hadouken"
id = 3300
pos = 37, -38
StateNo = 3315
ownpal = 1

[State 3000, ChangeState]
Type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Shinkuu Hadouken Fireball
[Statedef 3315]
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
stateno = ifelse(var(2) < 4, 3415, 3002)
ignorehitpause = 1

[State 3001, NotHitBy]
Type = NotHitBy
trigger1 = 1
value = , AA, AT

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
damage = Floor(ifelse(var(2) = 0, 10 + (3 * Random/1000.0), 3 + (random/1000.0)) *  Parent, fvar(28) + 0.5), Floor(2 * Parent, fvar(28) + 0.5)
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
ground.velocity = -1.97923, -4.50000
air.velocity = -1.57923, -4.00000
guard.velocity = -4.68145
id = 3000
air.hittime = 50
air.type = High
getpower = 0,0
givepower = 60, 90
fall = 1
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
; Being Thrown by Jigoku Gokuraku Otoshi
[StateDef 3350]
type    = A
movetype= H
physics = N
ctrl = 0
poweradd = 0
sprpriority = 1

[State 802, ChangeAnim2]
Type = ChangeAnim2
trigger1 = time = 0
value = 3450

[State 811, VelSet]
Type = VelSet
trigger1 = time > 30
x = 1.6
y = -4.5

[State 811, 6]
Type = ChangeState
trigger1 = time > 30
value = 822

;---------------------------------------------------------------------------
; Being Thrown by Jigoku Gokuraku Otoshi
[StateDef 3351]
type    = A
movetype= H
physics = N
ctrl = 0
poweradd = 0
sprpriority = 1

[State 802, ChangeAnim2]
Type = ChangeAnim2
trigger1 = time = 0
value = 3451

[State 811, VelSet]
Type = VelSet
trigger1 = time > 30
x = 1.6
y = -4.5

[State 811, 6]
Type = ChangeState
trigger1 = time > 30
value = 822

;---------------------------------------------------------------------------
; Being Thrown by Shoulder Slam
[StateDef 3352]
type    = A
movetype= H
physics = N
ctrl = 0
poweradd = 0
sprpriority = 1

[State 802, ChangeAnim2]
Type = ChangeAnim2
trigger1 = time = 0
value = 3452

[State 811, Turn]
Type = Turn
trigger1 = animelem = 4,0

[State 811, VelSet]
Type = VelSet
trigger1 = animelem = 4,1
x = 1.6
y = -4.5

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



