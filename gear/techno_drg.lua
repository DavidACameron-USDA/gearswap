-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.
function user_setup()
  state.OffenseMode:options('Normal', 'Acc')
  state.WeaponskillMode:options('Normal', 'Acc')

  update_combat_form()

  -- Additional local binds

  select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()

end


-- Define sets and vars used by this job file.
function init_gear_sets()
  --------------------------------------
  -- Start defining the sets
  --------------------------------------

  -- Idle sets
  sets.idle = {
    main = "Olyndicus",
    sub = "Pole Grip",
    ammo = "Thew Bomblet",
    head = "Vishap Armet +1",
    neck = "Asperity Necklace",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Xaddi Mail",
    hands = "Cizin Mufflers +1",
    ring1 = "Tyrant's Ring",
    ring2 = "Rajas Ring",
    back = "Repulse Mantle",
    waist = "Flume Belt +1",
    legs = "Crimson Cuisses",
    feet = "Whirlpool Greaves",
  }

  sets.idle.Refresh = {
    body = "Ares' Cuirass",
  }

  -- sets.idle.Town = {}

  -- sets.idle.Field = {}

  -- sets.idle.Weak = {}


  -- Engaged sets

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will
  -- fall back on previous sets if more refined versions aren't defined. If
  -- you create a set with both offense and defense modes, the offense mode
  -- should be first, e.g. sets.engaged.Dagger.Accuracy.Evasion.

  -- Normal melee group
  sets.engaged = {
    ammo = "Thew Bomblet",
    head = "Vishap Armet +1",
    neck = "Asperity Necklace",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Xaddi Mail",
    hands = "Cizin Mufflers +1",
    ring1 = "Tyrant's Ring",
    ring2 = "Rajas Ring",
    back = "Atheling Mantle",
    waist = "Cetl Belt",
    legs = "Vishap Brais +1",
    feet = "Whirlpool Greaves",
  }

  sets.engaged.Acc = set_combine(sets.engaged, {
    neck = "Love Torque",
    back = "Cuchulain's Mantle",
    waist = "Wyrm Belt",
  })

  sets.engaged.Refresh = {
    body = "Xaddi Mail",
    legs = "Vishap Brais +1",
  }


  -- Precast Sets
  -- Precast sets to enhance JAs
  sets.precast.JA.Jump = set_combine(sets.engaged, {
    body = "Vishap Mail",
    waist = "Windbuffet Belt",
    feet = "Vishap Greaves +1",
  })

  sets.precast.JA['High Jump'] = set_combine(sets.engaged, {
    body = "Vishap Mail",
    waist = "Windbuffet Belt",
    legs = "Vishap Brais +1",
  })

  sets.precast.JA['Spirit Jump'] = set_combine(sets.engaged, {
    legs = "Lancer's Cuissots +1",
    waist = "Windbuffet Belt",
  })

  sets.precast.JA['Soul Jump'] = set_combine(sets.engaged, {
    legs = "Lancer's Cuissots +1",
    waist = "Windbuffet Belt",
  })

  sets.precast.JA['Spirit Link'] = {
    head = "Vishap Armet +1",
  }

  sets.precast.JA['Ancient Circle'] = {
    legs = "Vishap Brais +1",
  }

  sets.precast.JA.Angon = {
    ammo = "Angon",
    hands = "Wyrm Finger Gauntlets +2",
  }

  -- Steady Wing's potency is improved by +Wyvern HP gear.
  sets.precast.JA['Steady Wing'] = {
    legs = "Vishap Brais +1",
    feet = "Homam Gambieras",
  }

  -- Waltz set (chr and vit)
  sets.precast.Waltz = {
    ammo="Sonia's Plectrum",
  }

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    ammo = "Thew Bomblet",
    head = "Vishap Armet +1",
    neck = "Lancer's Torque",
    ear1 = "Brutal Earring",
    ear2 = "Kemas Earring",
    body = "Xaddi Mail",
    hands = "Cizin Mufflers +1",
    ring1 = "Flame Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Warwolf Belt",
    legs = "Vishap Brais +1",
    feet = "Vishap Greaves +1",
  }

  sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

  -- Stardiver has a STR: 86~100% modifier and is aligned with the Shadow, Soil,
  -- and Light gorgets/belts.
  sets.precast.WS.Stardiver = set_combine(sets.precast.WS, {
    neck = "Shadow Gorget",
  })

  sets.precast.WS.Stardiver.Acc = set_combine(sets.precast.WS.Acc, {
    neck = "Shadow Gorget",
  })

  -- Sonic Thrust has STR: 40% and DEX 40% modifiers and is aligned with the
  -- Light and Soil gorgets/belts.
  sets.precast.WS['Sonic Thrust'] = set_combine(sets.precast.WS, {
    neck = "Kubira Bead Necklace",
  })

  sets.precast.WS['Sonic Thrust'].Acc = set_combine(sets.precast.WS.Acc, {})

  -- Drakesbane has a STR: 50% modifier and is aligned with the Flame and Light
  -- gorgets/belts.
  -- sets.precast.WS.Drakesbane = set_combine(sets.precast.WS, {})

  -- sets.precast.WS.Drakesbane.Acc = set_combine(sets.precast.WS.Acc, {})


  -- Healing Breath sets
  sets.precast.HealingBreath = {
    ammo = "Thew Bomblet",
    head = "Vishap Armet +1",
    ear1 = "Loquacious Earring",
    ear2 = "Ethereal Earring",
    neck = "Cougar Pendant",
    body = "Xaddi Mail",
    hands = "Cizin Mufflers +1",
    legs = "Vishap Brais +1",
    feet = "Homam Gambieras",
  }

  sets.midcast.HealingBreath = {
    head = "Wyrm Armet",
    neck = "Lancer's Torque",
    legs = "Vishap Brais +1",
    feet = "Homam Gambieras",
  }

  -- Elemental Breath set
  sets.midcast.ElementalBreath = {
    head = "Wyrm Armet",
    neck = "Lancer's Torque",
  }


  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {}


  -- Defense sets
  sets.defense.PDT = {
    hands = "Cizin Mufflers +1",
    back = "Repulse Mantle",
    waist = "Flume Belt +1",
  }

  sets.defense.MDT = {
    hands = "Cizin Mufflers +1",
  }

  sets.Kiting = {}
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- A list of subjobs for which we would want to equip a Refresh set.
mageSubJobs = S{'WHM', 'BLM', 'RDM', 'BLU', 'SCH'}

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
  if mageSubJobs:contains(player.sub_job) then
    idleSet = set_combine(idleSet, sets.idle.Refresh)
  end
  return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
  if mageSubJobs:contains(player.sub_job) then
    meleeSet = set_combine(meleeSet, sets.engaged.Refresh)
  end
  return meleeSet
end

function update_combat_form()

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
  -- Default macro set/book
  if player.sub_job == 'SAM' then
      set_macro_page(1, 14)
  elseif player.sub_job == 'WAR' then
      set_macro_page(2, 14)
  elseif player.sub_job == 'BLU' then
      set_macro_page(3, 14)
  elseif player.sub_job == 'BLM' then
      set_macro_page(4, 14)
  elseif player.sub_job == 'RDM' then
      set_macro_page(5, 14)
  elseif player.sub_job == 'WHM' then
      set_macro_page(5, 14)
  elseif player.sub_job == 'NIN' then
      set_macro_page(6, 14)
  end
end
