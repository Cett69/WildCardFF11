-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Motenten's Macro Book Function ** --
-- Last Updated: 05/05/14 12:00 AM *Fixed Magic Sets & Added Precast Elemental Staff Toggle* --

function get_sets()
	IdleIndex = 1
	IdleArray = {"Movement","Refresh"} -- Default Idle Set Is Movement --
	Armor = 'None'
	canceled = false
	DC = false
	Main = 'OFF' -- Set Default Main Weapon ON or OFF Here --
	Enmity = 'OFF' -- Set Default Enmity Set ON or OFF Here --
	Kiting = 'ON' -- Set Default Sublimation Kiting ON or OFF Here --
	ElementalStaff = 'ON' -- Set Default Precast Elemental Staff ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV","Cure V","Cure VI"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II","Curaga III","Curaga IV","Curaga V"} -- Curaga Degradation --
	Na_Spells = S{"Paralyna","Cursna","Silena","Poisona","Blindna","Viruna","Stona","Erase"} -- For Yagrush --
	sc_map = {SC1 = "LightArts", SC2 = "Celerity", SC3 = "Accession"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}
	-- Idle Sets --
	sets.Idle.Refresh = {
			main="Bolelabunga",
			sub="Genbu's Shield",
			ammo="Oreiad's Tathlum",
			head="Wivre Hairpin",
			neck="Wiglen Gorget",
			ear1="Lifestorm Earring",
			ear2="Beatific Earring",
			body="Gendewitha Bliaut",
			hands="Serpentes Cuffs",
			ring1="Sheltered Ring",
			ring2="Paguroidea Ring",
			back="Kumbira Cape",
			waist="Slipor Sash",
			legs="Nares Trews",
			feet="Serpentes Sabots"}
	sets.Idle.Movement = set_combine(sets.Idle.Refresh,{
			neck="Twilight Torque",
			ring1="Patricius Ring",
			ring2="Dark Ring",
			feet="Herald's Gaiters"})
	sets.Resting = {
			main="Boonwell Staff",
			ammo="Clarus Stone",
			head="Orvail Corona",
			neck="Eidolon Pendant",
			ear1="Loquac. Earring",
			ear2="Relaxing Earring",
			body="Chelona Blazer +1",
			hands="Nares Cuffs",
			ring1="Angha Ring",
			ring2="Paguroidea Ring",
			back="Felicitas Cape",
			waist="Austerity Belt",
			legs="Nisse Slacks",
			feet="Chelona Boots +1"}

	-- PDT Set --
	sets.PDT = {
			main="Bolelabunga",
			sub="Genbu's Shield",
			head="Gende. Caubeen",
			neck="Twilight Torque",
			body="Gendewitha Bliaut",
			hands="Gendewitha Gages",
			ring1="Patricius Ring",
			ring2="Dark Ring",
			back="Repulse Mantle",
			waist="Slipor Sash",
			legs="Artsieq Hose",
			feet="Gende. Galosh. +1"}

	-- Sublimation Set --
	sets.Sublimation = {
			main="Bolelabunga",
			sub="Genbu's Shield",
			ammo="Oreiad's Tathlum",
			head="Wivre Hairpin",
			neck="Dualism Collar",
			ear1="Loquac. Earring",
			ear2="Bloodgem Earring",
			body="Gendewitha Bliaut",
			hands="Serpentes Cuffs",
			ring1="K'ayres Ring",
			ring2="Meridian Ring",
			back="Gigant Mantle",
			waist="Forest Sash",
			legs="Nares Trews",
			feet="Serpentes Sabots"}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			sub=empty,
			ammo="Impatiens",
			head="Nahtirah Hat",
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			body="Marduk's Jubbah +1",
			hands="Gendewitha Gages",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Swith Cape +1",
			waist="Witful Belt";
			legs="Artsieq Hose",
			feet="Chelona Boots +1"}

	-- Elemental Staves --
	sets.Precast.Wind = {main='Vayuvata I'}
	sets.Precast.Light = {main='Arka I'}

	sets.Precast.Stoneskin = set_combine(sets.Precast.FastCast,{head="Umuthi Hat",waist="Siegel Sash"})
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{main="Yagrush",waist="Siegel Sash"})
	sets.Precast['Healing Magic'] = set_combine(sets.Precast.FastCast,{main="Yagrush",legs="Orsn. Pantaln. +2"})

	-- Cure Precast Set --
	sets.Precast.Cure = {
			sub=empty,
			ammo="Impatiens",
			head="Nahtirah Hat",
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			body="Heka's Kalasiris",
			hands="Gendewitha Gages",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Pahtli Cape",
			waist="Witful Belt";
			legs="Orsn. Pantaln. +2",
			feet="Chelona Boots +1"}

	-- Midcast Base Set --
	sets.Midcast = {
			main="Bolelabunga",
			sub="Genbu's Shield",
			ammo="Impatiens",
			head="Nahtirah Hat",
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			ear2="Novia Earring",
			body="Hedera Cotehardie",
			hands="Dynasty Mitts",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Swith Cape +1",
			waist="Witful Belt",
			legs="Artsieq Hose",
			feet="Gende. Galosh. +1"}

	-- Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{
			main="Bolelabunga",
			sub="Genbu's Shield",
			ammo="Impatiens",
			head="Nahtirah Hat",
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			ear2="Novia Earring",
			body="Hedera Cotehardie",
			hands="Dynasty Mitts",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Swith Cape +1",
			waist="Witful Belt",
			legs="Artsieq Hose",
			feet="Gende. Galosh. +1"})

	-- Cure Set --
	sets.Midcast.Cure = {
			main="Tamaxchi",
			sub="Genbu's Shield",
			ammo="Oreiad's Tathlum",
			head="Gende. Caubeen",
			neck="Colossus's Torque",
			ear1="Lifestorm Earring",
			ear2="Beatific Earring",
			body="Orison Bliaud +2",
			hands="Theo. Mitts +1",
			ring1="Sirona's Ring",
			ring2="Haoma's Ring",
			back="Tempered Cape",
			waist="Bishop's Sash",
			legs="Orsn. Pantaln. +2",
			feet="Piety Duckbills +1"}

	-- Cure Enmity Set --
	sets.Midcast.Cure.Enmity = set_combine(sets.Midcast.Cure,{
			neck="Lasaia Pendant",
			ear1="Novia Earring",
			ring2="Kuchekula Ring",
			back="Mending Cape"})

	-- Curaga Set --
	sets.Midcast.Curaga = {
			main="Tamaxchi",
			sub="Genbu's Shield",
			ammo="Oreiad's Tathlum",
			head="Gende. Caubeen",
			neck="Lasaia Pendant",
			ear1="Lifestorm Earring",
			ear2="Novia Earring",
			body="Gendewitha Bliaut",
			hands="Theo. Mitts +1",
			ring1="Aquasoul Ring",
			ring2="Kuchekula Ring",
			back="Pahtli Cape",
			waist="Pythia Sash +1",
			legs="Orsn. Pantaln. +2",
			feet="Piety Duckbills +1"}

	-- Curaga Enmity Set --
	sets.Midcast.Curaga.Enmity = set_combine(sets.Midcast.Curaga,{})

	sets.Midcast['Enhancing Magic'] = {
			main="Beneficus",
			sub="Genbu's Shield",
			ammo="Impatiens",
			head="Umuthi Hat",
			neck="Colossus's Torque",
			ear2="Andoaa Earring",
			body="Orison Bliaud +2",
			hands="Dynasty Mitts",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Swith Cape +1",
			waist="Olympus Sash",
			legs="Piety Pantaln. +1",
			feet="Orsn. Duckbills +2"}

	-- Barspells Set --
	sets.Midcast.Bar = {
			main="Beneficus",
			sub="Genbu's Shield",
			ammo="Impatiens",
			head="Orison Cap +2",
			neck="Colossus's Torque",
			ear1="Loquac. Earring",
			ear2="Andoaa Earring",
			body="Orison Bliaud +2",
			hands="Orison Mitts +2",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Swith Cape +1",
			waist="Olympus Sash",
			legs="Piety Pantaln. +1",
			feet="Orsn. Duckbills +2"}

	-- Regen Set --
	sets.Midcast.Regen = set_combine(sets.Midcast.Haste,{
			main="Bolelabunga",
			body="Piety Briault +1",
			hands="Orison Mitts +2",
			legs="Theo. Pant. +1"})

	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast.Haste,{})

	-- Na Set --
	sets.Midcast.Na = set_combine(sets.Midcast.Haste,{main="Yagrush",legs="Orsn. Pantaln. +2"})

	-- Cursna Set --
	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{
			main="Yagrush",
			sub="Genbu's Shield",
			ammo="Impatiens",
			head="Nahtirah Hat",
			neck="Malison Medallion",
			ear2="Beatific Earring",
			body="Orison Bliaud +2",
			hands="Theo. Mitts +1",
			ring1="Haoma's Ring",
			ring2="Haoma's Ring",
			back="Mending Cape",
			waist="Bishop's Sash",
			legs="Theo. Pant. +1",
			feet="Gende. Galosh. +1"})

	sets.Midcast['Divine Magic'] = {
			main="Bolelabunga",
			sub="Genbu's Shield",
			ammo="Oreida's Tathlum",
			head="Nahtirah Hat",
			neck="Stoicheion Medal",
			ear1="Lifestorm Earring",
			ear2="Psystorm Earring",
			body="Hedera Cotehardie",
			hands="Gendewitha Gages",
			ring1="Maquette Ring",
			ring2="Sangoma Ring",
			back="Kumbira Cape",
			waist="Bishop's Sash",
			legs="Theo. Pant. +1",
			feet="Bokwus Boots"}

	sets.Midcast['Enfeebling Magic'] = set_combine(sets.Midcast['Divine Magic'],{
			legs="Mes'yohi Slacks",
			feet="Piety Duckbills +1"})

	sets.Midcast['Dark Magic'] = set_combine(sets.Midcast['Divine Magic'],{})

	sets.Midcast.Impact = {}

	-- JA Sets --
	sets.JA = {}
	sets.JA.Benediction = {body="Clr. Briault +2"}
	sets.JA.Martyr = {hands="Clr. Mitts +2"}
	sets.JA.Devotion = {head="Clr. Cap +2"}

	-- Divine Caress Set --
	sets['Divine Caress'] = {
		main="Yagrush",
		hands="Orison Mitts +2",
		back="Mending Cape"}

	-- Melee Set --
	sets.Melee = set_combine(sets.Midcast.Haste,{})

	-- Lock Main Weapon --
	sets.MainWeapon = {
			main="Bolelabunga",
			sub="Genbu's Shield"}

	-- WS Base Set --
	sets.WS = {}
