-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Motenten's Macro Book Function ** --
-- Last Updated: 05/05/14 12:00 AM *Fixed Magic Sets* --
include('organizer-lib')
function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Magic. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Refresh"} -- Default Idle Set Is Movement --
	Armor = 'None'
	StunIndex = 0
	Obi = 'ON' -- Turn Default Obi ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book('input /macro book 5;wait .1;input /macro set 1') -- Change Default Macro Book At The End --

	Non_Obi_Spells = S{
			'Burn','Choke','Drown','Frost','Rasp','Shock','Impact','Anemohelix','Cryohelix',
			'Geohelix','Hydrohelix','Ionohelix','Luminohelix','Noctohelix','Pyrohelix'}

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1 = "Composure", SC2 = "Stun", SC3 = "Chainspell"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle Sets --
	sets.Idle = {}
	sets.Idle.Refresh = {
			 main="Bolelabunga",
						range="Aureole",
						sub="Genbu's Shield",
                        head="Vitivation Chapeau",
                        neck="Wiglen Gorget",
                        ear1="Psystorm Earring",
                        ear2="Lifestorm Earring",
                        body="Ischemia chasuble",
                        hands="Serpentes Cuffs",
                        ring1="Sheltered Ring",
                        ring2="Paguroidea Ring",
                        back="repulse mantle",
                        waist="Fucho-no-obi",
                        legs="Assiduity pants +1",
                        feet="Serpentes Sabots"}
	sets.Idle.Movement = set_combine(sets.Idle.Refresh,{
			 main="Bolelabunga",
                        range="Aureole",
						sub="Genbu's Shield",
                        head="Vitivation Chapeau",
                        neck="Wiglen Gorget",
                        ear1="Psystorm Earring",
                        ear2="Lifestorm Earring",
                        body="Ischemia chasuble",
                        hands="Serpentes Cuffs",
                        ring1="Sheltered Ring",
                        ring2="Paguroidea Ring",
                        back="repulse mantle",
                        waist="Fucho-no-obi",
                        legs="Assiduity pants +1",
                        feet="Serpentes Sabots"})
	sets.Resting = set_combine(sets.Idle.Movement,{})

	-- PDT Set --
	sets.PDT = {
			main="Terra's Staff",
			sub="Zuuxowu grip",
			head="Gende. Caubeen",
			neck="Loricate torque +1",
			body="Ischemia chasuble",
			hands="Amalric Gages",
			ring1="Defending Ring",
			ring2="Dark Ring",
			back="Shadow Mantle",
			waist="Flume belt +1",
			legs="Hagondes pants",
			feet="Umbani boots"}

	sets.Sublimation = {
			ammo="Ginsen",
			head="Vitivation Chapeau",
			neck="Orunmila's torque",
			ear1="Andoaa Earring",
			ear2="Loquac. Earring",
			body="Ischemia chasuble",
			hands="Serpentes Cuffs",
			ring1="Sangoma Ring",
			ring2="Meridian Ring",
			back="Twilight cape",
			waist="Fucho-no-obi",
			legs="Assiduity pants +1",
			feet="Serpentes Sabots"}

	sets.Precast = {}

	-- Fastcast Set --
	sets.Precast.FastCast = {
						ammo="Impatiens",
                        head="Atrophy Chapeau",
                        neck="Orunmila's Torque",
						ear1="Estq. Earring",
                        ear2="Loquac. Earring",
                        body="Vitivation Tabard",
                        ring1="Prolix Ring",
                        ring2="Veneficium Ring",
                        back="Swith Cape",
                        waist="Witful Belt";
						hands="Buremte gloves",
                        legs="Psycloth lappas",
						feet="Helios boots"}

	-- Elemental Staves --
	sets.Precast.Thunder = {}
        sets.Precast.Water = {}
        sets.Precast.Fire = {}
        sets.Precast.Ice = {}
        sets.Precast.Wind = {}
        sets.Precast.Earth = {}
        sets.Precast.Light = {}
        sets.Precast.Dark = {}

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Precast Cure Set --
	sets.Precast.Cure = {main="tamaxchi",
						ammo="Impatiens",
                        head="Atrophy Chapeau",
                        neck="Orunmila's Torque",
						ear1="Estq. Earring",
                        ear2="Loquac. Earring",
                        body="Vitivation Tabard",
                        hands="Buremte gloves",
                        ring1="Prolix Ring",
                        ring2="Veneficium Ring",
                        back="Swith Cape",
                        legs="Psycloth lappas",
						feet="Helios boots"}

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Haste Set --
	sets.Midcast.Haste = {
                        head="Atrophy Chapeau",
                        neck="Orunmila's Torque",
						ear1="Estq. Earring",
                        ear2="Loquac. Earring",
                        body="Vanir cotehardie",
                        hands="otomi gloves",
                        ring1="Prolix Ring",
                        ring2="Veneficium Ring",
                        back="Swith Cape",
                        waist="Witful Belt",
                        legs="Hagondes pants",
                        feet="Helios boots"}

	-- Cure Set --
	sets.Midcast.Cure = {
						main="tamaxchi",
                        ammo="Aqua sachet",
                        head="Vanya hood",
                        neck="Phalaina locket",
                        ear1="Lifestorm Earring",
                        ear2="Roundel Earring",
                        body="Vitivation Tabard",
                        hands="Ayao's gages",
                        ring1="Sirona's Ring",
                        ring2="Haoma's ring",
                        back="tempered cape",
                        waist="Witch Sash",
                        legs="Assiduity pants +1",
                        feet="Rubeus boots"}

	-- Curaga Set --
	sets.Midcast.Curaga = {
						main="tamaxchi",
                        ammo="Aqua sachet",
                        head="Vanya hood",
                        neck="Phalaina locket",
                        ear1="Lifestorm Earring",
                        ear2="Roundel Earring",
                        body="Vitivation Tabard",
                        hands="Ayao's gages",
                        ring1="Sirona's Ring",
                        ring2="Haoma's ring",
                        back="tempered cape",
                        waist="Witch Sash",
                        legs="Assiduity pants +1",
                        feet="Rubeus boots"}

	-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = {main="Marin staff +1",
						sub="Fulcio grip",
                        neck="Enhancing torque",
						head="Umuthi hat",
						ear1="Andoaa earring",
                        body="Vitivation Tabard",
                        hands="Ayao's gages",
                        ring1="Prolix Ring",
                        ring2="Veneficium Ring",
						back="ghostfyre cape",
						ear1="Andoaa Earring",
                        waist="Olympus sash",
                        legs="Estqr. fuseau +2",
                        feet="Estoqueur's Houseaux +2"}

	-- Stoneskin --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{waist="Siegel Sash",
		head="Umuthi Hat"})
	
	sets.Midcast.Others = {
						main="Marin staff +1",
						sub="Fulcio grip",
                        neck="Enhancing torque",
						head="Estq. Chappel +2",
						ear1="Andoaa earring",
                        body="Estoqueur's Sayon +2",
                        hands="Estoqueur's Gantherots +2",
                        ring1="Prolix Ring",
                        ring2="Veneficium Ring",
						back="ghostfyre cape",
						ear1="Andoaa Earring",
                        waist="Olympus sash",
                        legs="Estqr. fuseau +2",
                        feet="Estoqueur's Houseaux +2"}
	
	-- Refresh --
	sets.Midcast.Refresh = set_combine(sets.Midcast.Haste,{main="Marin staff +1",
						sub="Fulcio grip",
                        neck="Enhancing torque",
						head="Umuthi hat",
						ear1="Andoaa earring",
                        body="Vitivation Tabard",
                        hands="Ayao's gages",
                        ring1="Prolix Ring",
                        ring2="Veneficium Ring",
						back="ghostfyre cape",
						ear1="Andoaa Earring",
                        waist="Olympus sash",
                        legs="Estqr. fuseau +2",
                        feet="Estoqueur's Houseaux +2"})

	-- Cursna --
	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{
						head="Vanya hood",
                        neck="Phalaina locket",
                        ear1="Lifestorm Earring",
                        ear2="Roundel Earring",
                        body="Vitivation Tabard",
                        hands="Ayao's gages",
                        ring1="Sirona's Ring",
                        ring2="Haoma's ring",
                        back="tempered cape",
                        waist="Witch Sash",
                        legs="Assiduity pants +1",
                        feet="Rubeus boots"})

	-- Stun Sets --
	sets.Midcast.Stun = {
						main={ name="Marin staff +1", augments={'MP+60','Mag. Acc.+15','MND+12',}},
                        sub="Mephitis Grip",
                        head="Atrophy chapeau",
                        neck="Incanter's Torque",
						range="Aureole",
                        ear1="Lifestorm Earring",
                        ear2="Psystorm Earring",
                        body="Vanir cotehardie",
                        hands="Amalric Gages",
                        ring1="Globidonta ring",
                        ring2="Sangoma Ring",
                        back="Perimede cape",
                        waist="Witful Belt",
                        legs="Hagondes pants",
                        feet="Hagondes Boots"}
	sets.Midcast.Stun.MidACC = set_combine(sets.Midcast.Stun,{})
	sets.Midcast.Stun.HighACC = set_combine(sets.Midcast.Stun.MidACC,{})

	-- Dark Magic Sets --
	sets.Midcast['Dark Magic'] = {
			 main={ name="Marin staff +1", augments={'MP+60','Mag. Acc.+15','MND+12',}},
                        sub="Mephitis Grip",
                        head="Pixie hairpin +1",
						range="Aureole",
                        neck="Incanter's Torque",
                        ear1="Lifestorm Earring",
                        ear2="Psystorm Earring",
                        body="Vanir cotehardie",
                        hands="Amalric Gages",
                        ring1="Archon Ring",
                        ring2="Sangoma Ring",
                        back="Perimede cape",
                        waist="Witful Belt",
                        legs="Hagondes pants",
                        feet="Hagondes Boots"}
	sets.Midcast['Dark Magic'].MidACC = set_combine(sets.Midcast['Dark Magic'],{})
	sets.Midcast['Dark Magic'].HighACC = set_combine(sets.Midcast['Dark Magic'].MidACC,{})

	-- Elemental Sets --
	sets.Midcast['Elemental Magic'] = {
						main={ name="Marin staff +1", augments={'MP+60','"Mag.Atk.Bns."+15','INT+12',}},
                        sub="Zuuxowu grip",
                        neck="Eddy Necklace",
						head="Hagondes hat +1",
						ammo="Ghastly tathlum +1",
                        ear1="Friomisi Earring",
                        ear2="Novio Earring",
                        body="Amalric doublet",
                        hands="Amalric Gages",
                        ring1="Shiva ring +1",
                        ring2="Shiva ring +1",
                        back="Toro Cape",
                        waist="Sekhmet Corset",
                        legs="Hagondes pants +1",
                        feet="Umbani Boots"}
	sets.Midcast['Elemental Magic'].MidACC = set_combine(sets.Midcast['Elemental Magic'],{})
	sets.Midcast['Elemental Magic'].HighACC = set_combine(sets.Midcast['Elemental Magic'].MidACC,{main="Marin staff +1",
						ear1="Lifestorm Earring",
                        ear2="Psystorm Earring",
						feet="Vitivation Boots"})
	
	sets.Midcast.Thunder = set_combine(sets.Midcast['Elemental Magic'],{main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast['Thunder II'] = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast.Ionohelix = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast.Blizzard = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast['Blizzard II'] = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast.Cryohelix = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})    
    sets.Midcast.Fire = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast['Fire II'] = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast.Pyrohelix = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast.Aero = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast['Aero II'] = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast.Anemohelix = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast.Stone = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast['Stone II'] = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast.Geohelix = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast.Water = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast['Water II'] = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
    sets.Midcast.Hydrohelix = set_combine(sets.Midcast['Elemental Magic'], {main="Marin staff +1",ring1="Fenrir ring +1",ring2="Fenrir ring +1",hands="Otomi Gloves"})
	
	-- Enfeebling Sets --
	sets.Midcast['Enfeebling Magic'] = {
						main={ name="Marin staff +1", augments={'MP+60','Mag. Acc.+15','MND+12',}},
                        sub="Mephitis Grip",
                        neck="Imbodla necklace",
						head="Vitivation Chapeau",
						range="Aureole",
                        ear1="Lifestorm Earring",
                        ear2="Psystorm Earring",
                        body="Estoqueur's Sayon +2",
                        hands="Amalric Gages",
                        ring1="Levia. Ring +1",
                        ring2="Sangoma Ring",
                        back="Refraction Cape",
                        waist="Luminary Sash",
                        legs="Hagondes pants",
						feet="Uk'uxkaj Boots"}
	sets.Midcast['Enfeebling Magic'].MidACC =  set_combine(sets.Midcast['Enfeebling Magic'],{
                        body="Ischemia chasu.",
						feet="Vitivation boots"})
	sets.Midcast['Enfeebling Magic'].HighACC = set_combine(sets.Midcast['Enfeebling Magic'].MidACC,{})

	-- Impact --
	sets.Midcast.Impact = {
			main="Marin staff +1",
			sub="Mephitis Grip",
			range="Aureole",
			neck="Eddy Necklace",
			ear1="Lifestorm Earring",
			ear2="Psystorm Earring",
			body="Twilight Cloak",
			hands="Otomi gloves",
			ring1="Shiva ring +1",
			ring2="Sangoma Ring",
			back="Refraction Cape",
			waist="Witch Sash",
			legs="Hagondes pants +1",
			feet="Umbani boots"}

	-- Elemental Obi/Twilight Cape --
	sets.Obi = {}
	sets.Obi.Lightning = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Water = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Fire = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Ice = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Wind = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Earth = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Light = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Dark = {back="Twilight Cape",waist='Hachirin-no-Obi'}

	-- JA Sets --
	sets.JA = {}
	sets.JA.Chainspell = {body="Vitivation Tabard"}
	sets.JA.Saboteur = {hands="Estq. Ganthrt. +2"}

	-- Melee Set --
	sets.Melee = set_combine(sets.Midcast.Haste,{
                        ammo="Vanir Battery",
                        head="Umuthi Hat",
                        neck="Wiglen Gorget",
                        ear1="Andoaa Earring",
                        ear2="Loquac. Earring",
                        body="Artsieq Jubbah",
                        hands="Bokwus Gloves",
                        ring1="Sheltered Ring",
                        ring2="Paguroidea Ring",
                        back="ghostfyre cape",
                        waist="witful belt",
                        legs="Artsieq Hose",
                        feet="Umbani Boots"})

	-- WS Base Set --
	sets.WS = {}
	sets.WS["Chant du Cygne"] = {}
	sets.WS.Requiescat = {}
	sets.WS["Knights of Round"] = {}
	sets.WS.Exenterator = {}
	sets.WS.Evisceration = {}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
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
	if spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if string.find(spell.english,'Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
			elseif spell.english == "Stun" then
				if buffactive.Composure then -- Cancel Composure When You Cast Stun --
					cast_delay(0.2)
					send_command('cancel Composure')
				end
				equip(sets.Precast.FastCast)
			elseif spell.english == "Impact" then
				equip(set_combine(sets.Precast.FastCast,{body="Twilight Cloak"}))
			elseif string.find(spell.english,'Utsusemi') then
				if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
					cancel_spell()
					add_to_chat(123, spell.english .. ' Canceled: [3+ Images]')
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
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if sets.Precast[spell.element] then
		equip(sets.Precast[spell.element])
	end
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if string.find(spell.english,'Cure') then
			equipSet = equipSet.Cure
		elseif string.find(spell.english,'Cura') then
			equipSet = equipSet.Curaga
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
		elseif spell.english == "Phalanx II" then -- Aug'd Dls. Gloves +2 For Phalanx II --
			equipSet = set_combine(equipSet,{hands="Vitivation Gloves"})
		elseif spell.english == "Dia III" or spell.english == "Slow II" then -- Aug'd Dls. Chapeau +2 For Dia III or Slow II --
			equipSet = set_combine(equipSet,sets.Midcast['Enfeebling Magic'])
		elseif spell.english == "Paralyze II" then -- Aug'd Dls. Boots +2 For Paralyze II --
			equipSet = set_combine(equipSet,sets.Midcast['Enfeebling Magic'])
		elseif spell.english == "Blind II" or spell.english == "Bio III" then -- Aug'd Dls. Tights +2 For Blind II or Bio III --
			equipSet = set_combine(equipSet,{legs="Dls. Tights +2"})
		elseif string.find(spell.english,'Banish') then
			equipSet = set_combine(equipSet.Haste,{ring1="Fenian Ring"})
		elseif string.find(spell.english,'Regen') then 
			equipSet = set_combine(equipSet,{main="Bolelabunga"})
		elseif string.find(spell.english,'Refresh') or string.find(spell.english,'Haste') or string.find(spell.english,'Flurry') or string.find(spell.english,'Pro') or string.find(spell.english,'Shell') then
			if spell.target.name == player.name then
				equipSet = sets.Midcast['Enhancing Magic']
			else
				equipSet = sets.Midcast.Others
			end
		elseif string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7; cancel Copy Image*')
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
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
			if (spell.skill == 'Elemental Magic' or string.find(spell.english,'Cur') or string.find(spell.english,'Bio') or string.find(spell.english,'Dia')) and not Non_Obi_Spells:contains(spell.english) and (world.day_element == spell.element or world.weather_element == spell.element) and sets.Obi[spell.element] and Obi == 'ON' then -- Use Obi Toggle To Equip Normal Waist Gear --
				equipSet = set_combine(equipSet,sets.Obi[spell.element])
			end
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

function aftercast(spell,action)
	if not spell.interrupted then
		if spell.english == "Sleep II" then -- Sleep II Countdown --
			send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
			send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Banish II" then -- Banish II Countdown --
			send_command('wait 20;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
	elseif new == 'Engaged' then
		equip(sets.Melee)
	elseif new == 'Idle' then
		equip(sets.Idle[IdleArray[IdleIndex]])
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
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
	if command == 'C1' then -- Magic Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Magic Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Stun Toggle --
		if StunIndex == 1 then
			StunIndex = 0
			add_to_chat(123,'Stun Set: [Unlocked]')
		else
			StunIndex = 1
			add_to_chat(158,'Stun Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Obi Toggle --
		if Obi == 'ON' then
			Obi = 'OFF'
			add_to_chat(123,'Obi: [OFF]')
		else
			Obi = 'ON'
			add_to_chat(158,'Obi: [ON]')
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
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
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
		add_to_chat(8,spell.name..' Canceled: [Current MP = ' .. player.mp .. ' | ' .. player.mpp .. '%] Using '..new_spell..' instead.')
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
	if player.sub_job == 'WHM' then
		set_macro_page(2, 4)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'SCH' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 4)
	else
		set_macro_page(1, 4)
	end
end