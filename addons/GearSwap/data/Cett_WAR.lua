-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- Please Use Send, Shortcuts & Cancel Addon For My GearSwap --
-- Last Updated: 03/12/14 3:20 PM *Added AM3 + Ionis Sets* --
include('organizer-lib')
function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Regen"} -- Default Idle Set Is Movement --
	Armor = 'None'
	Twilight = 0
	Rancor = 'OFF' -- Set Default Rancor ON or OFF Here --
	Mekira = 'OFF' -- Set Default Mekira ON or OFF Here --
	BloodRage = 'ON' -- Set Default BloodRage ON or OFF Here --
	Retaliation = 'OFF' -- Set Default Retaliation ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	send_command('input /macro book 2;wait .1;input /macro set 1') -- Change Default Macro Book Here --

	sc_map = {SC1="UkkosFury", SC2="Berserk", SC3="Aggressor"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle/Town Sets --
	sets.Idle = {}
	sets.Idle.Regen = {
--			ammo="Iron gobbet",
--			head="Adaman Barbuta",
			neck="Wiglen Gorget",
--			ear1="Genmei Earring",
--			ear2="Infused Earring",
--			body="Obviation cuirass +1",
			hands="Agoge Mufflers +1",
--			ring1="Sheltered Ring",
			ring2="Paguroidea Ring",
--			back="Scuta cape",
--			waist="Flume belt +1",
--			legs="odyssean cuisses"
			}

	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
--			ammo="Iron gobbet",
			head="Odyssean Helm",
--			neck="Loricate torque +1",
--			ear1="Genmei Earring",
--			ear2="Infused Earring",
--			body="Obviation cuirass +1",
			hands="Agoge Mufflers +1",
			ring1="Defending Ring",
--			ring2="Dark Ring",
--			back="Agema cape",
			waist="Flume belt +1",
--			legs="Valorous hose",
			feet="Hermes' sandals"})

	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}

	-- TP Base Set --
	sets.TP = {}

	-- Conqueror(AM3 Down) TP Sets --
	sets.TP.Conqueror = {
			main="Conqueror",
			sub="Bloodrain strap",
			ammo="Ginsen",
			head="Boii mask +1",
			neck="Asperity Necklace",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Valorous mail",
			hands="Cizin Mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt +1",
			legs="agoge cuisses +1",
			feet="Acro Leggings"}
	sets.TP.Conqueror.MidACC = set_combine(sets.TP.Conqueror,{
			hands="Xaddi gauntlets",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Kentarch Belt +1",
			legs="Pummeler's cuisses +1",
			feet="Loyalist sabatons"})
	sets.TP.Conqueror.HighACC = set_combine(sets.TP.Conqueror.MidACC,{
			head="odyssean helm",
			neck="Iqabi Necklace",
			ear2="Zennaroi Earring",
			hands="Acro gauntlets",
			neck="Portus collar",
			ring1="Ramuh ring +1",
			legs="Odyssean cuisses",
			waist="Olseni Belt",
			feet="Founder's greaves"})

	-- Conqueror(AM3 Up) TP Sets --
	sets.TP.Conqueror.AM3 = set_combine(sets.TP.Conqueror,{
			head="Boii mask +1",
			body="Boii lorica +1",
			hands="Acro Gauntlets",
			ear1="Tripudio Earring",
			ear2="Kokou's Earring",
			feet="Boii Calligae +1"})
	sets.TP.Conqueror.MidACC.AM3 = set_combine(sets.TP.Conqueror.AM3,{
			ear2="Zennaroi Earring",
			legs="Pumm. Cuisses +1"})
	sets.TP.Conqueror.HighACC.AM3 = set_combine(sets.TP.Conqueror.MidACC.AM3,{
			head="odyssean helm",
			neck="Iqabi Necklace",
			ring1="Ramuh ring +1",
			waist="Olseni belt",
			legs="Odyssean cuisses"})

	-- Conqueror(AM3 Down: Restraint) TP Sets --
	sets.TP.Conqueror.Restraint = set_combine(sets.TP.Conqueror,{
			main="Conqueror",
			sub="Bloodrain strap",
			ammo="Ginsen",
			head="Boii mask +1",
			neck="Asperity Necklace",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Valorous mail",
			hands="boii mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt +1",
			legs="agoge cuisses +1",
			feet="Acro Leggings"})
	sets.TP.Conqueror.MidACC.Restraint = set_combine(sets.TP.Conqueror.Restraint,{
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Kentarch Belt +1",
			legs="Pummeler's cuisses +1",
			feet="Loyalist sabatons"})
	sets.TP.Conqueror.HighACC.Restraint = set_combine(sets.TP.Conqueror.MidACC.Restraint,{
			head="odyssean helm",
			neck="Iqabi Necklace",
			ear2="Zennaroi Earring",
			neck="Portus collar",
			ring1="Ramuh ring +1",
			legs="Odyssean cuisses",
			waist="Olseni Belt",
			feet="Founder's greaves"})

	-- Conqueror(AM3 Up: Restraint) TP Sets --
	sets.TP.Conqueror.AM3.Restraint = set_combine(sets.TP.Conqueror.AM3,{
			head="Boii mask +1",
			body="Boii lorica +1",
			hands="boii mufflers +1",
			ear1="Tripudio Earring",
			ear2="Kokou's Earring",
			feet="Boii Calligae +1"})
	sets.TP.Conqueror.MidACC.AM3.Restraint = set_combine(sets.TP.Conqueror.AM3.Restraint,{
			ear2="Zennaroi Earring",
			legs="Tatenashi haidate +1"})
	sets.TP.Conqueror.HighACC.AM3.Restraint = set_combine(sets.TP.Conqueror.MidACC.AM3.Restraint,{
			head="odyssean helm",
			neck="Iqabi Necklace",
			ring1="Ramuh ring +1",
			waist="Olseni belt",
			legs="Odyssean cuisses"})

	-- Conqueror(AM3 Down: Ionis) TP Sets --
	sets.TP.Conqueror.Ionis = set_combine(sets.TP.Conqueror,{
			main="Conqueror",
			sub="Bloodrain strap",
			ammo="Ginsen",
			head="Boii mask +1",
			neck="Asperity Necklace",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Valorous mail",
			hands="Cizin Mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt +1",
			legs="agoge cuisses +1",
			feet="Acro Leggings"})
	sets.TP.Conqueror.MidACC.Ionis = set_combine(sets.TP.Conqueror.Ionis,{
			hands="Xaddi gauntlets",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Kentarch Belt +1",
			legs="Pummeler's cuisses +1",
			feet="Loyalist sabatons"})
	sets.TP.Conqueror.HighACC.Ionis = set_combine(sets.TP.Conqueror.MidACC.Ionis,{
			head="odyssean helm",
			neck="Iqabi Necklace",
			ear2="Zennaroi Earring",
			hands="Acro gauntlets",
			neck="Portus collar",
			ring1="Ramuh ring +1",
			legs="Odyssean cuisses",
			waist="Olseni Belt",
			feet="Founder's greaves"})

	-- Conqueror(AM3 Up: Ionis) TP Sets --
	sets.TP.Conqueror.AM3.Ionis = set_combine(sets.TP.Conqueror.AM3,{
			head="Boii mask +1",
			body="Boii lorica +1",
			hands="Acro Gauntlets",
			ear1="Tripudio Earring",
			ear2="Kokou's Earring",
			feet="Boii Calligae +1"})
	sets.TP.Conqueror.MidACC.AM3.Ionis = set_combine(sets.TP.Conqueror.AM3.Ionis,{
			ear2="Zennaroi Earring",
			legs="Tatenashi haidate +1"})
	sets.TP.Conqueror.HighACC.AM3.Ionis = set_combine(sets.TP.Conqueror.MidACC.AM3.Ionis,{
			head="odyssean helm",
			neck="Iqabi Necklace",
			ring1="Ramuh ring +1",
			waist="Olseni belt",
			legs="Odyssean cuisses"})

	-- Conqueror(AM3 Down: Restraint + Ionis) TP Sets --
	sets.TP.Conqueror.Restraint.Ionis = set_combine(sets.TP.Conqueror.Restraint,{
			main="Conqueror",
			sub="Bloodrain strap",
			ammo="Ginsen",
			head="Boii mask +1",
			neck="Asperity Necklace",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Valorous mail",
			hands="boii mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt +1",
			legs="agoge cuisses +1",
			feet="Acro Leggings"})
	sets.TP.Conqueror.MidACC.Restraint.Ionis = set_combine(sets.TP.Conqueror.Restraint.Ionis,{
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Kentarch Belt +1",
			legs="Pummeler's cuisses +1",
			feet="Loyalist sabatons"})
	sets.TP.Conqueror.HighACC.Restraint.Ionis = set_combine(sets.TP.Conqueror.MidACC.Restraint.Ionis,{
			head="odyssean helm",
			neck="Iqabi Necklace",
			ear2="Zennaroi Earring",
			neck="Portus collar",
			ring1="Ramuh ring +1",
			legs="Odyssean cuisses",
			waist="Olseni Belt",
			feet="Founder's greaves"})

	-- Conqueror(AM3 Up: Restraint + Ionis) TP Sets --
	sets.TP.Conqueror.AM3.Restraint.Ionis = set_combine(sets.TP.Conqueror.AM3.Restraint,{
			head="Boii mask +1",
			body="Boii lorica +1",
			hands="boii mufflers +1",
			ear1="Tripudio Earring",
			ear2="Kokou's Earring",
			feet="Boii Calligae +1"})
	sets.TP.Conqueror.MidACC.AM3.Restraint.Ionis = set_combine(sets.TP.Conqueror.AM3.Restraint.Ionis,{
			ear2="Zennaroi Earring",
			legs="Tatenashi haidate +1"})
	sets.TP.Conqueror.HighACC.AM3.Restraint.Ionis = set_combine(sets.TP.Conqueror.MidACC.AM3.Restraint.Ionis,{
			head="odyssean helm",
			neck="Iqabi Necklace",
			ring1="Ramuh ring +1",
			waist="Olseni belt",
			legs="Odyssean cuisses"})

	-- Ukonvasara TP Sets --
	sets.TP.Ukonvasara = {
			main="Ukonvasara",
			sub="Duplus Grip",
			ammo="Ginsen",
			head="Boii Mask +1",
			neck="Asperity Necklace",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Valorous mail",
			hands="Boii Mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt +1",
			legs="Boii Cuisses +1",
			feet="Boii Calligae +1"}
	sets.TP.Ukonvasara.MidACC = set_combine(sets.TP.Ukonvasara,{
			neck="Portus collar",
			body="Boii lorica +1",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Kentarch Belt +1",
			legs="Pumm. Cuisses +1"})
	sets.TP.Ukonvasara.HighACC = set_combine(sets.TP.Ukonvasara.MidACC,{
			head="odyssean helm",
			waist="Olseni belt"})

	-- Ukonvasara(Restraint) TP Sets --
	sets.TP.Ukonvasara.Restraint = set_combine(sets.TP.Ukonvasara,{
			main="Ukonvasara",
			sub="Duplus Grip",
			ammo="Ginsen",
			head="Boii Mask +1",
			neck="Asperity Necklace",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Boii lorica +1",
			hands="boii mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt +1",
			legs="Agoge Cuisses +1",
			feet="Boii Calligae +1"})
	sets.TP.Ukonvasara.MidACC.Restraint = set_combine(sets.TP.Ukonvasara.Restraint,{
			neck="Portus collar",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Kentarch Belt +1",
			legs="Pumm. Cuisses +1"})
	sets.TP.Ukonvasara.HighACC.Restraint = set_combine(sets.TP.Ukonvasara.MidACC.Restraint,{
			head="odyssean helm",
			waist="Olseni belt"})

	-- Ukonvasara(Ionis) TP Sets --
	sets.TP.Ukonvasara.Ionis = set_combine(sets.TP.Ukonvasara,{
			main="Ukonvasara",
			sub="Duplus Grip",
			ammo="Ginsen",
			head="Boii Mask +1",
			neck="Asperity Necklace",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Boii lorica +1",
			hands="Cizin Mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt +1",
			legs="Boii Cuisses +1",
			feet="Boii Calligae +1"})
	sets.TP.Ukonvasara.MidACC.Ionis= set_combine(sets.TP.Ukonvasara.Ionis,{
			neck="Portus collar",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Kentarch Belt +1",
			legs="Pumm. Cuisses +1"})
	sets.TP.Ukonvasara.HighACC.Ionis = set_combine(sets.TP.Ukonvasara.MidACC.Ionis,{
			head="odyssean helm",
			waist="Olseni belt"})

	-- Ukonvasara(Restraint + Ionis) TP Sets --
	sets.TP.Ukonvasara.Restraint.Ionis = set_combine(sets.TP.Ukonvasara.Restraint,{
			main="Ukonvasara",
			sub="Duplus Grip",
			ammo="Ginsen",
			head="Boii Mask +1",
			neck="Asperity Necklace",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Boii lorica +1",
			hands="boii mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt +1",
			legs="Boii Cuisses +1",
			feet="Boii Calligae +1"})
	sets.TP.Ukonvasara.MidACC.Restraint.Ionis = set_combine(sets.TP.Ukonvasara.Restraint.Ionis,{
			neck="Portus collar",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Kentarch Belt +1",
			legs="Pumm. Cuisses +1"})
	sets.TP.Ukonvasara.HighACC.Restraint.Ionis = set_combine(sets.TP.Ukonvasara.MidACC.Restraint.Ionis,{
			head="odyssean helm",
			waist="Olseni belt"})

	-- Bravura(AM Down) TP Sets --
	sets.TP.Bravura = {
			main="Bravura",sub="Duplus Grip",ammo="Seething Bomblet",
			head="Boii Mask +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
			body="Boii Lorica +1",hands="Founder's Gauntlets",ring1="K'ayres Ring",ring2="Rajas Ring",
			back="Mauler's Mantle",waist="Windbuffet Belt",legs="Boii Cuisses +1",feet="Boii Calligae +1"}
	sets.TP.Bravura.MidACC = set_combine(sets.TP.Bravura,{
			neck="Deino Collar",
			hands="Valorous Mitts",ring1="Cacoethic Ring",ring2="Begrudging Ring",
			back="Ground. Mantle +1", waist="Kentarch Belt +1", legs="Odyssean Cuisses",feet="Valorous Greaves"})
	sets.TP.Bravura.HighACC = set_combine(sets.TP.Bravura.MidACC,{})
			
	-- Bravura(AM Up) TP Sets --
	sets.TP.Bravura.AM = set_combine(sets.TP.Bravura,{})
	sets.TP.Bravura.MidACC.AM = set_combine(sets.TP.Bravura.AM,{
		neck="Deino Collar",
		hands="Valorous Mitts",ring1="Cacoethic Ring",ring2="Begrudging Ring",
		back="Ground. Mantle +1", waist="Kentarch Belt +1", legs="Odyssean Cuisses",feet="Valorous Greaves"})
	sets.TP.Bravura.HighACC.AM = set_combine(sets.TP.Bravura.MidACC.AM,{})

	-- Bravura(AM Down: Restraint) TP Sets --
	sets.TP.Bravura.Restraint = set_combine(sets.TP.Bravura,{
		hands="Boii Mufflers"})
	sets.TP.Bravura.MidACC.Restraint = set_combine(sets.TP.Bravura.Restraint,{
		neck="Deino Collar",
		hands="Boii Mufflers",ring1="Cacoethic Ring",ring2="Begrudging Ring",
		back="Ground. Mantle +1", waist="Kentarch Belt +1", legs="Odyssean Cuisses",feet="Valorous Greaves"})
	sets.TP.Bravura.HighACC.Restraint = set_combine(sets.TP.Bravura.MidACC.Restraint,{})

	-- Bravura(AM Up: Restraint) TP Sets --
	sets.TP.Bravura.AM.Restraint = set_combine(sets.TP.Bravura.Restraint,{})
	sets.TP.Bravura.MidACC.AM.Restraint = set_combine(sets.TP.Bravura.AM.Restraint,{
		neck="Deino Collar",
		hands="Boii Mufflers",ring1="Cacoethic Ring",ring2="Begrudging Ring",
		back="Ground. Mantle +1", waist="Kentarch Belt +1", legs="Odyssean Cuisses",feet="Valorous Greaves"})
	sets.TP.Bravura.HighACC.AM.Restraint = set_combine(sets.TP.Bravura.MidACC.AM.Restraint,{})

	-- Bravura(AM Down: Ionis) TP Sets --
	sets.TP.Bravura.Ionis = set_combine(sets.TP.Bravura,{})
	sets.TP.Bravura.MidACC.Ionis = set_combine(sets.TP.Bravura.Ionis,{
		neck="Deino Collar",
		hands="Boii Mufflers",ring1="Cacoethic Ring",ring2="Begrudging Ring",
		back="Ground. Mantle +1", waist="Kentarch Belt +1", legs="Odyssean Cuisses",feet="Valorous Greaves"})
	sets.TP.Bravura.HighACC.Ionis = set_combine(sets.TP.Bravura.MidACC.Ionis,{})

	-- Bravura(AM Up: Ionis) TP Sets --
	sets.TP.Bravura.AM.Ionis = set_combine(sets.TP.Bravura.AM,{})
	sets.TP.Bravura.MidACC.AM.Ionis = set_combine(sets.TP.Bravura.AM.Ionis,{
		neck="Deino Collar",
		hands="Boii Mufflers",ring1="Cacoethic Ring",ring2="Begrudging Ring",
		back="Ground. Mantle +1", waist="Kentarch Belt +1", legs="Odyssean Cuisses",feet="Valorous Greaves"})
	sets.TP.Bravura.HighACC.AM.Ionis = set_combine(sets.TP.Bravura.MidACC.AM.Ionis,{})

	-- Bravura(AM Down: Restraint + Ionis) TP Sets --
	sets.TP.Bravura.Restraint.Ionis = set_combine(sets.TP.Bravura.Restraint,{})
	sets.TP.Bravura.MidACC.Restraint.Ionis = set_combine(sets.TP.Bravura.Restraint.Ionis,{
		neck="Deino Collar",
		hands="Boii Mufflers",ring1="Cacoethic Ring",ring2="Begrudging Ring",
		back="Ground. Mantle +1", waist="Kentarch Belt +1", legs="Odyssean Cuisses",feet="Valorous Greaves"
	})
	sets.TP.Bravura.HighACC.Restraint.Ionis = set_combine(sets.TP.Bravura.MidACC.Restraint.Ionis,{})

	-- Bravura(AM Up: Restraint + Ionis) TP Sets --
	sets.TP.Bravura.AM.Restraint.Ionis = set_combine(sets.TP.Bravura.AM.Restraint,{})
	sets.TP.Bravura.MidACC.AM.Restraint.Ionis = set_combine(sets.TP.Bravura.AM.Restraint.Ionis,{
		neck="Deino Collar",
		hands="Boii Mufflers",ring1="Cacoethic Ring",ring2="Begrudging Ring",
		back="Ground. Mantle +1", waist="Kentarch Belt +1", legs="Odyssean Cuisses",feet="Valorous Greaves"})
	sets.TP.Bravura.HighACC.AM.Restraint.Ionis = set_combine(sets.TP.Bravura.MidACC.AM.Restraint.Ionis,{})

	-- Ragnarok TP Sets --
	sets.TP.Ragnarok = {
			main="Ragnarok",
			sub="Duplus Grip",
			ammo="Ginsen",
			head="Boii Mask +1",
			neck="Portus Collar",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Valorous mail",
			hands="Xaddi gauntlets",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt +1",
			legs="Boii Cuisses +1",
			feet="Boii Calligae +1"}
	sets.TP.Ragnarok.MidACC = set_combine(sets.TP.Ragnarok,{
			neck="Portus collar",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Kentarch Belt +1",
			legs="Pumm. Cuisses +1"})
	sets.TP.Ragnarok.HighACC = set_combine(sets.TP.Ragnarok.MidACC,{
			head="odyssean helm",
			body="Valorous mail"})

	-- Ragnarok(Restraint) TP Sets --
	sets.TP.Ragnarok.Restraint = set_combine(sets.TP.Ragnarok,{
			main="Ragnarok",
			sub="Duplus Grip",
			ammo="Ginsen",
			head="Boii Mask +1",
			neck="Portus Collar",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Valorous mail",
			hands="boii mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt +1",
			legs="Boii Cuisses +1",
			feet="Boii Calligae +1"})
	sets.TP.Ragnarok.MidACC.Restraint = set_combine(sets.TP.Ragnarok.Restraint,{
			head="odyssean helm",
			neck="Portus collar",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Kentarch Belt +1",
			legs="Pumm. Cuisses +1"})
	sets.TP.Ragnarok.HighACC.Restraint = set_combine(sets.TP.Ragnarok.MidACC.Restraint,{
			body="Valorous mail",
			feet="Acro Leggings"})

	-- Ragnarok(Ionis) TP Sets --
	sets.TP.Ragnarok.Ionis = set_combine(sets.TP.Ragnarok,{
			main="Ragnarok",
			sub="Duplus Grip",
			ammo="Ginsen",
			head="Boii Mask +1",
			neck="Portus Collar",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Valorous mail",
			hands="Xaddi gauntlets",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt +1",
			legs="Agoge Cuisses +1",
			feet="Boii Calligae +1"})
	sets.TP.Ragnarok.MidACC.Ionis = set_combine(sets.TP.Ragnarok.Ionis,{
			head="odyssean helm",
			neck="Portus collar",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Kentarch Belt +1",
			legs="Pumm. Cuisses +1"})
	sets.TP.Ragnarok.HighACC.Ionis = set_combine(sets.TP.Ragnarok.MidACC.Ionis,{
			neck="Iqabi Necklace",
			body="Valorous mail",
			feet="Agoge calligae +1"})

	-- Ragnarok(Restraint + Ionis) TP Sets --
	sets.TP.Ragnarok.Restraint.Ionis = set_combine(sets.TP.Ragnarok.Restraint,{
			main="Ragnarok",
			sub="Duplus Grip",
			ammo="Ginsen",
			head="Boii Mask +1",
			neck="Portus Collar",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Valorous mail",
			hands="boii mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt +1",
			legs="Agoge Cuisses +1",
			feet="Boii Calligae +1"})
	sets.TP.Ragnarok.MidACC.Restraint.Ionis = set_combine(sets.TP.Ragnarok.Restraint.Ionis,{
			head="odyssean helm",
			neck="Portus collar",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Kentarch Belt +1",
			legs="Pumm. Cuisses +1"})
	sets.TP.Ragnarok.HighACC.Restraint.Ionis = set_combine(sets.TP.Ragnarok.MidACC.Restraint.Ionis,{
			body="Valorous mail",
			feet="Agoge calligae +1"})
	
	sets.TP.Aganoshe = {
			main="Aganoshe",
			sub="Duplus grip",
			ammo="Ginsen",
			head="Boii mask +1",
			neck="Asperity Necklace",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Boii lorica +1",
			hands="Cizin Mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt +1",
			legs="Agoge cuisses +1",
			feet="Boii Calligae +1"}
	sets.TP.Aganoshe.MidACC = set_combine(sets.TP.Aganoshe,{
			hands="Xaddi gauntlets",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Kentarch Belt +1",
			legs="Pummeler's cuisses +1",
			feet="Loyalist sabatons"})
	sets.TP.Aganoshe.HighACC = set_combine(sets.TP.Aganoshe.MidACC,{
			head="odyssean helm",
			neck="Iqabi Necklace",
			ear2="Zennaroi Earring",
			body="Boii lorica +1",
			hands="Acro gauntlets",
			neck="Portus collar",
			ring1="Ramuh ring +1",
			back="Grounded Mantle +1",
			legs="Odyssean cuisses",
			waist="Olseni Belt",
			feet="Founder's greaves"})
			
	sets.TP['Montante +1'] = {
			main="Montante +1",
			sub="Duplus grip",
			ammo="Ginsen",
			head="Boii mask +1",
			neck="Asperity Necklace",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Valorous mail",
			hands="Acro Gauntlets",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt +1",
			legs="Agoge cuisses +1",
			feet="Acro Leggings"}
	sets.TP['Montante +1'].MidACC = set_combine(sets.TP['Montante +1'],{
			hands="Xaddi gauntlets",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Kentarch Belt +1",
			legs="Pummeler's cuisses +1",
			feet="Loyalist sabatons"})
	sets.TP['Montante +1'].HighACC = set_combine(sets.TP['Montante +1'].MidACC,{
			head="odyssean helm",
			neck="Iqabi Necklace",
			ear2="Zennaroi Earring",
			body="Boii lorica +1",
			hands="Acro gauntlets",
			neck="Portus collar",
			ring1="Ramuh ring +1",
			legs="Odyssean cuisses",
			waist="Olseni Belt",
			feet="Founder's greaves"})
	
	-- MS TP Set --
	sets.TP.MS = {
			-- sub="Brave Grip",
			back="Mauler's Mantle",
			feet="Boii Calligae +1"}

	-- Retaliation Set --
	sets.TP.Retaliation = {hands="Pumm. Mufflers +1",feet="Boii Calligae +1"}

	-- AM3 Rancor ON Mantle --
	sets.TP.Rancor = {back="Rancorous Mantle"}

	-- PDT/MDT Sets --
	sets.PDT = {
			ammo="Iron gobbet",
			head="Ighwa cap",
			neck="Loricate torque +1",
			ear1="Genmei Earring",
			ear2="Infused Earring",
			body="Jumalik mail",
			hands="Agoge Mufflers +1",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back="Agema cape",
			waist="Flume belt +1",
			legs="Valorous hose",
			feet="Loyalist sabatons"}

	sets.MDT = set_combine(sets.PDT,{
			ammo="Vanir Battery",
			ear2="Sanare Earring",
			ring1="Shadow Ring",
			back="Engulfer Cape +1"})

	-- Hybrid/Kiting Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			ring1="Patricius Ring",
			waist="Cetl Belt"})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{
			ammo="Ginsen",
			head="odyssean helm",
			body="Valorous mail",
			waist="Kentarch Belt +1",
			legs="Pumm. Cuisses +1",
			feet="loyalist sabatons"})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{
			hands="Buremte Gloves",
			back="Mauler's Mantle"})

	sets.Kiting = set_combine(sets.PDT,{feet="Hermes' Sandals"})

	-- WS Base Set --
	sets.WS = {}

	-- WS Sets --
	sets.WS.Upheaval = {
			ammo="Iron Gobbet",
			head="Boii Mask +1",
			neck="Fotia gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Valorous mail",
			hands="Valorous Mitts",
			ring1="Titan ring +1",
			ring2="Titan Ring +1",
			back="Iximulew cape",
			waist="Fotia Belt",
			legs="Odyssean cuisses",
			feet="Valorous Greaves"}
	sets.WS.Upheaval.MidACC = set_combine(sets.WS.Upheaval,{
			hands="Acro Gauntlets"})
	sets.WS.Upheaval.HighACC = set_combine(sets.WS.Upheaval.MidACC,{
			back="Mauler's Mantle"})

	sets.WS.Resolution = {
			ammo="Seething Bomblet +1",
			head="Boii Mask +1",
			neck="Fotia gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Valorous mail",
			hands="Pumm. mufflers +1",
			ring1="Ifrit Ring +1",
			ring2="Ifrit ring +1",
			back="Mauler's Mantle",
			waist="Fotia Belt",
			legs="Tatenashi haidate +1",
			feet="Acro Leggings"}
	sets.WS.Resolution.MidACC = set_combine(sets.WS.Resolution,{
			hands="Miki. gauntlets",
			legs="Pumm. Cuisses +1"})
	sets.WS.Resolution.HighACC = set_combine(sets.WS.Resolution.MidACC,{
			hands="Xaddi gauntlets"})
			
	sets.WS["Ukko's Fury"] = {
			ammo="Seething Bomblet +1",
			head="Boii Mask +1",
			neck="Fotia gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Odyssean Chestplate",
			hands="Valorous Mitts",
			ring1="Rajas Ring",
			ring2="Pyrosoul Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt",
			legs="Odyssean Cuisses",
			feet="Boii Calligae +1"}
	sets.WS["Ukko's Fury"].MidACC = set_combine(sets.WS["Ukko's Fury"],{
			back="Mauler's Mantle",
			hands="Miki. gauntlets"})
	sets.WS["Ukko's Fury"].HighACC = set_combine(sets.WS["Ukko's Fury"].MidACC,{
			legs="Pumm. Cuisses +1"})

	sets.WS["King's Justice"] = {
			ammo="Seething Bomblet +1",
			head="Boii Mask +1",
			neck="Fotia gorget",
			ear1="Kokou's Earring",
			ear2="Vulcan's Pearl",
			body="Valorous mail",
			hands="Valorous Mitts",
			ring1="Ifrit Ring +1",
			ring2="Ifrit ring +1",
			back="Mauler's Mantle",
			waist="Fotia Belt",
			legs="Tatenashi haidate +1",
			feet="Loyalist sabatons"}
	sets.WS["King's Justice"].MidACC  = set_combine(sets.WS["King's Justice"],{
			legs="Pumm. Cuisses +1"})
	sets.WS["King's Justice"].HighACC = set_combine(sets.WS["King's Justice"].MidACC ,{
			hands="odyssean gauntlets"})
			
	sets.WS["Fell Cleave"] = {
		ammo="Seething Bomblet +1",
		head="Odyssean Helm",
		neck="Fotia gorget",
		ear1="Kokou's Earring",
		ear2="Vulcan's Pearl",
		body="Odyssean Chestplate",
		hands="Valorous Mitts",
		ring1="Rajas Ring",
		ring2="Pyrosoul Ring",
		back="Mauler's Mantle",
		waist="Windbuffet Belt",
		legs="Odyssean Cuisses",
		feet="Odyssean Greaves"}
			
	sets.WS["Metatron Torment"] = {
			ammo="Seething Bomblet +1",
			head="Odyssean Helm",
			neck="Fotia gorget",
			ear1="Kokou's Earring",
			ear2="Vulcan's Pearl",
			body="Odyssean Chestplate",
			hands="Valorous Mitts",
			ring1="Rajas Ring",
			ring2="Pyrosoul Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt",
			legs="Odyssean Cuisses",
			feet="Odyssean Greaves"}
	
	sets.WS["Scourge"] = {
			ammo="Seething Bomblet +1",
			head="Boii Mask +1",
			neck="Fotia gorget",
			ear1="Kokou's Earring",
			ear2="Brutal Earring",
			body="Phorcys korazin",
			hands="Agoge mufflers +1",
			ring1="spiral Ring",
			ring2="Ifrit ring +1",
			back="Mauler's Mantle",
			waist="Fotia Belt",
			legs="Agoge Cuisses +1",
			feet="Acro Leggings"}

	-- MS WS Set --
	sets.MS_WS = {
			-- body="Kirin's Osode",
			back="Mauler's Mantle",
			-- legs="Byakko's Haidate",
			feet="Boii Calligae +1"}

	-- JA Sets --
	sets.JA = {}
	sets.JA.Berserk = {body="Pummeler's Lorica",feet="Agoge Calligae +1"}
	sets.JA.Aggressor = {head="Pumm. Mask +1",body="Agoge Lorica"}
	sets.JA["Blood Rage"] = {body="Boii lorica +1"}
	sets.JA.Warcry = {head="Agoge Mask"}
	sets.JA.Tomahawk = {ammo="Thr. Tomahawk",feet="Agoge Calligae +1"}
	sets.JA["Mighty Strikes"] = {hands="Agoge Mufflers +1"}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatiens",
			head="Cizin Helm",
			ear1="Loquac. Earring",
			ring1="Prolix Ring",
			ring2="Veneficium Ring"}

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{
			hands="Agoge Mufflers +1"})
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		cancel_spell()
		send_command('ThirdEye')
	elseif spell.english == "Meditate" and player.tp > 2900 then -- Cancel Meditate If TP Is Above 290 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
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
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if buffactive["Mighty Strikes"] then -- Equip MS_WS Set When You Have Mighty Strikes On --
				equipSet = set_combine(equipSet,sets.MS_WS)
			end
			if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
             equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
			end
			if spell.english == "Ukko's Fury" and (world.day_element == 'Thunder' or world.day_element == 'Wind' or world.day_element == 'Fire' or world.day_element == 'Light') and Mekira == 'ON' then -- Equip Mekira-oto +1 On Lightningday or Windsday or Earthsday --
					equipSet = set_combine(equipSet,{head="Gavialis Helm"})
			end
			if spell.english == "Upheaval" and world.day_element == 'Dark' then -- Equip Shadow Mantle On Darksday For Upheaval --
				equipSet = set_combine(equipSet,{back="Shadow Mantle"})
			end
			if spell.english == "Upheaval" and (world.day_element == 'Dark' or world.day_element == 'Fire' or world.day_element == 'Light') and Mekira == 'ON' then -- Equip Mekira-oto +1 On Lightningday or Windsday or Earthsday --
					equipSet = set_combine(equipSet,{head="Gavialis Helm"})
			end
			if spell.english == "King's Justice" and (world.day_element == 'Thunder' or world.day_element == 'Wind' or world.day_element == 'Earth') and Mekira == 'ON' then -- Equip Mekira-oto +1 On Lightningday or Windsday or Earthsday --
					equipSet = set_combine(equipSet,{head="Gavialis Helm"})
			end
			if spell.english == "Resolution" and (world.day_element == 'Thunder' or world.day_element == 'Wind' or world.day_element == 'Earth') and Mekira == 'ON' then -- Equip Mekira-oto +1 On Lightningday or Windsday or Earthsday --
					equipSet = set_combine(equipSet,{head="Gavialis Helm"})
			end
			if player.tp > 2999 or buffactive.Sekkanoki then -- Equip Kokou's Earring When You Have 300 TP or Sekkanoki --
				equipSet = set_combine(equipSet,{ear1="Kokou's Earring"})
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		if string.find(spell.english,'Utsusemi') then -- Cancel Utsusemi If You Have 3+ Shadows Up --
			if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
				cancel_spell()
				add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
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
	if Twilight == 1 then
		equip(sets.Twilight)
	end
