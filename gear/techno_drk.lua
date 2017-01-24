-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
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

  -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
  sets.idle = {
    main = "Mekosuchus Blade",
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

  sets.idle.Refresh = {
    neck = "Parade Gorget",
    body = "Ares' Cuirass +1",
  }

  -- sets.idle.Town = {}

  -- sets.idle.Field = {}

  -- sets.idle.Weak = {}

  sets.idle.PDT = set_combine(sets.idle, {
    head = "Sulevia's Mask +1",
    body = "Sulevia's Platemail +1",
    hands = "Sulevia's Gauntlets +1",
    ring1 = "Defending Ring",
    back = "Repulse Mantle",
    waist = "Flume Belt +1",
    legs = "Sulevia's Cuisses +1",
    feet = "Sulevia's Leggings +1",
  })


  -- Engaged sets

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion

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
    neck = "Justice Torque",
    body = "Flamma Korazin +1",
    waist = "Kentarch Belt",
    legs = "Flamma Dirs +1",
    feet = "Flamma Gambieras +1",
  })


  -- Precast Sets
  -- Fast Cast set
  sets.precast.FC = {
    head = "Cizin Helm +1",
    neck = "Baetyl Pendant",
    ear2 = "Loquacious Earring",
    ring1 = "Weatherspoon Ring",
    legs = "Homam Cosciales",
  }


  -- Precast sets to enhance JAs
  sets.precast.JA.Souleater = {
    feet = "Chaos Burgeonet",
  }

  sets.precast.JA['Arcane Circle'] = {
    feet = "Chaos Sollerets",
  }

  sets.precast.JA['Last Resort'] = {}

  sets.precast.JA['Weapon Bash'] = {
    feet = "Chaos Gauntlets",
  }

  sets.precast.JA['Nether Void'] = {}


  -- Waltz set (CHR and VIT)
  sets.precast.Waltz = {
    ammo="Sonia's Plectrum",
  }

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    ammo = "Aqreqaq Bomblet",
    head = "Otomi Helm",
    neck = gear.ElementalGorget,
    ear1 = "Brutal Earring",
    ear2 = "Moonshade Earring",
    body = "Sulevia's Platemail +1",
    hands = "Sulevia's Gauntlets +1",
    ring1 = "Ifrit Ring",
    ring2 = "Rajas Ring",
    back = "Niht Mantle",
    waist = gear.ElementalBelt,
    legs = "Sulevia's Cuisses +1",
    feet = "Sulevia's Leggings +1",
  }

  sets.precast.WS.Acc = set_combine(sets.precast.WS, {
    head = "Flamma Zucchetto +1",
    ammo = "Ginsen",
    body = "Flamma Korazin +1",
    waist = "Kentarch Belt",
  })

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

  -- Guillotine has STR: 25% and MND 25% modifiers and is aligned with the Snow
  -- gorgets/belts.
  sets.precast.WS.Guillotine = set_combine(sets.precast.WS, {})
  sets.precast.WS.Guillotine.Acc = set_combine(sets.precast.WS.Acc, {})

  -- Cross Reaper has STR: 30% and MND 30% modifiers and is aligned with the
  -- Aqua and Snow gorgets/belts.
  sets.precast.WS['Cross Reaper'] = set_combine(sets.precast.WS, {})
  sets.precast.WS['Cross Reaper'].Acc = set_combine(sets.precast.WS.Acc, {})

  -- Spiral Hell has STR: 50% and INT 50% modifiers and is aligned with the
  -- Aqua, Snow, and Soil gorgets/belts.
  sets.precast.WS['Spiral Hell'] = set_combine(sets.precast.WS, {})
  sets.precast.WS['Spiral Hell'].Acc = set_combine(sets.precast.WS.Acc, {})

  -- Insurgency has STR: 20% and INT 20% modifiers and is aligned with the
  -- Flame, Light, and Shadow gorgets/belts.
  sets.precast.WS.Insurgency = set_combine(sets.precast.WS, {})
  sets.precast.WS.Insurgency.Acc = set_combine(sets.precast.WS.Acc, {})


  -- Midcast sets
  sets.midcast['Dark Magic'] = {
    ammo = "Sturm's Report",
    head = "Chaos Burgeonet",
    neck = "Aesir Torque",
    hands = "Crimson Finger Gauntlets",
    ring1 = "Omega Ring",
    back = "Niht Mantle",
    waist = gear.ElementalObi,
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
    back = "Repulse Mantle",
    waist = "Flume Belt +1",
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
  if player.sub_job == 'WAR' then
    set_macro_page(1, 8)
  elseif player.sub_job == 'SAM' then
    set_macro_page(2, 8)
  elseif player.sub_job == 'DNC' then
    set_macro_page(3, 8)
  elseif player.sub_job == 'NIN' then
    set_macro_page(4, 8)
  else
    set_macro_page(1, 8)
  end
end
