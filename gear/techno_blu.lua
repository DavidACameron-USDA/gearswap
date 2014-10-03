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
    ammo = "Olibanum Sachet",
    neck = "Kubira Bead Necklace",
    ear2 = "Bushinomimi",
    body = "Magus Jubbah +1",
    ring1 = "Flame Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Warwolf Belt",
    feet = "Denali Gamashes",
  }

  sets.precast.WS.acc = set_combine(sets.precast.WS, {
    head = "Optical Hat",
    body = "Homam Corazza",
  })

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

  -- Requiescat has a MND 73~85% modifier and is aligned with the Shadow and
  -- Soil gorgets/belts.
  -- sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
  --   neck = "Shadow Gorget"
  --   ear1 = "Geist Earring",
  --   hands = "Mirage Bazubands",
  -- })

  -- Sanguine Blade has STR 30% and MND 50% modifiers and isn't aligned with any
  -- element.
  sets.precast.WS['Sanguine Blade'] = {
    ear1 = "Geist Earring",
    hands = "Mirage Bazubands",
  }

  -- Expiacion has STR 30%, INT 30%, and DEX 20% modifiers and is aligned with
  -- the Aqua, Snow, and Soil gorgets/belts.
  sets.precast.WS.Expiacion = {
    neck = "Snow Gorget"
  }

  -- Savage Blade has STR: 50% and MND 50% modifiers and is aligned with the
  -- Breeze, Thunder, and Soil gorgets/belts.
  sets.precast.WS['Savage Blade'] = {
    ear1 = "Geist Earring",
    hands = "Mirage Bazubands",
  }


  -- Midcast Sets
  sets.midcast.FastRecast = {}

  sets.midcast['Blue Magic'] = {}

  -- Physical Spells --

  sets.midcast['Blue Magic'].Physical = {
    ammo = "Olibanum Sachet",
    head = "Mirage Keffiyeh",
    neck = "Chivalrous Chain",
    body = "Magus Jubbah +1",
    ring1 = "Ulthalam's Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Warwolf Belt",
    legs = "Denali Kecks",
    feet = "Denali Gamashes",
  }

  sets.midcast['Blue Magic'].PhysicalAcc = {
    ammo = "Tiphia Sting",
    head = "Optical Hat",
    neck = "Chivalrous Chain",
    ear1 = "Brutal Earring",
    ear2 = "Ethereal Earring",
    body = "Homam Corazza",
    ring1 = "Ulthalam's Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Warwolf Belt",
    legs = "Denali Kecks",
    feet = "Denali Gamashes",
  }

  sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {
    ammo = "Olibanum Sachet",
    neck = "Kubira Bead Necklace",
    ear2 = "Bushinomimi",
    body = "Magus Jubbah +1",
    ring1 = "Flame Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Warwolf Belt",
    feet = "Denali Gamashes",
  })

  sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {
    neck = "Kubira Bead Necklace",
    ear1 = "Delta Earring",
    body = "Magus Jubbah +1",
    hands = "Mirage Bazubands",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Warwolf Belt",
    legs = "Magus Shalwar +1",
  })

  sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {
    ammo = "Bibiki Seashell",
    head = "Mirage Keffiyeh",
    waist = "Warwolf Belt",
    legs = "Magus Shalwar +1",
  })

  sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {
    legs = "Denali Kecks",
  })

  sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {
    ammo = "Phantom Tathlum",
    head = "Magus Keffiyeh +1",
    ear1 = "Morion Earring",
    body = "Errant Houppelande",
    ring2 = "Omega Ring",
    back = "Gleeman's Cape",
    feet = "Yigit Crackows",
  })

  sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {
    head = "Magus Keffiyeh +1",
    neck = "Morgana's Choker",
    body = "Errant Houppelande",
    hands = "Mirage Bazubands",
    ring2 = "Omega Ring",
    feet = "Yigit Crackows",
  })

  sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {
    ear1 = "Delta Earring",
    body = "Errant Houppelande",
    ring2 = "Omega Ring",
  })

  sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical)


  -- Magical Spells --

  sets.midcast['Blue Magic'].Magical = {
    ammo = "Phantom Tathlum",
    head = "Magus Keffiyeh +1",
    ear2 = "Moldavite Earring",
    body = "Errant Houppelande",
    ring2 = "Omega Ring",
    back = "Gleeman's Cape",
    legs = "Denali Kecks",
    feet = "Yigit Crackows",
  }

  sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical, {
    ammo = "Phantom Tathlum",
    head = "Homam Zucchetto",
    ear1 = "Aptus Earring",
    body = "Errant Houppelande",
    hands = "Nashira Gages",
    feet = "Denali Gamashes",
  })

  sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {
    neck = "Morgana's Choker",
    ear1 = "Geist Earring",
    hands = "Mirage Bazubands",
  })

  sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {
    ear1 = "Delta Earring",
  })

  sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {
    ammo = "Bibiki Seashell",
    head = "Mirage Keffiyeh",
    waist = "Warwolf Belt",
    legs = "Magus Shalwar +1",
  })

  sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {
    neck = "Kubira Bead Necklace",
    ear1 = "Delta Earring",
    body = "Magus Jubbah +1",
    hands = "Mirage Bazubands",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Warwolf Belt",
    legs = "Magus Shalwar +1",
  })

  sets.midcast['Blue Magic'].MagicAccuracy = {
    ammo = "Sturm's Report",
    head = "Homam Zucchetto",
    ear1 = "Aptus Earring",
    hands = "Nashira Gages",
    ring2 = "Omega Ring",
    legs = "Denali Kecks",
    feet = "Denali Gamashes",
  }

  -- Breath Spells --

  sets.midcast['Blue Magic'].Breath = {
    head = "Mirage Keffiyeh",
    neck = "Cougar Pendant",
    body = "Homam Corazza",
    hands = "Homam Manopolas",
    ring1 = "Griffon Ring",
    back = "Gleeman's Cape",
    legs = "Homam Cosciales",
    feet = "Homam Gambieras",
  }

  -- Other Types --

  sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy, {})

  sets.midcast['Blue Magic']['White Wind'] = {}

  sets.midcast['Blue Magic'].Healing = {
    head = "Magus Keffiyeh +1",
    neck = "Morgana's Choker",
    ear1 = "Geist Earring",
    body = "Errant Houppelande",
    hands = "Mirage Bazubands",
    ring2 = "Omega Ring",
    feet = "Yigit Crackows",
  }

  sets.midcast['Blue Magic'].SkillBasedBuff = {
    head = "Mirage Keffiyeh",
    body = "Magus Jubbah +1",
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
    head = "Yigit Turban",
    neck = "Grandiose Chain",
    ear1 = "Antivenom Earring",
    body = "Yigit Gomlek",
    waist = "Hierarch Belt",
    legs = "Yigit Seraweels",
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
    set_macro_page(1, 16)
  elseif player.sub_job == 'DNC' then
    set_macro_page(2, 16)
  elseif player.sub_job == 'THF' then
    set_macro_page(3, 16)
  else
    set_macro_page(1, 16)
  end
end
