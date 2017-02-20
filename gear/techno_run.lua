--------------------------------------------------------------------------------
-- User setup functions for this job.
--------------------------------------------------------------------------------

function user_setup()
  state.OffenseMode:options('Normal', 'DD', 'Acc', 'PDT', 'MDT')
  state.WeaponskillMode:options('Normal', 'Acc')
  state.PhysicalDefenseMode:options('PDT')
  state.IdleMode:options('Regen', 'Refresh')

	select_default_macro_book()
end


function init_gear_sets()
  sets.enmity = {
    neck = "Warder's Charm",
    ring2 = "Petrov Ring",
    back = "Evasionist's Cape",
    waist = "Warwolf Belt",
  }

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
  sets.precast.JA['Vallation'] = {}

  sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']

  sets.precast.JA['Pflug'] = {}

  sets.precast.JA['Battuta'] = {}

  sets.precast.JA['Liement'] = {}

  sets.precast.JA['Lunge'] = {
    neck = "Baetyl Pendant",
    ear1 = "Friomisi Earring",
    ear2 = "Hecate's Earring",
    body = "Rawhide Vest",
    back = "Argochampsa Mantle",
    waist = "Yamabuki-no-Obi",
    feet = "Herculean Boots",
  }

  sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

  sets.precast.JA['Gambit'] = {}

  sets.precast.JA['Rayke'] = {}

  sets.precast.JA['Elemental Sforzo'] = {}

  sets.precast.JA['Swordplay'] = {}

  sets.precast.JA['Embolden'] = {
    back = "Evasionist's Cape",
  }

  -- Vivacious Pulse is enhanced by Divine Magic skill.
  sets.precast.JA['Vivacious Pulse'] = {
    neck = "Incanter's Torque",
  }

  sets.precast.JA['One For All'] = {}

  sets.precast.JA['Provoke'] = sets.enmity


	-- Fast cast sets for spells
  sets.precast.FC = {
    ear2 = "Loquacious Earring",
    neck = "Baetyl Pendant",
    ring1 = "Weatherspoon Ring",
    legs = "Rawhide Trousers",
  }

  sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
    waist = "Siegel Sash",
  })

  sets.precast.FC['Utsusemi: Ichi'] = set_combine(sets.precast.FC, {
    neck = "Magoraga Beads",
  })

  sets.precast.FC['Utsusemi: Ni'] = sets.precast.FC['Utsusemi: Ichi']


	-- Weaponskill sets

  -- Resolution has a STR 73~85% modifier and is aligned with the Breeze,
  -- Thunder, and Soil gorgets/belts.
  sets.precast.WS['Resolution'] = {
    ammo = "Aqreqaq Bomblet",
    head = "Adhemar Bonnet",
    neck = gear.ElementalGorget,
    ear1 = "Brutal Earring",
    ear2 = "Moonshade Earring",
    body = "Rawhide Vest",
    hands = "Herculean Gloves",
    ring1 = "Epona's Ring",
    ring2 = "Ifrit's Ring",
    back = "Atheling Mantle",
    waist = gear.ElementalBelt,
    legs = "Taeon Tights",
    feet = "Herculean Boots",
  }

  sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'].Normal, {
    ammo = "Honed Tathlum",
    head = "Ayanmo Zucchetto",
    body = "Ayanmo Corazza",
    hands = "Ayanmo Manopolas +1",
    ring1 = "Rufescent Ring",
    waist = "Kentarch Belt",
    legs = "Ayanmo Cosciales",
    feet = "Ayanmo Gambieras +1",
  })

  -- Dimidation has a DEX 80% modifier and is aligned with the Thunder and
  -- Breeze gorgets/belts.
  sets.precast.WS['Dimidiation'] = {
    ammo = "Jukukik Feather",
    head = "Adhemar Bonnet",
    neck = gear.ElementalGorget,
    ear1 = "Brutal Earring",
    ear2 = "Moonshade Earring",
    body = "Rawhide Vest",
    hands = "Herculean Gloves",
    ring1 = "Epona's Ring",
    ring2 = "Ramuh Ring",
    back = "Atheling Mantle",
    waist = gear.ElementalBelt,
    legs = "Taeon Tights",
    feet = "Herculean Boots",
  }

  sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS['Dimidiation'].Normal, {
    ammo = "Honed Tathlum",
    head = "Ayanmo Zucchetto",
    body = "Ayanmo Corazza",
    hands = "Ayanmo Manopolas +1",
    ring1 = "Rufescent Ring",
    waist = "Kentarch Belt",
    legs = "Ayanmo Cosciales",
    feet = "Ayanmo Gambieras +1",
  })

  -- Herculean Slash has a VIT 80% modifier, is magical and therefore modified
  -- by MAB, and is aligned with the Thunder, Breeze, and Snow gorgets/belts.
  sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})


	--------------------------------------
	-- Midcast sets
	--------------------------------------

  sets.midcast.FastRecast = {}

  sets.midcast['Enhancing Magic'] = {
    neck = "Incanter's Torque",
    legs = "Carmine Cuisses",
  }

  sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {})

  sets.midcast['Regen'] = {}

  sets.midcast['Stoneskin'] = {
    waist = "Siegel Sash",
  }

  sets.midcast.Cure = {
    neck = "Incanter's Torque",
    back = "Solemnity Cape",
    legs = "Carmine Cuisses",
  }

  sets.midcast.Flash = sets.enmity

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

  sets.idle = {
    main = "Montante",
    sub = "Refined Grip +1",
    ammo = "Ginsen",
    head = "Ayanmo Zucchetto",
    neck = "Twilight Torque",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Ayanmo Corazza",
    hands = "Ayanmo Manopolas +1",
    ring1 = "Defending Ring",
    ring2 = "Petrov Ring",
    back = "Solemnity Cape",
    waist = "Flume Belt +1",
    legs = "Carmine Cuisses",
    feet = "Ayanmo Gambieras +1",
  }

  sets.idle.Refresh = set_combine(sets.idle, {
    legs = "Rawhide Trousers",
  })

	sets.defense.PDT = {}

	sets.defense.MDT = {}

	sets.Kiting = {}


	--------------------------------------
	-- Engaged sets
	--------------------------------------

  sets.engaged = {
  }

  sets.engaged.DD = {
    sub = "Bloodrain Strap",
    ammo = "Ginsen",
    head = "Adhemar Bonnet",
    neck = "Asperity Necklace",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Rawhide Vest",
    hands = "Herculean Gloves",
    ring1 = "Epona's Ring",
    ring2 = "Petrov Ring",
    back = "Atheling Mantle",
    waist = "Windbuffet Belt +1",
    legs = "Taeon Tights",
    feet = "Herculean Boots",
  }

  sets.engaged.Acc = set_combine(sets.engaged.DD, {
    head = "Ayanmo Zucchetto",
    neck = "Sanctity Necklace",
    body = "Ayanmo Corazza",
    hands = "Ayanmo Manopolas +1",
    waist = "Kentarch Belt",
    legs = "Ayanmo Cosciales",
    feet = "Ayanmo Gambieras +1",
  })

  sets.engaged.PDT = {
    sub = "Refined Grip +1",
    head = "Ayanmo Zucchetto",
    neck = "Twilight Torque",
    body = "Ayanmo Corazza",
    hands = "Ayanmo Manopolas +1",
    ring1 = "Defending Ring",
    back = "Evasionist's Cape",
    waist = "Flume Belt +1",
    feet = "Ayanmo Gambieras +1",
  }

  sets.engaged.MDT = {
    sub = "Refined Grip +1",
    head = "Ayanmo Zucchetto",
    neck = "Twilight Torque",
    body = "Ayanmo Corazza",
    hands = "Ayanmo Manopolas +1",
    ring1 = "Defending Ring",
    back = "Solemnity Cape",
    waist = "Flume Belt +1",
    feet = "Ayanmo Gambieras +1",
  }

end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'BLU' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'NIN' then
		set_macro_page(2, 10)
	elseif player.sub_job == 'SAM' then
		set_macro_page(3, 10)
	elseif player.sub_job == 'WAR' then
		set_macro_page(4, 10)
	else
		set_macro_page(1, 10)
	end
end