end

function midcast(spell,action)
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		if string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then -- Cancel Copy Image 1 & 2 For Utsusemi: Ichi --
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Monomi: Ichi' then -- Cancel Sneak --
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
	if spell.type == "WeaponSkill" and not spell.interrupted then
		send_command('wait 0.2;gs c TP')
	elseif spell.english == "Blood Rage" and not spell.interrupted then -- Blood Rage Timer/Countdown --
		timer_blood_rage()
		send_command('wait 50;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
	elseif spell.english == "Tomahawk" and not spell.interrupted then -- Tomahawk Timer/Countdown --
		timer_tomahawk()
		send_command('wait 80;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;timers delete "Tomahawk";input /p '..spell.name..': [OFF]')
	end
	status_change(player.status)
end

function status_change(new,old)
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif Armor == 'Kiting' then
		equip(sets.Kiting)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[player.equipment.main] then
			equipSet = equipSet[player.equipment.main]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive["Aftermath: Lv.3"] and equipSet["AM3"] then
			if Rancor == 'ON' then -- Default Rancor Toggle Is Rancorous Mantle --
				equipSet = set_combine(equipSet["AM3"],sets.TP.Rancor)
			else -- Use Rancor Toggle For Bleating Mantle --
				equipSet = equipSet["AM3"]
			end
		end
		if buffactive.Aftermath and equipSet["AM"] then
			equipSet = equipSet["AM"]
		end
		if buffactive.Restraint and equipSet["Restraint"] then -- Restraint TP Set --
			equipSet = equipSet["Restraint"]
		end
		if buffactive.Ionis and equipSet["Ionis"] then -- Ionis TP Set --
			equipSet = equipSet["Ionis"]
		end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
             equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
		end
		if buffactive["Mighty Strikes"] then -- Mighty Strikes TP Set --
			equipSet = set_combine(equipSet,sets.TP.MS)
		end
		if buffactive.Retaliation and Retaliation == 'ON' then -- Use Retaliation Toggle For Retaliation TP Set --
			equipSet = set_combine(equipSet,sets.TP.Retaliation)
		end
		equip(equipSet)
	else
		equip(sets.Idle[IdleArray[IdleIndex]])
	end
	if buffactive.doom then -- Lock Twilight When You Are Doomed --
		equip(sets.Twilight)
		disable('head','body')
	end
	if Twilight == 1 then
		equip(sets.Twilight)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "doom" and not gain then
		enable('head','body')
	elseif buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 120;input /echo Aftermath: Lv.3 [WEARING OFF IN 60 SEC.];wait 30;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 20;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == "blood rage" and not gain then
		send_command('timers delete "Blood Rage"')
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if buff == "sleep" and gain and player.hp > 200 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 200+ HP --
		equip({neck="Berserker's Torque"})
	else
		if not midaction() then
			status_change(player.status)
		end
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
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
	elseif command == 'C12' then -- Kiting Toggle --
		if Armor == 'Kiting' then
			Armor = 'None'
			add_to_chat(123,'Kiting Set: [Unlocked]')
		else
			Armor = 'Kiting'
			add_to_chat(158,'Kiting Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- Retaliation Toggle --
		if Retaliation == 'ON' then
			Retaliation = 'OFF'
			add_to_chat(123,'Retaliation Set: [Unlocked]')
		else
			Retaliation = 'ON'
			add_to_chat(158,'Retaliation Set: [Locked]')
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
	elseif command == 'C11' then -- Hct. Mittens +1 Toggle --
		if BloodRage == 'ON' then
			BloodRage = 'OFF'
			add_to_chat(123,'Hct. Mittens +1: [OFF]')
		else
			BloodRage = 'ON'
			add_to_chat(158,'Hct. Mittens +1: [ON]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Twilight Toggle --
		if Twilight == 1 then
			Twilight = 0
			add_to_chat(123,'Twilight Set: [Unlocked]')
		else
			Twilight = 1
			add_to_chat(158,'Twilight Set: [locked]')
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
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
		status_change(player.status)
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function timer_blood_rage()
	local duration = 60
	send_command('timers create "Blood Rage" '..tostring(duration)..' down')
end

function timer_tomahawk()
	local duration = 90
	send_command('timers create "Tomahawk" '..tostring(duration)..' down')
end