script_author('Realluz')
script_version('0.1')
require 'lib.moonloader'
require "lib.sampfuncs"
local jopkanegra = require('moonloader').download_status
local samp = require 'lib.samp.events'
local inicfg = require 'inicfg'
local memory = require 'memory'
local imgui = require 'imgui'
local encoding = require "encoding"
local ffi = require 'ffi'
local active = true
local versya = 1
local versyaforuser = '1.00'
local nyjnaobnova = false
local ssilkadlyaini = 'https://raw.githubusercontent.com/Aegsdgds/autoupdatetest/main/update.ini' -- ÀÍÒÎÍ ÍÅ ÇÀÁÓÄÜ ÑÑÛËÊÓ'
local mesto = getWorkingDirectory()..'updatingcheat.ini'
local ssilfafile = '' --ÑÑÛËÊÓ
local patch = thisScript().patch  
encoding.default = 'CP1251'
u8 = encoding.UTF8
local elements = {
	checkbox = {
		WHSkeleton = imgui.ImBool(false),
		DriveNoLicenze = imgui.ImBool(false),
		NoFreeze = imgui.ImBool(false),
		ChatT = imgui.ImBool(false),
		AutoShot = imgui.ImBool(false),
		AntiStun = imgui.ImBool(false),
		CHelper = imgui.ImBool(false),
		Bhop = imgui.ImBool(true),
		AutoC = imgui.ImBool(false),
		InifinityRun = imgui.ImBool(true),
		NoSpread = imgui.ImBool(false),
		InfinityAmmo = imgui.ImBool(false),
		Inv = imgui.ImBool(false),
		Aim = imgui.ImBool(false),
		SafeScreen = imgui.ImBool(true),
		CollizionOb = imgui.ImBool(false),
		SetSpeedAnim = imgui.ImBool(false),
		AntiAfk = imgui.ImBool(false),
		NameTag = imgui.ImBool(false),
		NoFall = imgui.ImBool(false),
		InfinityOxygen = imgui.ImBool(false),
		NoBike = imgui.ImBool(false),
		CarShot = imgui.ImBool(false),
		FireResistance = imgui.ImBool(false),
		GRadar = imgui.ImBool(false),
		BlockedPlayer = imgui.ImBool(false),
		JBMX = imgui.ImBool(false),
		InfinityHealth = imgui.ImBool(false),
		MJump = imgui.ImBool(false),
		ClearDl = imgui.ImBool(false),
		AntiBlockCar = imgui.ImBool(false),
		MStop = imgui.ImBool(false),
		AntiCarSkill = imgui.ImBool(false),
		AntiZP = imgui.ImBool(false),
		AntiEject = imgui.ImBool(false),
		DriveInWater = imgui.ImBool(false),
		AntiBoomPDownCar = imgui.ImBool(false),
		NoRadio = imgui.ImBool(false),
		NoEatAll = imgui.ImBool(false),
		Rvanka = imgui.ImBool(false),
		ForClad = imgui.ImBool(false),
		NarkoWH = imgui.ImBool(false),
		ShowDialog = imgui.ImBool(false),
		Spectate = imgui.ImBool(false),
		NHealth = imgui.ImBool(false),
		GiveGun = imgui.ImBool(false),
		ResetGun = imgui.ImBool(false),
		SetGun = imgui.ImBool(false),
		RequestClass = imgui.ImBool(false),
		RequestSpawn = imgui.ImBool(false),
		ApplyAnimation = imgui.ImBool(false),
		ClearAnimation = imgui.ImBool(false),
		ForceClass = imgui.ImBool(false),
		FacingAngle = imgui.ImBool(false),
		ToggleControl = imgui.ImBool(false),
		Traicer = imgui.ImBool(false),
		AntiRv = imgui.ImBool(false),
		Ghost = imgui.ImBool(false),
		AntiRecon = imgui.ImBool(false),
		Lugs = imgui.ImBool(false)
	},
}

local HLcfg = inicfg.load({
	config = {
		Lugs = elements.checkbox.Lugs.v,
		AntiRecon = elements.checkbox.AntiRecon.v,
		Ghost = elements.checkbox.Ghost.v,
		Traicer = elements.checkbox.Traicer.v,
		ToggleControl = elements.checkbox.ToggleControl.v,
		FacingAngle = elements.checkbox.FacingAngle.v,
		ForceClass = elements.checkbox.ForceClass.v,
		ClearAnimation = elements.checkbox.ClearAnimation.v,
		ApplyAnimation = elements.checkbox.ApplyAnimation.v,
		RequestSpawn = elements.checkbox.RequestSpawn.v,
		RequestClass = elements.checkbox.RequestClass.v,
		SetGun = elements.checkbox.SetGun.v,
		ResetGun = elements.checkbox.ResetGun.v,
		GiveGun = elements.checkbox.GiveGun.v,
		NHealth = elements.checkbox.NHealth.v,
		Spectate = elements.checkbox.Spectate.v,
		ShowDialog = elements.checkbox.ShowDialog.v,
		NarkoWH = elements.checkbox.NarkoWH.v,
		ForClad = elements.checkbox.ForClad.v,
		WHSkeleton = elements.checkbox.WHSkeleton.v,
		Rvanka = elements.checkbox.Rvanka.v,
		NoEatAll = elements.checkbox.NoEatAll.v,
		NoRadio = elements.checkbox.NoRadio.v,
		AntiBoomPDownCar = elements.checkbox.AntiBoomPDownCar.v,
		DriveInWater = elements.checkbox.DriveInWater.v,
		AntiEject = elements.checkbox.AntiEject.v,
		AntiZP = elements.checkbox.AntiZP.v,
		AntiCarSkill = elements.checkbox.AntiCarSkill.v,
		MStop = elements.checkbox.MStop.v,
		AntiBlockCar = elements.checkbox.AntiBlockCar.v,
		ClearDl = elements.checkbox.ClearDl.v,
		MJump = elements.checkbox.MJump.v,
		InfinityHealth = elements.checkbox.InfinityHealth.v,
		JBMX = elements.checkbox.JBMX.v,
		DriveNoLicenze = elements.checkbox.DriveNoLicenze.v,
		NoFreeze = elements.checkbox.NoFreeze.v,
		BlockedPlayer = elements.checkbox.BlockedPlayer.v,
		GRadar = elements.checkbox.GRadar.v,
		ChatT = elements.checkbox.ChatT.v,
		FireResistance = elements.checkbox.FireResistance.v,
		CarShot = elements.checkbox.CarShot.v,
		NoBike = elements.checkbox.NoBike.v,
		InfinityOxygen = elements.checkbox.InfinityOxygen.v,
		NoFall = elements.checkbox.NoFall.v,
		NameTag = elements.checkbox.NameTag.v,
		AntiAfk = elements.checkbox.AntiAfk.v,
		SetSpeedAnim = elements.checkbox.SetSpeedAnim.v,
		CollizionOb = elements.checkbox.CollizionOb.v,
		AutoShot = elements.checkbox.AutoShot.v,
		AntiStun = elements.checkbox.AntiStun.v,
		CHelper = elements.checkbox.CHelper.v,
		Bhop = elements.checkbox.Bhop.v,
		AutoC = elements.checkbox.AutoC.v,
		InifinityRun = elements.checkbox.InifinityRun.v,
		NoSpread = elements.checkbox.NoSpread.v,
		InfinityAmmo = elements.checkbox.InfinityAmmo.v,
		Inv = elements.checkbox.Inv.v,
		Aim = elements.checkbox.Aim.v,
		SafeScreen = elements.checkbox.SafeScreen.v,
		AntiRv = elements.checkbox.AntiRv.v
	}
}, 'SS.ini')

function load_ini()
	local ini_file = inicfg.load(HLcfg, 'SS.ini')
	if ini_file then
		elements.checkbox.Lugs.v = ini_file.config.Lugs
		elements.checkbox.AntiRecon.v = ini_file.config.AntiRecon
		elements.checkbox.Ghost.v = ini_file.config.Ghost
		elements.checkbox.AntiRv.v = ini_file.config.AntiRv
		elements.checkbox.Traicer.v = ini_file.config.Traicer
		elements.checkbox.ToggleControl.v = ini_file.config.ToggleControl
		elements.checkbox.FacingAngle.v = ini_file.config.FacingAngle
		elements.checkbox.ForceClass.v = ini_file.config.ForceClass
		elements.checkbox.ClearAnimation.v = ini_file.config.ClearAnimation
		elements.checkbox.ApplyAnimation.v = ini_file.config.ApplyAnimation
		elements.checkbox.RequestSpawn.v = ini_file.config.RequestSpawn
		elements.checkbox.RequestClass.v = ini_file.config.RequestClass
		elements.checkbox.SetGun.v = ini_file.config.SetGun
		elements.checkbox.ResetGun.v = ini_file.config.ResetGun
		elements.checkbox.GiveGun.v = ini_file.config.GiveGun
		elements.checkbox.NHealth.v = ini_file.config.NHealth
		elements.checkbox.Spectate.v = ini_file.config.Spectate
		elements.checkbox.ShowDialog.v = ini_file.config.ShowDialog
		elements.checkbox.NarkoWH.v = ini_file.config.NarkoWH
		elements.checkbox.ForClad.v = ini_file.config.ForClad
		elements.checkbox.WHSkeleton.v = ini_file.config.WHSkeleton
		elements.checkbox.Rvanka.v = ini_file.config.Rvanka
		elements.checkbox.NoEatAll.v = ini_file.config.NoEatAll
		elements.checkbox.NoRadio.v = ini_file.config.NoRadio
		elements.checkbox.AntiBoomPDownCar.v = ini_file.config.AntiBoomPDownCar
		elements.checkbox.DriveInWater.v = ini_file.config.DriveInWater
		elements.checkbox.AntiEject.v = ini_file.config.AntiEject
		elements.checkbox.AntiZP.v = ini_file.config.AntiZP
		elements.checkbox.AntiCarSkill.v = ini_file.config.AntiCarSkill
		elements.checkbox.MStop.v = ini_file.config.MStop
		elements.checkbox.AntiBlockCar.v = ini_file.config.AntiBlockCar
		elements.checkbox.ClearDl.v = ini_file.config.ClearDl
		elements.checkbox.MJump.v = ini_file.config.MJump
		elements.checkbox.InfinityHealth.v = ini_file.config.InfinityHealth
		elements.checkbox.JBMX.v = ini_file.config.JBMX
		elements.checkbox.DriveNoLicenze.v = ini_file.config.DriveNoLicenze
		elements.checkbox.NoFreeze.v = ini_file.config.NoFreeze
		elements.checkbox.BlockedPlayer.v = ini_file.config.BlockedPlayer
		elements.checkbox.GRadar.v = ini_file.config.GRadar
		elements.checkbox.ChatT.v = ini_file.config.ChatT
		elements.checkbox.FireResistance.v = ini_file.config.FireResistance
		elements.checkbox.CarShot.v = ini_file.config.CarShot
		elements.checkbox.NoBike.v = ini_file.config.NoBike
		elements.checkbox.InfinityOxygen.v = ini_file.config.InfinityOxygen
		elements.checkbox.NoFall.v = ini_file.config.NoFall
		elements.checkbox.NameTag.v = ini_file.config.NameTag
		elements.checkbox.AntiAfk.v = ini_file.config.AntiAfk
		elements.checkbox.SetSpeedAnim.v = ini_file.config.SetSpeedAnim
		elements.checkbox.CollizionOb.v = ini_file.config.CollizionOb
		elements.checkbox.AutoShot.v = ini_file.config.AutoShot
		elements.checkbox.AntiStun.v = ini_file.config.AntiStun
		elements.checkbox.CHelper.v = ini_file.config.CHelper
		elements.checkbox.Bhop.v = ini_file.config.Bhop
		elements.checkbox.AutoC.v = ini_file.config.AutoC
		elements.checkbox.InifinityRun.v = ini_file.config.InifinityRun
		elements.checkbox.NoSpread.v = ini_file.config.NoSpread
		elements.checkbox.InfinityAmmo.v = ini_file.config.InfinityAmmo
		elements.checkbox.Inv.v = ini_file.config.Inv
		elements.checkbox.Aim.v = ini_file.config.Aim
		elements.checkbox.SafeScreen.v = ini_file.config.SafeScreen
	else
		HLcfg.config.Lugs = elements.checkbox.Lugs.v
		HLcfg.config.AntiRecon = elements.checkbox.AntiRecon.v
		HLcfg.config.Ghost = elements.checkbox.Ghost.v
		HLcfg.config.AntiRv = elements.checkbox.AntiRv.v
		HLcfg.config.Traicer = elements.checkbox.Traicer.v 
		HLcfg.config.ToggleControl = elements.checkbox.ToggleControl.v
		HLcfg.config.FacingAngle = elements.checkbox.FacingAngle.v
		HLcfg.config.ForceClass = elements.checkbox.ForceClass.v
		HLcfg.config.ClearAnimation = elements.checkbox.ClearAnimation.v
		HLcfg.config.ApplyAnimation = elements.checkbox.ApplyAnimation.v
		HLcfg.config.RequestSpawn = elements.checkbox.RequestSpawn.v
		HLcfg.config.RequestClass = elements.checkbox.RequestClass.v
		HLcfg.config.SetGun = elements.checkbox.SetGun.v
		HLcfg.config.ResetGun = elements.checkbox.ResetGun.v
		HLcfg.config.GiveGun = elements.checkbox.GiveGun.v
		HLcfg.config.NHealth = elements.checkbox.NHealth.v
		HLcfg.config.Spectate = elements.checkbox.Spectate.v
		HLcfg.config.ShowDialog = elements.checkbox.ShowDialog.v
		HLcfg.config.NarkoWH = elements.checkbox.NarkoWH.v
		HLcfg.config.ForClad = elements.checkbox.ForClad.v
		HLcfg.config.WHSkeleton = elements.checkbox.WHSkeleton.v
		HLcfg.config.Rvanka = elements.checkbox.Rvanka.v
		HLcfg.config.NoEatAll = elements.checkbox.NoEatAll.v
		HLcfg.config.NoRadio = elements.checkbox.NoRadio.v
		HLcfg.config.AntiBoomPDownCar = elements.checkbox.AntiBoomPDownCar.v
		HLcfg.config.DriveInWater = elements.checkbox.DriveInWater.v
		HLcfg.config.AntiEject = elements.checkbox.AntiEject.v
		HLcfg.config.AntiZP = elements.checkbox.AntiZP.v
		HLcfg.config.AntiCarSkill = elements.checkbox.AntiCarSkill.v
		HLcfg.config.MStop = elements.checkbox.MStop.v
		HLcfg.config.AntiBlockCar = elements.checkbox.AntiBlockCar.v
		HLcfg.config.ClearDl = elements.checkbox.ClearDl.v 
		HLcfg.config.MJump = elements.checkbox.MJump.v
		HLcfg.config.InfinityHealth = elements.checkbox.InfinityHealth.v
		HLcfg.config.JBMX = elements.checkbox.JBMX.v
		HLcfg.config.DriveNoLicenze = elements.checkbox.DriveNoLicenze.v
		HLcfg.config.BlockedPlayer = elements.checkbox.BlockedPlayer.v
		HLcfg.config.GRadar = elements.checkbox.GRadar.v
		HLcfg.config.ChatT = elements.checkbox.ChatT.v
		HLcfg.config.FireResistance = elements.checkbox.FireResistance.v
		HLcfg.config.CarShot = elements.checkbox.CarShot.v
		HLcfg.config.NoBike = elements.checkbox.NoBike.v
		HLcfg.config.InfinityOxygen = elements.checkbox.InfinityOxygen.v
		HLcfg.config.NoFall = elements.checkbox.NoFall.v
		HLcfg.config.NameTag = elements.checkbox.NameTag.v
		HLcfg.config.AntiAfk = elements.checkbox.AntiAfk.v
		HLcfg.config.SetSpeedAnim = elements.checkbox.SetSpeedAnim.v
		HLcfg.config.CollizionOb = elements.checkbox.CollizionOb.v
		HLcfg.config.AutoShot = elements.checkbox.AutoShot.v
		HLcfg.config.AntiStun = elements.checkbox.AntiStun.v
		HLcfg.config.CHelper = elements.checkbox.CHelper.v
		HLcfg.config.Bhop = elements.checkbox.Bhop.v
		HLcfg.config.AutoC = elements.checkbox.AutoC.v
		HLcfg.config.InifinityRun = elements.checkbox.InifinityRun.v
		HLcfg.config.NoSpread = elements.checkbox.NoSpread.v
		HLcfg.config.InfinityAmmo = elements.checkbox.InfinityAmmo.v
		HLcfg.config.Inv = elements.checkbox.Inv.v
		HLcfg.config.Aim = elements.checkbox.Aim.v
		HLcfg.config.SafeScreen = elements.checkbox.SafeScreen.v
	end
