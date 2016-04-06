include('organizer-lib')
function get_sets()

    --Variables for Midcast Gear
    petAtkToggle = 0
    LegPMacc = { name = "Hagondes Pants", augments = { "Phys. dmg. taken -3%", "Pet: Mag. Acc +22" } }

    merlinicLgPetAcc = { name = "Merlinic Shalwar", augments = { 'Pet: Accuracy+29 Pet: Rng. Acc.+29', '"Avatar perpetuation cost" -2', 'System: 1 ID: 1792 Val: 7', 'Pet: Mag. Acc.+3', 'Pet: "Mag.Atk.Bns."+11' } }


    HdMab = { name = "Merlinic Hood", augments = { 'Mag. Acc.+24 "Mag.Atk.Bns."+24', 'Mag. crit. hit dmg. +1%', 'MND+3', '"Mag.Atk.Bns."+15' } }
    BdyMab = { name = "Hagondes Coat", augments = { "Phys. dmg. taken -3%", "Mag. Atk. Bns. +20" } }
    LegMab = { name = "Merlinic Shalwar", augments = { 'Mag. Acc.+13 "Mag.Atk.Bns."+13', 'Magic burst mdg.+10%', '"Mag.Atk.Bns."+14' } }
    FeetMab = { name = "Merlinic Crackows", augments = { 'Mag. Acc.+24 "Mag.Atk.Bns."+24', 'Magic burst mdg.+5%', 'Mag. Acc.+14', '"Mag.Atk.Bns."+8' } }

    PetAtkHead = { name = "Apogee Crown", augments = { 'MP+60', 'Pet: Attack+30', 'Blood Pact Dmg.+7' } }

    PetMabHead = { name = "Apogee Crown +1", augments = { 'MP+80', 'Pet: "Mag.Atk.Bns."+35', 'Blood Pact Dmg.+8' } }
    PetMabHand = { name = "Merlinic Dastanas", augments = { 'Pet: Mag. Acc.+20 Pet: "Mag.Atk.Bns."+20', 'Blood Pact Dmg.+5', 'System: 1 ID: 1792 Val: 5', 'Pet: Mag. Acc.+10', 'Pet: "Mag.Atk.Bns."+1' } }
    PetHybHands = { name = "Apogee Mitts +1", augments = { 'MP+80', 'Pet: "Mag.Atk.Bns."+35', 'Blood Pact Dmg.+8' } }
    PetMabLeg = { name = "Apogee Slacks", augments = { 'MP+60', 'Pet: "Mag.Atk.Bns."+30', 'Blood Pact Dmg.+7' } }


    fcHand = { name = "Hagondes Cuffs", augments = { "Phys. dmg. taken -3%", "Fast Cast +5" } }
    fcHead = { name = "Merlinic Hood", augments = { 'Mag. Acc.+9 "Mag.Atk.Bns."+9', '"Fast Cast"+7', 'Mag. Acc.+4', '"Mag.Atk.Bns."+12' } }
    fcFeet = { name = "Merlinic Crackows", augments = { 'Mag. Acc.+28', '"Fast Cast"+6', 'INT+6' } }
    -- Cett Base
    sets.base = { main = "Nirvana", sub = "Oneiros Grip", ammo = "Seraphicaller" }

    sets.skill= {
        main = "Espiritus",
        sub = "Vox Grip",
        head = "Convoker's Horn",
        neck = "Caller's Pendant",
        rear = "Smn. Earring",
        lear = "Andoaa Earring",
        body = "Beckoner's Doublet +1",
        hands = "Lamassu Mitts +1",
        lring = "Evoker's Ring",
        rring = "Fervor Ring",
        back = "Conveyance Cape",
        waist = "Lucidity Sash",
        legs = "Becokner's Spats +1",
        feet = "Apogee Pumps"
    }
    -- Precast Sets
    sets['precast_Elemental Siphon'] = set_combine(sets.skill, {
        main = "Nirvana",
        sub = "Oneiros Grip",
        feet = "Beck. Pigaches +1"
    })

    sets['precast_Shock Squall'] = set_combine(sets.base, {
        head = "Convoker's Horn",
        neck = "Caller's Pendant",
        rear = "Smn. Earring",
        body = "Beckoner's Doublet +1",
        hands = "lamassu mitts +1",
        lring = "Evoker's Ring",
        rring = "Fervor Ring",
        back = "Conveyance Cape",
        waist = "Lucidity Sash",
        legs = LegPMacc,
        feet = "Beck. Pigaches +1"
    })

    sets.precast_BP = {
        head = "Convoker's Horn",
        body = "Glyphic Doublet +1",
        hands = "Glyphic Bracers",
        back = "Conveyance cape",
        legs = "Summoner's Spats",
        feet = "Glyphic Pigaches +1"
    }

    sets['precast_Mana Cede'] = { hands = "Call. Bracers +2" }

    sets['precast_Astral Flow'] = {head = "Summoner's Horn +2"}

    sets.precast_FC = {
        head = fcHead,
        neck = "Orunmila's Torque",
        right_ear = "Loquac. Earring",
        body = "Marduk's Jubbah +1",
        hands = "Hagondes Cuffs",
        left_ring = "Prolix Ring",
        back = "Swith Cape",
        waist = "Witful Belt",
        legs = "Psycloth Lappas",
        feet = fcFeet
    }

    sets.precast_Cur = { body = "Heka's Kalasiris", legs = "Nabu's Shalwar", back = "Pahtli Cape" }

    sets['precast_Myrkr'] = set_combine(sets.base, {
        head = "Apogee Crown +1",
        neck = "Orunmila's Torque",
        ear1 = "Gelos Earring",
        ear2 = "Gifted earring",
        body = "Beckoner's Doublet +1",
        hands = "Apogee Mitts +1",
        ring1 = "Evoker's Ring",
        ring2 = "Speaker's Ring",
        back = "Conveyance Cape",
        waist = "Yamabuki-no-obi",
        legs = "Apogee Slacks",
        feet = "apogee pumps +1"
    })

    sets['precast_Shattersoul'] = set_combine(sets.base, {
        head = "Nahtirah Hat",
        neck = "Asperity Necklace",
        ear1 = "SteelFlash Earring",
        ear2 = "Bladeborn Earring",
        body = BdyPerp,
        hands = "Amalric Gages",
        ring1 = "Icesoul Ring",
        ring2 = "Rajas Ring",
        back = "Refraction Cape",
        waist = "Fotia Belt",
        legs = LgMab,
        feet = FtPMab
    })

    sets['precast_Spirit Taker'] = set_combine(sets.base, {
        head = "Apogee Crown +1	",
        neck = "Asperity Necklace",
        ear1 = "Steelflash Earring",
        ear2 = "Bladeborn Earring",
        body = "Beckoner's Doublet +1",
        hands = "Merlinic Dastanas",
        ring1 = "Leviathan Ring",
        ring2 = "Icesoul Ring",
        back = "Refraction Cape",
        waist = "Fotia Belt",
        legs = "Assiduity Pants +1",
        feet = "apogee pumps +1"
    })

    sets['precast_Garland of Bliss'] = set_combine(sets.base, {
        head = HdMab,
        neck = "Sanctity Necklace",
        left_ear = "Novio Earring",
        right_ear = "Friomisi Earring",
        body = BdyMab,
        hands = "Amalric Gages",
        left_ring = "Strendu Ring",
        right_ring = "Leviathan Ring",
        back = "Refraction Cape",
        legs = LegMab,
        feet = FeetMab,
        waist = "Fotia Belt"
    })

    -- Midcast Sets
    --Skill Gear
    sets.BP_Base = set_combine(sets.base, {
        head = "Convoker's Horn",
        neck = "Caller's Pendant",
        ear1 = "Smn. Earring",
        ear2 = "Gifted Earring",
        body = "Beck. Doublet +1",
        hands = "lamassu mitts +1",
        ring1 = "Evoker's Ring",
        ring2 = "Fervor Ring",
        back = "Conveyance Cape",
        waist = "Lucidity Sash",
        legs = "Beck. Spats +1",
        feet = "Marduk's Crackows +1"
    })

    sets.midcast_Phys_BP = set_combine(sets.BP_Base, {
        head = "Apogee Crown",
        neck = "Empath Necklace",
        ear1 = "Gelos earring",
        ear2 = "Esper Earring",
        body = "Beckoner's Doublet +1",
        hands = "Apogee Mitts +1",
        ring2 = "Thurandaut Ring",
        back = "Scintillating Cape",
        waist = "Incarnation Sash",
        legs = "Apogee Slacks",
        feet = "apogee pumps +1"
    })

    sets.midcast_MAB_No_TP_BP = set_combine(sets.BP_Base, {
        head = "Apogee Crown +1",
        neck = "Deino Collar",
        ear1 = "Gelos earring",
        ear2 = "Esper Earring",
        body = "Shomonjijoe +1",
        hands = "Apogee mitts +1",
        ring2 = "Speaker's Ring",
        back = "Conveyance Cape",
        waist = "Incarnation Sash",
        legs = "Apogee Slacks",
        feet = "apogee pumps +1"
    })

    sets.midcast_MAB_TP_BP = set_combine(sets.BP_Base, {
        head = "Apogee Crown +1",
        neck = "Deino Collar",
        ear1 = "Gelos earring",
        ear2 = "Esper Earring",
        body = "Shomonjijoe +1",
        hands = "Apogee mitts +1",
        ring1 = "Evoker's Ring",
        ring2 = "Speaker's Ring",
        back = "Conveyance Cape",
        waist = "Incarnation Sash",
        legs = "Apogee Slacks",
        feet = "apogee pumps +1"
    })

    sets.midcast_zantetsuken = {
        main = "Nirvana",
        head = "Apogee Crown +1",
        ear1 = "Gelos earring",
        ear2 = "Esper Earring",
        body = "Beckoner's Doublet +1",
        hands = "Merlinic Dastanas",
        back = "Conveyance Cape",
        waist = "Incarnation Sash",
        legs = "Apogee Slacks",
        feet = "apogee pumps +1"
    }

    --Elemental's Nukes and enfeebles.
    sets.midcast_MAB_Spell = set_combine(sets.BP_Base, {
        head = HdPMab,
        neck = "Deino Collar",
        ear1 = "Gelos earring",
        ear2 = "Esper Earring",
        body = "Shomonjijoe +1",
        hands = "Merlinic Dastanas",
        back = "Scintillating Cape",
        waist = "Incarnation Sash",
        legs = "Apogee Slacks",
        feet = "apogee pumps +1"
    })

    --Retouch on Bp Macc gear later.
    sets.midcast_MAcc_BP = set_combine(sets.BP_Base,
        { neck = "Consummation Torque", legs = LegPMacc, feet = "Beck. Pigaches +1" })

    sets.midcast_Buff_BP = set_combine(sets.skill,
        { waist = "Lucidity Sash", legs = "Beckoner's Spats +1" })
    sets.midcast_Buff_BP_Melee = set_combine(sets.skill,
        {main = "Nirvana", sub = "Oneiros Grip"})

    sets.midcast_Cur = {
        head = "Marduk's Tiara +1",
        neck = "Orunmila's Torque",
        body = "Heka's Kalasiris",
        legs = "Gyve Trousers",
        back = "Solemnity Cape",
        hands = "Bokwus Gloves",
        feet = "Marduk's Crackows +1",
        ring1 = "Leviathan Ring",
        ring2 = "Sirona's Ring",
        waist = "Caller's sash"
    }

    sets.midcast_nuke = {
        head = HdMab,
        neck = "Sanctity Necklace",
        ear1 = "Novio Earring",
        ear2 = "Hecate's Earring",
        body = BdyMab,
        hands = "Amalric Gages",
        ring1 = "Shiva Ring",
        ring2 = "Shiva Ring",
        back = "Refraction Cape",
        waist = "Yamabuki-no-obi",
        legs = LegMab,
        feet = FeetMab
    }

    sets.midcast_Stoneskin = {
        head = "Marduk's Tiara +1",
        neck = "Stone Gorget",
        hands = "Yaoyotl gloves",
        waist = "Siegel Sash",
        legs = "Shedir Seraweels",
        ring1 = "Leviathan Ring"
    }


    --Aftercast Sets
    sets.aftercast_None = set_combine(sets.base, {
        head = "Beckoner's Horn +1",
        neck = "Sanctity Necklace",
        ear1 = "moonshade earring",
        ear2 = "Gifted Earring",
        body = "Shomonjijoe +1",
        hands = "Asteria Mitts +1",
        ring1 = "Defending Ring",
        ring2 = "Shadow Ring",
        back = "Solemnity Cape",
        waist = "Fucho-no-obi",
        legs = "Assiduity Pants +1",
        feet = "Herald's Gaiters"
    })

    sets.aftercast_Favor = set_combine(sets.base, {
        head = "Beckoner's Horn +1",
        neck = "Caller's Pendant",
        ear1 = "moonshade earring",
        ear2 = "Domesticator's Earring",
        body = "Beckoner's Doublet +1",
        hands = "lamassu mitts +1",
        ring1 = "Defending Ring",
        ring2 = "Evoker's Ring",
        back = "Conveyance Cape",
        waist = "Lucidity Sash",
        legs = "Beckoner's Spats +1",
        feet = "apogee pumps +1"
    })

    sets.aftercast_Perp_Base = set_combine(sets.aftercast_None, {
        neck = "Caller's Pendant",
        ear2 = "Domesticator's earring",
        hands = "Apogee mitts +1",
        ring2 = "Thurandaut Ring",
        back = "Scintillating Cape",
        waist = "Lucidity Sash"
    })

    sets.aftercast_Pet_Atk = set_combine(sets.aftercast_Perp_Base, {
        head = "Apogee Crown +1",
        neck = "Empath Necklace",
        ear1 = "Rimeice earring",
        ear2 = "Domes. Earring",
        body = "Glyphic Doublet +1",
        hands = "Apogee mitts +1",
        ring1 = "Defending Ring",
        waist = "Incarnation Sash",
        legs = merlinicLgPetAcc,
        feet = "Glyph. Pigaches +1"
    })

    sets.aftercast_Avatar_Spirit = set_combine(sets.aftercast_Perp_Base, { legs = "Assiduity Pants +1" })

    sets.aftercast_Resting = sets.aftercast_None

    sets.aftercast_Idle = sets.aftercast_None

    sets.reive = { neck = "Ygnas's Resolve +1" }

    sets.aftercast_TP = {
        main = "Nirvana",
        sub = "Oneiros grip",
        ammo = "Seraphicaller",
        head = "Beckoner's Horn +1",
        neck = "Sanctity Necklace",
        ear1 = "Steelflash Earring",
        ear2 = "Bladeborn Earring",
        body = "Shomonjijoe +1",
        hands = "Asteria Mitts +1",
        ring1 = "Evoker's Ring",
        ring2 = "Rajas Ring",
        back = "Scintillating Cape",
        waist = "Kuku Stone",
        legs = "Assiduity Pants +1",
        feet = "Glyphic Pigaches +1"
    }

    -- Variables and notes to myself
    Debuff_BPs = T { 'Diamond Storm', 'Sleepga', 'Slowga', 'Tidal Roar', 'Shock Squall', 'Nightmare', 'Pavor Nocturnus', 'Ultimate Terror', 'Somnolence', 'Lunar Cry', 'Lunar Roar','Mewing Lullaby','Eerie Eye', }
    Magical_BPs_affected_by_TP = T { 'Heavenly Strike', 'Wind Blade', 'Holy Mist', 'Night Terror', 'Thunderstorm', 'Geocrush', 'Meteor Strike', 'Grand Fall', 'Lunar Bay', 'Thunderspark','Level ? Holy' }
    Magical_BPs_unaffected_by_TP = T { 'Flaming Crush', 'Nether Blast', 'Aerial Blast', 'Searing Light', 'Diamond Dust', 'Earthen Fury', 'Tidal Wave', 'Judgment Bolt', 'Inferno', 'Howling Moon', 'Ruinous Omen' }
    Additional_effect_BPs = T { 'Rock Throw' }
    Low_tier_nuke = T { 'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder' }
