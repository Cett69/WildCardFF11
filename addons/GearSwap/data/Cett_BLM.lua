include('organizer-lib')
-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Motenten's Macro Book Function ** --
-- Last Updated: 05/05/14 12:00 AM *Fixed Magic Sets* --
 
function get_sets()
        AccIndex = 1
        AccArray = {"LowACC","MagicBurst"} -- 3 Levels Of Accuracy Sets For Magic. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
        IdleIndex = 1
        IdleArray = {"Movement","Refresh"} -- Default Idle Set Is Movement --
        Armor = 'None'
        StunIndex = 0
        Obi = 'ON' -- Turn Default Obi ON or OFF Here --
        target_distance = 5 -- Set Default Distance Here --
        select_default_macro_book() -- Change Default Macro Book At The End --
 
        Non_Obi_Spells = S{
                        'Burn','Choke','Drown','Frost','Rasp','Shock','Impact','Anemohelix','Cryohelix',
			'Geohelix','Hydrohelix','Ionohelix','Luminohelix','Noctohelix','Pyrohelix'}
        Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
        Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
        sc_map = {SC1 = "Stun", SC2 = "ThunderV", SC3 = "BlizzardV"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

        fcHand = { name = "Hagondes Cuffs", augments = { "Phys. dmg. taken -3%", "Fast Cast +5" } }
        fcHead = { name = "Merlinic Hood", augments = { 'Mag. Acc.+9 "Mag.Atk.Bns."+9', '"Fast Cast"+7', 'Mag. Acc.+4', '"Mag.Atk.Bns."+12' } }
        fcFeet = { name = "Merlinic Crackows", augments = { 'Mag. Acc.+28', '"Fast Cast"+6', 'INT+6' } }
        -- Idle Sets --
        sets.Idle = {}
        sets.Idle.Refresh = {
            main={ name="Lathi", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20'}},
            sub="Niobid Strap",
            head={ name="Merlinic Hood", augments={'Mag. Acc.+20','Magic burst mdg.+8%','MND+2','"Mag.Atk.Bns."+15'}},
            body={ name="Hagondes Coat", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+20'}},
            hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15'}},
            legs="Assid. Pants +1",
            feet="Herald's Gaiters",
            neck="Twilight Torque",
            waist="Witful Belt",
            left_ear={ name="Moonshade Earring", augments={'HP+25','Latent effect: "Refresh"+1'}},
            right_ear="Gifted Earring",
            left_ring="Defending Ring",
            right_ring="Shadow Ring",
            back="Shadow Mantle"}
        sets.Idle.Movement = set_combine(sets.Idle.Refresh,{})
        sets.Resting = set_combine(sets.Idle.Movement,{})
 
        -- PDT Set --
        sets.PDT = {
                       head="Hagondes Hat +1",
                        neck="Loricate torque +1",
                        ear1="Barkarole earring",
                        ear2="Genmei earring",
                        body="Vrikodara jupon",
                        hands="Amalric Gages",
                        ring1="Defending Ring",
                        ring2="Dark ring",
                        back="Solemnity cape",
                        waist="Fucho-no-obi",
                        legs="Assiduity pants +1",
                        feet="Vanya clogs",
                        ammo="Ghastly tathlum +1"}
 
        sets.Sublimation = {
		
						head=fcHead,
                        neck="Loricate torque +1",
                        ear1="Barkarole earring",
                        ear2="Etiolation earring",
                        body="Merlinic Jubbah",
                        hands="Amalric Gages",
                        ring1="Eihwaz Ring",
                        ring2="Meridian ring",
                        back="Twilight cape",
                        waist="Fucho-no-obi",
                        legs="Assiduity pants +1",
                        feet="Herald's gaiters",
                        ammo="Ghastly tathlum +1"}
 
        sets.Precast = {}
 
        -- Fastcast Set --
        sets.Precast.FastCast = {
            main={ name="Lathi", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20'}},
            sub="Niobid Strap",
            head=fcHead,
            body="Anhur Robe",
            hands={ name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','"Fast Cast"+5'}},
            legs="Psycloth Lappas",
            feet=fcFeet,
            neck="Orunmila's Torque",
            waist="Witful Belt",
            left_ear={ name="Moonshade Earring", augments={'HP+25','Latent effect: "Refresh"+1'}},
            right_ear="Gifted Earring",
            left_ring="Defending Ring",
            right_ring="Shadow Ring",
            back="Perimede Cape"}
 
        -- Elemental Staves --
        sets.Precast.Thunder = {}
        sets.Precast.Water = {}
        sets.Precast.Fire = {}
        sets.Precast.Ice = {}
        sets.Precast.Wind = {}
        sets.Precast.Earth = {}
        sets.Precast.Light = {}
        sets.Precast.Dark = {}
 
        -- Precast Stoneskin
        sets.Precast.Stoneskin = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})
 
        -- Precast Enhancing Magic
        sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})
 
        -- Precast Elemental Magic
        sets.Precast['Elemental Magic'] = set_combine(sets.Precast.FastCast,{
                        ear1="Barkarole earring",
                        head="Wicce petasos +1"})
                       
        -- Precast Cure Set --
        sets.Precast.Cure = {
                        head=fcHead,
                        neck="Orunmila's Torque",
                        ear1="Loquac. Earring",
                        body="Heka's kalasiris",
                        ring1="Prolix Ring",
						ring2="Veneficium Ring",
                        back="Perimede cape",
                        waist="Witful Belt",
                        legs="Psycloth lappas",
                        feet="Vanya clogs",
                        ammo="Impatiens"}
 
		sets.Precast.Death = {
					head="Pixie hairpin +1",
					body="Merlinic Jubbah",
					hands="Amalric Gages",
					legs="Merlinic shalwar",
					feet="Merlinic crackows",
					neck="Mizukage-no-Kubikazari",
					waist="Yamabuki-no-obi",
					ear1="Barkarole Earring",
					ear2="Friomisi earring",
					ring1="Locus ring",
					ring2="Mujin band",
					back="Seshaw cape",
					ammo="Pemphredo tathlum"}
 
        -- Midcast Base Set --
        sets.Midcast = {}
 
        -- Haste Set --
        sets.Midcast.Haste = {
                        head=fcHead,
                        neck="Orunmila's Torque",
                        ear1="Loquac. Earring",
                        body="Vanir Cotehardie",
                        hands="Amalric Gages",
                        ring1="Prolix Ring",
						ring2="Veneficium Ring",
                        back="Swith Cape",
                        waist="Witful Belt",
                        legs="Psycloth lappas",
                        feet="Helios Boots",
                        ammo="Impatiens"}
 
        -- Cure Set --
        sets.Midcast.Cure = {
                        head="Vanya hood",
                        neck="Phalaina locket",
                        ear1="Lifestorm Earring",
                        ear2="Roundel Earring",
                        body="Heka's Kalasiris",
                        hands="Telchine gloves",
                        ring1="Sirona's Ring",
                        ring2="Haoma's Ring",
                        back="Tempered Cape",
                        waist="Witful Belt",
                        legs="Assiduity pants +1",
                        feet="Medium's sabots"}
 
        -- Curaga Set --
        sets.Midcast.Curaga = {
                        head="Vanya hood",
                        neck="Phalaina locket",
                        ear1="Lifestorm Earring",
                        ear2="Roundel Earring",
                        body="Heka's Kalasiris",
                        hands="Telchine gloves",
                        ring1="Sirona's Ring",
                        ring2="Haoma's Ring",
                        back="Tempered Cape",
                        waist="Witful Belt",
                        legs="Assiduity pants +1",
                        feet="Medium's sabots"}
 
        -- Enhancing Magic Set --
        sets.Midcast['Enhancing Magic'] = {
                        head="Befouled crown",
                        neck="Incanter's Torque",
						ear1="Andoaa Earring",
                        body="Telchine Chas.",
                        back="Perimede cape",
                        waist="Olympus Sash",
                        feet="Telchine pigaches"}
 
        -- Stoneskin Set --
        sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{})
 
        -- Cursna Set --
        sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{
                        head=fcHead,
                        body="Vanir Cotehardie",
                        ring2="Haoma's Ring",
                        waist="Witful Belt"})
 
        -- Stun Sets --
        sets.Midcast.Stun = {
                        head=fcHead,
                        neck="Orunmila's Torque",
                        ear1="Lifestorm Earring",
						ear2="Psystorm Earring",
                        body="Vanir cotehardie",
                        hands="Amalric Gages",
                        ring1="Shiva ring +1",
						ring2="Sangoma Ring",
                        back="Bane Cape",
                        waist="Witful Belt",
                        legs="Merlinic shalwar",
                        feet="Medium's sabots",
                        ammo="Ghastly tathlum +1"}
       
        sets.Midcast.Stun.MagicBurst = set_combine(sets.Midcast.Stun,{})
       
 
        -- Dark Magic Sets --
        sets.Midcast['Dark Magic'] = {
                        head=fchead,
                        neck="Orunmila's Torque",
                        ear1="Psystorm Earring",
						ear2="Lifestorm earring",
                        body="Anhur Robe",
                        hands="Hagondes Cuffsgloves",
                        ring1="Strendu Ring",
						ring2="Archon Ring",
                        back="Bane Cape",
                        waist="Yamabuki-no-obi",
                        legs="Psycloth Lappas",
                        feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst mdg.+5%','Mag. Acc.+14','"Mag.Atk.Bns."+8',}},
                        ammo="Pemphredo tathlum"}
       
        sets.Midcast['Dark Magic'].MagicBurst = set_combine(sets.Midcast['Dark Magic'],{
						body="Archmage's coat +1"})
       
 
        -- Elemental Sets --
       
	   sets.Midcast.Death = {
					head="Pixie hairpin +1",
					body="Merlinic Jubbah",
					hands="Amalric Gages",
					legs="Merlinic shalwar",
					feet="Merlinic crackows",
					neck="Mizukage-no-Kubikazari",
					waist="Yamabuki-no-obi",
					ear1="Barkarole Earring",
					ear2="Friomisi earring",
					ring1="Locus ring",
					ring2="Mujin band",
					back="Seshaw cape",
					ammo="Pemphredo tathlum"}
					
		sets.Midcast.Comet = {
					head="Pixie hairpin +1",
					body="Merlinic Jubbah",
					hands="Amalric Gages",
					legs="Merlinic shalwar",
					feet="Merlinic crackows",
					neck="Mizukage-no-Kubikazari",
					waist="Yamabuki-no-obi",
					ear1="Barkarole Earring",
					ear2="Friomisi earring",
					ring1="Locus ring",
					ring2="Mujin band",
					back="Seshaw cape",
					ammo="Pemphredo tathlum"}			
	   
        sets.Midcast['Elemental Magic'] = {
            main={ name="Lathi", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20'}},
            sub="Niobid Strap",
            head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+20','Magic burst mdg.+11%','INT+8',}},
            body={ name="Hagondes Coat", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+20'}},
            hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15'}},
            legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+13 "Mag.Atk.Bns."+13','Magic burst mdg.+10%','"Mag.Atk.Bns."+14',}},
            feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst mdg.+5%','Mag. Acc.+14','"Mag.Atk.Bns."+8',}},
            neck="Mizu. Kubikazari",
            waist="Yamabuki-no-Obi",
            left_ear="Novio Earring",
            right_ear="Friomisi Earring",
            left_ring="Locus Ring",
            right_ring="Mujin Band",
            back={ name="Bane Cape", augments={'Elem. magic skill +9','Dark magic skill +5','"Mag.Atk.Bns."+4'} }
            }
       
        sets.Midcast['Elemental Magic'].MagicBurst = set_combine(sets.Midcast['Elemental Magic'],{})
      
    sets.Midcast.Thunder = set_combine(sets.Midcast['Elemental Magic'],{body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast['Thunder II'] = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast.Ionohelix = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast.Blizzard = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast['Blizzard II'] = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast.Cryohelix = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})    
    sets.Midcast.Fire = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast['Fire II'] = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast.Pyrohelix = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast.Aero = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast['Aero II'] = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast.Anemohelix = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast.Stone = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast['Stone II'] = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast.Geohelix = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast.Water = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast['Water II'] = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})
    sets.Midcast.Hydrohelix = set_combine(sets.Midcast['Elemental Magic'], {body="Merlinic Jubbah",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",back="Bane cape",feet="Umbani boots"})

 

                       
        -- Enfeebling Sets --
        sets.Midcast['Enfeebling Magic'] = {
                        head="Befouled crown",
                        neck="Incanter's Torque",
                        ear1="Lifestorm Earring",
						ear2="Psystorm Earring",
                        body="Merlinic Jubbah",
                        hands="Amalric gloves",
                        ring1="Shiva ring +1",
						ring2="Sangoma Ring",
                        back="Bane Cape",
                        waist="Luminary Sash",
                        legs="Merlinic shalwar",
                        feet="Medium's sabots",
                        ammo="Ghastly tathlum +1"}
                       
        sets.Midcast['Enfeebling Magic'].MagicBurst =  set_combine(sets.Midcast['Enfeebling Magic'],{})
 
        -- Impact Set --
        sets.Midcast.Impact = {
                    body="Twilight Cloak",
					hands="Amalric Gages",
					legs="Merlinic shalwar",
					feet="Umbani boots",
					neck="Mizukage-no-Kubikazari",
					waist="Yamabuki-no-obi",
					ear1="Barkarole Earring",
					ear2="Friomisi earring",
					ring1="Shiva ring +1",
					ring2="Shiva ring +1",
					back="Bane Cape",
					ammo="Ghastly tathlum +1"}
 
        -- Meteor Set --
        sets.Midcast.Meteor = {
					head="Merlinic hood",
					body="Merlinic Jubbah",
					hands="Amalric Gages",
					legs="Merlinic shalwar",
					feet="Merlinic crackows",
					neck="Mizukage-no-Kubikazari",
					waist="Yamabuki-no-obi",
					ear1="Barkarole Earring",
					ear2="Friomisi earring",
					ring1="Shiva ring +1",
					ring2="Shiva ring +1",
					back="Bane Cape",
					ammo="Pemphredo tathlum"}
 
        -- Elemental Obi/Twilight Cape --
        sets.Obi = {}
        sets.Obi.Lightning = {waist='Hachirin-no-obi'}
        sets.Obi.Water = {waist='Hachirin-no-obi'}
        sets.Obi.Fire = {waist='Hachirin-no-obi'}
        sets.Obi.Ice = {waist='Hachirin-no-obi'}
        sets.Obi.Wind = {waist='Hachirin-no-obi'}
        sets.Obi.Earth = {waist='Hachirin-no-obi'}
        sets.Obi.Light = {waist='Hachirin-no-obi'}
        sets.Obi.Dark = {waist='Hachirin-no-obi'}
 
        -- JA Sets --
        sets.JA = {}
        sets.JA.Manafont = {body="Archmage's coat +1"}
        sets.JA['Enmity Douse'] = {hands="Goetia Gloves +2"}
        sets.JA['Mana Wall'] = {feet="Wicce Sabots"}
 
        -- Melee Set --
        sets.Melee = set_combine(sets.Idle.Refresh,{})
 
        -- WS Base Set --
        sets.WS = {}
        sets.WS.Shattersoul = {}
        sets.WS.Myrkr = {
            ammo="Strobilus",
			head="Pixie hairpin +1",
			neck="Dualism collar +1",
			ear1="Etiolation earring",
			ear2="Moonshade Earring",
			body="Weatherspoon robe +1",
			hands="Helios gloves",
			ring1="Mephitas's Ring +1",
			ring2="Sangoma Ring",
			back="Bane cape",
			waist="Shinjutsu-no-obi +1",
			legs="Amalric slops",
			feet="Llwyd's clogs"}
        sets.WS.Vidohunir = {
			head="Merlinic hood",
			body="Merlinic Jubbah",
			hands="Amalric Gages",
			legs="Merlinic shalwar",
			feet="Merlinic crackows",
			neck="Eddy necklace",
			waist="Yamabuki-no-obi",
			ear1="Barkarole Earring",
			ear2="Friomisi earring",
			ring1="Shiva ring +1",
			ring2="Shiva ring +1",
			back="toro cape",
			ammo="Pemphredo tathlum"}
        sets.WS["Gate of Tartarus"] = {}
end
 
function pretarget(spell,action)
        if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
                cancel_spell()
                send_command('input /item "Echo Drops" <me>')
        elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
                degrade_spell(spell,Cure_Spells)
        elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
                degrade_spell(spell,Curaga_Spells)
        elseif spell.english == "Meteor" and not buffactive['Elemental Seal'] then -- Auto Elemental Seal When You Use Meteor --
                cancel_spell()
                send_command('input /ja "Elemental Seal" <me>;wait 1.5;input /ma "Meteor" <t>')
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
                        elseif spell.english == "Stoneskin" then
                                equip(sets.Precast[spell.english])
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
        if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' or spell.type == 'BardSong' then
                equipSet = sets.Midcast
                if string.find(spell.english,'Cure') then
                        equipSet = equipSet.Cure
                elseif string.find(spell.english,'Cura') then
                        equipSet = equipSet.Curaga
                elseif string.find(spell.english,'Banish') then
                        equipSet = set_combine(equipSet.Haste,{ring1="Fenian Ring"})
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
                        if equipSet[AccArray[AccIndex]] then
                                equipSet = equipSet[AccArray[AccIndex]]
                        end
                        if equipSet[spell.type] then
                                equipSet = equipSet[spell.type]
                        end
                        if  (spell.element == world.weather_element) or
    (spell.element == world.day_element) or 
    (spell.element == 'Lightning' and buffactive['Thunderstorm']) or 
    (spell.element == 'Ice' and buffactive['Hailstorm']) or 
    (spell.element == 'Water' and buffactive['Rainstorm']) or 
    (spell.element == 'Fire' and buffactive['Firestorm']) or 
    (spell.element == 'Earth' and buffactive['Sandstorm']) or 
    (spell.element == 'Wind' and buffactive['Windstorm']) or 
    (spell.element == 'Light' and buffactive['Aurorastorm']) or 
    (spell.element == 'Dark' and buffactive['Voidstorm']) and sets.Obi[spell.element] and not Non_Obi_Spells:contains(spell.english) and Obi == 'ON' then 
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
                if spell.english == 'Mana Wall' and player.equipment.feet == "Goetia Sabots +2" then
                        disable('feet')
                elseif spell.english == "Sleep II" or spell.english == "Sleepga II" then -- Sleep II & Sleepga II Countdown --
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
        elseif new=='Engaged' then
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
        if buff == "mana wall" and not gain then
                enable('feet')
        elseif buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
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
        -- Default macro set/book --
        if player.sub_job == 'WHM' then
                set_macro_page(14, 3)
        elseif player.sub_job == 'RDM' then
                set_macro_page(14, 1)
        elseif player.sub_job == 'SCH' then
                set_macro_page(14, 3)
        elseif player.sub_job == 'DNC' then
                set_macro_page(14, 3)
        elseif player.sub_job == 'NIN' then
                set_macro_page(14, 3)
        else
                set_macro_page(14, 3)
        end
end