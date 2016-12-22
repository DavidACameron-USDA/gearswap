-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  state.OffenseMode:options('Normal', 'Acc')
  state.WeaponskillMode:options('Normal', 'Acc')
  state.CastingMode:options('Normal', 'Resistant')
  state.PhysicalDefenseMode:options('PDT', 'HP')
  state.MagicalDefenseMode:options('MDT', 'HP')

  update_defense_mode()

  select_default_macro_book()
end

function user_unload()

end


-- Define sets and vars used by this job file.
function init_gear_sets()
  --------------------------------------
  -- Precast sets
  --------------------------------------

  -- Precast sets to enhance JAs
  sets.precast.JA['Invincible'] = {}
  sets.precast.JA['Holy Circle'] = {}
  sets.precast.JA['Shield Bash'] = {}
  sets.precast.JA['Sentinel'] = {}
  sets.precast.JA['Rampart'] = {}
  sets.precast.JA['Fealty'] = {}
  sets.precast.JA['Divine Emblem'] = {}
  sets.precast.JA['Cover'] = {}

  -- add mnd for Chivalry
  sets.precast.JA['Chivalry'] = {}

  -- Waltz set (chr and vit)
  sets.precast.Waltz = {
    ammo = "Sonia's Plectrum",
  }

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}

  -- Fast cast sets for spells

  sets.precast.FC = {
    head = "Cizin Helm +1",
    neck = "Baetyl Pendant",
    ear2 = "Loquacious Earring",
    ring1 = "Weatherspoon Ring",
  }

  sets.precast.Cure = set_combine(sets.precast.FC, {
    ear1 = "Nourishing Earring",
  })


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    ammo = "Ginsen",
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
    neck = "Fortitude Torque",
    body = "Flamma Korazin +1",
  })

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

  -- Chant du Cygne has a DEX: 80% modifier and is aligned with the Light, Aqua,
  -- and Snow gorgets/belts.
  sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
    hands = "Flamma Manopolas +1",
  })
  sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {
    hands = "Flamma Manopolas +1",
  })

  -- Requiescat has a MND 73~85% modifier and is aligned with the Shadow and
  -- Soil gorgets/belts.
  sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
  sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {})

  -- Sanguine Blade has STR 30% and MND 50% modifiers and isn't aligned with any
  -- element.
  sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {})

  -- Atonement damage is based on enmity and is aligned with the Light, Aqua,
  -- and Flame gorgets/belts.
  sets.precast.WS['Atonement'] = {}
  sets.precast.WS['Atonement'].Acc = {}

  -- Savage Blade has STR: 50% and MND 50% modifiers and is aligned with the
  -- Breeze, Thunder, and Soil gorgets/belts.
  sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {})
  sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {})


  --------------------------------------
  -- Midcast sets
  --------------------------------------

  sets.midcast.FastRecast = {
    head = "Cizin Helm +1",
    ear2 = "Loquacious Earring",
    body = "Xaddi Mail",
    hands = "Flamma Manopolas +1",
    waist = "Cetl Belt",
    legs = "Cizin Breeches +1",
    feet = "Whirlpool Greaves",
  }

  sets.midcast.Enmity = {
    head = "Cizin Helm +1",
    hands = "Cizin Mufflers +1",
    ring2 = "Apeile Ring",
  }

  sets.midcast.Flash = set_combine(sets.midcast.Enmity, {})

  sets.midcast.Cure = {
    ear1 = "Nourishing Earring",
  }

  sets.midcast['Enhancing Magic'] = {}
  sets.midcast.Protect = {}
  sets.midcast.Shell = {}

  --------------------------------------
  -- Idle/resting/defense/etc sets
  --------------------------------------

  sets.resting = {}

  -- Idle sets
  sets.idle = {
    main = "Nibiru Blade",
    sub = "Svalinn",
    ammo = "Ginsen",
    head = "Sulevia's Mask +1",
    neck = "Twilight Torque",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Sulevia's Platemail +1",
    hands = "Sulevia's Gauntlets +1",
    ring1 = "Defending Ring",
    ring2 = "Apeile Ring",
    back = "Repulse Mantle",
    waist = "Flume Belt +1",
    legs = "Crimson Cuisses",
    feet = "Sulevia's Leggings +1",
  }

  -- sets.idle.Town = {}

  -- sets.idle.Weak = {}


  --------------------------------------
  -- Defense sets
  --------------------------------------

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
  sets.defense.HP = {}
  -- To cap MDT with Shell IV (52/256), need 76/256 in gear.
  -- Shellra V can provide 75/256, which would need another 53/256 in gear.
  sets.defense.MDT = {
    head = "Sulevia's Mask +1",
    neck = "Twilight Torque",
    body = "Sulevia's Platemail +1",
    hands = "Sulevia's Gauntlets +1",
    ring1 = "Defending Ring",
    legs = "Sulevia's Cuisses +1",
    feet = "Sulevia's Leggings +1",
  }


  --------------------------------------
  -- Engaged sets
  --------------------------------------

  sets.engaged = {
    ammo = "Ginsen",
    head = "Otomi Helm",
    neck = "Asperity Necklace",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Xaddi Mail",
    hands = "Flamma Manopolas +1",
    ring1 = "K'ayres Ring",
    ring2 = "Apeile Ring",
    back = "Atheling Mantle",
    waist = "Windbuffet Belt +1",
    legs = "Cizin Breeches +1",
    feet = "Whirlpool Greaves",
  }

  sets.engaged.Acc = set_combine(sets.engaged, {
    head = "Flamma Zucchetto +1",
    neck = "Fortitude Torque",
    body = "Flamma Korazin +1",
    hands = "Flamma Manopolas +1",
    legs = "Flamma Dirs +1",
    feet = "Flamma Gambieras +1",
  })

  sets.engaged.DW = set_combine(sets.engaged, {
    ear1 = "Dudgeon Earring",
    ear2 = "Heartseeker Earring",
  })

  sets.engaged.DW.Acc = set_combine(sets.engaged.Acc, {
    ear1 = "Dudgeon Earring",
    ear2 = "Heartseeker Earring",
  })

  sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
  sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)

  sets.engaged.DW.PDT = set_combine(sets.engaged.DW, sets.defense.PDT)
  sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc, sets.defense.PDT)


  --------------------------------------
  -- Custom buff sets
  --------------------------------------

  sets.buff.Sentinel = {}
  sets.buff.Cover = {}
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_defense_mode()
  if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
    if player.equipment.sub and not player.equipment.sub:contains('Shield') and
      player.equipment.sub ~= 'Svalinn' then
      state.CombatForm:set('DW')
    else
      state.CombatForm:reset()
    end
  end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
  -- Default macro set/book
  if player.sub_job == 'WAR' then
    set_macro_page(1, 7)
  elseif player.sub_job == 'RDM' then
    set_macro_page(2, 7)
  elseif player.sub_job == 'NIN' then
    set_macro_page(3, 7)
  elseif player.sub_job == 'DNC' then
    set_macro_page(4, 7)
  else
    set_macro_page(1, 7)
  end
end
