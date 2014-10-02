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
    main = "Perdu Sickle",
    sub = "Pole Grip",
    ammo = "Tiphia Sting",
    head = "Walahra Turban",
    neck = "Parade Gorget",
    ear1 = "Brutal Earring",
    ear2 = "Ethereal Earring",
    body = "Ares' Cuirass",
    hands = "Homam Manopolas",
    ring1 = "Ulthalam's Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Swift Belt",
    legs = "Crimson Cuisses",
    feet = "Homam Gambieras",
  }

  -- sets.idle.Town = {}

  -- sets.idle.Field = {}

  -- sets.idle.Weak = {}


  -- Engaged sets

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion

  -- Normal melee group
  sets.engaged = {
    main = "Perdu Sickle",
    sub = "Pole Grip",
    ammo = "Tiphia Sting",
    head = "Walahra Turban",
    neck = "Justice Torque",
    ear1 = "Brutal Earring",
    ear2 = "Ethereal Earring",
    body = "Askar Korazin",
    hands = "Homam Manopolas",
    ring1 = "Ulthalam's Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Swift Belt",
    legs = "Homam Cosciales",
    feet = "Homam Gambieras",
  }

  sets.engaged.Acc = set_combine(sets.engaged, {
    head = "Optical Hat",
    body = "Homam Corazza",
    legs = "Perle Brayettes",
  })

  -- Melee sets for use in Assault and Salvage.  Sets should utilize gear with
  -- Assault bonuses.
  sets.engaged.Assault = set_combine(sets.engaged, {
    ring1 = "Imperial Ring",
  })

  sets.engaged.Assault.Acc = set_combine(sets.engaged.Acc, {})


  -- Precast Sets
  -- Fast Cast set
  sets.precast.FC = {
    ear2 = "Loquacious Earring",
    waist = "Swift Belt",
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


  -- Waltz set (chr and vit)
  sets.precast.Waltz = {
    ammo="Sonia's Plectrum",
  }

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    ammo = "Olibanum Sachet",
    head = "Perle Salade",
    neck = "Justice Torque",
    ear1 = "Brutal Earring",
    ear2 = "Bushinomimi",
    body = "Ares' Cuirass",
    hands = "Hecatomb Mittens",
    ring1 = "Flame Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Warwolf Belt",
    legs = "Blitzer Poleyn",
    feet = "Hecatomb Leggings",
  }

  sets.precast.WS.Acc = set_combine(sets.precast.WS, {
    head = "Optical Hat",
    body = "Perle Hauberk",
  })

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

  -- Guillotine has STR: 25% and MND 25% modifiers and is aligned with the Snow
  -- gorgets/belts.
  sets.precast.WS.Guillotine = set_combine(sets.precast.WS, {neck="Snow Gorget"})

  sets.precast.WS.Guillotine.Acc = set_combine(sets.precast.WS.Acc, {neck="Snow Gorget"})

  -- Cross Reaper has STR: 30% and MND 30% modifiers and is aligned with the
  -- Aqua and Snow gorgets/belts.
  sets.precast.WS['Cross Reaper'] = set_combine(sets.precast.WS, {neck="Snow Gorget"})

  sets.precast.WS['Cross Reaper'].Acc = set_combine(sets.precast.WS.Acc, {neck="Snow Gorget"})

  -- Spiral Hell has STR: 50% and INT 50% modifiers and is aligned with the
  -- Aqua, Snow, and Soil gorgets/belts.
  sets.precast.WS['Spiral Hell'] = set_combine(sets.precast.WS, {neck="Snow Gorget"})

  sets.precast.WS['Spiral Hell'].Acc = set_combine(sets.precast.WS.Acc, {neck="Snow Gorget"})

  -- Insurgency has STR: 20% and INT 20% modifiers and is aligned with the
  -- Flame, Light, and Shadow gorgets/belts.
  sets.precast.WS.Insurgency = set_combine(sets.precast.WS, {neck="Shadow Gorget"})

  sets.precast.WS.Insurgency.Acc = set_combine(sets.precast.WS.Acc, {neck="Shadow Gorget"})


  -- Midcast sets
  sets.midcast['Dark Magic'] = {
    ammo = "Sturm's Report",
    head = "Chaos Burgeonet",
    neck = "Aesir Torque",
    hands = "Crimson Finger Gauntlets",
    waist = "Crimson Belt",
    ring1 = "Omega Ring",
  }

  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {}


  -- Defense sets
  sets.defense.PDT = {}

  sets.defense.MDT = {}

  sets.Kiting = {}
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
  if areas.Assault:contains(world.area) then
    state.CombatForm:set('Assault')
  else
    state.CombatForm:reset()
  end
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