end




function precast(spell, action)

    if spell.name == 'Holy Water' then
        equip({ ammo = "Pebble" })
    end
    --if Low_tier_nuke:contains(spell.name) then
    --	equip(sets.midcast_nuke)
    --else
    if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
    equipSet = set_combine(equipSet, { neck = "Ygnas's Resolve +1" })
    end
    if spell.action_type == 'Magic' then
        equip(sets.precast_FC)
        if string.find(spell.english, 'Cur') then
            equip(sets.precast_Cur)
        end
    end

    --end
end

function midcast(spell, action)
    if string.find(spell.english, 'Cur') then
        equip(sets.midcast_Cur)
    elseif spell.english == 'Stoneskin' then
        equip(sets.midcast_Stoneskin)
    elseif spell.action_type == 'Magic' then
        equip(sets.midcast_nuke)
    elseif sets['precast_FC_' .. tostring(spell.element)] then
        equip(sets['precast_FC_' .. spell.element])
        -- Any Magic Affinity specific sets
    elseif sets['precast_' .. spell.english] then
        equip(sets['precast_' .. spell.english])

    elseif string.find(spell.type, 'BloodPact') then
        if buffactive['Astral Conduit'] then
            pet_midcast(spell)
        else
            equip(sets.precast_BP)
        end
    else
        idle()
    end
