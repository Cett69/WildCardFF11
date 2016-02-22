include('organizer-lib')
-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I use Motenten's define_roll_values function ** --
-- Last Updated: 03/02/14 8:00 PM *Added Distance Rule/Toggle, Fixed PDT/MDT & Updated Gear* --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Shooting/QD/TP/WS. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {'Movement', 'Regen'} -- Default Idle Set Is Movement --
	autoRAmode = 0
	Armor = 'None'
	Obi = 'ON' -- Turn Default Obi ON or OFF Here --
	define_roll_values()
	target_distance = 5 -- Set Default Distance Here --
	--send_command('input /macro book 15;input /macro set 10') -- Change Default Macro Book Here --

	ranged_ws = S{
			"Hot Shot","Split Shot","Sniper Shot","Slug Shot","Detonator","Numbing Shot",
			"Last Stand","Leaden Salute","Wildfire"}

	ACC_Shots = S{"Light Shot","Dark Shot"}
	
	sc_map = {SC1="CoursersRoll", SC2="DiaII", SC3="LightShot"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle/Town Sets --
	sets.Idle = {}
	sets.Idle.Regen = {
	head="Whirlpool mask",
			body="lak. Frac",
			hands="Iuitl Wristbands",
			legs="Nahtirah Trousers",
			feet="Iuitl Gaiters",
			neck="Wiglen Gorget",
			waist="Lycopodium Sash",
			ear1="Black Earring",
			ear2="black Earring",
			ring1="Karieyh Ring",
			ring2="Barataria Ring",
			back="Mecistopins Mantle"}
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			head="Whirlpool mask",
			body="lak. Frac",
			hands="Iuitl Wristbands",
			legs="Lak. trews",
			feet="Skd. Jambeaux +1",
			neck="",
			waist="Lycopodium Sash",
			ear1="Moonshade Earring",
			ear2="",
			ring1="",
			ring2="",
			back=""})

		--Gear Collection--
	sets.Collect = {
			main="Pulfanxa",
			head="Trump Card",
			neck="Trump Card Case", 
			ear1="Rhadamanthus",
			ear2="Remedy",
			body="Holy Waters",
			hands="Echo Drops",
			ring1="Legion Scutum",
			ring2="",
			back="Count's Garb",
			waist="",
			legs="Red Curry Bun",
			}
			
	sets.Collect2 = {
			main="Capacity Ring",
			head="Trizek Ring",
			}			
			
	-- QD Sets --
	sets.QD = {
			ammo="Animikii Bullet",
			head="Thaumas hat",
			neck="Stoicheion Medal",
			ear1="Hecate's Earring",
			ear2="Friomisi Earring",
			body="Rawhide Vest",
			hands="Schutzen Mittens",
			ring1="Garuda Ring +1",
			ring2="Blobnag Ring",
			back="Toro Cape",
			waist="Elanid Belt",
			legs="Nahtirah Trousers",
			--feet="Lanun Boots +1"
			feet="Chasseur's bottes +1"
			}
	sets.QD.MidACC = set_combine(sets.QD,{})
	sets.QD.HighACC = set_combine(sets.QD.MidACC,{
			head="Umbani Cap",
			body="Chasseur's Frac",
			hands="Sigyn's Bazubands",
			legs="Nahtirah Trousers",
			feet="Chasseur's bottes +1"})

	-- PDT/MDT Sets --
	sets.PDT = {
			head="Whirlpool mask",
			neck="Twilight Torque",
			ear1="Black Earring",
			ear2="black Earring",
			body="Iuitl Vest",
			hands="Iuitl Wristbands",
			ring1="Dark Ring",
			ring2="Dark Ring",
			back="Repulse Mantle",
			waist="flume belt +1",
			legs="Nahtirah Trousers",
			feet="Thur. boots +1"}

	sets.MDT = set_combine(sets.PDT,{
			ear1="Merman's Earring",
			ear2="Merman's Earring",
			ring1="Shadow Ring",
			back="Engulfer Cape",
			waist="Resolute Belt"})

	-- Roll Set --
	sets.Rolls = set_combine(sets.PDT,{
			head="Comm. Tricorne +2",
			hands="Chasseur's Gants",
			legs="desultor tassets",
			feet="Chasseur's bottes +1",
			ring1="Luzaf's Ring",
			ring2="Barataria Ring"})

	-- Preshot --
	sets.Preshot = {
			head="Chasseur's Tricorne",
			body='lak. frac',
			hands="Manibozho gloves",
			back="Navarch's Mantle",
			waist="Impulse Belt",
			legs="Nahtirah Trousers",
			feet="Wurrukatte Boots"}

	-- Shooting Base Set --
	sets.Midshot = {}

	-- Pulfanxa   Sets --
	sets.Midshot['Pulfanxa'] = {
			ammo="Adlivun Bullet",
			head="Umbani Cap",
			neck="Ocachi Gorget",
			ear1="Clearview Earring",
			ear2="Volley Earring",
			body="Kheper jacket",
			hands="Manibozho Gloves",
			ring1="Paqichikaji Ring",
			ring2="Arewe Ring",
			back="Terebellum Mantle",
			waist="Elanid Belt",
			legs="Nahtirah Trousers",
			feet="Iuitl Gaiters"}
	sets.Midshot['Pulfanxa'].MidACC = set_combine(sets.Midshot['Pulfanxa'],{
			head="Umbani Cap",
			feet="Qaxxo Leggings",
			ear1="Clearview Earring",
			ring1="Paqichikaji Ring",
			ring2="Garuda Ring +1",
			})
	sets.Midshot['Pulfanxa'].HighACC = set_combine(sets.Midshot['Pulfanxa'].MidACC,{
			neck="Iqabi Necklace",
			hands="Buremte Gloves",
			legs="Thur. Tights +1",
			ring1="Paqichikaji Ring",
			ring2="Arewe Ring",
			back="Gunslinger's Cape",
			})

	-- Armageddon Sets --
	sets.Midshot.Armageddon = {}
	sets.Midshot.Armageddon.MidACC = set_combine(sets.Midshot.Armageddon,{})
	sets.Midshot.Armageddon.HighACC = set_combine(sets.Midshot.Armageddon.MidACC,{})

	-- Melee Sets --
	sets.Melee = {
		head="Iuitl headgear",
		body="Rawhide Vest",
		hands="Iuitl Wristbands",
		legs="Nahtirah Trousers",
		feet="Qaaxo Leggings",
		neck="Rancor Collar",
		waist="Windbuffet Belt +1",
		ear1="Dudgeon earring",ear2="Heartseeker Earring",
		ring1="Karieyh Ring",ring2="Epona's Ring",
		back="Bleating Mantle"}
	sets.Melee.MidACC = set_combine(sets.Melee,{})
	sets.Melee.HighACC = set_combine(sets.Melee.MidACC,{})

	-- WS Base Set --
	sets.WS = {}

	-- WS Sets --
	sets.WS["Last Stand"] = {
			ammo="Adlivun Bullet",
			head="Umbani Cap",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Clearview Earring",
			body="Kheper jacket",
			hands="Buremte gloves",
			ring1="Karieyh Ring",
			ring2="Garuda Ring +1",
			back="Terebellum Mantle",
			waist="Fotia Belt",
			legs="Nahtirah Trousers",
			feet="Iuitl Gaiters"}
	sets.WS["Last Stand"].MidACC = set_combine(sets.WS["Last Stand"],{
			head="Umbani Cap",
			legs="Lanun Culottes",
			feet="Qaaxo Leggings",
			})
	sets.WS["Last Stand"].HighACC = set_combine(sets.WS["Last Stand"].MidACC,{
			body="Lak. Frac",
			hands="Buremte Gloves",
			legs="Thur. Tights +1",
			ring1="Karieyh Ring",
			ring2="Garuda Ring +1",
			back="Libeccio mantle",
			})

	sets.WS.Wildfire = {
		ammo='Orichalc. Bullet',
		head="Umbani Cap",
		body="Rawhide Vest",
		hands="Iuitl Wristbands",
		legs="Iuitl Tights",
		feet="Lanun Boots +1",
		neck="Stoicheion Medal",
		waist="Gunslinger's Cape",
		ear1="Friomisi Earring",
		ear2="Hecate's Earring",
		ring1="Paqichikaji Ring",
		ring2="Garuda Ring +1",
		back="Toro Cape",
	}
	sets.WS.Wildfire.MidACC = set_combine(sets.WS.Wildfire,{})
	sets.WS.Wildfire.HighACC = set_combine(sets.WS.Wildfire.MidACC,{})

	-- Elemental Obi --
	sets.Obi = {}
	sets.Obi.Thunder = {waist='Rairin Obi'}
	sets.Obi.Water = {waist='Suirin Obi'}
	sets.Obi.Fire = {waist='Karin Obi'}
	sets.Obi.Ice = {waist='Hyorin Obi'}
	sets.Obi.Wind = {waist='Furin Obi'}
	sets.Obi.Earth = {waist='Dorin Obi'}
	sets.Obi.Light = {waist='Hachirin-no-Obi'}
	sets.Obi.Dark = {waist='Anrin Obi'}

	-- JA Sets --
	sets.JA = {}
	sets.JA['Random Deal'] = {body="Lanun Frac"}
	sets.JA['Fold'] = {}
	sets.JA['Snake Eye'] = {legs="Comm. culottes +2"}
	sets.JA['Wild Card'] = {feet="Lanun Boots +1"}
	sets.JA['Phantom Roll'] = {hands="Chasseur's Gants",ring1="Luzaf's Ring",ring2="Barataria Ring"}
	sets.JA['Double-Up'] = {ring1="Luzaf's Ring",ring2="Barataria Ring"}
	sets.JA['Triple Shot'] = {body="Chasseur's Frac"}
	
	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	--Fastcast Set --
	sets.Precast.FastCast = {}

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{})
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.type == "CorsairRoll" and buffactive[spell.english] then -- Change Any Rolls To Double-Up When You Have A Roll Up --
		cancel_spell()
		send_command('doubleup')
	elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		cancel_spell()
		send_command('ThirdEye')
	elseif spell.english == "Meditate" and player.tp > 290 then -- Cancel Meditate If TP Is Above 290 --
		cancel_spell()
		add_to_chat(8, spell.name .. ' Canceled: ' .. player.tp)
	elseif ranged_ws:contains(spell.english) and spell.target.distance > 16+target_distance and player.status == 'Engaged' then
		cancel_spell()
		add_to_chat(8, spell.name..' Canceled: [Out of Range]')
		return
	elseif spell.type == "WeaponSkill" and not ranged_ws:contains(spell.english) and spell.target.distance > target_distance and player.status == 'Engaged' then
		cancel_spell()
		add_to_chat(8, spell.name..' Canceled: [Out of Range]')
		return
	end
