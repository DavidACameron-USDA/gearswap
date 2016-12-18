-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
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

  -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
  sets.idle = {
    main = "Ichimonji-Yofusa",
    sub = "Pole Grip",
    ammo = "Ginsen",
    head = "Flamma Zucchetto +1",
    neck = "Twilight Torque",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Flamma Korazin +1",
    hands = "Flamma Manopolas +1",
    ring1 = "Defending Ring",
    ring2 = "Rajas Ring",
    back = "Repulse Mantle",
    waist = "Flume Belt +1",
    legs = "Flamma Dirs +1",
    feet = "Flamma Gambieras +1",
  }

  -- sets.idle.Town = {}

  -- sets.idle.Field = {}

  -- sets.idle.Weak = {}

  sets.idle.PDT = set_combine(sets.idle, {
    head = "Outrider Mask",
    neck = "Twilight Torque",
    body = "Outrider Mail",
    hands = "Outrider Mittens",
    ring1 = "Defending Ring",
    back = "Repulse Mantle",
    legs = "Outrider Hose",
    feet = "Outrider Greaves",
  })


  -- Engaged sets

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion

  -- Normal melee group
  sets.engaged = {
    main = "Ichimonji-Yofusa",
    sub = "Pole Grip",
    ammo = "Ginsen",
    head = "Otomi Helm",
    neck = "Asperity Necklace",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Xaddi Mail",
    hands = "Flamma Manopolas +1",
    ring1 = "K'ayres Ring",
    ring2 = "Rajas Ring",
    back = "Atheling Mantle",
    waist = "Windbuffet Belt +1",
    legs = "Acro Breeches",
    feet = "Whirlpool Greaves",
  }

  sets.engaged.Acc = set_combine(sets.engaged, {
    head = "Flamma Zucchetto +1",
    ear2 = "Bushinomimi",
    neck = "Justice Torque",
    body = "Flamma Korazin +1",
    legs = "Flamma Dirs +1",
    feet = "Flamma Gambieras +1",
  })


  -- Precast Sets
  -- Precast sets to enhance JAs
  sets.precast.JA.Meditate = {
    head = "Wakido Kabuto",
  }

  sets.precast.JA['Warding Circle'] = {
    head = "Wakido Kabuto",
  }

  sets.precast.JA['Blade Bash'] = {}


  -- Waltz set (chr and vit)
  sets.precast.Waltz = {
    ammo = "Sonia's Plectrum",
  }

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    ammo = "Thew Bomblet",
    head = "Otomi Helm",
    neck = gear.ElementalGorget,
    ear1 = "Brutal Earring",
    ear2 = "Moonshade Earring",
    body = "Flamma Korazin +1",
    hands = "Flamma Manopolas +1",
    ring1 = "Ifrit Ring",
    ring2 = "Rajas Ring",
    back = "Unkai Sugemino",
    waist = gear.ElementalBelt,
    legs = "Flamma Dirs +1",
    feet = "Flamma Gambieras +1",
  }

  sets.precast.WS.Acc = set_combine(sets.precast.WS, {
    head = "Flamma Zucchetto +1",
    ammo = "Ginsen",
    body = "Flamma Korazin +1",
  })

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
  -- sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {})
  -- sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS.Acc, {})

  -- sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {})
  -- sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {})

  -- sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {})
  -- sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {})

  -- sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {})

  -- sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {})

  -- sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {})

  -- sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {})

  -- sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {})


  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {}


  -- Defense sets
  sets.defense.PDT = {
    head = "Outrider Mask",
    neck = "Twilight Torque",
    body = "Outrider Mail",
    hands = "Outrider Mittens",
    ring1 = "Defending Ring",
    back = "Repulse Mantle",
    waist = "Flume Belt +1",
    legs = "Outrider Hose",
    feet = "Outrider Greaves",
  }

  sets.defense.MDT = {
    neck = "Twilight Torque",
    ring1 = "Defending Ring",
  }

  sets.Kiting = {
    neck = "Twilight Torque",
    ring1 = "Defending Ring",
    back = "Repulse Mantle",
    waist = "Flume Belt +1",
  }


  sets.buff.Sekkanoki = {}

  sets.buff.Sengikori = {}

  sets.buff['Meikyo Shisui'] = {}
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
    set_macro_page(1, 12)
  elseif player.sub_job == 'DNC' then
    set_macro_page(2, 12)
  elseif player.sub_job == 'THF' then
    set_macro_page(3, 12)
  elseif player.sub_job == 'NIN' then
    set_macro_page(4, 12)
  else
    set_macro_page(1, 12)
  end
end