end

all_anims = {'abseil', 'arrestgun', 'atm', 'bike_elbowl', 'bike_elbowr', 'bike_fallr', 'bike_fall_off', 'bike_pickupl', 'bike_pickupr', 'bike_pullupl', 'bike_pullupr', 'bomber', 'car_alignhi_lhs', 'car_alignhi_rhs', 'car_align_lhs', 'car_align_rhs', 'car_closedoorl_lhs', 'car_closedoorl_rhs', 'car_closedoor_lhs', 'car_closedoor_rhs', 'car_close_lhs', 'car_close_rhs', 'car_crawloutrhs', 'car_dead_lhs', 'car_dead_rhs', 'car_doorlocked_lhs', 'car_doorlocked_rhs', 'car_fallout_lhs', 'car_fallout_rhs', 'car_getinl_lhs', 'car_getinl_rhs', 'car_getin_lhs', 'car_getin_rhs', 'car_getoutl_lhs', 'car_getoutl_rhs', 'car_getout_lhs', 'car_getout_rhs', 'car_hookertalk', 'car_jackedlhs', 'car_jackedrhs', 'car_jumpin_lhs', 'car_lb', 'car_lb_pro', 'car_lb_weak', 'car_ljackedlhs', 'car_ljackedrhs', 'car_lshuffle_rhs', 'car_lsit', 'car_open_lhs', 'car_open_rhs', 'car_pulloutl_lhs', 'car_pulloutl_rhs', 'car_pullout_lhs', 'car_pullout_rhs', 'car_qjacked', 'car_rolldoor', 'car_rolldoorlo', 'car_rollout_lhs', 'car_rollout_rhs', 'car_shuffle_rhs', 'car_sit', 'car_sitp', 'car_sitplo', 'car_sit_pro', 'car_sit_weak', 'car_tune_radio', 'climb_idle', 'climb_jump', 'climb_jump2fall', 'climb_jump_b', 'climb_pull', 'climb_stand', 'climb_stand_finish', 'cower', 'crouch_roll_l', 'crouch_roll_r', 'dam_arml_frmbk', 'dam_arml_frmft', 'dam_arml_frmlt', 'dam_armr_frmbk', 'dam_armr_frmft', 'dam_armr_frmrt', 'dam_legl_frmbk', 'dam_legl_frmft', 'dam_legl_frmlt', 'dam_legr_frmbk', 'dam_legr_frmft', 'dam_legr_frmrt', 'dam_stomach_frmbk', 'dam_stomach_frmft', 'dam_stomach_frmlt', 'dam_stomach_frmrt', 'door_lhinge_o', 'door_rhinge_o', 'drivebyl_l', 'drivebyl_r', 'driveby_l', 'driveby_r', 'drive_boat', 'drive_boat_back', 'drive_boat_l', 'drive_boat_r', 'drive_l', 'drive_lo_l', 'drive_lo_r', 'drive_l_pro', 'drive_l_pro_slow', 'drive_l_slow', 'drive_l_weak', 'drive_l_weak_slow', 'drive_r', 'drive_r_pro', 'drive_r_pro_slow', 'drive_r_slow', 'drive_r_weak', 'drive_r_weak_slow', 'drive_truck', 'drive_truck_back', 'drive_truck_l', 'drive_truck_r', 'drown', 'duck_cower', 'endchat_01', 'endchat_02', 'endchat_03', 'ev_dive', 'ev_step', 'facanger', 'facgum', 'facsurp', 'facsurpm', 'factalk', 'facurios', 'fall_back', 'fall_collapse', 'fall_fall', 'fall_front', 'fall_glide', 'fall_land', 'fall_skydive', 'fight2idle', 'fighta_1', 'fighta_2', 'fighta_3', 'fighta_block', 'fighta_g', 'fighta_m', 'fightidle', 'fightshb', 'fightshf', 'fightsh_bwd', 'fightsh_fwd', 'fightsh_left', 'fightsh_right', 'flee_lkaround_01', 'floor_hit', 'floor_hit_f', 'fucku', 'gang_gunstand', 'gas_cwr', 'getup', 'getup_front', 'gum_eat', 'guncrouchbwd', 'guncrouchfwd', 'gunmove_bwd', 'gunmove_fwd', 'gunmove_l', 'gunmove_r', 'gun_2_idle', 'gun_butt', 'gun_butt_crouch', 'gun_stand', 'handscower', 'handsup', 'hita_1', 'hita_2', 'hita_3', 'hit_back', 'hit_behind', 'hit_front', 'hit_gun_butt', 'hit_l', 'hit_r', 'hit_walk', 'hit_wall', 'idlestance_fat', 'idlestance_old', 'idle_armed', 'idle_chat', 'idle_csaw', 'idle_gang1', 'idle_hbhb', 'idle_rocket', 'idle_stance', 'idle_taxi', 'idle_tired', 'jetpack_idle', 'jog_femalea', 'jog_malea', 'jump_glide', 'jump_land', 'jump_launch', 'jump_launch_r', 'kart_drive', 'kart_l', 'kart_lb', 'kart_r', 'kd_left', 'kd_right', 'ko_shot_face', 'ko_shot_front', 'ko_shot_stom', 'ko_skid_back', 'ko_skid_front', 'ko_spin_l', 'ko_spin_r', 'pass_smoke_in_car', 'phone_in', 'phone_out', 'phone_talk', 'player_sneak', 'player_sneak_walkstart', 'roadcross', 'roadcross_female', 'roadcross_gang', 'roadcross_old', 'run_1armed', 'run_armed', 'run_civi', 'run_csaw', 'run_fat', 'run_fatold', 'run_gang1', 'run_left', 'run_old', 'run_player', 'run_right', 'run_rocket', 'run_stop', 'run_stopr', 'run_wuzi', 'seat_down', 'seat_idle', 'seat_up', 'shot_leftp', 'shot_partial', 'shot_partial_b', 'shot_rightp', 'shove_partial', 'smoke_in_car', 'sprint_civi', 'sprint_panic', 'sprint_wuzi', 'swat_run', 'swim_tread', 'tap_hand', 'tap_handp', 'turn_180', 'turn_l', 'turn_r', 'walk_armed', 'walk_civi', 'walk_csaw', 'walk_doorpartial', 'walk_drunk', 'walk_fat', 'walk_fatold', 'walk_gang1', 'walk_gang2', 'walk_old', 'walk_player', 'walk_rocket', 'walk_shuffle', 'walk_start', 'walk_start_armed', 'walk_start_csaw', 'walk_start_rocket', 'walk_wuzi', 'weapon_crouch', 'woman_idlestance', 'woman_run', 'woman_runbusy', 'woman_runfatold', 'woman_runpanic', 'woman_runsexy', 'woman_walkbusy', 'woman_walkfatold', 'woman_walknorm', 'woman_walkold', 'woman_walkpro', 'woman_walksexy', 'woman_walkshop', 'xpressscratch'}
local seres = 0
local radars = {}
local turn = false
local notInCarYet = true
local hookSH = false
local hookAV = false
local actualSpeed = -1
local speedCap = 50
local oldX = 0
local flymode = 0  
local speed = 1.0
local BulletSync = {lastId = 0, maxLines = 20}
for i = 1, BulletSync.maxLines do
	BulletSync[i] = {enable = false, o = {x, y, z}, t = {x, y, z}, time = 0, tType = 0}
end
local radarHud = 0
local time = 0
local keyPressed = 0
local oldY = 0
local oldZ = 0
local distAB = 0
local firstTimeSitInCar = 0
local getBonePosition = ffi.cast("int (__thiscall*)(void*, float*, int, bool)", 0x5E4280)
local DownMenu = imgui.ImBool(true)
local pdate = imgui.ImBool(false)
local MenuWindow = imgui.ImBool(false)
local MenuCheats = imgui.ImBool(false)
local MenuVCheats = imgui.ImBool(false)
local MenuGun = imgui.ImBool(false)
local Other = imgui.ImBool(false)
local MenuPatch = imgui.ImBool(false)
local AmmoGun = imgui.ImBuffer(10)
local selectGun = imgui.ImInt(0)
local ComboGun = {
	[1] = 'Fist[0]',
	[2] = 'Brass knuckles[1]',
	[3] = 'Hockey stick[2]',
	[4] = 'Club[3]',
	[5] = 'Knife[4]',
	[6] = 'Bat[5]',
	[7] = 'Shovel[6]',
	[8] = 'Cue[7]',
	[9] = 'Katana[8]',
	[10] = 'Chainsaw[9]',
	[11] = 'Dildo[10]',
	[12] = 'Dildo[11]',
	[13] = 'Dildo[12]',
	[14] = 'Dildo[13]',
	[15] = 'Bouquet[14]',
	[16] = 'Cane[15]',
	[17] = 'Grenade[16]',
	[18] = 'Gas[17]',
	[19] = 'Molotov cocktail[18]',
	[20] = 'Unknown',
	[21] = 'Unknown',
	[22] = 'Unknown',
	[23] = '9MM[22]',
	[24] = '9mm with silencer[23]',
	[25] = 'Desert Eagle[24]',
	[26] = 'Shotgun[25]',
	[27] = 'Sawed-off[26]',
	[28] = 'Fast Shotgun[27]',
	[29] = 'Uzi[28]',
	[30] = 'MP5[29]',
	[31] = 'AK-47[30]',			
	[32] = 'M4[31]',	
	[33] = 'Tec-9[32]',		
	[34] = 'Sniper rifle[33]',			
	[35] = 'Sniper rifle[34]',			
	[36] = 'RPG[35]',			
	[37] = 'RPG[36]',			
	[38] = 'Flamethrower[37]',			
	[39] = 'Minigun[38]',			
	[40] = 'TNT bag[39]',			
	[41] = 'Detonator[40]',			
	[42] = 'Spray can[41]',			
	[43] = 'Fire extinguisher[42]',			
	[44] = 'Camera[43]',		
	[45] = 'Thermal imager[44]',			
	[46] = 'Thermal imager[45]'	,		
	[47] = 'Parachute[46]'			
}

function main()
	load_ini()
	if not isSampfuncsLoaded() or not isSampLoaded() then return end
	while not isSampAvailable() do wait(100) end 
	wait(4000)
	--[[
	WHSkeleton  AppleThe & hnnssy
	     cover
	FuckRadar By Trefa
	     .
	CamHack  sanek a.k.a Maks_Fender, edited by ANIKI
	]]

	downloadUrlToFile(ssilkadlyaini ,mesto ,function(id, status)
		if status == jopkanegra.STATUS_ENDDOWNLOADDATA then
			iniupdat = inicfg.load(nil , mesto)
			if tonumber(iniupdat.settings.ver) > versya then
				sampAddChatMessage("pipiska", -1)
				nyjnaobnova = true
				os.remove(mesto)
			end
		end
	end)
	sampRegisterChatCommand('update', function()
		pdate.v = not pdate.v
	end)
	sampRegisterChatCommand('/re', function(number)
		if number ~= '' then
			if number ~= '(%d+)' then
				lua_thread.create(function()
					sampDisconnectWithReason(1)
					wait(number*1000)
					sampSetGamestate(1)
				end)
			else
				sampAddChatMessage('{FF0000}[] {FF8C00}    .', 0xFFFF0000)
			end
		else
			sampAddChatMessage('{FF0000}[] {FF8C00}  .', 0xFFFF0000)
		end
	end)
	font = renderCreateFont("Arial", 9, FCR_BORDER + FCR_BOLD)
	rel()
	spreadval = memory.getfloat(0x8D2E64)
	address = sampGetBase() + 0xD83A8
	while true do
		wait(0)
		if nyjnaobnova then
			downloadUrlToFile(ssilfafile , mesto ,function(id, status)
				if status == jopkanegra.STATUS_ENDDOWNLOADDATA then
					sampAddChatMessage('Ñêðèïò îáíîâë¸í!')
					thisScript():reload()
				end
			end)
			break
		end
		imgui.Process = true
		if not MenuWindow.v and not pdate.v and not DownMenu.v and not MenuWindow.v and not MenuCheats.v and not MenuVCheats.v and not MenuGun.v and not Other.v then
			imgui.ShowCursor = false
		end
		if isKeyJustPressed(VK_F12) and not sampIsChatInputActive() and not sampIsDialogActive() then active = not active end
		if active then
			DownMenu.v = true
			check_buttons()
		else
			DownMenu.v = false MenuWindow.v = false MenuCheats.v = false MenuVCheats.v = false MenuGun.v = false Other.v = false
			box = nil
		end
	end
end

