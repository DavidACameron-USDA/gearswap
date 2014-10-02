-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.
function user_setup()
  state.OffenseMode:options('Normal', 'Acc', 'Refresh', 'Learning')
  state.WeaponskillMode:options('Normal', 'Acc')
  state.CastingMode:options('Normal', 'Resistant')
  state.IdleMode:options('Normal', 'PDT', 'Learning')

  -- Additional local binds

  update_combat_form()
  select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()

end


-- Set up gear sets.
function init_gear_sets()
  --------------------------------------
  -- Start defining the sets
  --------------------------------------

  sets.buff['Burst Affinity'] = {}
  sets.buff['Chain Affinity'] = {}
  sets.buff.Convergence = {}
  sets.buff.Diffusion = {}
  sets.buff.Enchainment = {}
  sets.buff.Efflux = {}


  -- Precast Sets

  -- Precast sets to enhance JAs
  sets.precast.JA['Azure Lore'] = {}


  -- Waltz set (chr and vit)
  sets.precast.Waltz = {ammo="Sonia's Plectrum"}

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}


  -- Fast cast sets for spells
  sets.precast.FC = {
    ear2 = "Loquacious Earring",
    legs = "Homam Cosciales",
  }

  sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {})


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {

  }

  sets.precast.WS.acc = set_combine(sets.precast.WS, {

  })

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
  -- sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})

  sets.precast.WS['Sanguine Blade'] = {

  }


  -- Midcast Sets
  sets.midcast.FastRecast = {  }

  sets.midcast['Blue Magic'] = {}

  -- Physical Spells --

  sets.midcast['Blue Magic'].Physical = {

  }

  sets.midcast['Blue Magic'].PhysicalAcc = {

  }

  sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {

  })

  sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {

  })

  sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical,
      {

  })

  sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical,
      {

  })

  sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical,
      {

  })

  sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical,
      {

  })

  sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical,
      {

  })

  sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical)


  -- Magical Spells --

  sets.midcast['Blue Magic'].Magical = {

  }

  sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
      {

  })

  sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical,
      {

  })

  sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical)

  sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical,
      {

  })

  sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical)

  sets.midcast['Blue Magic'].MagicAccuracy = {

  }

  -- Breath Spells --

  sets.midcast['Blue Magic'].Breath = {

  }

  -- Other Types --

  sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy,
      {

  })

  sets.midcast['Blue Magic']['White Wind'] = {

  }

  sets.midcast['Blue Magic'].Healing = {

  }

  sets.midcast['Blue Magic'].SkillBasedBuff = {

  }

  sets.midcast['Blue Magic'].Buff = {}


  -- Sets to return to when not performing an action.

  -- Gear for learning spells: +skill and AF hands.
  sets.Learning = {
    hands = "Magus Bazubands",
  }
  -- Optional learning gear with +blue magic skill that lowers the minimum level
  -- needed to learn the spell.
  -- head = "Mirage Keffiyeh",
  -- body = "Magus Jubbah +1",


  sets.latent_refresh = {}

  -- Resting sets
  sets.resting = {

  }

  -- Idle sets
  sets.idle = {
    main = "Perdu Hanger",
    sub = "Demon Slayer",
    ammo = "Tiphia Sting",
    head = "Walahra Turban",
    neck = "Chivalrous Chain",
    ear1 = "Brutal Earring",
    ear2 = "Ethereal Earring",
    body = "Mirage Jubbah",
    hands = "Homam Manopolas",
    ring1 = "Ulthalam's Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Swift Belt",
    legs = "Crimson Cuisses",
    feet = "Homam Gambieras",
  }

  -- sets.idle.PDT = {}

  -- sets.idle.Town = {}

  sets.idle.Learning = set_combine(sets.idle, sets.Learning)


  -- Defense sets
  sets.defense.PDT = {}

  sets.defense.MDT = {}

  sets.Kiting = {legs = "Crimson Cuisses"}

  -- Engaged sets

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion

  -- Normal melee group
  sets.engaged = {
    main = "Perdu Hanger",
    sub = "Demon Slayer",
    ammo = "Tiphia Sting",
    head = "Walahra Turban",
    neck = "Chivalrous Chain",
    ear1 = "Brutal Earring",
    ear2 = "Ethereal Earring",
    body = "Mirage Jubbah",
    hands = "Homam Manopolas",
    ring1 = "Ulthalam's Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Swift Belt",
    legs = "Homam Cosciales",
    feet = "Homam Gambieras",
  }

  sets.engaged.Acc = {
    head = "Optical Hat",
    body = "Homam Corazza",
  }

  sets.engaged.Refresh = {}

  sets.engaged.DW = {}

  sets.engaged.DW.Acc = {
    head = "Optical Hat",
    body = "Homam Corazza",
  }

  sets.engaged.DW.Refresh = {}

  sets.engaged.Learning = set_combine(sets.engaged, sets.Learning)
  sets.engaged.DW.Learning = set_combine(sets.engaged.DW, sets.Learning)


  sets.self_healing = {}
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
  -- Check for H2H or single-wielding
  if player.equipment.sub == "Genbu's Shield" or player.equipment.sub == 'empty' then
    state.CombatForm:reset()
  else
    state.CombatForm:set('DW')
  end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
  -- Default macro set/book
  if player.sub_job == 'NIN' then
    set_macro_page(1, 7)
  elseif player.sub_job == 'DNC' then
    set_macro_page(2, 7)
  elseif player.sub_job == 'THF' then
    set_macro_page(3, 7)
  else
    set_macro_page(1, 7)
  end
end
