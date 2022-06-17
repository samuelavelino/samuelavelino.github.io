=================================================================================================
                  --------------------| SANDER 71113 |-------------------
                                   sander71113@gmail.com
                                  http://go.to/sander71113 

=================================
NeoKyo/Kyo 71113 release 2008
=================================

-* PROGRAMMING AND RIPPING:
   Sander71113

-* MAIN RIPPING AND CLSNING:
   NeoGouki for NeoKyo 

-* SPRITE EDITS:
   Kaddet -> Dodge, Dodge attack, Charge up, 182 Shiki SDM.
          -> old edits: Kamijiri SDM, and Kototsuki you 2001.
   Ruddy(R.B.) -> Kototsuki you and Oboro goruma.

DATE: 07/06/2008

 *** WHY ANOTHER KYO... ***
 
 Since this guy is my favorite KOF character of all time ZOMG~!, I decided to create the 
 ultimate "All in One" Kyo Kusanagi.    
 
 *** CHARACTER ***

 Kyo Kusanagi is taken from SNK's King of Fighters Series. All of his varying moves and
 abilities from KOF'94 to KOF'2002 are made available. An all in one Kyo, which gives the user
 the power to choose between the many different modes and grooves that KOF has implemented. 
 "Mugenized" by Sander71113 (sander71113@gmail.com).

*- MODES: 
    1. Kyo Kusanagi '95
    2. Kyo Kusanagi '98
    3. Kyo-1
    4. Kyo-2
    5. Kyo Kusanagi '99
    6. Kyo Kusanagi '2000
    7. Kyo Kusanagi '2001
    8. Kyo Kusanagi Mix
    9. Kusanagi '2002	

