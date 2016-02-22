-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some of Motenten's Functions ** --
-- Last Updated: 05/02/14 10:00 PM *Advanced Version* --
include('organizer-lib')
function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {'Movement','Regen'} -- Default Idle Set Is Movement --
	Armor = 'None'
	Attack = 'OFF' -- Set Default Attack Set ON or OFF Here --
	Migawari = 'ON' -- Set Default Migawari Body ON or OFF Here --
	Rancor = 'OFF' -- Set Default Rancor ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	sc_map = {SC1="BladeHi", SC2="UtsusemiNi", SC3="UtsusemiIchi"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle/Town Sets --
	sets.Idle = {}
	sets.Idle.Regen = {
			ammo="Happo shuriken +1",
			head="Oce. Headpiece +1",
			neck="Wiglen Gorget",
			ear1="Heartseeker Earring",
			ear2="Dudgeon Earring",
			body="Mekosuchinae harness",
			hands="Umuthi gloves",
			ring1="Paguroidea Ring",
			ring2="Sheltered Ring",
			back="Scuta cape",
			waist="Flume belt +1",
			legs="Otronif brais +1",
			feet="Otronif boots +1"}
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			head="Ptica headgear",
			neck="Loricate torque +1",
			ear1="Trux Earring",
			ear2="Sanare Earring",
			body="Mes. Haubergeon",
			hands="Otronif Gloves +1",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back="Yokaze Mantle"})

	-- Normal TP Sets --
	sets.TP = {
			ammo="Happo shuriken +1",
			head="Ptica headgear",
			neck="Asperity Necklace",
			ear1="Heartseeker Earring",
			ear2="Dudgeon Earring",
			body="Mochi. chainmail +1",
			hands="Otronif Gloves +1",
			ring1="Epona's Ring",
			ring2="Rajas Ring",
			back="Bleating Mantle",
			waist="Shetal stone",
			legs="Mochizuki Hakama +1",
			feet="Mochizuki kyahan +1"}
	sets.TP.MidACC = set_combine(sets.TP,{
			hands="Umuthi gloves",
			back="Yokaze Mantle",
			ring2="Ramuh ring +1"})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{
			legs="Ighwa trousers",
			waist="Anguinus Belt",
			feet="Mochizuki kyahan +1"})

	-- March x2 --
	-- March + Haste + Haste Samba --
	sets.TP.MidHaste = {
			ammo="Happo shuriken +1",
			head="Ptica headgear",
			neck="Asperity Necklace",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			body="Thaumas Coat",
			hands="Otronif Gloves +1",
			ring1="Epona's Ring",
			ring2="Rajas Ring",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			legs="Otronif brais +1",
			feet="Mochizuki kyahan +1"}
	sets.TP.MidACC.MidHaste = set_combine(sets.TP.MidHaste,{
			hands="Umuthi gloves",
			back="Yokaze Mantle",
			ring2="Ramuh ring +1"})
	sets.TP.HighACC.MidHaste = set_combine(sets.TP.MidACC.MidHaste,{
			legs="Ighwa trousers",
			body="Mes. Haubergeon",
			waist="Anguinus Belt",
			legs="Otronif brais +1",
			feet="Mochizuki kyahan +1"})

	-- March x2 + Haste --
	-- Embrava + (March x2 or March + Haste) --
	sets.TP.HighHaste = {
			ammo="Happo shuriken +1",
			head="Felistris Mask",
			neck="Asperity Necklace",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			body="Thaumas Coat",
			hands="Otronif Gloves +1",
			ring1="Epona's Ring",
			ring2="Rajas Ring",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			legs="Mochizuki Hakama +1",
			feet="Mochizuki kyahan +1"}
	sets.TP.MidACC.HighHaste = set_combine(sets.TP.HighHaste,{
			hands="Umuthi gloves",
			back="Yokaze Mantle"})
	sets.TP.HighACC.HighHaste = set_combine(sets.TP.MidACC.HighHaste,{
			head="Whirlpool Mask",
			legs="Ighwa trousers",
			body="Mes. Haubergeon",
			waist="Anguinus Belt",
			ring1="Ramuh ring +1"})

	-- Embrava + (Haste or March) TP Sets --
	sets.TP.EmbravaHaste = {
			ammo="Happo shuriken +1",
			head="Ptica headgear",
			neck="Asperity Necklace",
			ear1="Suppanomimi",
			ear2="Brutal Earring",
			body="Thaumas Coat",
			hands="Otronif Gloves +1",
			ring1="Epona's Ring",
			ring2="Rajas Ring",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			legs="Mochizuki Hakama +1",
			feet="Mochizuki kyahan +1"}
	sets.TP.MidACC.EmbravaHaste = set_combine(sets.TP.EmbravaHaste,{
			ear1="Heartseeker Earring",
			ear2="Dudgeon Earring",
			hands="Umuthi gloves",
			back="Yokaze Mantle",
			waist="Anguinus Belt"})
	sets.TP.HighACC.EmbravaHaste = set_combine(sets.TP.MidACC.EmbravaHaste,{
			head="Whirlpool Mask",
			body="Mes. Haubergeon",
			legs="Ighwa trousers",
			ring1="Ramuh ring +1"})

	-- TP Rancor ON Neck --
	sets.TP.Rancor = {neck="Rancor Collar"}

	-- TP Migawari Set --
	sets.TP.Migawari = {body="Iga Ningi +2"}

	-- PDT/MDT Sets --
	sets.PDT = {
			ammo="Iron Gobbet",
			head="Lithelimb cap",
			neck="Agitator's collar",
			body="Otro. harness +1",
			hands="Umuthi gloves",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back="Mollusca Mantle",
			waist="Flume belt +1",
			legs="Otronif brais +1",
			feet="Otronif boots +1"}

	sets.MDT = set_combine(sets.PDT,{
			ammo="Vanir Battery",
			neck="Loricate torque +1",
			ear1="Trux Earring",
			ear2="Sanare Earring",
			hands="otronif gloves +1",
			ring1="Shadow Ring",
			back="Mubvumbamiri mantle"})

	-- Hybrid/Evasion Sets --
	sets.TP.Hybrid = {
			ammo="Happo shuriken +1",
			head="Felistris Mask",
			neck="Asperity Necklace",
			ear1="trux Earring",
			ear2="brutal Earring",
			body="Thaumas Coat",
			hands="Otronif Gloves +1",
			ring1="Epona's Ring",
			ring2="Rajas Ring",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			legs="Otronif brais +1",
			feet="Mochizuki kyahan +1"}
	sets.TP.Hybrid.MidACC = {
			head="Ptica headgear"}
	sets.TP.Hybrid.HighACC = {
			body="Mes. Haubergeon"}

	sets.DT = set_combine(sets.PDT,{
			ammo="Vanir Battery",
			head="Lithelimb cap",
			neck="Loricate torque +1",
			ear1="Trux Earring",
			ear2="Sanare Earring",
			body="Otro. harness +1",
			hands="otronif gloves +1",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back="Mollusca Mantle",
			waist="Flume belt +1",
			legs="Otronif brais +1",
			feet="Otronif boots +1"})
			
	sets.Evasion = set_combine(sets.PDT,{
			head="Ptica headgear",
			body="Qaaxo harness",
			hands="Umuthi gloves",
			back="Yokaze Mantle",
			legs="Kaabnax Trousers",
			feet="Durgai leggings"})

	-- WS Base Set --
	sets.WS = {}

	-- Blade: Hi Sets --
	sets.WS["Blade: Hi"] = {
			ammo="Happo shuriken +1",
			head="Uk'uxkaj cap",
			neck="Fotia gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Dread jupon",
			hands="Seiryu's kote",
			ring1="Epona's Ring",
			ring2="Garuda ring +1",
			back="Rancorous Mantle",
			waist="Windbuffet Belt +1",
			legs="Mochizuki Hakama +1",
			feet="Mochizuki kyahan +1"}
	sets.WS["Blade: Hi"].MidACC = set_combine(sets.WS["Blade: Hi"],{
			head="Ptica headgear",
			neck="Rancor Collar",
			ring2="Rajas Ring",
			waist="Fotia Belt"})
	sets.WS["Blade: Hi"].HighACC = set_combine(sets.WS["Blade: Hi"].MidACC,{
			back="Yokaze Mantle"})

	-- Blade: Hi(Attack) Set --
	sets.WS["Blade: Hi"].ATT = set_combine(sets.WS["Blade: Hi"],{})

	-- Blade: Shun Sets --
	sets.WS["Blade: Shun"] = {}
	sets.WS["Blade: Shun"].MidACC = set_combine(sets.WS["Blade: Shun"],{})
	sets.WS["Blade: Shun"].HighACC = set_combine(sets.WS["Blade: Shun"].MidACC,{})

	-- Blade: Shun(Attack) Set --
	sets.WS["Blade: Shun"].ATT = set_combine(sets.WS["Blade: Shun"],{})

	sets.WS.Exenterator = {}

	sets.WS.Evisceration = {}

	sets.WS["Sanguine Blade"] = {}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatiens",
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			body="Dread jupon",
			hands="Buremte Gloves",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			feet="Suzaku's sune-ate"}
	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{neck="Magoraga Beads",body="Mochi. Chainmail +1"})

	sets.Midcast = {}
	-- -- Magic Haste/Utsusemi Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{hands="Mochizuki Tekko +1",body="Dread jupon",feet="Iga Kyahan +2"})

	-- Migawari Magic Set --
	sets.Midcast.Migawari = {
			head="Uk'uxkaj cap",
			body="Dread jupon",
			hands="Mochizuki Tekko +1",
			legs="Otronif brais +1",
			feet="Mochizuki kyahan +1"}

	-- Ninjutsu Set --
	sets.Midcast.Ninjutsu = {
			ammo="Ghastly tathlum +1",
			head="Umbani cap",
			neck="Stoicheion medal",
			ear1="Friomisi Earring",
			ear2="Novio Earring",
			body="tessera saio",
			hands="Mochizuki Tekko +1",
			ring1="Fenrir ring +1",
			ring2="Fenrir ring +1",
			back="Toro cape",
			waist="Wanion Belt",
			feet="Mochizuki kyahan +1"}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Yonin" and buffactive.Yonin then -- Change Yonin To Innin If Yonin Is On --
		cancel_spell()
		send_command('Innin')
	elseif spell.english == "Innin" and buffactive.Innin then -- Change Innin To Yonin If Innin Is On --
		cancel_spell()
		send_command('Yonin')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif (spell.english == 'Ranged' and spell.target.distance > 24.9) or (spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged') then -- Cancel Ranged Attack or WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	end
end

function precast(spell,action)
	if spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if Attack == 'ON' then
				equipSet = equipSet["ATT"]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if player.tp > 2999 then
				if spell.english == "Blade: Hi" then
					equipSet = set_combine(equipSet,{ear1="Trux earring"})
				elseif spell.english == "Blade: Shun" then
					equipSet = set_combine(equipSet,{ear1="Dominance earring +1"})
				end
			end
			equip(equipSet)
		end
	elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if string.find(spell.english,'Utsusemi') then
				if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
					cancel_spell()
					add_to_chat(123, spell.english .. ' Canceled: [3+ Images]')
					return
				else
					equip(sets.Precast.Utsusemi)
				end
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
end

function midcast(spell,action)
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		if string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equip(sets.Midcast.Haste)
		elseif string.find(spell.english,'Tonko') then
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Migawari: Ichi' then
			equip(sets.Midcast.Migawari)
		elseif sets.Midcast[spell.skill] then
			equip(sets.Midcast[spell.skill])
		end
	end
end

function aftercast(spell,action)
	if spell.type == "WeaponSkill" and not spell.interrupted then
		send_command('wait 0.2;gs c TP')
	end
	status_change(player.status)
end

function status_change(new,old)
	check_range_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif Armor == 'EVA' then
		equip(sets.Evasion)
	elseif Armor == 'DT' then
		equip(sets.DT)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if (buffactive.Haste and buffactive.March == 2) and (buffactive.Embrava and (buffactive.March == 2 or (buffactive.March and buffactive.Haste))) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if buffactive.Embrava and (buffactive.Haste or buffactive.March) and equipSet["EmbravaHaste"] then
			equipSet = equipSet["EmbravaHaste"]
		end
		if (buffactive.March == 1 and buffactive.Haste and buffactive["Haste Samba"]) or (buffactive.March == 2) and equipSet["MidHaste"] then
			equipSet = equipSet["MidHaste"]
		end
		if Rancor == 'ON' then -- Use Rancor Toggle For Rancor Collar --
			equipSet = set_combine(equipSet,sets.TP.Rancor)
		end
		equip(equipSet)
	else
		equip(sets.Idle[IdleArray[IdleIndex]])
		if world.time >= 1020 or world.time <= 420 then
			equip({feet="Hachi. Kyahan +1"})
		end
	end
	if buffactive.Migawari and Migawari == 'ON' then -- Use Migawari Toggle To Lock Iga Ningi +2 When You Have Migawari On --
		equip(sets.TP.Migawari)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 120;input /echo Aftermath: Lv.3 [WEARING OFF IN 60 SEC.];wait 30;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 20;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if not midaction() then
		status_change(player.status)
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		status_change(player.status)
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Hybrid Toggle --
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123,'Hybrid Set: [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
		end
		status_change(player.status)
	elseif command == 'C7' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C10' then -- Migawari Set Toggle --
		if Migawari == 'ON' then
			Migawari = 'OFF'
			add_to_chat(123,'Migawari Set: [Unlocked]')
		else
			Migawari = 'ON'
			add_to_chat(158,'Migawari Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Evasion Toggle --
		if Armor == 'EVA' then
			Armor = 'None'
			add_to_chat(123,'Evasion Set: [Unlocked]')
		else
			Armor = 'EVA'
			add_to_chat(158,'Evasion Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C16' then -- Rancor Toggle --
		if Rancor == 'ON' then
			Rancor = 'OFF'
			add_to_chat(123,'Rancor: [OFF]')
		else
			Rancor = 'ON'
			add_to_chat(158,'Rancor: [ON]')
		end
		status_change(player.status)
	elseif command == 'C17' then -- DT Toggle --
		if Armor == 'DT' then
			Armor = 'None'
			add_to_chat(123,'DT Set: [Unlocked]')
		else
			Armor = 'DT'
			add_to_chat(158,'DT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- Attack Toggle --
		if Attack == 'ON' then
			Attack = 'OFF'
			add_to_chat(123,'Attack: [OFF]')
		else
			Attack = 'ON'
			add_to_chat(158,'Attack: [ON]')
		end
		status_change(player.status)
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		status_change(player.status)
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_range_lock()
	if player.equipment.range ~= 'empty' then
		disable('range','ammo')
	else
		enable('range','ammo')
	end
end

function refine_waltz(spell,action)
	if spell.type ~= 'Waltz' then
		return
	end

	if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" or spell.name == "Divine Waltz II" then
		return
	end

	local newWaltz = spell.english
	local waltzID

	local missingHP

	if spell.target.type == "SELF" then
		missingHP = player.max_hp - player.hp
	elseif spell.target.isallymember then
		local target = find_player_in_alliance(spell.target.name)
		local est_max_hp = target.hp / (target.hpp/100)
		missingHP = math.floor(est_max_hp - target.hp)
	end

	if missingHP ~= nil then
		if player.sub_job == 'DNC' then
			if missingHP < 40 and spell.target.name == player.name then
				add_to_chat(123,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 300 then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			else
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
		else
			return
		end
	end

	local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50, ['Curing Waltz IV'] = 65, ['Curing Waltz V'] = 80}
	local tpCost = waltzTPCost[newWaltz]

	local downgrade

	if player.tp < tpCost and not buffactive.trance then

		if player.tp < 20 then
			add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
			cancel_spell()
			return
		elseif player.tp < 35 then
			newWaltz = 'Curing Waltz'
		elseif player.tp < 50 then
			newWaltz = 'Curing Waltz II'
		elseif player.tp < 65 then
			newWaltz = 'Curing Waltz III'
		elseif player.tp < 80 then
			newWaltz = 'Curing Waltz IV'
		end

		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
	end

	if newWaltz ~= spell.english then
		send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then
			add_to_chat(158, downgrade)
		end
		cancel_spell()
		return
	end

	if missingHP > 0 then
		add_to_chat(158,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
	end
end

function find_player_in_alliance(name)
	for i,v in ipairs(alliance) do
		for k,p in ipairs(v) do
			if p.name == name then
				return p
			end
		end
	end
end

function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book()
end

function set_macro_page(set,book)
	if not tonumber(set) then
		add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
		return
	end
	if set < 1 or set > 10 then
		add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
		return
	end

	if book then
		if not tonumber(book) then
			add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
			return
		end
		if book < 1 or book > 20 then
			add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
			return
		end
		send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
	else
		send_command('@input /macro set '..tostring(set))
	end
end

function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 3)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 3)
	else
		set_macro_page(1, 3)
	end
end