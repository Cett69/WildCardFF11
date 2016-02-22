-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Motenten's Macro Book Function ** --
-- Last Updated: 05/05/14 12:00 AM *Fixed Magic Sets* --
include('organizer-lib')
function get_sets()
	IdleIndex = 1
	IdleArray = {"Refresh","Geomancy","Movement"} -- Default Idle Set Is Movement --
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	Armor = 'None'
	define_geomancy_values()
	Obi = 'ON' -- Turn Default Obi ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1 = "GeoTorpor", SC2 = "GeoLanguor", SC3 = "IndiFocus"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	Non_Obi_Spells = S{
			'Burn','Choke','Drown','Frost','Rasp','Shock','Impact','Anemohelix','Cryohelix',
			'Geohelix','Hydrohelix','Ionohelix','Luminohelix','Noctohelix','Pyrohelix'}

	Cities = S{
			"Ru'lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno",
			"Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
			"Port San d'Oria","Northern San d'Oria","Southern San d'Oria",
			"Port Bastok","Bastok Markets","Bastok Mines","Metalworks",
			"Aht Urhgan Whitegate","Nashmau","Tavanazian Safehold",
			"Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham"}

	-- Idle Sets --
	sets.Idle = {}
	sets.Idle.Refresh = {
			main="Bolelabunga",
			sub="Culminus",
			range="Dunna",
			head="Spurrina coif",
			neck="Wiglen Gorget",
			ear1="Lifestorm Earring",
			ear2="Psystorm Earring",
			body="Geomancy Tunic +1",
			hands="Bagua mitaines +1",
			ring1="Sheltered Ring",
			ring2="Paguroidea Ring",
			back="Lifestream cape",
			waist="Fucho-no-obi",
			legs="Assiduity pants +1",
			feet="Azimuth gaiters +1"}
	sets.Idle.Movement =  set_combine(sets.Idle.Refresh,{
			neck="Loricate torque +1",
			body="Bagua tunic +1",
			ring1="Defending Ring",
			ring2="Dark Ring",
			feet="Geo. Sandals +1"})
	sets.Idle.Geomancy =  set_combine(sets.Idle.Refresh,{
			main="Idris",
			sub="genmei shield",
			range="Dunna",
			head="Azimuth hood +1",
			neck="Loricate torque +1",
			ear1="Handler's Earring +1",
			ear2="Rimeice Earring",
			body="Vrikodara jupon",
			hands="Geomancy mitaines +1",
			ring1="defending Ring",
			ring2="Dark Ring",
			back="Lifestream cape",
			waist="Isa belt",
			legs="Assiduity pants +1",
			feet="Bagua sandals +1"})
			
	sets.Resting = set_combine(sets.Idle.Movement,{})

	-- PDT Set --
	sets.PDT = {
			main="Mafic cudgel",
			sub="genmei shield",
			head="Befouled crown",
			neck="Loricate torque +1",
			ear1="Handler's Earring +1",
			ear2="Rimeice Earring",
			body="Vrikodara jupon",
			hands="Geomancy mitaines +1",
			ring1="Defending Ring",
			ring2="Dark Ring",
			back="Lifestream cape",
			waist="Isa belt",
			legs="Assiduity pants +1",
			feet="Geo. Sandals +1"}
			
	sets.Sublimation = {
			main="Bolelabunga",
			sub="Culminus",
			head="Spurrina coif",
			ear2="Loquac. Earring",
			body="Amalric doublet",
			hands="Bagua mitaines +1",
			back="Lifestream cape",
			waist="Fucho-no-obi",
			legs="Assiduity pants +1",
			feet="Bagua sandals +1"}

	sets.Precast = {}
	-- FastCast Sets --
	sets.Precast.FastCast = {
			head="Nahtirah Hat",
			neck="Orunmila's Torque",
			ear1="Etiolation Earring",
			ear2="Loquac. Earring",
			body="Anhur robe",
			hands="Bagua mitaines +1",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Perimede cape",
			waist="Witful Belt",
			legs="Geomancy Pants +1",
			feet="Merlinic crackows"}

	-- Geomancy Precast
	sets.Precast.GeoCast = set_combine(sets.Precast.FastCast,{
			main="Idris",
			sub="Culminus",
			range="Dunna",
			head="Azimuth hood +1",
			neck="Incanter's Torque",
			ear1="Gifted Earring",
			ear2="Mendi. Earring",
			body="Azimuth coat +1",
			hands="Azimuth gloves +1",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Lifestream Cape",
			waist="Austerity belt +1",
			legs="Bagua Pants +1",
			feet="Azimuth gaiters +1"})

	-- Elemental Staves --
	sets.Precast.Thunder = {}
	sets.Precast.Water = {}
	sets.Precast.Fire = {}
	sets.Precast.Ice = {}
	sets.Precast.Wind = {}
	sets.Precast.Earth = {}
	sets.Precast.Light = {}
	sets.Precast.Dark = {}

	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Precast Cure Set --
	sets.Precast.Cure = {
			head="Nahtirah Hat",
			neck="Orunmila's Torque",
			ear1="Mendicant's earring",
			ear2="Loquac. Earring",
			body="Heka's Kalasiris",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Perimede cape",
			waist="Witful belt",
			legs="Geo. Pants +1",
			feet="Merlinic crackows"}

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Cure Set --
	sets.Midcast.Cure = {
			head="Vanya hood",
			neck="Phalaina Locket",
			ear1="Mendicant's earring",
			ear2="Loquac. Earring",
			body="Vrikodara jupon",
			hands="Telchine gloves",
			ring1="Sirona's Ring",
			ring2="Haoma's ring",
			back="Tempered Cape",
			waist="Luminary sash",
			legs="Assiduity pants +1",
			feet="Vanya clogs"}

	-- Curaga Set --
	sets.Midcast.Curaga = {
			head="Vanya hood",
			neck="Phalaina Locket",
			ear1="Mendicant's earring",
			ear2="Loquac. Earring",
			body="Vrikodara jupon",
			hands="Telchine gloves",
			ring1="Sirona's Ring",
			ring2="Haoma's ring",
			back="Tempered Cape",
			waist="Luminary sash",
			legs="Assiduity pants +1",
			feet="Vanya clogs"}

	-- Haste Set --
	sets.Midcast.Haste = {
			head="Nahtirah Hat",
			neck="Orunmila's Torque",
			ear2="Loquac. Earring",
			body="Merlinic Jubbah",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Lifestream Cape",
			waist="Witful Belt",
			legs="Geomancy Pants +1",
			feet="Umbani boots"}

	sets.Midcast['Enhancing Magic'] = {
			head="Befouled crown",
			neck="Incanter's Torque",
			body="Telchine Chas.",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			waist="Olympus Sash",
			back="Perimede cape",
			legs="Geomancy Pants +1",
			feet="Telchine pigaches"}

	sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{})

	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{
			head="Vanya hood",
			body="Merlinic Jubbah",
			ring1="Sirona's Ring",
			ring2="Haoma's ring",
			back="Tempered Cape",
			waist="Witful Belt",
			legs="Geomancy pants +1",
			feet="Vanya clogs"})

	sets.Midcast.Stun = {
			main="Rubicundity",
			sub="Culminus",
			ammo="Pemphredo tathlum",
			head="Nahtirah Hat",
			neck="Orunmila's Torque",
			ear1="Etiolation Earring",
			ear2="Loquac. Earring",
			body="Merlinic Jubbah",
			hands="Azimuth gloves +1",
			ring1="Prolix ring",
			ring2="Sangoma Ring",
			back="Lifestream cape",
			waist="Witful Belt",
			legs="geomancy pants +1",
			feet="Merlinic crackows"}
	sets.Midcast.Stun.MidACC = set_combine(sets.Midcast.Stun,{
			main="Rubicundity",
			sub="Culminus",
			ammo="Pemphredo tathlum",
			head="Nahtirah Hat",
			neck="Orunmila's Torque",
			ear1="Lifestorm Earring",
			ear2="Psystorm Earring",
			body="Merlinic Jubbah",
			hands="Azimuth gloves +1",
			ring1="Shiva ring +1",
			ring2="Sangoma Ring",
			back="Lifestream cape",
			waist="Witful Belt",
			legs="geomancy pants +1",
			feet="Merlinic crackows"})
	sets.Midcast.Stun.HighACC = set_combine(sets.Midcast.Stun.MidACC,{})

	-- Dark Magic Sets --
	sets.Midcast['Dark Magic'] = {
			main="Rubicundity",
			sub="Culminus",
			ammo="Pemphredo tathlum",
			head="Pixie hairpin +1",
			neck="Incanter's Torque",
			ear1="Hirudinea earring",
			ear2="Barkarole earring",
			body="Merlinic Jubbah",
			hands="Helios gloves",
			ring1="Archon Ring",
			ring2="Evanescence Ring",
			back="Perimede cape",
			waist="Fucho-no-obi",
			legs="Merlinic shalwar",
			feet="Merlinic crackows"}
	sets.Midcast['Dark Magic'].MidACC = set_combine(sets.Midcast['Dark Magic'],{})
	sets.Midcast['Dark Magic'].HighACC = set_combine(sets.Midcast['Dark Magic'].MidACC,{})

	-- Elemental Sets --
	sets.Midcast['Elemental Magic'] = {
			main="Solstice",
			sub="Culminus",
			ammo="Pemphredo tathlum",
			head="Merlinic hood",
			neck="Mizu. Kubikazari",
			ear1="Friomisi Earring",
			ear2="Barkarole earring",
			body="Merlinic Jubbah",
			hands="Amalric Gages",
			ring1="Shiva ring +1",
			ring2="Shiva ring +1",
			back="Toro cape",
			waist="Yamabuki-no-Obi",
			legs="Merlinic shalwar",
			feet="Merlinic crackows"}
	sets.Midcast['Elemental Magic'].MidACC = set_combine(sets.Midcast['Elemental Magic'],{
			main="Solstice",
			sub="Culminus",
			ammo="Pemphredo tathlum",
			head="Merlinic hood",
			neck="Eddy necklace",
			ear1="Friomisi Earring",
			ear2="Barkarole earring",
			body="Merlinic Jubbah",
			hands="Amalric Gages",
			ring1="Shiva ring +1",
			ring2="Shiva ring +1",
			back="Toro cape",
			waist="Yamabuki-no-Obi",
			legs="Merlinic shalwar",
			feet="Merlinic crackows"})
	sets.Midcast['Elemental Magic'].HighACC = set_combine(sets.Midcast['Elemental Magic'].MidACC,{
			main="Solstice",
			sub="Culminus"})

    sets.Midcast.Thunder = set_combine(sets.Midcast['Elemental Magic'],{main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast['Thunder II'] = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast.Ionohelix = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast.Blizzard = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast['Blizzard II'] = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast.Cryohelix = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})    
    sets.Midcast.Fire = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast['Fire II'] = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast.Pyrohelix = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast.Aero = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast['Aero II'] = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast.Anemohelix = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast.Stone = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast['Stone II'] = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast.Geohelix = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast.Water = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast['Water II'] = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
    sets.Midcast.Hydrohelix = set_combine(sets.Midcast['Elemental Magic'], {main="Idris",ring1="Fenrir ring +1",ring2="Fenrir ring +1",ammo="Ghastly tathlum +1",neck="Eddy necklace",waist="Sekhmet corset",feet="Umbani boots"})
       
	-- Enfeebling Sets --
	sets.Midcast['Enfeebling Magic'] = {
			main="Rubicundity",
			sub="Culminus",
			ammo="Pemphredo tathlum",
			head="Befouled crown",
			neck="Imbodla necklace",
			ear1="Lifestorm Earring",
			ear2="Psystorm Earring",
			body="Merlinic Jubbah",
			hands="Azimuth gloves +1",
			ring1="Shiva ring +1",
			ring2="Sangoma Ring",
			back="Lifestream cape",
			waist="Luminary Sash",
			legs="Merlinic shalwar",
			feet="Medium's sabots"}
	sets.Midcast['Enfeebling Magic'].MidACC =  set_combine(sets.Midcast['Enfeebling Magic'],{})
	sets.Midcast['Enfeebling Magic'].HighACC = set_combine(sets.Midcast['Enfeebling Magic'].MidACC,{})

	sets.Midcast['Divine Magic'] = {
			ammo="Pemphredo tathlum",
			head="Befouled crown",
			neck="Imbodla necklace",
			ear1="Lifestorm Earring",
			ear2="Psystorm Earring",
			body="Merlinic Jubbah",
			hands="Azimuth gloves +1",
			ring1="Shiva ring +1",
			ring2="Sangoma Ring",
			back="Lifestream cape",
			waist="Luminary Sash",
			legs="Merlinic shalwar",
			feet="Medium's sabots"}
			
	sets.Midcast.Impact = {
			main="Solstice",
			sub="Culminus",
			ammo="Pemphredo tathlum",
			neck="Eddy Necklace",
			ear1="Lifestorm Earring",
			ear2="Psystorm Earring",
			body="Twilight Cloak",
			hands="Amalric Gages",
			ring1="Shiva ring +1",
			ring2="Sangoma Ring",
			back="Perimede cape",
			waist="Yamabuki-no-Obi",
			legs="Merlinic shalwar",
			feet="Umbani boots"}

	-- Elemental Obi/Twilight Cape --
	sets.Obi = {}
	sets.Obi.Lightning = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Water = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Fire = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Ice = {back="Twilight Cape",waist='Hachirin-no-Obi',}
	sets.Obi.Wind = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Earth = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Light = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Dark = {back="Twilight Cape",waist='Hachirin-no-Obi'}

	-- JA Sets --
	sets.JA = {}
	sets.JA['Life Cycle'] = {body="Geomancy Tunic +1"}
	sets.JA['Full Circle'] = {head="Azimuth hood +1"}
	sets.JA['Bolster'] = {body="Bagua Tunic +1"}
	sets.JA['Mending Halation'] = {legs="Bagua pants +1"}
	sets.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}

	-- Melee Set --
	sets.Melee = {
			head="Befouled crown",
			neck="Asperity necklace",
			ear1="Steelflash earring",
			ear2="Bladeborn Earring",
			body="Ischemia chasu.",
			hands="Geomancy mitaines +1",
			ring1="Ramuh Ring +1",
			ring2="Petrov ring",
			back="Lifestream Cape",
			waist="Windbuffet Belt +1",
			legs="Assiduity pants +1",
			feet="Umbani boots"}

	-- WS Base Set --
	sets.WS = {}
	sets.WS["Hexa Strike"] = {
			ammo="Vanir Battery",
			head="Nahtirah Hat",
			neck="Fotia gorget",
			ear1="brutal earring",
			ear2="Moonshade Earring",
			body="Ischemia chasu.",
			hands="Amalric Gages",
			ring1="Ifrit ring +1",
			ring2="Ifrit ring +1",
			back="Rancorous mantle",
			waist="Fotia Belt",
			legs="Merlinic shalwar",
			feet="Bagua sandals +1"}
	sets.WS.Realmrazer = {}
	sets.WS.Shattersoul = {}
	sets.WS.Exudation = {
			ammo="Ghastly tathlum +1",
			head="Merlinic hood",
			neck="Fotia gorget",
			ear1="brutal earring",
			ear2="Moonshade Earring",
			body="Merlinic Jubbah",
			hands="Amalric Gages",
			ring1="Shiva ring +1",
			ring2="Shiva ring +1",
			back="toro Cape",
			waist="Fotia Belt",
			legs="Merlinic shalwar",
			feet="Merlinic crackows"}
	sets.WS["Flash Nova"] = {
			ammo="Pemphredo tathlum",
			head="Merlinic hood",
			neck="Eddy Necklace",
			ear1="Barkarole earring",
			ear2="Friomisi Earring",
			body="Merlinic Jubbah",
			hands="Amalric Gages",
			ring1="Shiva ring +1",
			ring2="Shiva ring +1",
			back="toro Cape",
			waist="Yamabuki-no-Obi",
			legs="Merlinic shalwar",
			feet="Merlinic crackows"}