end

function precast(spell,action)
	if spell.english == 'Ranged' or spell.type == "WeaponSkill" then
		if player.equipment.ammo == "Animikii Bullet" then -- Cancel Ranged Attack or WS If You Have Animikii Bullet Equipped --
			cancel_spell()
			add_to_chat(8, spell.name .. ' Canceled: [Animikii Bullet Equipped!]')
			return
		elseif spell.english=='Ranged' then
			equip(sets.Preshot)
		elseif spell.type == "WeaponSkill" then
			if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
				cancel_spell()
				add_to_chat(8,'Unable To Use WeaponSkill: [Disengaged]')
				return
			else
				equipSet = sets.WS
				if equipSet[spell.english] then
					equipSet = equipSet[spell.english]
				end
				if equipSet[AccArray[AccIndex]] then
					equipSet = equipSet[AccArray[AccIndex]]
				end
				if spell.english == "Last Stand" and (player.tp > 299 or buffactive.Sekkanoki) then
					equipSet = set_combine(equipSet,{ear1="Altdorf's Earring",ear2="Wilhelm's Earring"})
				end
				equip(equipSet)
			end
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
			if spell.english == "Snake Eye" then -- Auto Double-Up After You Use Snake Eye --
				send_command('@wait 1;input /ja Double-Up <me>')
			end
		end
	elseif spell.type == "CorsairRoll" or spell.english == "Double-Up" then
		equip(sets.Rolls)
		if spell.english == "Tactician's Roll" then
			equip({body="Chasseur's Frac"})
		elseif spell.english == "Caster's Roll" then
			equip({legs="Chasseur's Culottes"})
		elseif spell.english == "Courser's Roll" then
			equip({feet="Chasseur's Bottes +1"})
		end
	elseif spell.type == "CorsairShot" then
		equipSet = sets.QD
		if ACC_Shots:contains(spell.english) then
			equipSet = sets.QD.HighACC
		else
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if not ACC_Shots:contains(spell.english) and (world.day_element == spell.element or world.weather_element == spell.element) and sets.Obi[spell.element] and Obi == 'ON' then
				equipSet = set_combine(equipSet,sets.Obi[spell.element])
			end
		end
		equip(equipSet)
	elseif spell.type:endswith('Magic') or spell.type=='Ninjutsu' then
		if string.find(spell.english,'Utsusemi') then
			if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
				cancel_spell()
				add_to_chat(8, spell.name .. ' Canceled: [3+ Images]')
				return
			else
				equip(sets.Precast.FastCast)
			end
		else
			equip(sets.Precast.FastCast)
		end
	elseif spell.type == "Waltz" then
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
end