end

function pretarget(spell,action)
	if midaction() then
		add_to_chat(123, '****** ['..spell.name..' CANCELED] ******')
		canceled = true
		return
	elseif (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	elseif Na_Spells:contains(spell.english) then -- Auto Divine Caress --
		if windower.ffxi.get_ability_recasts()[32] < 1 and (spell.target.type == 'PLAYER' or spell.target.name == player.name) and not buffactive.amnesia and not buffactive.charm and spell.english ~= "Erase" then
			cancel_spell()
			send_command('DivineCaress;wait 1.7;input /ma "'..spell.english..'" '..spell.target.name)
		end
	elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
		if spell.english == "Light Arts" and not buffactive['Addendum: White'] then
			cancel_spell()
			send_command('input /ja Addendum: White <me>')
		elseif spell.english == "Manifestation" then
			cancel_spell()
			send_command('input /ja Accession <me>')
		elseif spell.english == "Alacrity" then
			cancel_spell()
			send_command('input /ja Celerity <me>')
		elseif spell.english == "Parsimony" then
			cancel_spell()
			send_command('input /ja Penury <me>')
		end
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		if spell.english == "Dark Arts" and not buffactive['Addendum: Black'] then
			cancel_spell()
			send_command('input /ja Addendum: Black <me>')
		elseif spell.english == "Accession" then
			cancel_spell()
			send_command('input /ja Manifestation <me>')
		elseif spell.english == "Celerity" then
			cancel_spell()
			send_command('input /ja Alacrity <me>')
		elseif spell.english == "Penury" then
			cancel_spell()
			send_command('input /ja Parsimony <me>')
		end
	end
end

function precast(spell,action)
	if canceled then
		return
	elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if string.find(spell.english,'Cur') and spell.english~="Cursna" then
				equip(sets.Precast.Cure)
			elseif spell.english == "Stoneskin" then
				equip(sets.Precast[spell.english])
			elseif spell.english == "Impact" then
				equip(set_combine(sets.Precast.FastCast,{body="Twilight Cloak"}))
			elseif string.find(spell.english,'Utsusemi') then
				if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
					return
				else
					equip(sets.Precast.FastCast)
				end
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			if sets.WS[spell.english] then
				equip(sets.WS[spell.english])
			end
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if sets.Precast[spell.element] and not Na_Spells:contains(spell.english) and ElementalStaff == 'ON' then
		equip(sets.Precast[spell.element])
	end
	if Main == 'ON' then
		equip(sets.MainWeapon)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type=='Ninjutsu' then
		equipSet = sets.Midcast
		if Na_Spells:contains(spell.english) then
			equipSet = equipSet.Na
			add_to_chat(158, '************* ['..spell.name..'] ************')
			if DC then
				equipSet = set_combine(equipSet,sets['Divine Caress'])
			end
		elseif string.find(spell.english,'Cur') and spell.english ~= "Cursna" then
			if string.find(spell.english,'Cure') then
				if Enmity == 'ON' then
					equipSet = equipSet.Cure.Enmity
				else
					equipSet = equipSet.Cure
				end
			elseif string.find(spell.english,'Cura') then
				if Enmity == 'ON' then
					equipSet = equipSet.Curaga.Enmity
				else
					equipSet = equipSet.Curaga
				end
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{back="Twilight Cape",waist="Korin Obi"})
			end
		elseif spell.english == "Protectra V" then
			equipSet = set_combine(equipSet,{feet="Piety Duckbills +1"})
		elseif spell.english == "Shellra V" then
			equipSet = set_combine(equipSet,{legs="Clr. Pantaln. +2"})
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif string.find(spell.english,'Bar') then
			equipSet = equipSet.Bar
		elseif string.find(spell.english,'Regen') then
			equipSet = equipSet.Regen
		elseif string.find(spell.english,'Banish') then
			equipSet = set_combine(equipSet,{hands="Clr. Mitts +2",ring1="Fenian Ring"})
		elseif string.find(spell.english,'Reraise') then
			equipSet = equipSet.Haste
		elseif string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Haste
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Haste
		else
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end 
			if equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end 
	equip(equipSet)
	if Main == 'ON' then
		equip(sets.MainWeapon)
	end