end

function aftercast(spell, action)
    if not spell.type or not string.find(spell.type, 'BloodPact') then
        -- Don't want to swap away too quickly if I'm about to put BP damage gear on
        -- Need to wait 1 in order to allow pet information to update on Release.
        send_command('@wait 1;gs c Idle')
    end
end

function status_change(new, action)
    if new == 'Idle' then
        idle()
        if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
        equipSet = set_combine(equipSet, { neck = "Ygnas's Resolve +1" })
        end
    elseif new == 'Resting' then
        equip(sets['aftercast_Resting'])
    elseif new == 'Engaged' then
        equip(sets.aftercast_TP)
        if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
        equipSet = set_combine(equipSet, { neck = "Ygnas's Resolve +1" })
        end
    end
end

function pet_midcast(spell, action)
    if spell.name == 'Perfect Defense' then
        equip(sets.skill)
    elseif spell.name == 'Zantetsuken' then
        equip(sets.midcast_zantetsuken)
    elseif spell.type == 'BloodPactWard' then
        if Debuff_BPs:contains(spell.name) then
            equip(sets.midcast_MAcc_BP)
        else
            equip(sets.midcast_Buff_BP)
        end
    elseif spell.type == 'BloodPactRage' then
        if Magical_BPs_affected_by_TP:contains(spell.name) or string.find(spell.name, ' II') or string.find(spell.name, ' IV') then
            equip(sets.midcast_MAB_TP_BP)
        elseif Magical_BPs_unaffected_by_TP:contains(spell.name) then
            equip(sets.midcast_MAB_No_TP_BP)
        elseif Additional_effect_BPs:contains(spell.name) then -- for BPs where the additional effect matters more than the damage
        equip(sets.midcast_MAcc_BP)
        else
            equip(sets.midcast_Phys_BP)
        end
    elseif spell.type == 'BlackMagic' then
        equip(sets.midcast_MAB_Spell)
    end
end

function pet_aftercast(spell, action)
    idle()
end

function self_command(command)
    if command == 'Idle' then
        idle()
    end
    if command == 'C1' and petAtkToggle == 0 then -- Change pet to Pet Atk Gear --
    petAtkToggle = 1
    add_to_chat(158, 'Pet Attack Toggle is On')
    status_change(player.status)
    elseif command == 'C1' and petAtkToggle == 1 then -- Change to Refresh Gear --
    petAtkToggle = 0
    add_to_chat(158, 'Pet Attack Toggle is Off')
    status_change(player.status)
    end
end

function idle()
    if player.status == 'Engaged' then
        equip(sets.aftercast_TP)
    else

        equip(sets.aftercast_None)
        if pet.isvalid then
            if string.find(pet.name, 'Spirit') then
                equip(sets.aftercast_Avatar_Spirit)
            elseif buffactive["Avatar's Favor"] then
                equip(sets.aftercast_Favor)
            elseif (petAtkToggle == 1) then
                equip(sets.aftercast_Pet_Atk)
            else
                equip(sets.aftercast_Perp_Base)
                if sets['aftercast_Avatar_' .. pet.name] then
                    equip(sets['aftercast_Avatar_' .. pet.name])
                end
            end
        end
    end
end