function imgui.OnDrawFrame()
	
	if DownMenu.v then
		imgui.ShowCursor = false
		local ex, ey = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(-2, ey - 30), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowSize(imgui.ImVec2(5000, 20), imgui.Cond.FirstUseEver)
		imgui.Begin(u8'##Menu', nil, imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoMove)
		imgui.Text('  Health: '..getCharHealth(playerPed)) imgui.SameLine()
		imgui.Text(u8'  |') imgui.SameLine()
		if elements.checkbox.Inv.v then
			green('Inv') imgui.SameLine()
		else
			red('Inv') imgui.SameLine()
		end
		imgui.Text('|') imgui.SameLine()
		if elements.checkbox.Bhop.v then
			green('Bhop') imgui.SameLine() 
		else
			red('Bhop') imgui.SameLine()
		end
		imgui.Text('|') imgui.SameLine()
		if elements.checkbox.Aim.v then
			green('Aim') imgui.SameLine()
		else
			red('Aim') imgui.SameLine()
		end
		imgui.Text('|') imgui.SameLine()
		if elements.checkbox.InifinityRun.v then
			green('Infinity Run') imgui.SameLine()
		else
			red('Infinity Run') imgui.SameLine()
		end
		imgui.Text('|') imgui.SameLine()
		if elements.checkbox.AntiStun.v then
			green('AntiStun') imgui.SameLine()
		else
			red('AntiStun') imgui.SameLine()
		end
		imgui.Text('|') imgui.SameLine()
		if elements.checkbox.NoSpread.v then
			green('NoSpread') imgui.SameLine()
		else
			red('NoSpread') imgui.SameLine()
		end
		imgui.Text('|') imgui.SameLine()
		if elements.checkbox.InfinityAmmo.v then
			green('Infinity Ammo') imgui.SameLine()
		else
			red('Infinity Ammo') imgui.SameLine()
		end
		imgui.Text('|') imgui.SameLine()
		if elements.checkbox.SafeScreen.v then
			green('SafeScreen') imgui.SameLine()
		else
			red('SafeScreen') imgui.SameLine()
		end
		imgui.Text('|') imgui.SameLine()
		if elements.checkbox.AutoC.v then
			green('Auto +C') imgui.SameLine()
		else
			red('Auto +C') imgui.SameLine()
		end
		imgui.Text('|') imgui.SameLine()
		if elements.checkbox.NameTag.v then
			green('NameTag') imgui.SameLine()
		else
			red('NameTag') imgui.SameLine()
		end
		imgui.Text('|') imgui.SameLine()
		if elements.checkbox.AutoShot.v then
			green('TriggerBot') imgui.SameLine()
		else
			red('TriggerBot') imgui.SameLine()
		end
		imgui.End()
	end
	if pdate.v then
		imgui.ShowCursor = true
		local ex, ey = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(-2 + 1187, ey / 2 + 110), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowSize(imgui.ImVec2(217, 300), imgui.Cond.FirstUseEver)
		imgui.Begin(u8'Îáíîâëåíèå',pdate, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize)
		imgui.Text(zaebis)
		imgui.Button('asfadfg', imgui.ImVec2(10, 10))
		imgui.End()
	end
	if MenuWindow.v then
		imgui.ShowCursor = true
		local ex, ey = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(-2 + 1187, ey / 2 + 110), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowSize(imgui.ImVec2(217, 300), imgui.Cond.FirstUseEver)
		imgui.Begin(u8'-', MenuWindow, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize)
		if imgui.Button(u8'', imgui.ImVec2(200, 50)) then
			MenuWindow.v = false
			MenuCheats.v = true
		end
		if imgui.Button(u8' ', imgui.ImVec2(200, 50)) then
			MenuWindow.v = false
			MenuVCheats.v = true
		end
		if imgui.Button(u8'', imgui.ImVec2(200, 50)) then
			MenuWindow.v = false
			MenuGun.v = true
		end
		if imgui.Button(u8'Nops', imgui.ImVec2(200, 50)) then
			MenuWindow.v = false
			MenuPatch.v = true
		end
		if imgui.Button(u8'', imgui.ImVec2(200, 50)) then
			MenuWindow.v = false
			Other.v = true
		end
		imgui.End()
	end
	if MenuCheats.v then
		imgui.ShowCursor = true
		local ex, ey = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(ex / 2 - 200, ey / 2 - 200), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowSize(imgui.ImVec2(280, 300), imgui.Cond.FirstUseEver)
		imgui.Begin(u8'', nil, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize)
		if imgui.Button(u8' <<', imgui.ImVec2(250, 30)) then
			MenuCheats.v = false
			MenuWindow.v = true
		end
		if imgui.Checkbox(u8'[/] CBug Helper', elements.checkbox.CHelper) then
			HLcfg.config.CHelper = elements.checkbox.CHelper.v
			save()
		end
		if imgui.Checkbox(u8'[/]  ', elements.checkbox.InfinityAmmo) then
			HLcfg.config.InfinityAmmo = elements.checkbox.InfinityAmmo.v
			save()
		end
		if imgui.Checkbox(u8'[/] NoSpread', elements.checkbox.NoSpread) then
			HLcfg.config.NoSpread = elements.checkbox.NoSpread.v
			save()
		end
		if imgui.Checkbox(u8'[/] AntiStun', elements.checkbox.AntiStun) then
			HLcfg.config.AntiStun = elements.checkbox.AntiStun.v
			save()
		end
		if imgui.Checkbox(u8'[/]  ', elements.checkbox.InifinityRun) then
			HLcfg.config.InifinityRun = elements.checkbox.InifinityRun.v
			save()
		end
		if imgui.Checkbox(u8'[/]  +', elements.checkbox.AutoC) then
			HLcfg.config.AutoC = elements.checkbox.AutoC.v
			save()
		end
		if imgui.Checkbox(u8'[/] ', elements.checkbox.Aim) then
			HLcfg.config.Aim = elements.checkbox.Aim.v
			save()
		end
		if imgui.Checkbox(u8'[/] Bhop Mode', elements.checkbox.Bhop) then
			HLcfg.config.Bhop = elements.checkbox.Bhop.v
			save()
		end
		if imgui.Checkbox(u8'[/] ', elements.checkbox.Inv) then
			HLcfg.config.Inv = elements.checkbox.Inv.v
			save()
		end
		if imgui.Checkbox(u8'[/]  ', elements.checkbox.CollizionOb) then
			HLcfg.config.CollizionOb = elements.checkbox.CollizionOb.v
			save()
		end
		if imgui.Checkbox(u8'[+/-]  ', elements.checkbox.SetSpeedAnim) then
			HLcfg.config.SetSpeedAnim = elements.checkbox.SetSpeedAnim.v
			save()
		end
		if imgui.Checkbox(u8'[/] -', elements.checkbox.AntiAfk) then
			HLcfg.config.AntiAfk = elements.checkbox.AntiAfk.v
			save()
		end
		if imgui.Checkbox(u8'[/] NameTag', elements.checkbox.NameTag) then
			HLcfg.config.NameTag = elements.checkbox.NameTag.v
			save()
		end
		if imgui.Checkbox(u8'[/] NoFall', elements.checkbox.NoFall) then
			HLcfg.config.NoFall = elements.checkbox.NoFall.v
			save()
		end
		if imgui.Checkbox(u8'[/]  ', elements.checkbox.InfinityOxygen) then
			HLcfg.config.InfinityOxygen = elements.checkbox.InfinityOxygen.v 
			save()
		end
		if imgui.Checkbox(u8'[/] NoBike', elements.checkbox.NoBike) then
			HLcfg.config.NoBike = elements.checkbox.NoBike.v
			save()
		end
		if imgui.Checkbox(u8'[/] ', elements.checkbox.FireResistance) then
			HLcfg.config.FireResistance = elements.checkbox.FireResistance.v
			save()
		end
		if imgui.Checkbox(u8'[/]   ', elements.checkbox.DriveNoLicenze) then
			HLcfg.config.DriveNoLicenze = elements.checkbox.DriveNoLicenze.v
			save()
		end
		if imgui.Checkbox(u8'[/] TriggerBot', elements.checkbox.AutoShot) then
			HLcfg.config.AutoShot = elements.checkbox.AutoShot.v
			save()
		end
		if imgui.Checkbox(u8'[/] High jump on BMX', elements.checkbox.JBMX) then
			HLcfg.config.JBMX = elements.checkbox.JBMX.v
			save()
		end
		if imgui.Checkbox(u8'[/]  ', elements.checkbox.InfinityHealth) then
			HLcfg.config.InfinityHealth = elements.checkbox.InfinityHealth.v
			save()
		end
		if imgui.Checkbox(u8'[/]  ', elements.checkbox.MJump) then
			HLcfg.config.MJump = elements.checkbox.MJump.v
			save()
		end
		if imgui.Checkbox(u8'[/] - ', elements.checkbox.AntiBlockCar) then
			HLcfg.config.AntiBlockCar = elements.checkbox.AntiBlockCar.v
			save()
		end
		if imgui.Checkbox(u8'[/] -', elements.checkbox.AntiZP) then
			HLcfg.config.AntiZP = elements.checkbox.AntiZP.v
			save()
		end
		if imgui.Checkbox(u8'[/]   ', elements.checkbox.DriveInWater) then
			HLcfg.config.DriveInWater = elements.checkbox.DriveInWater.v
			save()
		end
		if imgui.Checkbox(u8'[/] -  ', elements.checkbox.AntiBoomPDownCar) then
			HLcfg.config.AntiBoomPDownCar = elements.checkbox.AntiBoomPDownCar.v
			save()
		end
		if imgui.Checkbox(u8'[/]  ', elements.checkbox.WHSkeleton) then
			HLcfg.config.WHSkeleton = elements.checkbox.WHSkeleton.v
			save()
		end
		if imgui.Checkbox(u8'[/]   [ARZ]', elements.checkbox.ForClad) then
			HLcfg.config.ForClad = elements.checkbox.ForClad.v
			save()
		end
		if imgui.Checkbox(u8'[/]   [ARZ]', elements.checkbox.NarkoWH) then
			HLcfg.config.NarkoWH = elements.checkbox.NarkoWH.v
			save()
		end
		if imgui.Checkbox(u8'[/] ', elements.checkbox.Ghost) then
			HLcfg.config.Ghost = elements.checkbox.Ghost.v
			save()
		end
		imgui.End()
	end
	if MenuVCheats.v then
		imgui.ShowCursor = true
		local ex, ey = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(ex / 2 - 200, ey / 2 - 200), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowSize(imgui.ImVec2(220, 300), imgui.Cond.FirstUseEver)
		imgui.Begin(u8'.', nil, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize)
		if imgui.Button(u8' <<', imgui.ImVec2(200, 30)) then
			MenuVCheats.v = false
			MenuWindow.v = true
		end
		if imgui.Checkbox(u8'[/] CarShot', elements.checkbox.CarShot) then
			HLcfg.config.CarShot = elements.checkbox.CarShot.v
			save()
		end
		if imgui.Checkbox(u8'[/] ', elements.checkbox.Rvanka) then
			HLcfg.config.Rvanka = elements.checkbox.Rvanka.v
			save()
		end
		if imgui.Checkbox(u8'[/] ', elements.checkbox.Lugs) then
			HLcfg.config.Lugs = elements.checkbox.Lugs.v
			save()
		end
		imgui.End()
	end
	if MenuGun.v then
		imgui.ShowCursor = true
		local ex, ey = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(ex / 2 - 200, ey / 2 - 200), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowSize(imgui.ImVec2(250, 180), imgui.Cond.FirstUseEver)
		imgui.Begin(u8' ', nil, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize)
		if imgui.Button(u8' <<', imgui.ImVec2(200, 30)) then
			MenuGun.v = false
			MenuWindow.v = true
		end
		imgui.Text(u8' - ')
		imgui.InputText(u8'##GiveGun', AmmoGun)
		imgui.Text(u8' ')
		imgui.Combo('##COMBO', selectGun, ComboGun)
		if imgui.Button(u8'', imgui.ImVec2(200, 0)) then
			if AmmoGun.v ~= '' then
				checks()
			else
				sampAddChatMessage('{FF0000}[] {FF8C00} - .', 0xFFFF0000)
			end
		end
		imgui.End()
	end
	if Other.v then
		imgui.ShowCursor = true
		local ex, ey = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(ex / 2 - 200, ey / 2 - 200), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowSize(imgui.ImVec2(270, 180), imgui.Cond.FirstUseEver)
		imgui.Begin(u8'', nil, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize)
		if imgui.Button(u8' <<', imgui.ImVec2(250, 30)) then
			Other.v = false
			MenuWindow.v = true
		end
		if imgui.Checkbox(u8'[/]  ', elements.checkbox.SafeScreen) then
			HLcfg.config.SafeScreen = elements.checkbox.SafeScreen.v
			save()
		end
		if imgui.Checkbox(u8'[/]   T', elements.checkbox.ChatT) then
			HLcfg.config.ChatT = elements.checkbox.ChatT
			save()
		end
		if imgui.Checkbox(u8'[/]  ', elements.checkbox.GRadar) then
			HLcfg.config.GRadar = elements.checkbox.GRadar.v
			save()
		end
		if imgui.Checkbox(u8'[/] AntiBlockedPlayer', elements.checkbox.BlockedPlayer) then
			HLcfg.config.BlockedPlayer = elements.checkbox.BlockedPlayer.v 
			save()
		end
		if imgui.Checkbox(u8'[/]  /dl', elements.checkbox.ClearDl) then
			HLcfg.config.ClearDl = elements.checkbox.ClearDl.v
			save()
		end
		if imgui.Checkbox(u8'[/]  ', elements.checkbox.MStop) then
			HLcfg.config.MStop = elements.checkbox.MStop.v
			save()
		end
		if imgui.Checkbox(u8'[/] AntiCarSkill', elements.checkbox.AntiCarSkill) then
			HLcfg.config.AntiCarSkill = elements.checkbox.AntiCarSkill.v
			save()
		end
		if imgui.Checkbox(u8'[/] AntiEject', elements.checkbox.AntiEject) then
			HLcfg.config.AntiEject = elements.checkbox.AntiEject.v
			save()
		end
		if imgui.Checkbox(u8'[/] NoRadio', elements.checkbox.NoRadio) then
			HLcfg.config.NoRadio = elements.checkbox.NoRadio.v
			save()
		end
		if imgui.Checkbox(u8'[/]  " "', elements.checkbox.NoEatAll) then
			HLcfg.config.NoEatAll = elements.checkbox.NoEatAll.v
			save()
		end
		if imgui.Checkbox(u8'[/]  ', elements.checkbox.Traicer) then
			HLcfg.config.Traicer = elements.checkbox.Traicer.v
			save()
		end
		if imgui.Checkbox(u8'[/] -', elements.checkbox.AntiRv) then
			HLcfg.config.AntiRv = elements.checkbox.AntiRv.v
			save()
		end
		if imgui.Checkbox(u8'[/] -', elements.checkbox.AntiRecon) then
			HLcfg.config.AntiRecon = elements.checkbox.AntiRecon.v
			save()
		end
		imgui.End()
	end
	if MenuPatch.v then
		imgui.ShowCursor = true
		local ex, ey = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(ex / 2 - 200, ey / 2 - 200), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowSize(imgui.ImVec2(260, 220), imgui.Cond.FirstUseEver)
		imgui.Begin(u8'Nops', nil, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize)
		if imgui.Button(u8' <<', imgui.ImVec2(200, 30)) then
			MenuPatch.v = false
			MenuWindow.v = true
		end
		if imgui.Checkbox(u8'[/] Nop NoFreeze', elements.checkbox.NoFreeze) then
			HLcfg.config.NoFreeze = elements.checkbox.NoFreeze.v
			save()
		end
		if imgui.Checkbox(u8'[/] Nop ShowDialog', elements.checkbox.ShowDialog) then
			HLcfg.config.ShowDialog = elements.checkbox.ShowDialog.v
			save()
		end
		if imgui.Checkbox(u8'[/] Nop Spectate', elements.checkbox.Spectate) then
			HLcfg.config.Spectate = elements.checkbox.Spectate.v
			save()
		end
		if imgui.Checkbox(u8'[/] Nop Health', elements.checkbox.NHealth) then
			HLcfg.config.NHealth = elements.checkbox.NHealth.v
			save()
		end
		if imgui.Checkbox(u8'[/] Nop GiveGun', elements.checkbox.GiveGun) then
			HLcfg.config.GiveGun = elements.checkbox.GiveGun.v 
			save()
		end
		if imgui.Checkbox(u8'[/] Nop ResetGun', elements.checkbox.ResetGun) then
			HLcfg.config.ResetGun = elements.checkbox.ResetGun.v
			save()
		end
		if imgui.Checkbox(u8'[/] Nop SetGun', elements.checkbox.SetGun) then
			HLcfg.config.SetGun = elements.checkbox.SetGun.v
			save()
		end
		if imgui.Checkbox(u8'[/] Nop RequestClass', elements.checkbox.RequestClass) then
			HLcfg.config.RequestClass = elements.checkbox.RequestClass.v
			save()
		end
		if imgui.Checkbox(u8'[/] Nop RequestSpawn', elements.checkbox.RequestSpawn) then
			HLcfg.config.RequestSpawn = elements.checkbox.RequestSpawn.v
			save()
		end
		if imgui.Checkbox(u8'[/] Nop ApplyAnimation', elements.checkbox.ApplyAnimation) then
			HLcfg.config.ApplyAnimation = elements.checkbox.ApplyAnimation.v
			save()
		end
		if imgui.Checkbox(u8'[/] Nop ClearAnimation', elements.checkbox.ClearAnimation) then
			HLcfg.config.ClearAnimation = elements.checkbox.ClearAnimation.v
			save()
		end
		if imgui.Checkbox(u8'[/] Nop ForceClass', elements.checkbox.ForceClass) then
			HLcfg.config.ForceClass = elements.checkbox.ForceClass.v
			save()
		end
		if imgui.Checkbox(u8'[/] Nop FacingAngle', elements.checkbox.FacingAngle) then
			HLcfg.config.FacingAngle = elements.checkbox.FacingAngle.v 
			save()
		end
		if imgui.Checkbox(u8'[/] Nop ToggleControl', elements.checkbox.ToggleControl) then
			HLcfg.config.ToggleControl = elements.checkbox.ToggleControl.v
			save()
		end
		imgui.End()
	end