*- GROOVES:
    1. Advance Groove
    2. Extra Groove
    3. KOF'99 Groove
    4. KOF '2000 Groove
    5. KOF '2002 Groove
    6. Mix Groove

 *- STRIKERS:
    1. Another Iori
    2. Kyoko
    3. Syo
    4. Saisyu

 *- Artificial Intelligence:
    1. Hard level - Neokyo.cmd / Kyo.cmd
    2. Medium level - NeoMedai.cmd / KyoMedai.cmd
    3. Low Level - NeoNoai.cmd / KyoNoai.cmd

 *- STORY BOARD:
    1. KOF2000 ENDING
    2. KOF97 SPECIAL ENDING

 *- WHATS DONE:
    1. WINMUGEN Compatible

 *- REQUIREMENTS:
    1. WIN M.U.G.E.N. engine
    2. Faster than 300 mhz processor.
    3. 64MB or higher Ram.


 Just an added note, Mix and 2K1 mode uses KOF2K1 damages, and the rest uses KOF98 based damage.
 Pls take the time to read the accompanying docs (readme.txt,cmd.txt,history.txt).

 *** M.U.G.E.N. ***

 To use Kyo Kusanagi, you need the latest build of "M.U.G.E.N." engine
 which can found at http://www.elecbyte.com.

 *** NeoKyo/Kyo FILES AND USE ***

 Upon unzipping the Zip file(s), You should now have these:

 DOCUMENTATIONS:
 Readme.txt
 history.txt
 Neocmds.txt
 Kyocmds.txt

 DEF FILES:
 Kusanagi.def
 Neokyo.def

 CODES:
 Kyo.cns
 Kyoa.cns
 Kyo-basics.cns
 Neokyo.cns
 Neokyoa.cns
 Neokyob.cns
 Neokyoc.cns
 Neokyod.cns
 Neokyoe.cns
 Neokyof.cns

 STRIKER CODES:
 Kyo-strikers.cns
 Neo-strikers.cns

 SPRITES:
 neokyo.sff
 kusanagi.sff

 SOUNDS:
 kusanagi.snd
 Kyo.snd

 Story board:
 ending.def
 ending.sff
 ending1.mp3
 ending2.mp3
 ending3.mp3
 ending4.mp3
 ending5.mp3
 Neoending.def
 Neoending.sff

 PALETTES:
 pal1n.act	pal1.act
 pal2n.act	pal2.act
 pal3n.act	pal3.act
 pal4n.act	pal4.act
 pal5n.act	pal5.act
 pal6n.act	pal6.act
 pal7n.act	pal7.act
 pal8n.act	pal8.act
 pal9n.act	pal9.act
 pal10n.act	pal10.act
 pal11n.act	pal11.act
 pal12n.act	pal12.act

 Unzip or Put all the files into a folder named Kusanagi and insert this Kusanagi folder
 into the chars folder of your M.U.G.E.N. You can add Kusanagi and Neokyo to your Select Screen by simply
 adding the lines below to your "select.cfg" under the [Characters] section:

 Kusanagi,
 kusanagi/neokyo.def,

 ---------------------------------------------------------------------------------------------

 ---------------------------------------------------------------------------------------------
 *** NEOKYO X SYSTEM AND COMMANDS ***
 ---------------------------------------------------------------------------------------------
  ** SPECIAL SYSTEMS ***

   * COUNTER HIT  - Allows for another free hit. This is most obvious when using knockdown
                   attacks. Some moves are not affected by counter hit (ex. Sweep). Use it
                   to your advantage.

   * GUARD CRUSH  - Kyo can be Guard Crushed. So don't block too much :P. My Guard Crush
                   System is not KOF accurate since it is still not built into the M.U.G.E.N.
                   engine itself. This is just a "work around". It works much like SFA3. 
                   You can see the guard crush points in debug display.

   * DIZZY        - Kyo Can be dizzied. Again this is not KOF accurate. You can also check the
                   dizzy points in Debug Display.

   * THROW CANCEL - Tired of being thrown around? You cancel Kyo's throws by pressing any punch
                    button during the first few frames of his throw, KOF98 style.
 ----------------------------------------------------------------------------------------------

 ----------------------------------------------------------------------------------------------
  ** M.U.G.E.N. JOYSTICK CONFIGURATION **
 (Player 1)

 *- DIRECTION KEYS

		     (U)           U = up        DF = downforward

 		 (B)  x  (F)       B = back      DB = downback

  		     (D)           F = Forward   UF = upforward

		                   D = down      UB = upback

 *- BUTTONS

		 (x) (y) (z)       x = light punch    y = hard punch   z = No Use

		 (a) (b) (c)       a = light kick     b = hard kick    c = No Use

		     (s)                              s = start
 ---------------------------------------------------------------------------------------------

 ---------------------------------------------------------------------------------------------
  ** DEFAULT MODES AND GROOVES **

 Kyo is a bit more complicated than your normal straight forward character so here is an
 explanation that I hope will clear up things for you. Kyo has different modes and grooves
 which you can choose from either by palette selection or pressing cmds during fight.

 NOTES: Modes and Grooves will reset to Palette default every start of a 1ST round.  
	A.I. will always automatically select Mix Mode and Mix Groove - Update~!

    M.U.G.E.N. BUTTON PALETTE MAP: * Palettes are the different color schemes of kyo.

                          (s) - start

			  (x) (y) (z)

			  (a) (b) (c)

   When selecting you Kyo, each button represents a default Mode and Groove.

	 (x) - pal4.act   - 98 MODE / ADV GROOVE            - COLOR: Dark Green

	 (y) - pal5.act   - 95 MODE / EXTRA GROOVE          - COLOR: Lavander

	 (z) - neokyo.act - 2000 MODE/ 2000 GROOVE          - COLOR: Original

	 (a) - pal1.act   - Kyo-1 MODE / 99 GROOVE          - COLOR: Grey  (Darker skin tone)

	 (b) - pal2.act   - Kyo-2 MODE / 99 GROOVE          - COLOR: Brown (Darker skin tone)

	 (c) - pal3.act   - 99 MODE / 99 GROOVE             - COLOR: Dark Blue

   -* Extra Palettes [Hold start then press the corresponding button during select screen]

         (x) - pal9.act   - RANDOM MODE/ RANDOM GROOVE      - COLOR: Green

         (y) - pal10.act  - RANDOM MODE/ RANDOM GROOVE      - COLOR: Violet

         (z) - pal11.act  - RANDOM MODE/ RANDOM GROOVE      - COLOR: Black Skin Tone

         (a) - pal6.act   - MIX MODE / MIX GROOVE           - COLOR: Black & Red

         (b) - pal7.act   - 2001 MODE/ 2001 GROOVE          - COLOR: Black

         (c) - pal8.act   - RANDOM MODE/ RANDOM GROOVE      - COLOR: Blue (Shingo!!!)
 ---------------------------------------------------------------------------------------------

 ---------------------------------------------------------------------------------------------
  *** TAUNTS ***

 Kyo has 4 taunts. Each with it's own particular use:

    Taunt 1 = start         : KOF98 style taunt -Cancelable-
    Taunt 2 = Down+start    : KOF2000 Style Taunt -Striker Bomb Add-
    Taunt 3 = Forward+start : Groove Selection
    Taunt 4 = Back+start    : Mode Selection
 ---------------------------------------------------------------------------------------------

 ---------------------------------------------------------------------------------------------
  ** MODE AND GROOVE SELECTION DURING FIGHT**

 NOTES: Grooves and Modes can be changed during fight. They are activated by Taunt1 and Taunt2
        respectively. Here is the explanation:

 GROOVE SELECTION :

     CMD: FORWARD+START

     -* During Groove Selection, you can change Kyo's Groove by pressing one of
        these buttons. An appropriate display appears upon a succesful Groove change.
        I've also added a chart so you won't have to memorize this.. :P

 		    *- DURING TAUNT1

 	      BUTTON:     GROOVE:     DISPLAY

  	        (x)    -  Advance  -   Groove: ADV

		(y)    -   Extra   -   Groove: EX

 		(z)    -    Mix    -   Groove: MIX

 		(a)    -    99     -   Groove: KOF'99

 		(b)    -    2K     -   Groove: KOF'00

                (c)    -    2001   -   Groove: KOF'01


 MODE SELECTION :

     CMD: BACK+START

     -* During Mode Selection you can change Kyo's Mode by pressing one of these buttons.
        An appropriate display appears upon a succesful Mode change. I've also added a
        chart so you won't have to memorize this.. :P

                   *- DURING TAUNT2

 	      BUTTON:      MODE:     DISPLAY

  	        (x)    -   Kyo'98    -   Mode: Kyo'98

		(y)    -   Kyo'95    -   Mode: Kyo'95

 		(z)    -   Kyo'2K    -   Mode: Kyo'2K

 		(a)    -   Kyo-1     -   Mode: Kyo-1

 		(b)    -   Kyo-2     -   Mode: Kyo-2

                (c)    -   Kyo'99    -   Mode: Kyo'99

                (s)    -   Mix       -   Mode: Kyo-Mix

              (x)+(y)  -   Kyo'2001  -   Mode: Kyo'2001

 --------------------------------------------------------------------------------------------

 --------------------------------------------------------------------------------------------
 *** STRIKER SYSTEM ***

 NOTE: NeoKyo's Striker System works like KOF '2000. You get 3 Striker Bombs for the
       first round, then adds another one for the next rounds. You can call a striker
       Anytime except when being hit or thrown and when doing DM/SDMs (ACTIVE STRIKER SYSTEM).
       You can also add striker bombs by using taunt2 which costs 1 power stock.

 STRIKER ON/OFF TOGGLE:
 During 1st Round Intro, you can enable/disable use of striker by pressing back or forward
 There is no default striker toggle, It randomly toggles on/off before round 1. So be sure
 to pick your striker preference by not skipping the intro in round 1.
 Forward - Striker: On
 Back    - Striker: Off

 ALTERNATIVE STRIKER:
 NeoKyo can now choose between 4 strikers (A_iori, Kyoko, Syo & Saisyu), while Kyo can shoose 
 between 3(Shingo, Goro and Benimaru). You can change strikers by pressing lp+hk.

 (y)+(a) - Striker Summon

 (x)+(b) - Striker Change

 Down+start - Taunt2 adds 1 striker bomb and uses 1 power stock

 STRIKER DESCRIPTIONS FOR NEOKYO:

 1. A_iori : -KOF2000 attack-     Jump in Kick then rainbow attack (OTGs)
 2. Kyoko  : -KOF2000 attack-     R.E.D. kick then shiki kai.
 3. Syo    : -KOF2000 attack-     Head dive then burning upper.
 4. Saisyu : -SETH style KOF2000- Jump in Kick, land and stand, then walk.
                                  Auto attacks when enemy is in range.

 STRIKER DESCRIPTIONS FOR CLASSIC KYO:

 1. Shingo Yabuki    : -KOF'99 attack- Jump in Kick, run forward then grabs the enemy's foot.
 2. Goro Daimon      : -Smart attack-  Jump in Kick, wait, then uses either double throw, earth
                                       quake or Cloud slam depending on enemy's position.
 3. Benimaru Nikaido : -Mix attack-    Jump in Air Raijiken, then flip kick.

 --------------------------------------------------------------------------------------------
 *** ARTIFICIAL INTELLIGENCE SYSTEM ***

 NeoKyo has a 3 level AI. All you have to do is edit neoKyo.def using notepad.

 cmd      = neokyo.cmd        	   ;Hard Ai
 ;cmd      = neomedai.cmd          ;Medium level Ai
 ;cmd      = neonoai.cmd           ;Low level Ai

 cmd      = kyo.cmd        	   ;Hard Ai
 ;cmd      = kyomedai.cmd          ;Medium level Ai
 ;cmd      = kyonoai.cmd           ;Low level Ai


 Just remove the semicolon AT THE START OF THE LINE before the ai level of your choice and make
 sure the unwanted levels have semicolon before them. In the example above, it is setup to use
 Hard level AI.

 --------------------------------------------------------------------------------------------

 --------------------------------------------------------------------------------------------
 *** COMMANDS MOVES ***

 -* I used the idle buttons (z,c) as DM shortcuts. YOU CAN REMOVE THESE SHORTCUTS!!!
    You'll just have to delete the shortcut cmd portion in the .cmd file you are using.
    You can also set it to "roll" for dodge and "shingo" for striker.

 For the complete moves and commands, see Cmds.txt
 --------------------------------------------------------------------------------------------

 --------------------------------------------------------------------------------------------
 *** HISTORY ***

 To see the progress and to know what's new on this release, see History.txt
 --------------------------------------------------------------------------------------------

 --------------------------------------------------------------------------------------------
 *** Disclaimer ***

 Mugen and all related stuff is free as far as I know so if you bought this....
 You've been spoofed!! All the files included in the zip file(s) are mine... 
 Almost all the sprites and sounds are from SNK, I only ripped and programmed it for M.U.G.E.N.
 I will not be held responsible for any damage these files can do to your computer 
 or to your life. These files are not considered roms, emulator, warez etc.
 You can modify this, BUT LET ME KNOW IF YOU ARE TO RELEASE IT PUBLICLY.
 Also DON'T USE THE EDITED SPRITES, THOSE WERE NOT MADE BY ME, YOU SHOULD ASK KADDET FIRST. 
 If you think some of my codings, ideas, rips etc. helped you... Don't Forget to credit me :)
 --------------------------------------------------------------------------------------------

 --------------------------------------------------------------------------------------------
 *** CREDITS: ***


        SNK NEOGEO - For making my favorite game... The King of Fighters! and for making
                     my all time favorite character... Kyo Kusanagi!

        ELECBYTE   - For making M.U.G.E.N... the Best 2D fighting game engine! 

        NEORAGEX   - For the rips and for the "arcade at home" fun!

        NEOJUKE    - Sound rips

        NeoGouki   - I used Neokyo Sprites (thus the name neoKyo).
                     He also answers a lot of my stupid questions.. :P

        Kaddet     - For the KOF2001 SDM edits and the dodge/charge up edits.

        Ruddy(R.B.)- For the kototsuki you and oboro goruma edits.

        Ses'MCM    - For making mugen life a bit more bearable.

        Rag's MEE  - For making mugen life a lot more bearable.

        Shin_DIO   - For a lot of sound rips and for working on special intros.

        Yongming   - I learned everything about new mugen from his characters.

        Sorrowedge - For a lot of help while I was starting.

        J[E]NUS    - For his continuous command issues and beta testing.

        [K3nShiN]  - For his Quick Edit Program.

        K_Kusanag  - For his GBKyo's Readme and his great beta testing help.

        Tenshin    - For beta testing.

        People at the Mugen Boards - For some help and a lot of frustrations...

        People at #Mugen - For being fun, idle and of some help... XD

        Zyke    - For being the cute mini me that he is :P.

	Paula	- For sticking with me through thick and thin.

        JESUS   - Whom everything is of and for...

        ME..(SANDER71113) - For wasting my time in completing this ambitious project.

        And to everyone who enjoys M.U.G.E.N...

        If you think you deserve to be acknowledged email me..
 ---------------------------------------------------------------------------------------------

 ---------------------------------------------------------------------------------------------
 *** ABOUT ***

 For bugs and comments suggestions whatever email me at:

 EMAIL   :   sander71113@gmail.com

 WEB PAGE:   http://go.to/sander71113
             http://www.angelfire.com/jazz/sander71113

 ---------------------------------------------------------------------------------------------

===================================== END OF README.TXT =========================================