function midcast(spell,action)
	if spell.english=='Ranged' then
		equipSet = sets.Midshot
		if equipSet[player.equipment.range] then
			equipSet = equipSet[player.equipment.range]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		equip(equipSet)
	elseif spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
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
		else
			equip(sets.Midcast.Haste)
		end
	end
end

function aftercast(spell,action)
	if spell.english == 'Ranged' and autoRAmode==1 then
		autoRA()
	elseif spell.type == "WeaponSkill" and not spell.interrupted then
		send_command('wait 0.2;gs c TP')
	elseif spell.type == 'CorsairRoll' and not spell.interrupted then
		display_roll_info(spell)
	elseif spell.english == 'Light Shot' and not spell.interrupted then -- Sleep Countdown --
		send_command('wait 50;input /echo '..spell.name..' Effect: [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..' Effect: [OFF]')
	else
		status_change(player.status)
	end
end

function status_change(new,old)
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif new == 'Engaged' then
		equipSet = sets.Melee
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		equip(equipSet)
	elseif new == 'Idle' then
		equip(sets.Idle[IdleArray[IdleIndex]])
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer Bar & AM3 Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 120;input /echo Aftermath: Lv.3 [WEARING OFF IN 60 SEC.];wait 30;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 20;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(8,'AM3: [OFF]')
		end
	elseif buff == 'weakness' then -- Weakness Timer Bar --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	status_change(player.status)
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Ranged Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		status_change(player.status)
		add_to_chat(158,'Ranged Accuracy Level: ' .. AccArray[AccIndex])
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C3' then -- Obi Toggle --
		if Obi == 'ON' then
			Obi = 'OFF'
			add_to_chat(8,'Obi: [OFF]')
		else
			Obi = 'ON'
			add_to_chat(158,'Obi: [ON]')
		end
		status_change(player.status)
	elseif command == 'C7' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(8,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(8,'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(8,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		status_change(player.status)
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
	elseif command == 'C2' then -- Auto Ranged Attack Toggle. *Don't Rely On This. It Isn't As Fast As Shooting Manually. It Is Mainly For AFK or When You Dualbox* --
		if autoRAmode == 0 then
			autoRAmode = 1
			add_to_chat(158,'AutoRA Mode: [ON]')
		else
			autoRAmode = 0
			add_to_chat(8,'AutoRA Mode: [OFF]')
		end
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function autoRA()
	send_command('@wait 2.7; input /ra <t>')
end

function define_roll_values()
	rolls = {
		CorsairsRoll		= {lucky=5, unlucky=9, bonus="Experience Points"},
		NinjaRoll		= {lucky=4, unlucky=8, bonus="Evasion"},
		HuntersRoll		= {lucky=4, unlucky=8, bonus="Accuracy"},
		ChaosRoll		= {lucky=4, unlucky=8, bonus="Attack"},
		MagussRoll		= {lucky=2, unlucky=6, bonus="Magic Defense"},
		HealersRoll		= {lucky=3, unlucky=7, bonus="Cure Potency Received"},
		PuppetRoll		= {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
		ChoralRoll		= {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
		MonksRoll		= {lucky=3, unlucky=7, bonus="Subtle Blow"},
		BeastRoll		= {lucky=4, unlucky=8, bonus="Pet Attack"},
		SamuraiRoll		= {lucky=2, unlucky=6, bonus="Store TP"},
		EvokersRoll		= {lucky=5, unlucky=9, bonus="Refresh"},
		RoguesRoll		= {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
		WarlocksRoll		= {lucky=4, unlucky=8, bonus="Magic Accuracy"},
		FightersRoll		= {lucky=5, unlucky=9, bonus="Double Attack Rate"},
		DrachenRoll		= {lucky=3, unlucky=7, bonus="Pet Accuracy"},
		GallantsRoll		= {lucky=3, unlucky=7, bonus="Defense"},
		WizardsRoll		= {lucky=5, unlucky=9, bonus="Magic Attack"},
		DancersRoll		= {lucky=3, unlucky=7, bonus="Regen"},
		ScholarsRoll		= {lucky=2, unlucky=6, bonus="Conserve MP"},
		BoltersRoll		= {lucky=3, unlucky=9, bonus="Movement Speed"},
		CastersRoll		= {lucky=2, unlucky=7, bonus="Fast Cast"},
		CoursersRoll		= {lucky=3, unlucky=9, bonus="Snapshot"},
		BlitzersRoll		= {lucky=4, unlucky=9, bonus="Attack Delay"},
		TacticiansRoll		= {lucky=5, unlucky=8, bonus="Regain"},
		AlliessRoll		= {lucky=3, unlucky=10, bonus="Skillchain Damage"},
		MisersRoll		= {lucky=5, unlucky=7, bonus="Save TP"},
		CompanionsRoll		= {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
		AvengersRoll		= {lucky=4, unlucky=8, bonus="Counter Rate"}
		}
end

function display_roll_info(spell)
	rollinfo = rolls[(string.gsub((string.gsub(spell.english, "%'+", "")), "%s+", ""))]
	if rollinfo then
		add_to_chat(158, spell.english..' = '..rollinfo.bonus..'. Lucky Roll is '..
			tostring(rollinfo.lucky)..', Unlucky Roll is '..tostring(rollinfo.unlucky)..'.')
	end
end