end

function check_buttons()
		if elements.checkbox.Rvanka.v then
			id = getClosestPlayerId()
			result, pPed = sampGetCharHandleBySampPlayerId(id)
			if result then
				function samp.onSendPlayerSync(data)
					if doesCharExist(pPed) then
						local rvSpreadA = 0.05
						local rvSpreadB = 0.05
						local divAtoB = rvSpreadA / rvSpreadB
						local divBtoA = rvSpreadB / rvSpreadA
						local pos = {getCharCoordinates(pPed)}
						data.moveSpeed.x = 160 / 140
						data.moveSpeed.y = 160 / 140
						data.moveSpeed.z = 160 / 140
						data.position.x = pos[1] + math.random(-divAtoB, divAtoB) * (divBtoA / 2)
						data.position.y = pos[2] + math.random(-divAtoB, divAtoB) * (divBtoA / 2)
						data.position.z = pos[3] + math.random(-divAtoB, divAtoB) * (divBtoA / 2)
					end
				end
			end
		end
		if elements.checkbox.AntiRecon.v then
			sampForceOnfootSync()
			local sync = samp_create_sync_data('spectator')
			sync.position.x, sync.position.y, sync.position.z = getCharCoordinates(PLAYER_PED)
			sync.send()
		end
		if elements.checkbox.Traicer.v then
			local oTime = os.time()
			for i = 1, BulletSync.maxLines do
				if BulletSync[i].enable == true and oTime <= BulletSync[i].time then
					local o, t = BulletSync[i].o, BulletSync[i].t
					if isPointOnScreen(o.x, o.y, o.z) and
					   isPointOnScreen(t.x, t.y, t.z) then
						local sx, sy = convert3DCoordsToScreen(o.x, o.y, o.z)
						local fx, fy = convert3DCoordsToScreen(t.x, t.y, t.z)
						renderDrawLine(sx, sy, fx, fy, 1, BulletSync[i].tType == 0 and 0xFFFFFFFF or 0xFFFF0000 or 0xFF006400)
						renderDrawPolygon(fx, fy-1, 3, 3, 4.0, 10, BulletSync[i].tType == 0 and 0xFFFFFFFF or 0xFFFF0000 or 0xFF006400)
					end
				end
			end
		end
		if elements.checkbox.NarkoWH.v then
			for n = 1, 2048 do
				if sampIs3dTextDefined(n) then
					local string, clr, posX, posY, posZ, dist, iW, pID, vehID = sampGet3dTextInfoById(n)
					local Px, Py, Pz = getCharCoordinates(playerPed)
					if isPointOnScreen(posX, posY, posZ, 0.0) and string.find(string, '') then
						if getDistanceBetweenCoords2d(posX, posY, Px, Py) > 4.0 then
							local wposX, wposY = convert3DCoordsToScreen(posX, posY, posZ)
							renderFontDrawText(font, string, wposX, wposY, clr)
						end
					end
				end
			end
		end
		if elements.checkbox.ForClad.v then
			for _, objid in pairs(getAllObjects()) do
				if tonumber(getObjectModel(objid)) == 1271 or tonumber(getObjectModel(objid)) == 2680 then
					_, objPosX, objPosY, objPosZ = getObjectCoordinates(objid)
					isSoundOn, SoundObjID = true, objid
					addOneOffSound(objPosX, objPosY, objPosZ, 1062)
					if isObjectOnScreen(objid) then
						charPosX, charPosY, charPosZ = getCharCoordinates(PLAYER_PED)
						wposX, wposY = convert3DCoordsToScreen(objPosX, objPosY, objPosZ)
						wpos2X, wpos2Y = convert3DCoordsToScreen(charPosX, charPosY, charPosZ)
						renderDrawLine(wposX, wposY, wpos2X, wpos2Y, 1, 0x883c8fb5)
						renderDrawPolygon(wposX, wposY, 3, 3, 7, 0, 0xba3c8fb5)
						renderFontDrawText(font, "{3c8fb5}[WH] {ffffff} ", wposX + 5, wposY - 7, 0xcac1f4c1)
					end
				end
			end
			if isSoundOn and SoundObjID ~= -1 then
				_, objPosX, objPosY, objPosZ = getObjectCoordinates(SoundObjID)
				charPosX, charPosY, charPosZ = getCharCoordinates(PLAYER_PED)
				if getDistanceBetweenCoords3d(objPosX, objPosY, objPosZ, charPosX, charPosY, charPosZ) > 200.0 then
					isSoundOn, SoundObjID = false, -1
					addOneOffSound(positionX, positionY, positionZ, 1063)
				end
			end
		end
		if elements.checkbox.Lugs.v then
			local _, id = sampGetPlayerIdByCharHandle(playerPed)
			sampSetSendrate(1, 2000)
			sampSetSendrate(3, 2000)
		else
			sampSetSendrate(1, 0)
			sampSetSendrate(2, 0)
			sampSetSendrate(3, 0)
		end
		if elements.checkbox.WHSkeleton.v then
			if not isPauseMenuActive() and not isKeyDown(VK_F8) then
				for i = 0, sampGetMaxPlayerId() do
					if sampIsPlayerConnected(i) then
						local result, cped = sampGetCharHandleBySampPlayerId(i)
						local color = sampGetPlayerColor(i)
						local aa, rr, gg, bb = explode_argb(color)
						local color = join_argb(255, rr, gg, bb)
						if result then
							if doesCharExist(cped) and isCharOnScreen(cped) then
								local t = {3, 4, 5, 51, 52, 41, 42, 31, 32, 33, 21, 22, 23, 2}
								for v = 1, #t do
									pos1X, pos1Y, pos1Z = getBodyPartCoordinates(t[v], cped)
									pos2X, pos2Y, pos2Z = getBodyPartCoordinates(t[v] + 1, cped)
									pos1, pos2 = convert3DCoordsToScreen(pos1X, pos1Y, pos1Z)
									pos3, pos4 = convert3DCoordsToScreen(pos2X, pos2Y, pos2Z)
									renderDrawLine(pos1, pos2, pos3, pos4, 1, color)
								end
								for v = 4, 5 do
									pos2X, pos2Y, pos2Z = getBodyPartCoordinates(v * 10 + 1, cped)
									pos3, pos4 = convert3DCoordsToScreen(pos2X, pos2Y, pos2Z)
									renderDrawLine(pos1, pos2, pos3, pos4, 1, color)
								end
								local t = {53, 43, 24, 34, 6}
								for v = 1, #t do
									posX, posY, posZ = getBodyPartCoordinates(t[v], cped)
									pos1, pos2 = convert3DCoordsToScreen(posX, posY, posZ)
								end
							end
						end
					end
				end
			end
		end
		if elements.checkbox.NoEatAll.v then
			memory.setint8(0x969174, 1)
		else
			memory.setint8(0x969174, 0)
		end
		if isCharInAnyCar(playerPed) then
			if elements.checkbox.NoRadio.v then
				if getRadioChannel(playerPed) < 12 then
					setRadioChannel(12)
				end
			end
			if elements.checkbox.DriveInWater.v then
				memory.write(9867602, 1, 4)
			else
				memory.write(9867602, 0, 4)
			end
			if elements.checkbox.AntiZP.v then
				local veh = storeCarCharIsInNoSave(PLAYER_PED)
				setCarEngineBroken(veh, false)
			end
			if elements.checkbox.MStop.v then
				if isKeyDown(VK_SPACE) then
					local veh = storeCarCharIsInNoSave(PLAYER_PED)
					local position = {getCarCoordinates(veh)}
					setCarCoordinates(veh, position[1], position[2], position[3])
				end
			end
			if elements.checkbox.AntiBlockCar.v then
				local veh = storeCarCharIsInNoSave(PLAYER_PED)
				if isCarVisiblyDamaged(veh) then
					setCarEngineBroken(veh, false)
				end
			end
			if elements.checkbox.CarShot.v then
				local camCoordX, camCoordY, camCoordZ = getActiveCameraCoordinates()
				local targetCamX, targetCamY, targetCamZ = getActiveCameraPointAt()
				setCarHeading(storeCarCharIsInNoSave(playerPed), getHeadingFromVector2d(targetCamX - camCoordX, targetCamY - camCoordY))
				if isKeyDown(VK_W) then setCarForwardSpeed(storeCarCharIsInNoSave(playerPed), 200.0 / 1.67)
				elseif isKeyDown(VK_S) then setCarForwardSpeed(storeCarCharIsInNoSave(playerPed), 0.0) end
			end
		end
		if elements.checkbox.ClearDl.v then
			local protect = memory.unprotect(address, 0x87) 
			ffi.copy(ffi.cast('void*', address), '[id: %d, type: %d subtype: %d Health: %.1f]', 0x87) 
			memory.protect(address, protect) 
		else
			local protect = memory.unprotect(address, 0x87) 
			ffi.copy(ffi.cast('void*', address), '[id: %d, type: %d subtype: %d Health: %.1f preloaded: %u]\nDistance: %.2fm\nPassengerSeats: %u\ncPos: %.3f,%.3f,%.3f\nsPos: %.3f,%.3f,%.3f', 0x87) 
			memory.protect(address, protect)
		end
		camhack()
		if elements.checkbox.MJump.v then
			memory.setint8(0x96916C, 1)
		else
			memory.setint8(0x96916C, 0)
		end
		if elements.checkbox.InfinityHealth.v then
			memory.setint8(0x96916D, 1)
		else
			memory.setint8(0x96916D, 0)
		end
		if elements.checkbox.JBMX.v then
			memory.setint8(0x969161, 1)
		else
			memory.setint8(0x969161, 0)
		end
		if elements.checkbox.DriveNoLicenze.v and isCharInAnyCar(1) and ((os.clock() - firstTimeSitInCar) > 1) then
			sampForceOnfootSync()
			sampSendEnterVehicle(select(2, sampGetVehicleIdByCarHandle(storeCarCharIsInNoSave(1))))
		end
		if elements.checkbox.BlockedPlayer.v then
			for i = 0, sampGetMaxPlayerId(false) do
				if sampIsPlayerConnected(i) then
					local result, id = sampGetCharHandleBySampPlayerId(i)
					if result then
						if doesCharExist(id) then
							local x, y, z = getCharCoordinates(id)
							local mX, mY, mZ = getCharCoordinates(playerPed)
							if 0.4 > getDistanceBetweenCoords3d(x, y, z, mX, mY, mZ) then
								setCharCollision(id, false)
							end
						end
					end
				end
			end
		end
		if elements.checkbox.GRadar.v then
			memory.setint8(0xA444A4, 1)
		else
			memory.setint8(0xA444A4, 0)
		end
		if elements.checkbox.FireResistance.v then
			memory.setint8(0xB7CEE6, 1)
		else
			memory.setint8(0xB7CEE6, 0)
		end
		if elements.checkbox.ChatT then
			if isKeyJustPressed(VK_T) then
				sampSetChatInputEnabled(true)
			end			
		end
		if elements.checkbox.AntiAfk.v then
			memory.setuint8(7634870, 1, false)
			memory.setuint8(7635034, 1, false)
			memory.fill(7623723, 144, 8, false)
			memory.fill(5499528, 144, 6, false)
		else
			memory.setuint8(7634870, 0, false)
			memory.setuint8(7635034, 0, false)
			memory.hex2bin('0F 84 7B 01 00 00', 7623723, 8)
			memory.hex2bin('50 51 FF 15 00 83 85 00', 5499528, 6)
		end
		if elements.checkbox.SetSpeedAnim.v then
			for k,v in pairs(all_anims) do setCharAnimSpeed(PLAYER_PED, v, 3.0) end
		end
		if elements.checkbox.CollizionOb.v then
			for k,v in ipairs(getAllObjects()) do
				setObjectCollision(v, false)
			end
		else
			for k,v in ipairs(getAllObjects()) do
				setObjectCollision(v, true)
			end
		end
		if elements.checkbox.NoBike.v then
			if isCharOnAnyBike(playerPed) then
				setCharCanBeKnockedOffBike(playerPed, true)
			else
				setCharCanBeKnockedOffBike(playerPed, false)
			end
		else
			setCharCanBeKnockedOffBike(playerPed, false)
		end
		if elements.checkbox.InfinityOxygen.v then
			memory.setint8(0x96916E, 1)
		else
			memory.setint8(0x96916E, 0)
		end
		if elements.checkbox.NameTag.v then
			nameTagOn()
		else
			nameTagOff()
		end
		if elements.checkbox.NoFall.v then
			if isCharPlayingAnim(PLAYER_PED, 'KO_SKID_BACK') or isCharPlayingAnim(playerPed, 'FALL_COLLAPSE') then
				local x, y, z = getCharCoordinates(PLAYER_PED)
				setCharCoordinates(PLAYER_PED, x, y, z - 1)
			end
		end
		if elements.checkbox.CHelper.v then
			weapon = getCurrentCharWeapon(playerPed)
			if weapon == 24 then
				if isKeyDown(VK_RBUTTON) and isKeyJustPressed(VK_LBUTTON) then
					wait(100)
					setVirtualKeyDown(VK_C, true)
					wait(4)
					setVirtualKeyDown(VK_C, false)
				end
			end
		end
		if elements.checkbox.SafeScreen.v then
			if isKeyJustPressed(VK_F8) then
				active = false
				wait(1000)
				active = true
			end
		end
		if elements.checkbox.AutoShot.v then
			result, ped = getCharPlayerIsTargeting(playerHandle)
			if result then
				if isKeyDown(VK_RBUTTON) then
					weapon = getCurrentCharWeapon(playerPed)
					if weapon == 24 then
						setVirtualKeyDown(VK_LBUTTON, true)
						wait(10)
						setVirtualKeyDown(VK_LBUTTON, false)
						local int = readMemory(0xB6F3B8, 4, 0)
						int=int + 0x79C
						writeMemory(int, 4, 0, 0)
					end
				end
			end
		end
		if elements.checkbox.InfinityAmmo.v then
			memory.write(0x969178, 1, 1, true)			
		else
			memory.write(0x969178, 0, 1, true)				
		end
		if elements.checkbox.NoSpread.v then
			memory.setfloat(0x8D2E64, 0)				
		else
			memory.setfloat(0x8D2E64, spreadval)				
		end
		if elements.checkbox.InifinityRun.v then
			setPlayerNeverGetsTired(playerHandle, true)
		else
			setPlayerNeverGetsTired(playerHandle, true)
		end
		if elements.checkbox.Inv.v then
			if isCharInAnyCar(playerPed) then
				setCarProofs(storeCarCharIsInNoSave(playerPed), true, true, true, true, true)
				setCharCanBeKnockedOffBike(playerPed, true)
				setCanBurstCarTires(storeCarCharIsInNoSave(playerPed), false)
			end
			setCharProofs(playerPed, true, true, true, true, true)
		else
			if isCharInAnyCar(playerPed) then
				setCarProofs(storeCarCharIsInNoSave(playerPed), false, false, false, false, false)
				setCharCanBeKnockedOffBike(playerPed, false)
			end
			setCharProofs(playerPed, false, false, false, false, false)
		end
		if elements.checkbox.Aim.v then
			result, ped = getCharPlayerIsTargeting(playerHandle)
			if result then
				local myPos = {getActiveCameraCoordinates()}
				local enPos = {getCharCoordinates(ped)}
				local vector = {myPos[1] - enPos[1], myPos[2] - enPos[2], myPos[3] - enPos[3]}
				if isWidescreenOnInOptions() then coefficentZ = 0.0778 else coefficentZ = 0.103 end
				local angle = {(math.atan2(vector[2], vector[1]) + 0.04253), (math.atan2((math.sqrt((math.pow(vector[1], 2) + math.pow(vector[2], 2)))), vector[3]) - math.pi / 2 - coefficentZ)}
				local view = {fix(representIntAsFloat(readMemory(0xB6F258, 4, false))), fix(representIntAsFloat(readMemory(0xB6F248, 4, false)))}
				local difference = {angle[1] - view[1], angle[2] - view[2]}
				local smooth = {difference[1] / 1.0, difference[2] / 1.0}
				setCameraPositionUnfixed((view[2] + smooth[2]), (view[1] + smooth[1]))
			end
		end
		if elements.checkbox.AutoC.v then
			weapon = getCurrentCharWeapon(playerPed)
			local result = isCharShooting(playerPed)
			if result then
				if weapon == 24 then
					wait(5)
					clearCharTasksImmediately(playerPed)
				elseif weapon == 25 then
					wait(5)
					clearCharTasksImmediately(playerPed)
				end
			end
		end
		if not sampIsChatInputActive() and not sampIsDialogActive() and not sampIsScoreboardOpen() then
			if isKeyJustPressed(VK_NUMPAD6) then
				sampSpawnPlayer()
				restoreCameraJumpcut()
			end
			if isCharInAnyCar(playerPed) then
				if isKeyJustPressed(VK_Y) then
					local cVecX, cVecY, cVecZ = getCarSpeedVector(storeCarCharIsInNoSave(PLAYER_PED))
					if cVecZ < 7.0 then applyForceToCar(storeCarCharIsInNoSave(PLAYER_PED), 0.0, 0.0, 0.1, 0.0, 0.0, 0.0) end
				end
				if isKeyJustPressed(VK_NUMPAD5) then
					local cVecX, cVecY, cVecZ = getCarSpeedVector(storeCarCharIsInNoSave(PLAYER_PED))
					applyForceToCar(storeCarCharIsInNoSave(PLAYER_PED), -cVecX / 25, -cVecY / 25, -cVecZ / 25, 0.0, 0.0, 0.0)
					local x, y, z, w = getVehicleQuaternion(storeCarCharIsInNoSave(PLAYER_PED))
					local matrix = {convertQuaternionToMatrix(w, x, y, z)}
					matrix[1] = -matrix[1]
					matrix[2] = -matrix[2]
					matrix[4] = -matrix[4]
					matrix[5] = -matrix[5]
					matrix[7] = -matrix[7]
					matrix[8] = -matrix[8]
					local w, x, y, z = convertMatrixToQuaternion(matrix[1], matrix[2], matrix[3], matrix[4], matrix[5], matrix[6], matrix[7], matrix[8], matrix[9])
					setVehicleQuaternion(storeCarCharIsInNoSave(PLAYER_PED), x, y, z, w)
					setCarForwardSpeed(storeCarCharIsInNoSave(PLAYER_PED), 0.0)
				end
				if isKeyJustPressed(VK_DELETE) then
					setCarHealth(storeCarCharIsInNoSave(PLAYER_PED), 200)
				end
				if isKeyJustPressed(VK_NUMPAD4) then
					local veh = storeCarCharIsInNoSave(PLAYER_PED)
					giveNonPlayerCarNitro(veh)
				end
				if isKeyJustPressed(VK_NUMPAD3) then
					local veh = storeCarCharIsInNoSave(PLAYER_PED)
					local oX, oY, oZ = getOffsetFromCarInWorldCoords(veh, 0.0,  0.0,  0.0)
					setCarCoordinates(veh, oX, oY, oZ)
				end
				if isKeyJustPressed(VK_NUMPAD2) then
					local veh = storeCarCharIsInNoSave(PLAYER_PED)
					local _, id = sampGetVehicleIdByCarHandle(veh)
					local data = samp_create_sync_data('vehicle', true)
					if _ then
						data.vehicleId = id
						data.position.x, data.position.y, data.position.z = getCarCoordinates(veh)
						data.vehicleHealth = 1000
						data.send()
						setCarHealth(veh, 1000)
						fixCar(veh)
						printStyledString('Repair!', 1000, 4)
					end
				end
			end
			if isKeyJustPressed(VK_NUMPAD1) and isCharInAnyCar(playerPed) then
				local veh = storeCarCharIsInNoSave(PLAYER_PED)
				for tire = 0, 3 do
					fixCarTire(veh, tire)
					printStyledString('Fix!', 1000, 4)
				end
			end
			if isKeyDown(VK_CONTROL) and isKeyDown(VK_P) and isKeyJustPressed(VK_O) then
				x, y, z = getCharCoordinates(playerPed)
				setCharCoordinates(playerPed, x, y, z + 5)
			end
			if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_9) then
				setCharHealth(playerPed, 50)
				setCharHealth(playerPed, 0)
				printStyledString('Suicide!', 1000, 4)
			end	
			if isKeyJustPressed(VK_Z) then
				clearCharTasksImmediately(playerPed)
			end
			if (not isCharInAnyCar(PLAYER_PED)) then
				actualSpeed = -1
			end
			if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_5) then
				ClearChat()
				printStyledString('Chat clear', 1000, 4)
			end
			if isKeyDown(VK_LMENU) and isCharInAnyCar(playerPed) then
				hookSH = true
				if getCarSpeed(storeCarCharIsInNoSave(playerPed)) * 2.01 <= 150 then
					local cVecX, cVecY, cVecZ = getCarSpeedVector(storeCarCharIsInNoSave(playerPed))
					local heading = getCarHeading(storeCarCharIsInNoSave(playerPed))
					local turbo = fps_correction() / 85
					local xforce, yforce, zforce = turbo, turbo, turbo
					local Sin, Cos = math.sin(-math.rad(heading)), math.cos(-math.rad(heading))
					if cVecX > -0.01 and cVecX < 0.01 then xforce = 0.0 end
					if cVecY > -0.01 and cVecY < 0.01 then yforce = 0.0 end
					if cVecZ < 0 then zforce = -zforce end
					if cVecZ > -2 and cVecZ < 15 then zforce = 0.0 end
					if Sin > 0 and cVecX < 0 then xforce = -xforce end
					if Sin < 0 and cVecX > 0 then xforce = -xforce end
					if Cos > 0 and cVecY < 0 then yforce = -yforce end
					if Cos < 0 and cVecY > 0 then yforce = -yforce end
					applyForceToCar(storeCarCharIsInNoSave(playerPed), xforce * Sin, yforce * Cos, zforce / 2, 0.0, 0.0, 0.0)
				end
			elseif not isKeyDown(VK_LMENU) then
				actualSpeed = -1
			end
			if isKeyJustPressed(VK_F3) then
				elements.checkbox.Bhop.v = not elements.checkbox.Bhop.v
				HLcfg.config.Bhop = elements.checkbox.Bhop.v
				save()				
			end
			if isKeyJustPressed(VK_INSERT) then
				elements.checkbox.Inv.v = not elements.checkbox.Inv.v
				HLcfg.config.Inv = elements.checkbox.Inv.v
				save()				
			end
			if isKeyJustPressed(VK_F11) then
				MenuWindow.v = not MenuWindow.v				
			end	
		end
