-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.
function user_setup()
  state.OffenseMode:options('Normal', 'Acc')
  state.WeaponskillMode:options('Normal', 'Acc')
  state.IdleMode:options('Normal', 'Refresh')

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
    main = "Upukirex",
    sub = "Pole Grip",
    ammo = "Ginsen",
    head = "Sulevia's Mask +1",
    neck = "Twilight Torque",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Sulevia's Platemail +1",
    hands = "Sulevia's Gauntlets +1",
    ring1 = "Defending Ring",
    ring2 = "Petrov Ring",
    back = "Repulse Mantle",
    waist = "Flume Belt +1",
    legs = "Carmine Cuisses",
    feet = "Sulevia's Leggings +1",
  }

  sets.idle.Refresh = set_combine(sets.idle, {
    body = "Ares' Cuirass +1",
  })

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
    ammo = "Ginsen",
    head = "Otomi Helm",
    neck = "Asperity Necklace",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Xaddi Mail",
    hands = "Flamma Manopolas +1",
    ring1 = "K'ayres Ring",
    ring2 = "Petrov Ring",
    back = "Atheling Mantle",
    waist = "Windbuffet Belt +1",
    legs = "Cizin Breeches +1",
    feet = "Whirlpool Greaves",
  }

  sets.engaged.Acc = set_combine(sets.engaged, {
    head = "Flamma Zucchetto +1",
    neck = "Maskirova Torque",
    body = "Flamma Korazin +1",
    back = "Updraft Mantle",
    waist = "Kentarch Belt",
    legs = "Flamma Dirs +1",
    feet = "Flamma Gambieras +1",
  })


  -- Precast Sets
  -- Precast sets to enhance JAs
  sets.precast.JA.Jump = set_combine(sets.engaged, {
    body = "Vishap Mail",
    legs = "Sulevia's Cuisses +1",
    feet = "Vishap Greaves +1",
  })

  sets.precast.JA['High Jump'] = set_combine(sets.engaged, {
    body = "Vishap Mail",
    legs = "Vishap Brais +1",
    feet = "Sulevia's Leggings +1",
  })

  sets.precast.JA['Spirit Jump'] = set_combine(sets.engaged, {
    legs = "Peltast's Cuissots",
    feet = "Lancer's Schynbalds +2",
  })

  sets.precast.JA['Soul Jump'] = set_combine(sets.engaged, {
    legs = "Peltast's Cuissots",
    feet = "Sulevia's Leggings +1",
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


  -- Precast Sets
  -- Fast Cast set
  sets.precast.FC = {
    head = "Cizin Helm +1",
    neck = "Baetyl Pendant",
    ear2 = "Loquacious Earring",
    ring1 = "Weatherspoon Ring",
    legs = "Homam Cosciales",
  }


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    ammo = "Thew Bomblet",
    head = "Otomi Helm",
    neck = gear.ElementalGorget,
    ear1 = "Brutal Earring",
    ear2 = "Moonshade Earring",
    body = "Sulevia's Platemail +1",
    hands = "Sulevia's Gauntlets +1",
    ring1 = "Ifrit Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = gear.ElementalBelt,
    legs = "Sulevia's Cuisses +1",
    feet = "Sulevia's Leggings +1",
  }

  sets.precast.WS.Acc = set_combine(sets.precast.WS, {
    head = "Flamma Zucchetto +1",
    ammo = "Ginsen",
    neck = "Maskirova Torque",
    body = "Flamma Korazin +1",
    waist = "Kentarch Belt",
    back = "Updraft Mantle",
  })

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

  -- Stardiver has a STR: 86~100% modifier.
  sets.precast.WS.Stardiver = set_combine(sets.precast.WS, {})
  sets.precast.WS.Stardiver.Acc = set_combine(sets.precast.WS.Acc, {})

  -- Camlann's Torment has STR: 60% and VIT: 60% modifiers and is aligned with
  -- the Light, Breeze, and Thunder gorgets/belts.
  sets.precast.WS["Camlann's Torment"] = set_combine(sets.precast.WS, {})

  -- Sonic Thrust has STR: 40% and DEX 40% modifiers and is aligned with the
  -- Light and Soil gorgets/belts.
  sets.precast.WS['Sonic Thrust'] = set_combine(sets.precast.WS, {})
  sets.precast.WS['Sonic Thrust'].Acc = set_combine(sets.precast.WS.Acc, {})

  -- Drakesbane has a STR: 50% modifier and is aligned with the Flame and Light
  -- gorgets/belts.
  sets.precast.WS.Drakesbane = set_combine(sets.precast.WS, {
    hands = "Flamma Manopolas +1",
  })
  sets.precast.WS.Drakesbane.Acc = set_combine(sets.precast.WS.Acc, {
    hands = "Flamma Manopolas +1",
  })


  -- Healing Breath sets
  sets.precast.HealingBreath = {
    ammo = "Thew Bomblet",
    head = "Vishap Armet +1",
    ear1 = "Loquacious Earring",
    ear2 = "Ethereal Earring",
    neck = "Cougar Pendant",
    body = "Flamma Korazin",
    hands = "Flamma Manopolas +1",
    legs = "Vishap Brais +1",
    feet = "Homam Gambieras",
  }

  sets.midcast.HealingBreath = {
    head = "Pteroslaver Armet",
    neck = "Lancer's Torque",
    back = "Updraft Mantle",
    legs = "Vishap Brais +1",
    feet = "Homam Gambieras",
  }

  -- Elemental Breath set
  sets.midcast.ElementalBreath = {
    head = "Pteroslaver Armet",
    neck = "Lancer's Torque",
  }


  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {}


  -- Defense sets
  sets.defense.PDT = {
    head = "Sulevia's Mask +1",
    neck = "Twilight Torque",
    body = "Sulevia's Platemail +1",
    hands = "Sulevia's Gauntlets +1",
    ring1 = "Defending Ring",
    back = "Repulse Mantle",
    waist = "Flume Belt +1",
    legs = "Sulevia's Cuisses +1",
    feet = "Sulevia's Leggings +1",
  }

  sets.defense.MDT = {
    head = "Sulevia's Mask +1",
    neck = "Twilight Torque",
    body = "Sulevia's Platemail +1",
    hands = "Sulevia's Gauntlets +1",
    ring1 = "Defending Ring",
    legs = "Sulevia's Cuisses +1",
    feet = "Sulevia's Leggings +1",
  }

  sets.Kiting = {
    head = "Sulevia's Mask +1",
    neck = "Twilight Torque",
    body = "Sulevia's Platemail +1",
    hands = "Sulevia's Gauntlets +1",
    ring1 = "Defending Ring",
    back = "Repulse Mantle",
    waist = "Flume Belt +1",
    legs = "Carmine Cuisses",
    feet = "Sulevia's Leggings +1",
  }
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

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
