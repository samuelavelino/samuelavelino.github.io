; �J���t�[�}���̓��̓R�}���h��`�t�@�C���ł��B
; �R�}���h�̓��̓L�[��ݒ肷��p�[�g�ƁA�Z�����s���邽�߂̏�����ݒ肷��p�[�g�ɕ�����Ă��܂��B
;------------------------------------------------------------------------------
;==============================================================================
; ���̓L�[�̐ݒ�p�[�g
;==============================================================================
;------------------------------------------------------------------------------
;���ݒ�͂��̌`�����܂莖�ł��B�ڍׂ͈ȉ��Q�ƁB
;
;[Command]
;name = "***"
;command = ###
;time = &&&
;
;���R�}���h�̖��O�F�uname = "***"�v�Ƃ������ɓ���܂��B***�ɕ��������Ă��������B
; �@�@�@�@�@�@�@�@�A���t�@�x�b�g�͑啶���Ə������ł���ʂ���܂��B���{����\�ł��B
;
;���w����@�F�ucommand = ###�v�Ƃ������ɓ���܂��B
;�@�@�@�@�@�@###�ɉ��L�̃L�[��g�ݍ��킹���͂���R�}���h��ݒ肵�Ă��������B
;
;�@�@�����L�[�F�@B, DB, D, DF, F, UF, U, UB�@�i�S�đ啶���Łj
;�@�@�@�@�@�@�@�@B=Back�i��j�ED=Down�i���j�EF=Forward�i�O�j�EU=Up�i��j�ɂȂ��Ă��܂��B
;
;�@�@�{�^���@�F�@a, b, c, x, y, z, s �@�@�@�@�i�S�ď������Łj
; 
;�@�����ꕶ��
;
;�@�@�X���b�V���i / �j�F�{�^�����������ςȂ��ɂ���ꍇ�͂�������܂��B
;�@�@�@�@�@�@�@�@��Fcommand = /F�@�@�@�i�O�L�[���������܂܂ɂ���j
;�@�@�@�@�@�@�@�@�@�@command = /B,y�@�@�i��L�[���������܂܂x�{�^������́j
;
;�@�@�`���_�@�@�i ~ �j�F�{�^����������鎖��F��������ꍇ�͂�������܂��B
;�@�@�@�@�@�@�@�@��Fcommand = ~c�@�@�@�i�b�{�^���𗣂��j
;�@�@�@�@�@�@�@�@�@�@command = ~DB,DF,x�i�΂ߌ㉺�𗣂��Ď΂ߑO��=>�w�{�^���̏��Ԃɓ��́j
;
;�@�@�@�@�@�@�@�@�����l��ǉ����鎖�ŁA�{�^���𗣂��܂ł̎��ԁA������w���߁x��ݒ�o���܂��B
;�@�@�@�@�@�@�@�@��Fcommand = ~20z�@�@�i�y�{�^�����������܂܂ɂ��A�Q�O�t���[����ɗ����j
;�@�@�@�@�@�@�@�@�@�@command = ~40B,F,b�i��L�[���������܂܂ɂ��A�S�O�t���[����ɗ����đO�L�[=>�a�{�^���̏��Ԃɓ��́j
;
;�@�@�h���@�@�@�i $ �j�F�����̕����L�[�v�f����͏o����悤�ɂ���ꍇ�͂�������܂��B
;�@�@�@�@�@�@�@�@��Fcommand = $U�@�@�@�i��E�΂ߑO��E�΂ߌ��̂ǂꂩ��Ŏn�߂Ă��ǂ��j
;�@�@�@�@�@�@�@�@�@�@command = $DF �@�@�i���E�΂ߑO���E�O�̂ǂꂩ��Ŏn�߂Ă��ǂ��j
;
;�@�@�v���X�@�@�i + �j�F�{�^���𓯎���������ꍇ�͂�������܂��B
;�@�@�@�@�@�@�@�@��Fcommand = a+b �@�@�i�`�{�^���Ƃa�{�^���𓯎��������܂��j
;�@�@�@�@�@�@�@�@�@�@command = x+y+z �@�i�w�{�^���Ƃx�{�^���Ƃy�{�^���𓯎��������܂��j
;�@�@�@�@�@�@�@�@�@�@command = F+c �@�@�i�O�L�[�Ƃb�{�^���𓯎��������܂��j
;
;�@�������̓��ꕶ���́A�g�ݍ��킹�Ďg�p���鎖���\�ł��B
;�@�@�@�@�@�@�@�@��Fcommand = ~30$D,a+b
;�@�@�@�@�@�@�@�@�@�@�@�@�@�i���v�f���R�O�t���[�����߂ė�������ɂ`�{�^���Ƃa�{�^���𓯎��������܂��j
;
;�����̓R�}���h��t���ԁF�utime = &&&�v�Ƃ������ɓ���܂��B�I�v�V�����Ȃ̂ŏȗ��\�B
;�@�@�@�@�@�@�@�@�@�@�@�@&&&�ɃR�}���h����͏o���鎞�Ԃ����Ă��������B���Ԃ̓t���[�����ł��i�P�t���[����1/60�b�j�B
;�@�@�@�@�@�@�@�@��Ftime = 24�@�i���͎�t���Ԃ��Q�S�t���[���i0.4�b�j�ɐݒ�j
;
; ��͎��ۂɓo�^����Ă�����̂��Q�Ƃ��Ă��������B
;==============================================================================

;-| �{�^���z�u |-----------------------------------------------------
;�e�{�^���̔z�u���ȒP�ɕύX�ł��܂��B
;���̃L�����N�^�[�̃{�^���z�u��ς������Ƃ��ȂǂɎg���܂��B
;x = x �� x = a �ɕς���΁Ax��a�ɕς��܂��B

[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| �W���� |-------------------------------------------------------
[Defaults]
; time���L�q���Ȃ������ꍇ�A�ȉ��̒l���Q�Ƃ���܂��B�ŏ��l��1�ł��B
command.time = 15

; buffer.time�̒l�ł��B1�`30�܂Őݒ�ł��܂��B
; ���ʂ�1�ł��B
command.buffer.time = 1

;------------------------------------------------------------------------------
;-| MAX2���K�E�Z |--------------------------------------------------------------

[Command]
name = "�O�_�Z�V��"
command = ~D, DF, F, DF, D, DB, B, a+b
time = 28

;------------------------------------------------------------------------------
;-| MAX���K�E�Z |--------------------------------------------------------------

[Command]
name = "�֐�Q�S��E�ގ��E�g�U��"
command = ~D, DF, F, DF, D, DB, B, x+y
time = 28

;------------------------------------------------------------------------------
;-| ���K�E�Z |-----------------------------------------------------------------
[Command]
name = "淉؁w�^�x"
command = ~D, DF, F, D, DF, F, D, DF, F, D, DF, F, x+y
time = 100

[Command]
name = "淉؁w�^�x"
command = ~D, DF, F, D, DF, F, D, DF, F, D, DF, F, y
time = 100

[Command]
name = "淉؁w�U�x"
command = ~D, DF, F, D, DF, F, D, DF, F, D, DF, F, x
time = 100

[Command]
name = "���S�����E����tX"
command = ~D, DB, B, DB, D, DF, F, x
time = 28

[Command]
name = "���S�����E����tY"
command = ~D, DB, B, DB, D, DF, F, y
time = 28

[Command]
name = "�㌌�̖\��"
command = ~D, DF, F, DF, D, DB, B, a
time = 28

[Command]
name = "�����̖\��"
command = ~D, DF, F, DF, D, DB, B, b
time = 28

[Command]
name = "��֐��S�E�뎮�E���t��"
command = ~D, DF, F, DF, D, DB, B, x
time = 28

[Command]
name = "���֐��S�E�뎮�E���t��"
command = ~D, DF, F, DF, D, DB, B, y
time = 28

[Command]
name = "���Q�S�E�뎮�E�͒܋�"
command = ~D, DF, F, D, DF, F, a
time = 25

[Command]
name = "���Q�S�E�뎮�E�͒܋�"
command = ~D, DF, F, D, DF, F, b
time = 25

[Command]
name = "���Q�S�E�Z���E淉�"
command = ~D, DF, F, D, DF, F, x
time = 25

[Command]
name = "���Q�S�E�Z���E淉�"
command = ~D, DF, F, D, DF, F, y
time = 25

;------------------------------------------------------------------------------
;-| �K�E�Z |-------------------------------------------------------------------

[Command]
name = "����"
command = ~F, DF, D, DB, B, F, x
time = 25

[Command]
name = "����"
command = ~F, DF, D, DB, B, F, y
time = 25

[Command]
name = "��Q�S�E�뎮�E�܋�"
command = ~F, D, DF, a

[Command]
name = "���Q�S�E�뎮�E�܋�"
command = ~F, D, DF, b

[Command]
name = "��S���E�S�Ă�"
command = ~F, D, DF, x

[Command]
name = "���S���E�S�Ă�"
command = ~F, D, DF, y

[Command]
name = "���l�E�󎮁E�Ռ�"
command = ~F, DF, D, DB, B, a

[Command]
name = "����l�E�󎮁E�Ռ�"
command = ~F, DF, D, DB, B, b

[Command]
name = "��S��E�����E����"
command = ~D, DB, B, x

[Command]
name = "���S��E�����E����"
command = ~D, DB, B, y

[Command]
name = "��S�����E�ŕ���"
command = ~D, DF, F, x

[Command]
name = "���S�����E�ŕ���"
command = ~D, DF, F, y

[Command]
name = "jump"    
command = D, $U
time = 12

;------------------------------------------------------------------------------
;-| �L�[�Q��A������ |---------------------------------------------------------
[Command]
name = "FF"     ;�v���ς� (�L�[�̕ύX�͉\�ł������O��ς����薳���ɂ��Ă͂����܂���)
command = F, F
time = 10

[Command]
name = "BB"     ;�v���ς� (�L�[�̕ύX�͉\�ł������O��ς����薳���ɂ��Ă͂����܂���)
command = B, B
time = 10

;------------------------------------------------------------------------------
;-| �������� |-----------------------------------------------------------------
[Command]
name = "recovery"   ;�v���ς� (�L�[�̕ύX�͉\�ł������O��ς����薳���ɂ��Ă͂����܂���)
command = x+a
time = 1

[Command]
name = "recovery"   ;�v���ς� (�L�[�̕ύX�͉\�ł������O��ς����薳���ɂ��Ă͂����܂���)
command = z
time = 1

[Command]
name = "�ӂ��Ƃ΂�"
command = y+b
time = 1

[Command]
name = "�ӂ��Ƃ΂�"
command = c
time = 1

[Command]
name = "a+b"
command = a+b
time = 1

;------------------------------------------------------------------------------
;-| �����L�[�{�{�^�� |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;------------------------------------------------------------------------------
;-| �{�^���P�� |---------------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;------------------------------------------------------------------------------
;-| �����L�[�������ςȂ� |-----------------------------------------------------
[Command]
name = "holdfwd"   ;�v���ς� (�L�[�̕ύX�͉\�ł������O��ς����薳���ɂ��Ă͂����܂���)
command = /$F
time = 1

[Command]
name = "holdback"  ;�v���ς� (�L�[�̕ύX�͉\�ł������O��ς����薳���ɂ��Ă͂����܂���)
command = /$B
time = 1

[Command]
name = "holdup"    ;�v���ς� (�L�[�̕ύX�͉\�ł������O��ς����薳���ɂ��Ă͂����܂���)
command = /$U
time = 1

[Command]
name = "holddown"  ;�v���ς� (�L�[�̕ύX�͉\�ł������O��ς����薳���ɂ��Ă͂����܂���)
command = /$D
time = 1

[Command]
name = "holdx"
command = /$x
time = 1

[Command]
name = "holdy"
command = /$y
time = 1

;------------------------------------------------------------------------------
;==============================================================================
; �Z�����s���邽�߂̏����̐ݒ�i�X�e�[�g�G���g���[�p�[�g�j
;==============================================================================
;------------------------------------------------------------------------------
; �������牺�́u�ǂ̃R�}���h�łǂ̔ԍ��̃X�e�[�g���ǂ����������ŏo���邩�v��ݒ肷��ꏊ�ł��B
;�i�X�e�[�g�Ɋւ��Ă�CNS�t�@�C�����Q�Ɓj
; 
;���ݒ�͊�{�I�ɂ��̌`�ɂȂ�܂��B
;
; [State -1, Label]                  ;�uLabel�v�̕����͂����̃��x���ł��B���ł��ǂ��ł��B����ȊO�͕ύX�s�B
; type = ChangeState                 ;�u�ʂ̃X�e�[�g�ɕύX����v�Ƃ����Ӗ��̃X�e�[�g�R���g���[��
; value = new_state_number           ;�o�������Z�̃X�e�[�g�ԍ������܂�
; trigger1 = command = command_name  ;���̓L�[�ݒ�p�[�g�œo�^�����R�}���h�̖��O���ǂꂩ����܂�
; . . .  (any additional triggers)   ;trigger�i�������w�肷��g���K�[�j��ǉ��o���܂�
;
;��trigger�Ɏg�����{�I�ȏ����i�ʏ�́u�g���K�[�v�ƌĂ΂�Ă��܂��j
;
;   - StateType    - �L�����N�^�[���ǂ̏�Ԃ̎��ɂ��̃X�e�[�g���o���邩�ǂ��������߂��܂��B
;                    S=��������ԁEC=��������ԁEA=�󒆂ɂ����ԁEL=���ɓ|�ꂽ��ԁA�̂S�����܂莖�ł��B
;                    CNS��Statedef�̉��ɂ���uType = *�v�̍��ڂ���Ԃ̈Ӗ��Ȃ̂ŁA��������̃g���K�[�Ŕ��f���܂��B
;
;   - Ctrl         - �R���g���[�����\���s�\���ǂ��炩�̎��ɂ��̃X�e�[�g���o���邩�ǂ��������߂��܂��B
;                    0=�R���g���[���s�\��ԁE1=�R���g���[���\��ԁA�ł����ʏ�� Ctrl = 1 ( = 1 �ȗ��\)����{�B
;
;   - StateNo      - �ʂ̔ԍ��̃X�e�[�g����o���鎖���\�ɂȂ�܂��B
;                    ��������p���ăX�[�p�[�L�����Z�����\�ł��B
;
;   - MoveContact  - �����U��������ɓ����������i�U�����q�b�g�������A�������̓K�[�h���ꂽ���j�ɁA
;                    ���̃X�e�[�g���o���邩�ǂ��������߂��܂��B�Q��ނS�p�^�[������܂��B
;                    MoveContact or MoveContact = 1  �i�U���������������j
;                    !MoveContact or MoveContact = 0 �i�U�����������ĂȂ����j
;                    ��������p���ăX�[�p�[�L�����Z�����\�ł��B
;
;�@����̂S�ȊO�ɂ�����܂����A���̃g���K�[��M.U.G.E.N�{��docs�t�H���_�̒���
;�@�@CNS�h�L�������e�[�V�������Q�Ƃ��Ă��������B
;
;���X�e�[�g�G���g���[�̏���
;
; ChangeState�̓o�^�̏��Ԃ͏d�v�ł��B��ɗ���Η���قǃR�}���h���̗͂D��x�������Ȃ�܂��B
;
; ���p�ɂȂ�܂����A�Ⴆ�΁u�g�����R�}���h��ChangeState�i���_���{�p���`�j�v��
;�u�������R�}���h��ChangeState�i�����_�{�p���`�j�v������ɓo�^�����ꍇ�A
; �Q�[�����ł͏��������o�����Ƃ��Ă��g����������Ė\�����₷���Ȃ��Ă��܂��܂��B
; �h�~���邽�߂ɂ́A�u�g������ChangeState�v���u��������ChangeState�v�������ɓo�^���Ȃ��Ă͂Ȃ�܂���B
;�u���o�[��O�ɓ���ďo������Z�v�Ɓu�����Z�v�̊֌W�Ȃǂ����l�ł��B
;
; ���Ԃ��悭�l���ēo�^���܂��傤�B
;
;��AI(CPU)�͂ǂ������̂�
;MUGEN�̕W��CPU�͑���ɋ߂Â��K���ɍU�����J��o�������Ȃ̂ŁAAI�X�C�b�`�ɂ�鐧�䂪�K�v�Ȃ��Ƃ�����܂��B
;
;��[Statedef -1]�Ƃ́H
;
; ���̕�����CNS�v���O���~���O�̊g�������́A�펞�Ď��X�e�[�g�ɂȂ�܂��B
; �ǂ̂����Ȃ��Ԃł��ݒ肵���L�q����ɗL���ɂȂ�X�e�[�g�ł��iCNS��[Statedef -2]�Ǝ����悤�ȕ����j�B
;
; �K�v�ȋL�q�ƍs�Ȃ̂ŁA��΂ɏ����Ȃ��ł��������B
;
;==============================================================================
;------------------------------------------------------------------------------

[Statedef -1];�����̍s�͐�΂ɏ����Ȃ��ł��������B�K�{�̍��ڂł��B

;==============================================================================
;�O�_�Z�V��
[State -1, 3singi]
type = ChangeState
value = 3100
triggerall = command = "�O�_�Z�V��"
triggerall = power >= 3000
;triggerall = (100*life/const(data.life)) <= 30
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 215 && movecontact
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 300 && movecontact
trigger8 = stateno = 305 && movecontact
trigger9 = stateno = 1750 && AnimElemtime(4) > 0 && AnimElemtime(5) <= 2 && movehit
trigger10 = stateno = 1810 && AnimElemtime(6) > 0 && AnimElemtime(8) <= 2 && movehit
trigger11 = stateno = 2510 && AnimElemtime(5) > 0 && AnimElemtime(45) < 0 && movehit
trigger12 = stateno = 2515 && AnimElemtime(5) > 0 && AnimElemtime(45) < 0 && movehit
trigger13 = stateno = 1260 && AnimElemtime(4) > 0 && AnimElemtime(5) < 10 && movehit

;==============================================================================
;�֐�Q�S��E�ގ��E�g�U��
[State -1, KURENAI]
type = ChangeState
value = 3000
triggerall = command = "�֐�Q�S��E�ގ��E�g�U��"
triggerall = power >= 2000
;triggerall = (100*life/const(data.life)) <= 80
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 215 && movecontact
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 300 && movecontact
trigger8 = stateno = 305 && movecontact
trigger9 = stateno = 1750 && AnimElemtime(4) > 0 && AnimElemtime(5) <= 2 && movehit
trigger10 = stateno = 1810 && AnimElemtime(6) > 0 && AnimElemtime(8) <= 2 && movehit
trigger11 = stateno = 1260 && AnimElemtime(4) > 0 && AnimElemtime(5) < 10 && movehit
trigger12 = stateno = 2510 && AnimElemtime(5) > 0 && AnimElemtime(45) < 0 && movehit
trigger13 = stateno = 2515 && AnimElemtime(5) > 0 && AnimElemtime(45) < 0 && movehit

;------------------------------------------------------------------------------
;���S�����E����t
[State -1, YASAKAZUKI]
type = ChangeState
value = 2601
triggerall = command = "���S�����E����tY"
triggerall = power >= 1000
triggerall = numprojID(2640) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 215 && movecontact
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 1750 && AnimElemtime(4) > 0 && AnimElemtime(5) <= 2 && movehit
trigger8 = stateno = 1810 && AnimElemtime(6) > 0 && AnimElemtime(8) <= 2 && movehit
trigger9 = stateno = 1260 && AnimElemtime(4) > 0 && AnimElemtime(5) < 10 && movehit

;------------------------------------------------------------------------------
;���S�����E����t
[State -1, YASAKAZUKI]
type = ChangeState
value = 2600
triggerall = command = "���S�����E����tX"
triggerall = power >= 1000
triggerall = numprojID(2640) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 215 && movecontact
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 1750 && AnimElemtime(4) > 0 && AnimElemtime(5) <= 2 && movehit
trigger8 = stateno = 1810 && AnimElemtime(6) > 0 && AnimElemtime(8) <= 2 && movehit
trigger9 = stateno = 1260 && AnimElemtime(4) > 0 && AnimElemtime(5) < 10 && movehit

;------------------------------------------------------------------------------
;���Q�S�E�뎮�E�͒܋�
[State -1, ORI]
type = ChangeState
value = 2400
triggerall = command = "���Q�S�E�뎮�E�͒܋�"
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 215 && movecontact
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 1750 && AnimElemtime(4) > 0 && AnimElemtime(5) <= 2 && movehit
trigger8 = stateno = 1810 && AnimElemtime(6) > 0 && AnimElemtime(8) <= 2 && movehit
trigger9 = stateno = 1260 && AnimElemtime(4) > 0 && AnimElemtime(5) < 10 && movehit

;------------------------------------------------------------------------------
;���Q�S�E�Z���E淉�
[State -1, L ONI]
type = ChangeState
value = 2300
triggerall = command = "���Q�S�E�Z���E淉�"
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 215 && movecontact
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 1750 && AnimElemtime(4) > 0 && AnimElemtime(5) <= 2 && movehit
trigger8 = stateno = 1810 && AnimElemtime(6) > 0 && AnimElemtime(8) <= 2 && movehit
trigger9 = stateno = 1260 && AnimElemtime(4) > 0 && AnimElemtime(5) < 10 && movehit

;------------------------------------------------------------------------------
;�����̖\��
[State -1, SB]
type = ChangeState
value = 2150
triggerall = command = "�����̖\��"
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 215 && movecontact
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 300 && movecontact
trigger8 = stateno = 305 && movecontact
trigger9 = stateno = 1750 && AnimElemtime(4) > 0 && AnimElemtime(5) <= 2 && movehit
trigger10 = stateno = 1810 && AnimElemtime(6) > 0 && AnimElemtime(8) <= 2 && movehit
trigger11 = stateno = 1260 && AnimElemtime(4) > 0 && AnimElemtime(5) < 10 && movehit

;�㌌�̖\��
[State -1, LB]
type = ChangeState
value = 2100
triggerall = command = "�㌌�̖\��"
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 215 && movecontact
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 300 && movecontact
trigger8 = stateno = 305 && movecontact
trigger9 = stateno = 1750 && AnimElemtime(4) > 0 && AnimElemtime(5) <= 2 && movehit
trigger10 = stateno = 1810 && AnimElemtime(6) > 0 && AnimElemtime(8) <= 2 && movehit
trigger11 = stateno = 1260 && AnimElemtime(4) > 0 && AnimElemtime(5) < 10 && movehit

;------------------------------------------------------------------------------
;���֐��S�E�뎮�E���t��
[State -1, S8M]
type = ChangeState
value = 2050
triggerall = command = "���֐��S�E�뎮�E���t��"
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 215 && movecontact
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 300 && movecontact
trigger8 = stateno = 305 && movecontact
trigger9 = stateno = 1750 && AnimElemtime(4) > 0 && AnimElemtime(5) <= 2 && movehit
trigger10 = stateno = 1810 && AnimElemtime(6) > 0 && AnimElemtime(8) <= 2 && movehit
trigger11 = stateno = 1260 && AnimElemtime(4) > 0 && AnimElemtime(5) < 10 && movehit

;��֐��S�E�뎮�E���t��
[State -1, L8M]
type = ChangeState
value = 2000
triggerall = command = "��֐��S�E�뎮�E���t��"
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 215 && movecontact
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 300 && movecontact
trigger8 = stateno = 305 && movecontact
trigger9 = stateno = 1750 && AnimElemtime(4) > 0 && AnimElemtime(5) <= 2 && movehit
trigger10 = stateno = 1810 && AnimElemtime(6) > 0 && AnimElemtime(8) <= 2 && movehit
trigger11 = stateno = 1260 && AnimElemtime(4) > 0 && AnimElemtime(5) < 10 && movehit

;===========================================================================
;����
[State -1, KUZUKAZE]
type = ChangeState
value = 1500
triggerall = command = "����"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 215 && movecontact
trigger6 = stateno = 235 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact
trigger9 = stateno = 305 && movecontact
trigger10 = stateno = 750 && movecontact

;------------------------------------------------------------------------------
;��Q�S�E�뎮�E�܋�
[State -1, L T]
type = ChangeState
value = 1400
triggerall = command = "��Q�S�E�뎮�E�܋�"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 215 && movecontact
trigger6 = stateno = 235 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact
trigger9 = stateno = 305 && movecontact
trigger10 = stateno = 750 && movecontact

;���Q�S�E�뎮�E�܋�
[State -1, S T]
type = ChangeState
value = 1450
triggerall = command = "���Q�S�E�뎮�E�܋�"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 215 && movecontact
trigger6 = stateno = 235 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact
trigger9 = stateno = 305 && movecontact
trigger10 = stateno = 750 && movecontact

;------------------------------------------------------------------------------
;��S���E�S�Ă�
[State -1, L ONI]
type = ChangeState
value = 1700
triggerall = command = "��S���E�S�Ă�"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 215 && movecontact
trigger6 = stateno = 235 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact
trigger9 = stateno = 305 && movecontact
trigger10 = stateno = 750 && movecontact

;���S���E�S�Ă�
[State -1, S ONI]
type = ChangeState
value = 1750
triggerall = command = "���S���E�S�Ă�"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 215 && movecontact
trigger6 = stateno = 235 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact
trigger9 = stateno = 305 && movecontact
trigger10 = stateno = 750 && movecontact

;------------------------------------------------------------------------------
;���l�E�󎮁E�Ռ�
[State -1, L KOTOTUKI]
type = ChangeState
value = 1800
triggerall = command = "���l�E�󎮁E�Ռ�"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 215 && movecontact
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 750 && movecontact

;����l�E�󎮁E�Ռ�
[State -1, S KOTOTUKI]
type = ChangeState
value = 1850
triggerall = command = "����l�E�󎮁E�Ռ�"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 215 && movecontact
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 750 && movecontact

;------------------------------------------------------------------------------
;��S��E�����E����
[State -1, L AOI]
type = ChangeState
value = 1200
triggerall = command = "��S��E�����E����"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 215 && movecontact
trigger6 = stateno = 235 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact
trigger9 = stateno = 305 && movecontact
trigger10 = stateno = 1410  && AnimElemtime(2) > 0 && AnimElemtime(3) < 10 && movecontact
trigger11 = stateno = 1460  && AnimElemtime(2) > 0 && AnimElemtime(3) < 10 && movecontact
trigger12 = stateno = 750 && movecontact

;���S��E�����E����
[State -1, S AOI]
type = ChangeState
value = 1250
triggerall = command = "���S��E�����E����"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 215 && movecontact
trigger6 = stateno = 235 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact
trigger9 = stateno = 305 && movecontact
trigger10 = stateno = 1410  && AnimElemtime(2) > 0 && AnimElemtime(3) < 10 && movecontact
trigger11 = stateno = 1460  && AnimElemtime(2) > 0 && AnimElemtime(3) < 10 && movecontact
trigger12 = stateno = 750 && movecontact

;------------------------------------------------------------------------------
;��S�����E�ŕ���
[State -1, L SENKA]
type = ChangeState
value = 1600
triggerall = command = "��S�����E�ŕ���"
triggerall = statetype != A
triggerall = numprojID(1600) = 0
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 215 && movecontact
trigger6 = stateno = 235 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact
trigger9 = stateno = 305 && movecontact
trigger10 = stateno = 750 && movecontact

;���S�����E�ŕ���
[State -1, S SENKA]
type = ChangeState
value = 1650
triggerall = command = "���S�����E�ŕ���"
triggerall = statetype != A
triggerall = numprojID(1600) = 0
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 215 && movecontact
trigger6 = stateno = 235 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact
trigger9 = stateno = 305 && movecontact
trigger10 = stateno = 750 && movecontact

;---------------------------------------------------------------------------
;��ً}���
[State -1, T S]
type = ChangeState
value = 720
triggerall = command = "recovery" && command = "holdback"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = power >= 1000
trigger2 = stateno = [150,151]

;---------------------------------------------------------------------------
;�O�ً}���
[State -1, T S]
type = ChangeState
value = 710
triggerall = command = "recovery"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = power >= 1000
trigger2 = stateno = [150,151]
trigger3 = stateno = 100

;---------------------------------------------------------------------------
;��g
[State -1, UKEMI]
type = ChangeState
value = 52000
triggerall = command = "recovery"
triggerall = alive = 1
trigger1 = stateno = 5050
trigger1 = pos y > -30
trigger1 = vel y > 0 && vel y < 9

;------------------------------------------------------------------------------
;�ӂ��Ƃ΂�
[State -1, Throw]
type = ChangeState
value = 750
triggerall = command = "�ӂ��Ƃ΂�"
triggerall = statetype = S
triggerall = stateno != 100
trigger1 = ctrl
trigger2 = power >= 1000
trigger2 = stateno = [150,151]

;------------------------------------------------------------------------------
;�󒆂ӂ��Ƃ΂�
[State -1, CD]
type = ChangeState
value = 760
triggerall = command = "�ӂ��Ƃ΂�"
triggerall = statetype = A
trigger1 = ctrl

;------------------------------------------------------------------------------
;�O���E���e
[State -1, rokotu]
type = ChangeState
value = 300
triggerall = command = "x"
triggerall = command = "holdfwd"
triggerall = statetype != A
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 215 && movecontact
trigger6 = stateno = 235 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact

;�O���E�����@�A"���_"
[State -1, rokotu]
type = ChangeState
value = 310
triggerall = command = "a"
triggerall = command = "holdfwd"
triggerall = statetype != A
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 215 && movecontact
trigger6 = stateno = 235 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact

;�O���E�S���܂�
[State -1, rokotu]
type = ChangeState
value = 320
triggerall = statetype = A
trigger1 = ctrl
trigger1 = command = "a"
trigger1 = command = "holdback"
trigger1 = p2bodydist X > 0
trigger2 = ctrl
trigger2 = command = "a"
trigger2 = command = "holdfwd"
trigger2 = p2bodydist X < 0
trigger3 = stateno = 105 && Pos Y < 0
trigger3 = command = "a"
trigger3 = command = "holdback"

;------------------------------------------------------------------------------
;P����
[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "y"
triggerall = command = "holdfwd" || command = "holdback"
triggerall = statetype = S
triggerall = stateno != 100
trigger1 = p2bodydist X < 15
trigger1 = p2statetype != A && p2movetype != H
trigger1 = ctrl

;------------------------------------------------------------------------------
;K����
[State -1, Throw]
type = ChangeState
value = 830
triggerall = command = "b"
triggerall = command = "holdfwd" || command = "holdback"
triggerall = statetype = S
triggerall = stateno != 100
trigger1 = p2bodydist X < 15
trigger1 = p2statetype != A && p2movetype != H
trigger1 = ctrl

;------------------------------------------------------------------------------
;�_�b�V��
[State -1, Dash]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;GC�t�����g�X�e�b�v
[State -1, T S]
type = ChangeState
value = 101
triggerall = command = "FF"
triggerall = power >= 500
trigger1 = stateno = 150
trigger2 = stateno = 151

;�o�b�N�X�e�b�v
[State -1, Back Step]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;==============================================================================
;�ߋ���������p���`
[State -1, Stand Light Punch]
type = ChangeState
value = 205
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype = S
triggerall = p2bodydist X < 25
trigger1 = ctrl
trigger2 = stateno = 700

;������������p���`
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 700

;�ߋ����������p���`
[State -1, Stand Strong Punch]
type = ChangeState
value = 215
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype = S
triggerall = p2bodydist X < 20
trigger1 = ctrl
trigger2 = stateno = 700

;�������������p���`
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 700

;------------------------------------------------------------------------------
;�ߋ���������L�b�N
[State -1, Stand Light Kick]
type = ChangeState
value = 235
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype = S
triggerall = p2bodydist X < 20
trigger1 = ctrl
trigger2 = stateno = 700

;������������L�b�N
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 700

;�ߋ����������L�b�N
[State -1, Standing Strong Kick]
type = ChangeState
value = 245
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype = S
triggerall = p2bodydist X < 20
trigger1 = ctrl
trigger2 = stateno = 700

;�������������L�b�N
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 700

;------------------------------------------------------------------------------
;����
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
triggerall = var(20) = 0
trigger1 = statetype != A
trigger1 = ctrl

;------------------------------------------------------------------------------

;���Ⴊ�ݎ�p���`
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 430 && movecontact

;���Ⴊ�݋��p���`
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;------------------------------------------------------------------------------
;���Ⴊ�ݎ�L�b�N
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;���Ⴊ�݋��L�b�N
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;------------------------------------------------------------------------------
;�W�����v��p���`
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = stateno != 105  ;�o�b�N�X�e�b�v���͋֎~
trigger1 = statetype = A
trigger1 = ctrl

;�W�����v���p���`
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = stateno != 105
trigger1 = statetype = A
trigger1 = ctrl

;------------------------------------------------------------------------------
;�W�����v��L�b�N
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
triggerall = stateno != 105
trigger1 = statetype = A
trigger1 = ctrl

;�W�����v���L�b�N
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = stateno != 105
trigger1 = statetype = A
trigger1 = ctrl