end

function save()
	inicfg.save(HLcfg, 'SS.ini')
end

function fix(angle)
	while angle > math.pi do
		angle = angle - (math.pi*2)
	end
	while angle < -math.pi do
		angle = angle + (math.pi*2)
	end
	return angle
end

function rotateCarAroundUpAxis(car, vec)
  local mat = Matrix3X3(getVehicleRotationMatrix(car))
  local rotAxis = Vector3D(mat.up:get())
  vec:normalize()
  rotAxis:normalize()
  local theta = math.acos(rotAxis:dotProduct(vec))
  if theta ~= 0 then
    rotAxis:crossProduct(vec)
    rotAxis:normalize()
    rotAxis:zeroNearZero()
    mat = mat:rotate(rotAxis, -theta)
  end
  setVehicleRotationMatrix(car, mat:get())
end

function readFloatArray(ptr, idx)
  return representIntAsFloat(readMemory(ptr + idx * 4, 4, false))
end

function writeFloatArray(ptr, idx, value)
  writeMemory(ptr + idx * 4, 4, representFloatAsInt(value), false)
end

function getVehicleRotationMatrix(car)
  local entityPtr = getCarPointer(car)
  if entityPtr ~= 0 then
    local mat = readMemory(entityPtr + 0x14, 4, false)
    if mat ~= 0 then
      local rx, ry, rz, fx, fy, fz, ux, uy, uz
      rx = readFloatArray(mat, 0)
      ry = readFloatArray(mat, 1)
      rz = readFloatArray(mat, 2)

      fx = readFloatArray(mat, 4)
      fy = readFloatArray(mat, 5)
      fz = readFloatArray(mat, 6)

      ux = readFloatArray(mat, 8)
      uy = readFloatArray(mat, 9)
      uz = readFloatArray(mat, 10)
      return rx, ry, rz, fx, fy, fz, ux, uy, uz
    end
  end
end

function setVehicleRotationMatrix(car, rx, ry, rz, fx, fy, fz, ux, uy, uz)
  local entityPtr = getCarPointer(car)
  if entityPtr ~= 0 then
    local mat = readMemory(entityPtr + 0x14, 4, false)
    if mat ~= 0 then
      writeFloatArray(mat, 0, rx)
      writeFloatArray(mat, 1, ry)
      writeFloatArray(mat, 2, rz)

      writeFloatArray(mat, 4, fx)
      writeFloatArray(mat, 5, fy)
      writeFloatArray(mat, 6, fz)

      writeFloatArray(mat, 8, ux)
      writeFloatArray(mat, 9, uy)
      writeFloatArray(mat, 10, uz)
    end
  end
end

function displayVehicleName(x, y, gxt)
  x, y = convertWindowScreenCoordsToGameScreenCoords(x, y)
  useRenderCommands(true)
  setTextWrapx(640.0)
  setTextProportional(true)
  setTextJustify(false)
  setTextScale(0.33, 0.8)
  setTextDropshadow(0, 0, 0, 0, 0)
  setTextColour(255, 255, 255, 230)
  setTextEdge(1, 0, 0, 0, 100)
  setTextFont(1)
  displayText(x, y, gxt)
end

function createPointMarker(x, y, z)
  pointMarker = createUser3dMarker(x, y, z + 0.3, 4)
end

function removePointMarker()
  if pointMarker then
    removeUser3dMarker(pointMarker)
    pointMarker = nil
  end
end