end

function aftercast(spell,action)
	if canceled then
		canceled = false
		return
	else
		if not spell.interrupted then
			if spell.type == "WeaponSkill" then
				send_command('wait 0.2;gs c TP')
			elseif (spell.english == "Repose" or spell.english == "Sleep II") then -- Repose & Sleep II Countdown --
				send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
			elseif (spell.english == "Sleep" or spell.english == "Sleepga") then -- Sleep & Sleepga Countdown --
				send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
			elseif spell.english == "Banish III" then -- Banish III Countdown --
				send_command('wait 35;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
			end
		end
		status_change(player.status)
	end
end

function status_change(new,old)
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
		if Kiting == 'ON' then
			equip({feet="Herald's Gaiters"})
		end
	elseif new == 'Engaged' then
		equip(sets.Melee)
	elseif new == 'Idle' then
		equip(sets.Idle[IdleArray[IdleIndex]])
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if Main == 'ON' then
		equip(sets.MainWeapon)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down AM3.png;wait 120;input /echo Aftermath: Lv.3 [WEARING OFF IN 60 SEC.];wait 30;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 20;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == 'divine caress' then
		DC = gain
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
	if command == 'C1' then -- Enmity Toggle --
		if Enmity == 'ON' then
			Enmity = 'OFF'
			add_to_chat(123,'Enmity Set: [OFF]')
		else
			Enmity = 'ON'
			add_to_chat(158,'Enmity Set: [ON]')
		end
		status_change(player.status)
	elseif command == 'C2' then -- Follow Toggle --
		send_command('input /ta Bokura;input /lockon;wait .3;setkey numpad8 down;wait .3;setkey numpad7 down;wait .3;setkey numpad7 up;wait .3;setkey numpad8 up')
	elseif command == 'C3' then -- Kiting Toggle --
		if Kiting == 'ON' then
			Kiting = 'OFF'
			add_to_chat(123,'Kiting Set: [Unlocked]')
		else
			Kiting = 'ON'
			add_to_chat(158,'Kiting Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C7' then
		if Armor == 'PDT' then -- PDT Toggle --
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C17' then -- Main Weapon Toggle --
		if Main == 'ON' then
			Main = 'OFF'
			add_to_chat(123,'Main Weapon: [Unlocked]')
		else
			Main = 'ON'
			add_to_chat(158,'Main Weapon: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: '..tostring(player.tp))
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Light Arts"] then
		return originalCost*.9
	else
		return originalCost
	end
end

function degrade_spell(spell,degrade_array)
	spell_index = table.find(degrade_array,spell.name)
	if spell_index > 1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell,spell.target.raw)
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
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
	if player.sub_job == 'SCH' then
		set_macro_page(3, 18)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'RDM' then
		set_macro_page(2, 18)
	elseif player.sub_job == 'DNC' then
		set_macro_page(10, 18)
	elseif player.sub_job == 'NIN' then
		set_macro_page(5, 18)
	else
		set_macro_page(1, 18)
	end
end