end

function pretarget(spell,action)
	if (string.find(spell.type,'Magic') or spell.type == "Ninjutsu" or spell.type == "Geomancy") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	elseif string.find(spell.english,'Geo') and pet.isvalid then -- Change Any Geo Spells To Full Circle If You Have A Luopan Active --
		cancel_spell()
		send_command('input /ja "Full Circle" <me>')
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
		elseif sets.WS[spell.english] then
			equip(sets.WS[spell.english])
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "Geomancy" then
		if Cities:contains(world.area) then
			cancel_spell()
			add_to_chat(123,'Unable To Use Geomancy In Town')
			return
		else
			if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Geomancy If You Are Silenced or Out of Range --
				cancel_spell()
				add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
				return
			else
				display_geomancy_info(spell)
				equip(sets.Precast.GeoCast)
			end
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
	if spell.type:endswith('Magic') or spell.type == "Geomancy" or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if string.find(spell.english,'Cure') then
			equipSet = equipSet.Cure
		if buffactive.Aurorastorm or world.day_element == 'Light' or world.weather_element == 'Light' then
			equipSet = set_combine(equipSet,{back="Twilight Cape",waist='Hachirin-no-Obi'})
		elseif string.find(spell.english,'Cura') then
			equipSet = equipSet.Curaga
		end
		elseif string.find(spell.english,'Banish') then
			equipSet = set_combine(equipSet.Haste,{ring1="Fenian Ring"})
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('cancel stoneskin')
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
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
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
		if spell.english == "Sleep II" then-- Sleep II Countdown --
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
	if buff == 'weakness' then -- Weakness Timer --
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
	if command == 'C1' then -- Stun Toggle --
		if StunIndex == 1 then
			StunIndex = 0
			add_to_chat(123,'Stun Set: [Unlocked]')
		else
			StunIndex = 1
			add_to_chat(158,'Stun Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C2' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
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
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
end

function define_geomancy_values()
	geomancy = {
		Frailty = {bonus="Defense Down"},
		Torpor = {bonus="Evasion Down"},
		Languor = {bonus="Magic Evasion Down"},
		Focus = {bonus="Magic Accuracy"},
		Malaise = {bonus="Magic Defense Down"},
		Precision = {bonus="Accuracy"},
		Refresh = {bonus="Refresh"},
		Fade = {bonus="Magic Attack Down"},
		Wilt = {bonus="Attack Down"},
		Vex = {bonus="Magic Accuracy Down"},
		Slip = {bonus="Accuracy Down"},
		Acumen = {bonus="Magic Attack"},
		Fend = {bonus="Magic Defense"},
		Fury = {bonus="Attack"},
		Attunement = {bonus="Magic Evasion"},
		Voidance = {bonus="Evasion"},
		Barrier = {bonus="Defense"}
		}
end

function display_geomancy_info(spell)
	geoType=nil 
	string.gsub(spell.english.."-","-(.-)-",function(geo) geoType=geo end)
	geoInfo = geomancy[geoType]
	if geoInfo then
		add_to_chat(158, spell.english..' = '..tostring(geoInfo.bonus))
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
	if player.sub_job == 'RDM' then
		set_macro_page(9, 2)
	elseif player.sub_job == 'BLM' then
		set_macro_page(9, 2)
	elseif player.sub_job == 'WHM' then
		set_macro_page(8, 2)
	else
		set_macro_page(9, 2)
	end
end