function getCarFreeSeat(car)
  if doesCharExist(getDriverOfCar(car)) then
    local maxPassengers = getMaximumNumberOfPassengers(car)
    for i = 0, maxPassengers do
      if isCarPassengerSeatFree(car, i) then
        return i + 1
      end
    end
    return nil
  else
    return 0
  end
end

function samp.onSetVehicleHealth(vehicleId, health)
    if elements.checkbox.AntiBlockCar.v then
        return false
    end
end

function jumpIntoCar(car)
  local seat = getCarFreeSeat(car)
  if not seat then return false end          
  if seat == 0 then warpCharIntoCar(playerPed, car)     
  else warpCharIntoCarAsPassenger(playerPed, car, seat - 1)
  end
  restoreCameraJumpcut()
  return true
end

function teleportPlayer(x, y, z)
  if isCharInAnyCar(playerPed) then
    setCharCoordinates(playerPed, x, y, z)
  end
  setCharCoordinatesDontResetAnim(playerPed, x, y, z)
end

function setCharCoordinatesDontResetAnim(char, x, y, z)
  if doesCharExist(char) then
    local ptr = getCharPointer(char)
    setEntityCoordinates(ptr, x, y, z)
  end
end

function setEntityCoordinates(entityPtr, x, y, z)
  if entityPtr ~= 0 then
    local matrixPtr = readMemory(entityPtr + 0x14, 4, false)
    if matrixPtr ~= 0 then
      local posPtr = matrixPtr + 0x30
      writeMemory(posPtr + 0, 4, representFloatAsInt(x), false) 
      writeMemory(posPtr + 4, 4, representFloatAsInt(y), false) 
      writeMemory(posPtr + 8, 4, representFloatAsInt(z), false) 
    end
  end
end

function showCursor(toggle)
  if toggle then
    sampSetCursorMode(CMODE_LOCKCAM)
  else
    sampToggleCursor(false)
  end
  cursorEnabled = toggle
end

function getMyId()
	result, id = sampGetPlayerIdByCharHandle(playerPed)
	if result then
		return id
	end
end

function SearchMarker(posX, posY, posZ)
    local ret_posX = 0.0
    local ret_posY = 0.0
    local ret_posZ = 0.0
    local isFind = false
    for id = 0, 31 do
        local MarkerStruct = 0
        MarkerStruct = 0xC7F168 + id * 56
        local MarkerPosX = representIntAsFloat(readMemory(MarkerStruct + 0, 4, false))
        local MarkerPosY = representIntAsFloat(readMemory(MarkerStruct + 4, 4, false))
        local MarkerPosZ = representIntAsFloat(readMemory(MarkerStruct + 8, 4, false))
        if MarkerPosX ~= 0.0 or MarkerPosY ~= 0.0 or MarkerPosZ ~= 0.0 then
            ret_posX = MarkerPosX
            ret_posY = MarkerPosY
            ret_posZ = MarkerPosZ
            isFind = true
        end
    end
    return isFind, ret_posX, ret_posY, ret_posZ
end

function getAmmoInClip()
  local struct = getCharPointer(playerPed)
  local prisv = struct + 0x0718
  local prisv = memory.getint8(prisv, false)
  local prisv = prisv * 0x1C
  local prisv2 = struct + 0x5A0
  local prisv2 = prisv2 + prisv
  local prisv2 = prisv2 + 0x8
  local ammo = memory.getint32(prisv2, false)
  return ammo
end

function mlg()
	lua_thread.create(function()
	while true do
		wait(0)
		if not eaegg then return end
		isTargetin, handle = getCharPlayerIsTargeting(playerHandle)
		if isCharShooting(playerPed) and isTargetin then
			trgx, trgy, trgz = getCharCoordinates(handle)
			addOneOffSound(trgx, trgy, trgz, 1159)
			shakeCam(100)
		end
	end
	end)
end

function samp.onPlayerSync(id, data)
	if elements.checkbox.AntiRv.v then
		local x, y, z = getCharCoordinates(PLAYER_PED)
		if x - data.position.x > -1.5 and x - data.position.x < 1.5 then
			if (data.moveSpeed.x >= 1.5 or data.moveSpeed.x <= -1.5) or (data.moveSpeed.y >= 1.5 or data.moveSpeed.y <= -1.5) or (data.moveSpeed.z >= 0.5 or data.moveSpeed.z <= -0.5) then
				data.moveSpeed.x, data.moveSpeed.y, data.moveSpeed.z = 0, 0, 0
			end
		end
	end
	return {id, data}
end

function samp.onVehicleSync(id, vehid, data)
	if elements.checkbox.AntiRv.v then
		local x, y, z = getCharCoordinates(PLAYER_PED)
		if x - data.position.x > -1.5 and x - data.position.x < 1.5 then
			if (data.moveSpeed.x >= 1.5 or data.moveSpeed.x <= -1.5) or (data.moveSpeed.y >= 1.5 or data.moveSpeed.y <= -1.5) or (data.moveSpeed.z >= 0.5 or data.moveSpeed.z <= -0.5) then
				data.moveSpeed.x, data.moveSpeed.y, data.moveSpeed.z = 0, 0, 0
				data.position.x = data.position.x - 5
			end
		end
	end
	return {id, vehid, data}
end

function get_screen_centure(szX, szY)
 	local X,Y = getScreenResolution()
	X = X/2 - szX
	Y = Y/2 - szY
	return X, Y
end

function samp.onSendPlayerSync(data)
	if elements.checkbox.Bhop.v then
		if bit.band(data.keysData, 0x28) == 0x28 then
			data.keysData = bit.bxor(data.keysData, 0x20)
		end
	end
	if elements.checkbox.AntiStun.v then
		if data.animationId == 1084 then
			data.animationFlags = 32772
			data.animationId = 1189
		end
	end
	if elements.checkbox.Ghost.v then
		local position = {getCharCoordinates(playerPed)}
		data.position.z = position[3] - 2
		data.position.x = position[1] - 2
	end
	notInCarYet = true
end

function blue()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
	style.Alpha = 1.00

    style.WindowRounding = 2.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
    style.ChildWindowRounding = 2.0
    style.FrameRounding = 2.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0

    colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
    colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

blue()

function onScriptTerminate(script, quitGame)
	if script == thisScript() then
		imgui.ShowCursor = false
	end
end

function rel()
	lua_thread.create(function()
		sampSetChatInputEnabled(true)
		wait(100)
		sampSetChatInputEnabled(false)
	end)
end

function red(name)
	imgui.PushStyleColor(imgui.Col.Text, imgui.ImColor(255, 0, 0):GetVec4())
	imgui.Text(u8(name))
	imgui.PopStyleColor()
end

function green(name)
	imgui.PushStyleColor(imgui.Col.Text, imgui.ImColor(0, 255, 0):GetVec4())
	imgui.Text(u8(name))
	imgui.PopStyleColor()
end

function ClearChat()
    local memory = require "memory"
    memory.fill(sampGetChatInfoPtr() + 306, 0x0, 25200)
    memory.write(sampGetChatInfoPtr() + 306, 25562, 4, 0x0)
    memory.write(sampGetChatInfoPtr() + 0x63DA, 1, 1)
end

function fps_correction()
	return representIntAsFloat(readMemory(0xB7CB5C, 4, false))
end
	
function samp.onSendVehicleSync(data)
	local speed = data.moveSpeed
	actualSpeed = math.sqrt( speed.x ^ 2 + speed.y ^ 2 + speed.z ^ 2 ) * 140
	if (actualSpeed >= speedCap and hookSH) then
		speed.x = math.random(10, 20) / 100
		speed.y = math.random(10, 20) / 100
		speed.z = math.random(10, 20) / 100
	end
	if hookAV then
		speed.x = math.random(10, 20) / 100
		speed.y = math.random(10, 20) / 100
		speed.z = math.random(10, 20) / 100
	end
	local dist = checkdist(radars,data.position)
    if dist < 30 then
        data.moveSpeed.x = -0.11308368295431
        data.moveSpeed.y = -0.63233608007431
        data.moveSpeed.z = 3.0089278880041e-05
    end
    if dist < 35 then
        turn = true
    else
        turn = false
    end
end

function samp.onSetVehicleVelocity()
    if turn then
        return false
    end
	if elements.checkbox.AntiCarSkill.v then
		return false
	end
end

function samp.onCreate3DText(id,color,position,dist,testLOS,attachedPlayerId,attachedVehicleId,text)
    if color == -1 and text:find("%s* : {D1DE43}%d+ /.{FFFFFF}%s*  : {D1DE43}%d+%$.{FFFFFF}%s*: {D1DE43}.*") then
        if not checkIntable(radars, position.x,position.y,position.z) then
            table.insert(radars,{position.x,position.y,position.z})
        end
        return {id,color,position,1000,testLOS,attachedPlayerId,attachedVehicleId,text}
    end
end

function checkIntable(t, r1,r2,r3)
    for _, v in ipairs(t) do
        if (v[1] == r1) and (v[2] == r2) and (v[3] == r3) then return true end
    end
    return false
end

function checkdist(t,h)
	local f = 10000
		for _, v in ipairs(t) do
			local distance = getDistanceBetweenCoords3d(v[1], v[2], v[3], h.x, h.y, h.z)
			if distance < f then
				f = distance
			end
		end
	return f
end

function checks()
	if selectGun.v == 0 then
		giveWeaponToChar(playerPed, 0, AmmoGun.v)
	elseif selectGun.v == 1 then
		giveWeaponToChar(playerPed, 1, AmmoGun.v)
	elseif selectGun.v == 2 then
		giveWeaponToChar(playerPed, 2, AmmoGun.v)
	elseif selectGun.v == 3 then
		giveWeaponToChar(playerPed, 3, AmmoGun.v)
	elseif selectGun.v == 4 then
		giveWeaponToChar(playerPed, 4, AmmoGun.v)
	elseif selectGun.v == 5 then
		giveWeaponToChar(playerPed, 5, AmmoGun.v)
	elseif selectGun.v == 6 then
		giveWeaponToChar(playerPed, 6, AmmoGun.v)
	elseif selectGun.v == 7 then
		giveWeaponToChar(playerPed, 7, AmmoGun.v) 
	elseif selectGun.v == 8 then
		giveWeaponToChar(playerPed, 8, AmmoGun.v)
	elseif selectGun.v == 9 then
		giveWeaponToChar(playerPed, 9, AmmoGun.v)
	elseif selectGun.v == 10 then
		giveWeaponToChar(playerPed, 10, AmmoGun.v)
	elseif selectGun.v == 11 then
		giveWeaponToChar(playerPed, 11, AmmoGun.v)
	elseif selectGun.v == 12 then
		giveWeaponToChar(playerPed, 12, AmmoGun.v)
	elseif selectGun.v == 13 then
		giveWeaponToChar(playerPed, 13, AmmoGun.v)
	elseif selectGun.v == 14 then
		giveWeaponToChar(playerPed, 14, AmmoGun.v)
	elseif selectGun.v == 15 then
		giveWeaponToChar(playerPed, 15, AmmoGun.v)
	elseif selectGun.v == 16 then
		giveWeaponToChar(playerPed, 16, AmmoGun.v)
	elseif selectGun.v == 17 then
		giveWeaponToChar(playerPed, 17, AmmoGun.v)
	elseif selectGun.v == 18 then
		giveWeaponToChar(playerPed, 18, AmmoGun.v)
	elseif selectGun.v == 19 then
		giveWeaponToChar(playerPed, 19, AmmoGun.v)
	elseif selectGun.v == 20 then
		giveWeaponToChar(playerPed, 20, AmmoGun.v)
	elseif selectGun.v == 21 then
		giveWeaponToChar(playerPed, 21, AmmoGun.v)
	elseif selectGun.v == 22 then
		giveWeaponToChar(playerPed, 22, AmmoGun.v)
	elseif selectGun.v == 23 then
		giveWeaponToChar(playerPed, 23, AmmoGun.v)
	elseif selectGun.v == 24 then
		giveWeaponToChar(playerPed, 24, AmmoGun.v)
	elseif selectGun.v == 25 then
		giveWeaponToChar(playerPed, 25, AmmoGun.v)
	elseif selectGun.v == 26 then
		giveWeaponToChar(playerPed, 26, AmmoGun.v)
	elseif selectGun.v == 27 then
		giveWeaponToChar(playerPed, 27, AmmoGun.v)
	elseif selectGun.v == 28 then
		giveWeaponToChar(playerPed, 28, AmmoGun.v)
	elseif selectGun.v == 29 then
		giveWeaponToChar(playerPed, 29, AmmoGun.v)
	elseif selectGun.v == 30 then
		giveWeaponToChar(playerPed, 30, AmmoGun.v)
	elseif selectGun.v == 31 then
		giveWeaponToChar(playerPed, 31, AmmoGun.v)
	elseif selectGun.v == 32 then
		giveWeaponToChar(playerPed, 32, AmmoGun.v)
	elseif selectGun.v == 33 then
		giveWeaponToChar(playerPed, 33, AmmoGun.v)
	elseif selectGun.v == 34 then
		giveWeaponToChar(playerPed, 34, AmmoGun.v)
	elseif selectGun.v == 35 then
		giveWeaponToChar(playerPed, 35, AmmoGun.v)
	elseif selectGun.v == 36 then
		giveWeaponToChar(playerPed, 36, AmmoGun.v)
	elseif selectGun.v == 37 then
		giveWeaponToChar(playerPed, 37, AmmoGun.v)
	elseif selectGun.v == 38 then
		giveWeaponToChar(playerPed, 38, AmmoGun.v)
	elseif selectGun.v == 39 then
		giveWeaponToChar(playerPed, 39, AmmoGun.v)
	elseif selectGun.v == 40 then
		giveWeaponToChar(playerPed, 40, AmmoGun.v)
	elseif selectGun.v == 41 then
		giveWeaponToChar(playerPed, 41, AmmoGun.v)
	elseif selectGun.v == 42 then
		giveWeaponToChar(playerPed, 42, AmmoGun.v)
	elseif selectGun.v == 43 then
		giveWeaponToChar(playerPed, 43, AmmoGun.v)
	elseif selectGun.v == 44 then
		giveWeaponToChar(playerPed, 44, AmmoGun.v)
	elseif selectGun.v == 45 then
		giveWeaponToChar(playerPed, 45, AmmoGun.v)
	elseif selectGun.v == 46 then
		giveWeaponToChar(playerPed, 46, AmmoGun.v)
	elseif selectGun.v == 47 then
		giveWeaponToChar(playerPed, 47, AmmoGun.v)
	end
end

function samp.onSetPlayerArmedWeapon(weaponId)
	if elements.checkbox.NoFreeze.v then
		return false
	end
end

function samp.onTogglePlayerControllable(controllable)
	if elements.checkbox.NoFreeze.v then
		return false
	end
end

function nameTagOn()
	local pStSet = sampGetServerSettingsPtr()
	memory.setfloat(pStSet + 39, 1488.0)
	memory.setint8(pStSet + 47, 0)
	memory.setint8(pStSet + 56, 1)
end

function nameTagOff()
	local pStSet = sampGetServerSettingsPtr()
	memory.setfloat(pStSet + 39, 50.0)
	memory.setint8(pStSet + 47, 0)
	memory.setint8(pStSet + 56, 1)
end

function samp.onRemovePlayerFromVehicle() if elements.checkbox.DriveNoLicenze.v then return false end end

function samp.onSetPlayerPos() if elements.checkbox.DriveNoLicenze.v then return false end end

function sendFakeOnfootSync(x, y, z)
	local data = allocateMemory(68)
	
	setStructElement(data, 0, 2, 0, false)
	setStructElement(data, 2, 2, 0, false)
	setStructElement(data, 4, 2, 0, false)
	
	setStructFloatElement(data, 6, x, false)
	setStructFloatElement(data, 10, y, false)
	setStructFloatElement(data, 14, z, false)
	
	setStructFloatElement(data, 18, 0, false)
	setStructFloatElement(data, 22, 0, false)
	setStructFloatElement(data, 26, 0, false)
	setStructFloatElement(data, 30, 0, false)
	
	setStructElement(data, 34, 1, getCharHealth(PLAYER_PED), false)
	setStructElement(data, 35, 1, 0, false)
	setStructElement(data, 36, 1, 0, false)
	setStructElement(data, 37, 1, 0, false)
	
	setStructFloatElement(data, 38, 0, false)
	setStructFloatElement(data, 42, 0, false)
	setStructFloatElement(data, 46, 0, false)
	
	setStructFloatElement(data, 50, 0, false)
	setStructFloatElement(data, 54, 0, false)
	setStructFloatElement(data, 58, 0, false)
	
	setStructElement(data, 62, 2, 0, false)
	setStructElement(data, 64, 2, 1198, false)
	setStructElement(data, 66, 2, 0, false)
	
	sampSendOnfootData(data)
	freeMemory(data)
end

function samp.onPlayerChatBubble(id, col, dist, dur, msg)
	if flymode == 1 then
		return {id, col, 1488, dur, msg}
	end
end

function camhack()
	time = time + 1
	if isKeyDown(VK_C) and isKeyDown(VK_1) then
		if flymode == 0 then
			displayRadar(false)
			displayHud(false)	    
			posX, posY, posZ = getCharCoordinates(playerPed)
			angZ = getCharHeading(playerPed)
			angZ = angZ * -1.0
			setFixedCameraPosition(posX, posY, posZ, 0.0, 0.0, 0.0)
			angY = 0.0
			lockPlayerControl(true)
			flymode = 1
		end
	end
	if flymode == 1 and not sampIsChatInputActive() and not isSampfuncsConsoleActive() then
		offMouX, offMouY = getPcMouseMovement()  
		offMouX = offMouX / 4.0
		offMouY = offMouY / 4.0
		angZ = angZ + offMouX
		angY = angY + offMouY
		if angZ > 360.0 then angZ = angZ - 360.0 end
		if angZ < 0.0 then angZ = angZ + 360.0 end
		if angY > 89.0 then angY = 89.0 end
		if angY < -89.0 then angY = -89.0 end   
		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0        
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY      
		pointCameraAtPoint(poiX, poiY, poiZ, 2)
		curZ = angZ + 180.0
		curY = angY * -1.0      
		radZ = math.rad(curZ) 
		radY = math.rad(curY)                   
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 10.0     
		cosZ = cosZ * 10.0       
		sinY = sinY * 10.0                       
		posPlX = posX + sinZ 
		posPlY = posY + cosZ 
		posPlZ = posZ + sinY              
		angPlZ = angZ * -1.0
		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0        
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY      
		pointCameraAtPoint(poiX, poiY, poiZ, 2)

		if isKeyDown(VK_W) then      
			radZ = math.rad(angZ) 
			radY = math.rad(angY)                   
			sinZ = math.sin(radZ)
			cosZ = math.cos(radZ)      
			sinY = math.sin(radY)
			cosY = math.cos(radY)       
			sinZ = sinZ * cosY      
			cosZ = cosZ * cosY 
			sinZ = sinZ * speed      
			cosZ = cosZ * speed       
			sinY = sinY * speed  
			posX = posX + sinZ 
			posY = posY + cosZ 
			posZ = posZ + sinY      
			setFixedCameraPosition(posX, posY, posZ, 0.0, 0.0, 0.0)      
		end 

		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0         
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY      
			pointCameraAtPoint(poiX, poiY, poiZ, 2)

		if isKeyDown(VK_S) then  
			curZ = angZ + 180.0
			curY = angY * -1.0      
			radZ = math.rad(curZ) 
			radY = math.rad(curY)                   
			sinZ = math.sin(radZ)
			cosZ = math.cos(radZ)      
			sinY = math.sin(radY)
			cosY = math.cos(radY)       
			sinZ = sinZ * cosY      
			cosZ = cosZ * cosY 
			sinZ = sinZ * speed      
			cosZ = cosZ * speed       
			sinY = sinY * speed                       
			posX = posX + sinZ 
			posY = posY + cosZ 
			posZ = posZ + sinY      
			setFixedCameraPosition(posX, posY, posZ, 0.0, 0.0, 0.0)
		end 

		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0        
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY      
		pointCameraAtPoint(poiX, poiY, poiZ, 2)
				  
		if isKeyDown(VK_A) then  
			curZ = angZ - 90.0
			radZ = math.rad(curZ)
			radY = math.rad(angY)
			sinZ = math.sin(radZ)
			cosZ = math.cos(radZ)
			sinZ = sinZ * speed
			cosZ = cosZ * speed
			posX = posX + sinZ
			posY = posY + cosZ
			setFixedCameraPosition(posX, posY, posZ, 0.0, 0.0, 0.0)
		end 

		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0        
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY
		pointCameraAtPoint(poiX, poiY, poiZ, 2)       

		if isKeyDown(VK_D) then  
			curZ = angZ + 90.0
			radZ = math.rad(curZ)
			radY = math.rad(angY)
			sinZ = math.sin(radZ)
			cosZ = math.cos(radZ)       
			sinZ = sinZ * speed
			cosZ = cosZ * speed
			posX = posX + sinZ
			posY = posY + cosZ      
			setFixedCameraPosition(posX, posY, posZ, 0.0, 0.0, 0.0)
		end 

		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0        
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY      
		pointCameraAtPoint(poiX, poiY, poiZ, 2)   

		if isKeyDown(VK_SPACE) then  
			posZ = posZ + speed
			setFixedCameraPosition(posX, posY, posZ, 0.0, 0.0, 0.0)
		end 

		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0       
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY      
		pointCameraAtPoint(poiX, poiY, poiZ, 2) 

		if isKeyDown(VK_SHIFT) then  
			posZ = posZ - speed
			setFixedCameraPosition(posX, posY, posZ, 0.0, 0.0, 0.0)
		end 

		radZ = math.rad(angZ) 
		radY = math.rad(angY)             
		sinZ = math.sin(radZ)
		cosZ = math.cos(radZ)      
		sinY = math.sin(radY)
		cosY = math.cos(radY)       
		sinZ = sinZ * cosY      
		cosZ = cosZ * cosY 
		sinZ = sinZ * 1.0      
		cosZ = cosZ * 1.0     
		sinY = sinY * 1.0       
		poiX = posX
		poiY = posY
		poiZ = posZ      
		poiX = poiX + sinZ 
		poiY = poiY + cosZ 
		poiZ = poiZ + sinY      
		pointCameraAtPoint(poiX, poiY, poiZ, 2) 

		if keyPressed == 0 and isKeyDown(VK_F10) then
			keyPressed = 1
			if radarHud == 0 then
				displayRadar(true)
				displayHud(true)
				radarHud = 1
			else
				displayRadar(false)
				displayHud(false)
				radarHud = 0
			end
		end

		if wasKeyReleased(VK_F10) and keyPressed == 1 then keyPressed = 0 end

		if isKeyDown(187) then 
			speed = speed + 0.01
			printStringNow(speed, 1000)
		end 
							   
		if isKeyDown(189) then 
			speed = speed - 0.01 
			if speed < 0.01 then speed = 0.01 end
			printStringNow(speed, 1000)
		end   

		if isKeyDown(VK_C) and isKeyDown(VK_2) then
			displayRadar(true)
			displayHud(true)
			radarHud = 0	    
			angPlZ = angZ * -1.0
			lockPlayerControl(false)
			restoreCameraJumpcut()
			setCameraBehindPlayer()
			flymode = 0     
		end
	end
end

function getNearestVehicle(radius)
    if not sampIsLocalPlayerSpawned() then return end
    local pVehicle = getLocalVehicle()
    local pCoords = {getCharCoordinates(PLAYER_PED)}
    local vehicles = getAllVehicles()
    table.sort(vehicles, function(a, b)
        local aX, aY, aZ = getCarCoordinates(a)
        local bX, bY, bZ = getCarCoordinates(b)
        return getDistanceBetweenCoords3d(aX, aY, aZ, unpack(pCoords)) < getDistanceBetweenCoords3d(bX, bY, bZ, unpack(pCoords))
    end)
    for i = #vehicles, 1, -1 do
        if vehicles[i] == pVehicle then
            table.remove(vehicles, i)
        elseif radius ~= nil then
            local x, y, z = getCarCoordinates(vehicles[i])
            if getDistanceBetweenCoords3d(x, y, z, unpack(pCoords)) > radius then
                table.remove(vehicles, i)
            end
        end
    end
    return vehicles[1]
end

function getLocalVehicle()
    return isCharInAnyCar(PLAYER_PED) and storeCarCharIsInNoSave(PLAYER_PED) or nil
end

function isVehicleExist(vHandle)
    if not sampIsLocalPlayerSpawned() then return false end
    return hasValue(getAllVehicles(), vHandle)
end

function hasValue(tab, val)
    for _, v in ipairs(tab) do
        if v == val then
            return true
        end
    end
    return false
end

function samp_create_sync_data(sync_type, copy_from_player)
    local ffi = require 'ffi'
    local sampfuncs = require 'sampfuncs'
    local raknet = require 'samp.raknet'

    copy_from_player = copy_from_player or true
    local sync_traits = {
        player = {'PlayerSyncData', raknet.PACKET.PLAYER_SYNC, sampStorePlayerOnfootData},
        vehicle = {'VehicleSyncData', raknet.PACKET.VEHICLE_SYNC, sampStorePlayerIncarData},
        passenger = {'PassengerSyncData', raknet.PACKET.PASSENGER_SYNC, sampStorePlayerPassengerData},
        aim = {'AimSyncData', raknet.PACKET.AIM_SYNC, sampStorePlayerAimData},
        trailer = {'TrailerSyncData', raknet.PACKET.TRAILER_SYNC, sampStorePlayerTrailerData},
        unoccupied = {'UnoccupiedSyncData', raknet.PACKET.UNOCCUPIED_SYNC, nil},
        bullet = {'BulletSyncData', raknet.PACKET.BULLET_SYNC, nil},
        spectator = {'SpectatorSyncData', raknet.PACKET.SPECTATOR_SYNC, nil}
    }
    local sync_info = sync_traits[sync_type]
    local data_type = 'struct ' .. sync_info[1]
    local data = ffi.new(data_type, {})
    local raw_data_ptr = tonumber(ffi.cast('uintptr_t', ffi.new(data_type .. '*', data)))
    -- copy player's sync data to the allocated memory
    if copy_from_player then
        local copy_func = sync_info[3]
        if copy_func then
            local _, player_id
            if copy_from_player == true then
                _, player_id = sampGetPlayerIdByCharHandle(PLAYER_PED)
            else
                player_id = tonumber(copy_from_player)
            end
            copy_func(player_id, raw_data_ptr)
        end
    end
    -- function to send packet
    local func_send = function()
        local bs = raknetNewBitStream()
        raknetBitStreamWriteInt8(bs, sync_info[2])
        raknetBitStreamWriteBuffer(bs, raw_data_ptr, ffi.sizeof(data))
        raknetSendBitStreamEx(bs, sampfuncs.HIGH_PRIORITY, sampfuncs.UNRELIABLE_SEQUENCED, 1)
        raknetDeleteBitStream(bs)
    end
    -- metatable to access sync data and 'send' function
    local mt = {
        __index = function(t, index)
            return data[index]
        end,
        __newindex = function(t, index, value)
            data[index] = value
        end
    }
    return setmetatable({send = func_send}, mt)
end

function getClosestPlayerId()
	local minDist = 9999
	local closestId = -1
	local x, y, z = getCharCoordinates(PLAYER_PED)
	for i = 0, 999 do
		local streamed, pedID = sampGetCharHandleBySampPlayerId(i)
		if streamed then
			local xi, yi, zi = getCharCoordinates(pedID)
			local dist = math.sqrt( (xi - x) ^ 2 + (yi - y) ^ 2 + (zi - z) ^ 2 )
			if dist < minDist then
				minDist = dist
				closestId = i
			end
		end
	end
	return closestId
end

function samp.onSendExitVehicle(vehicleId)
    if elements.checkbox.AntiEject.v then
        return false
    end
end

function getBodyPartCoordinates(id, handle)
	local pedptr = getCharPointer(handle)
	local vec = ffi.new("float[3]")
	getBonePosition(ffi.cast("void*", pedptr), vec, id, true)
	return vec[0], vec[1], vec[2]
end

function join_argb(a, r, g, b)
  local argb = b
  argb = bit.bor(argb, bit.lshift(g, 8))
  argb = bit.bor(argb, bit.lshift(r, 16))
  argb = bit.bor(argb, bit.lshift(a, 24))
  return argb
end

function explode_argb(argb)
  local a = bit.band(bit.rshift(argb, 24), 0xFF)
  local r = bit.band(bit.rshift(argb, 16), 0xFF)
  local g = bit.band(bit.rshift(argb, 8), 0xFF)
  local b = bit.band(argb, 0xFF)
  return a, r, g, b
end

function onReceiveRpc(id, bs)
	if elements.checkbox.ShowDialog.v and id == 61 then return false end
	if elements.checkbox.Spectate.v and id == 124 then return false end
	if elements.checkbox.NHealth.v and id == 14 then return false end
	if elements.checkbox.GiveGun.v and id == 22 then return false end
	if elements.checkbox.ResetGun.v and id == 21 then return false end
	if elements.checkbox.SetGun.v and id == 67 then return false end
	if elements.checkbox.RequestClass.v and id == 128 then return false end
	if elements.checkbox.RequestSpawn.v and id == 129 then return false end
	if elements.checkbox.ApplyAnimation.v and id == 86 then return false end
	if elements.checkbox.ClearAnimation.v and id == 87 then return false end
	if elements.checkbox.ForceClass.v and id == 74 then return false end
	if elements.checkbox.FacingAngle.v and id == 19 then return false end
	if elements.checkbox.ToggleControl.v and id == 15 then return false end
end

function onSendRpc(id, bitStream, priority, reliability, orderingChannel, shiftTs)
	if elements.checkbox.RequestClass.v and id == 128 then return false end
	if elements.checkbox.RequestSpawn.v and id == 129 then return false end
end

function emul_rpc(hook, parameters)
    local bs_io = require 'samp.events.bitstream_io'
    local handler = require 'samp.events.handlers'
    local extra_types = require 'samp.events.extra_types'
    local hooks = {

        --[[ Outgoing rpcs
        ['onSendEnterVehicle'] = { 'int16', 'bool8', 26 },
        ['onSendClickPlayer'] = { 'int16', 'int8', 23 },
        ['onSendClientJoin'] = { 'int32', 'int8', 'string8', 'int32', 'string8', 'string8', 'int32', 25 },
        ['onSendEnterEditObject'] = { 'int32', 'int16', 'int32', 'vector3d', 27 },
        ['onSendCommand'] = { 'string32', 50 },
        ['onSendSpawn'] = { 52 },
        ['onSendDeathNotification'] = { 'int8', 'int16', 53 },
        ['onSendDialogResponse'] = { 'int16', 'int8', 'int16', 'string8', 62 },
        ['onSendClickTextDraw'] = { 'int16', 83 },
        ['onSendVehicleTuningNotification'] = { 'int32', 'int32', 'int32', 'int32', 96 },
        ['onSendChat'] = { 'string8', 101 },
        ['onSendClientCheckResponse'] = { 'int8', 'int32', 'int8', 103 },
        ['onSendVehicleDamaged'] = { 'int16', 'int32', 'int32', 'int8', 'int8', 106 },
        ['onSendEditAttachedObject'] = { 'int32', 'int32', 'int32', 'int32', 'vector3d', 'vector3d', 'vector3d', 'int32', 'int32', 116 },
        ['onSendEditObject'] = { 'bool', 'int16', 'int32', 'vector3d', 'vector3d', 117 },
        ['onSendInteriorChangeNotification'] = { 'int8', 118 },
        ['onSendMapMarker'] = { 'vector3d', 119 },
        ['onSendRequestClass'] = { 'int32', 128 },
        ['onSendRequestSpawn'] = { 129 },
        ['onSendPickedUpPickup'] = { 'int32', 131 },
        ['onSendMenuSelect'] = { 'int8', 132 },
        ['onSendVehicleDestroyed'] = { 'int16', 136 },
        ['onSendQuitMenu'] = { 140 },
        ['onSendExitVehicle'] = { 'int16', 154 },
        ['onSendUpdateScoresAndPings'] = { 155 },
        ['onSendGiveDamage'] = { 'int16', 'float', 'int32', 'int32', 115 },
        ['onSendTakeDamage'] = { 'int16', 'float', 'int32', 'int32', 115 },]]

        -- Incoming rpcs
        ['onInitGame'] = { 139 },
        ['onPlayerJoin'] = { 'int16', 'int32', 'bool8', 'string8', 137 },
        ['onPlayerQuit'] = { 'int16', 'int8', 138 },
        ['onRequestClassResponse'] = { 'bool8', 'int8', 'int32', 'int8', 'vector3d', 'float', 'Int32Array3', 'Int32Array3', 128 },
        ['onRequestSpawnResponse'] = { 'bool8', 129 },
        ['onSetPlayerName'] = { 'int16', 'string8', 'bool8', 11 },
        ['onSetPlayerPos'] = { 'vector3d', 12 },
        ['onSetPlayerPosFindZ'] = { 'vector3d', 13 },
        ['onSetPlayerHealth'] = { 'float', 14 },
        ['onTogglePlayerControllable'] = { 'bool8', 15 },
        ['onPlaySound'] = { 'int32', 'vector3d', 16 },
        ['onSetWorldBounds'] = { 'float', 'float', 'float', 'float', 17 },
        ['onGivePlayerMoney'] = { 'int32', 18 },
        ['onSetPlayerFacingAngle'] = { 'float', 19 },
        --['onResetPlayerMoney'] = { 20 },
        --['onResetPlayerWeapons'] = { 21 },
        ['onGivePlayerWeapon'] = { 'int32', 'int32', 22 },
        --['onCancelEdit'] = { 28 },
        ['onSetPlayerTime'] = { 'int8', 'int8', 29 },
        ['onSetToggleClock'] = { 'bool8', 30 },
        ['onPlayerStreamIn'] = { 'int16', 'int8', 'int32', 'vector3d', 'float', 'int32', 'int8', 32 },
        ['onSetShopName'] = { 'string256', 33 },
        ['onSetPlayerSkillLevel'] = { 'int16', 'int32', 'int16', 34 },
        ['onSetPlayerDrunk'] = { 'int32', 35 },
        ['onCreate3DText'] = { 'int16', 'int32', 'vector3d', 'float', 'bool8', 'int16', 'int16', 'encodedString4096', 36 },
        --['onDisableCheckpoint'] = { 37 },
        ['onSetRaceCheckpoint'] = { 'int8', 'vector3d', 'vector3d', 'float', 38 },
        --['onDisableRaceCheckpoint'] = { 39 },
        --['onGamemodeRestart'] = { 40 },
        ['onPlayAudioStream'] = { 'string8', 'vector3d', 'float', 'bool8', 41 },
        --['onStopAudioStream'] = { 42 },
        ['onRemoveBuilding'] = { 'int32', 'vector3d', 'float', 43 },
        ['onCreateObject'] = { 44 },
        ['onSetObjectPosition'] = { 'int16', 'vector3d', 45 },
        ['onSetObjectRotation'] = { 'int16', 'vector3d', 46 },
        ['onDestroyObject'] = { 'int16', 47 },
        ['onPlayerDeathNotification'] = { 'int16', 'int16', 'int8', 55 },
        ['onSetMapIcon'] = { 'int8', 'vector3d', 'int8', 'int32', 'int8', 56 },
        ['onRemoveVehicleComponent'] = { 'int16', 'int16', 57 },
        ['onRemove3DTextLabel'] = { 'int16', 58 },
        ['onPlayerChatBubble'] = { 'int16', 'int32', 'float', 'int32', 'string8', 59 },
        ['onUpdateGlobalTimer'] = { 'int32', 60 },
        ['onShowDialog'] = { 'int16', 'int8', 'string8', 'string8', 'string8', 'encodedString4096', 61 },
        ['onDestroyPickup'] = { 'int32', 63 },
        ['onLinkVehicleToInterior'] = { 'int16', 'int8', 65 },
        ['onSetPlayerArmour'] = { 'float', 66 },
        ['onSetPlayerArmedWeapon'] = { 'int32', 67 },
        ['onSetSpawnInfo'] = { 'int8', 'int32', 'int8', 'vector3d', 'float', 'Int32Array3', 'Int32Array3', 68 },
        ['onSetPlayerTeam'] = { 'int16', 'int8', 69 },
        ['onPutPlayerInVehicle'] = { 'int16', 'int8', 70 },
        --['onRemovePlayerFromVehicle'] = { 71 },
        ['onSetPlayerColor'] = { 'int16', 'int32', 72 },
        ['onDisplayGameText'] = { 'int32', 'int32', 'string32', 73 },
        --['onForceClassSelection'] = { 74 },
        ['onAttachObjectToPlayer'] = { 'int16', 'int16', 'vector3d', 'vector3d', 75 },
        ['onInitMenu'] = { 76 },
        ['onShowMenu'] = { 'int8', 77 },
        ['onHideMenu'] = { 'int8', 78 },
        ['onCreateExplosion'] = { 'vector3d', 'int32', 'float', 79 },
        ['onShowPlayerNameTag'] = { 'int16', 'bool8', 80 },
        ['onAttachCameraToObject'] = { 'int16', 81 },
        ['onInterpolateCamera'] = { 'bool', 'vector3d', 'vector3d', 'int32', 'int8', 82 },
        ['onGangZoneStopFlash'] = { 'int16', 85 },
        ['onApplyPlayerAnimation'] = { 'int16', 'string8', 'string8', 'bool', 'bool', 'bool', 'bool', 'int32', 86 },
        ['onClearPlayerAnimation'] = { 'int16', 87 },
        ['onSetPlayerSpecialAction'] = { 'int8', 88 },
        ['onSetPlayerFightingStyle'] = { 'int16', 'int8', 89 },
        ['onSetPlayerVelocity'] = { 'vector3d', 90 },
        ['onSetVehicleVelocity'] = { 'bool8', 'vector3d', 91 },
        ['onServerMessage'] = { 'int32', 'string32', 93 },
        ['onSetWorldTime'] = { 'int8', 94 },
        ['onCreatePickup'] = { 'int32', 'int32', 'int32', 'vector3d', 95 },
        ['onMoveObject'] = { 'int16', 'vector3d', 'vector3d', 'float', 'vector3d', 99 },
        ['onEnableStuntBonus'] = { 'bool', 104 },
        ['onTextDrawSetString'] = { 'int16', 'string16', 105 },
        ['onSetCheckpoint'] = { 'vector3d', 'float', 107 },
        ['onCreateGangZone'] = { 'int16', 'vector2d', 'vector2d', 'int32', 108 },
        ['onPlayCrimeReport'] = { 'int16', 'int32', 'int32', 'int32', 'int32', 'vector3d', 112 },
        ['onGangZoneDestroy'] = { 'int16', 120 },
        ['onGangZoneFlash'] = { 'int16', 'int32', 121 },
        ['onStopObject'] = { 'int16', 122 },
        ['onSetVehicleNumberPlate'] = { 'int16', 'string8', 123 },
        ['onTogglePlayerSpectating'] = { 'bool32', 124 },
        ['onSpectatePlayer'] = { 'int16', 'int8', 126 },
        ['onSpectateVehicle'] = { 'int16', 'int8', 127 },
        ['onShowTextDraw'] = { 134 },
        ['onSetPlayerWantedLevel'] = { 'int8', 133 },
        ['onTextDrawHide'] = { 'int16', 135 },
        ['onRemoveMapIcon'] = { 'int8', 144 },
        ['onSetWeaponAmmo'] = { 'int8', 'int16', 145 },
        ['onSetGravity'] = { 'float', 146 },
        ['onSetVehicleHealth'] = { 'int16', 'float', 147 },
        ['onAttachTrailerToVehicle'] = { 'int16', 'int16', 148 },
        ['onDetachTrailerFromVehicle'] = { 'int16', 149 },
        ['onSetWeather'] = { 'int8', 152 },
        ['onSetPlayerSkin'] = { 'int32', 'int32', 153 },
        ['onSetInterior'] = { 'int8', 156 },
        ['onSetCameraPosition'] = { 'vector3d', 157 },
        ['onSetCameraLookAt'] = { 'vector3d', 'int8', 158 },
        ['onSetVehiclePosition'] = { 'int16', 'vector3d', 159 },
        ['onSetVehicleAngle'] = { 'int16', 'float', 160 },
        ['onSetVehicleParams'] = { 'int16', 'int16', 'bool8', 161 },
        --['onSetCameraBehind'] = { 162 },
        ['onChatMessage'] = { 'int16', 'string8', 101 },
        ['onConnectionRejected'] = { 'int8', 130 },
        ['onPlayerStreamOut'] = { 'int16', 163 },
        ['onVehicleStreamIn'] = { 164 },
        ['onVehicleStreamOut'] = { 'int16', 165 },
        ['onPlayerDeath'] = { 'int16', 166 },
        ['onPlayerEnterVehicle'] = { 'int16', 'int16', 'bool8', 26 },
        ['onUpdateScoresAndPings'] = { 'PlayerScorePingMap', 155 },
        ['onSetObjectMaterial'] = { 84 },
        ['onSetObjectMaterialText'] = { 84 },
        ['onSetVehicleParamsEx'] = { 'int16', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 'int8', 24 },
        ['onSetPlayerAttachedObject'] = { 'int16', 'int32', 'bool', 'int32', 'int32', 'vector3d', 'vector3d', 'vector3d', 'int32', 'int32', 113 }

    }
    local handler_hook = {
        ['onInitGame'] = true,
        ['onCreateObject'] = true,
        ['onInitMenu'] = true,
        ['onShowTextDraw'] = true,
        ['onVehicleStreamIn'] = true,
        ['onSetObjectMaterial'] = true,
        ['onSetObjectMaterialText'] = true
    }
    local extra = {
        ['PlayerScorePingMap'] = true,
        ['Int32Array3'] = true
    }
    local hook_table = hooks[hook]
    if hook_table then
        local bs = raknetNewBitStream()
        if not handler_hook[hook] then
            local max = #hook_table-1
            if max > 0 then
                for i = 1, max do
                    local p = hook_table[i]
                    if extra[p] then extra_types[p]['write'](bs, parameters[i])
                    else bs_io[p]['write'](bs, parameters[i]) end
                end
            end
        else
            if hook == 'onInitGame' then handler.on_init_game_writer(bs, parameters)
            elseif hook == 'onCreateObject' then handler.on_create_object_writer(bs, parameters)
            elseif hook == 'onInitMenu' then handler.on_init_menu_writer(bs, parameters)
            elseif hook == 'onShowTextDraw' then handler.on_show_textdraw_writer(bs, parameters)
            elseif hook == 'onVehicleStreamIn' then handler.on_vehicle_stream_in_writer(bs, parameters)
            elseif hook == 'onSetObjectMaterial' then handler.on_set_object_material_writer(bs, parameters, 1)
            elseif hook == 'onSetObjectMaterialText' then handler.on_set_object_material_writer(bs, parameters, 2) end
        end
        raknetEmulRpcReceiveBitStream(hook_table[#hook_table], bs)
        raknetDeleteBitStream(bs)
    end
end

function samp.onBulletSync(playerid, data)
	if elements.checkbox.Traicer.v then
		if data.target.x == -1 or data.target.y == -1 or data.target.z == -1 then
			return true
		end
		BulletSync.lastId = BulletSync.lastId + 1
		if BulletSync.lastId < 1 or BulletSync.lastId > BulletSync.maxLines then
			BulletSync.lastId = 1
		end
		local id = BulletSync.lastId
		BulletSync[id].enable = true
		BulletSync[id].tType = data.targetType
		BulletSync[id].time = os.time() + 15
		BulletSync[id].o.x, BulletSync[id].o.y, BulletSync[id].o.z = data.origin.x, data.origin.y, data.origin.z
		BulletSync[id].t.x, BulletSync[id].t.y, BulletSync[id].t.z = data.target.x, data.target.y, data.target.z
	end
end
