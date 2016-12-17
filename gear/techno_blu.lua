-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.
function user_setup()
  state.OffenseMode:options('Normal', 'Acc', 'Refresh', 'Learning', 'CP')
  state.WeaponskillMode:options('Normal', 'Acc')
  state.CastingMode:options('Normal', 'Resistant')
  state.IdleMode:options('Normal', 'PDT', 'Learning', 'Nuking', 'CP')

  gear.fc_helios_boots = {name="Helios Boots", augments={'"Mag. Atk. Bns."+4', '"Fast Cast"+5', 'Mag. crit. hit dmg. +8%'}}

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

  sets.buff['Burst Affinity'] = {
    legs = "Assimilator's Shalwar +1",
  }
  sets.buff['Chain Affinity'] = {
    head = "Hashishin Kavuk",
    feet = "Assimilator's Charuqs +1",
  }
  sets.buff.Convergence = {}
  sets.buff.Diffusion = {
    feet = "Luhlaza Charuqs",
  }
  sets.buff.Efflux = {
    back = "Rosmerta's Cape",
  }


  -- Precast Sets

  -- Precast sets to enhance JAs
  sets.precast.JA['Azure Lore'] = {}


  -- Waltz set (CHR and VIT)
  sets.precast.Waltz = {
    ammo = "Sonia's Plectrum"
  }

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}


  -- Fast cast sets for spells
  sets.precast.FC = {
    head = "Haruspex Hat",
    ear2 = "Loquacious Earring",
    neck = "Baetyl Pendant",
    body = "Luhlaza Jubbah +1",
    ring1 = "Weatherspoon Ring",
    back = "Swith Cape",
    legs = "Orvail Pants +1",
    feet = gear.fc_helios_boots,
  }

  sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {
    body = "Hashishin Mintan",
  })


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    ammo = "Olibanum Sachet",
    head = "Jhakri Coronal +1",
    neck = gear.ElementalGorget,
    ear1 = "Brutal Earring",
    ear2 = "Moonshade Earring",
    body = "Jhakri Robe +1",
    hands = "Jhakri Cuffs +1",
    ring1 = "Epona's Ring",
    ring2 = "Rajas Ring",
    back = "Cornflower Cape",
    waist = gear.ElementalBelt,
    legs = "Taeon Tights",
    feet = "Jhakri Pigaches +1",
  }

  sets.precast.WS.acc = set_combine(sets.precast.WS, {
    ammo = "Honed Tathlum",
  })

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

  -- Chant du Cygne has a DEX 80% modifier, has a chance of dealing critical
  -- damage, and is aligned with the Light, Flame, Thunder, Breeze, Aqua, and
  -- Snow gorgets/belts.
  sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
    ammo = "Ginsen",
  })

  -- Requiescat has a MND 73~85% modifier and is aligned with the Shadow and
  -- Soil gorgets/belts.
  sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
    ammo = "Ginsen",
    ring2 = "K'ayres Ring",
  })

  -- Sanguine Blade has STR 30% and MND 50% modifiers and isn't aligned with any
  -- element.
  sets.precast.WS['Sanguine Blade'] = {
    head = "Pixie Hairpin +1",
    neck = "Baetyl Pendant",
    ear1 = "Friomisi Earring",
    ear2 = "Moonshade Earring",
    body = "Jhakri Robe +1",
    hands = "Jhakri Cuffs +1",
    ring2 = "Archon Ring",
    back = "Cornflower Cape",
    waist = "Yamabuki-no-Obi",
    legs = "Hagondes Pants",
    feet = "Jhakri Pigaches +1",
  }

  -- Expiacion has STR 30%, INT 30%, and DEX 20% modifiers and is aligned with
  -- the Aqua, Snow, and Soil gorgets/belts.
  sets.precast.WS.Expiacion = set_combine(sets.precast.WS, {})

  -- Savage Blade has STR: 50% and MND 50% modifiers and is aligned with the
  -- Breeze, Thunder, and Soil gorgets/belts.
  sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {})


  -- Midcast Sets
  sets.midcast.FastRecast = {
    body = "Luhlaza Jubbah +1",
    legs = "Assimilator's Shalwar +1",
  }

  sets.midcast['Blue Magic'] = {
    hands = "Hashishin Bazubands",
  }

  -- Physical Spells --

  sets.midcast['Blue Magic'].Physical = {
    ammo = "Mavi Tathlum",
    head = "Jhakri Coronal +1",
    neck = "Justice Torque",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Assimilator's Jubbah +1",
    hands = "Jhakri Cuffs +1",
    ring1 = "Flame Ring",
    ring2 = "Rajas Ring",
    back = "Cornflower Cape",
    waist = "Warwolf Belt",
    legs = "Assimilator's Shalwar +1",
    feet = "Jhakri Pigaches +1",
  }

  sets.midcast['Blue Magic'].PhysicalAcc = set_combine(sets.midcast['Blue Magic'].Physical, {
    ammo = "Honed Tathlum",
    body = "Jhakri Robe +1",
    back = "Rosmerta's Cape",
    legs = "Taeon Tights",
  })

  sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {
    ring1 = "Flame Ring",
  })

  sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {
    neck = "Love Torque",
    ear1 = "Delta Earring",
  })

  sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {
    head = "Whirlpool Mask",
    neck = "Fortitude Torque",
  })

  sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {
    head = "Whirlpool Mask",
  })

  sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {
    neck = "Imbodla Necklace",
    ear1 = "Psystorm Earring",
    ring2 = "Omega Ring",
  })

  sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {
    neck = "Imbodla Necklace",
    ring2 = "Omega Ring",
  })

  sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {
    ear1 = "Delta Earring",
    ring2 = "Omega Ring",
  })

  sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {
    head = "Whirlpool Mask",
    feet = "Assimilator's Charuqs +1",
  })


  -- Magical Spells --

  sets.midcast['Blue Magic'].Magical = {
    ammo = "Mavi Tathlum",
    head = "Jhakri Coronal +1",
    neck = "Baetyl Pendant",
    ear1 = "Friomisi Earring",
    ear2 = "Hecate's Earring",
    body = "Jhakri Robe +1",
    hands = "Jhakri Cuffs +1",
    ring1 = "Weatherspoon Ring",
    ring2 = "Omega Ring",
    back = "Cornflower Cape",
    waist = "Yamabuki-no-Obi",
    legs = "Hagondes Pants",
    feet = "Jhakri Pigaches +1",
  }

  sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical, {
    ear1 = "Lifestorm Earring",
    ear2 = "Psystorm Earring",
  })

  sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {})

  sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})

  sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})

  sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {
    ring2 = "Rajas Ring",
  })

  sets.midcast['Blue Magic'].MagicAccuracy = {
    head = "Jhakri Coronal +1",
    neck = "Eddy Necklace",
    ear1 = "Lifestorm Earring",
    ear2 = "Psystorm Earring",
    body = "Jhakri Robe +1",
    ring1 = "Weatherspoon Ring",
    ring2 = "Omega Ring",
    back = "Cornflower Cape",
  }

  -- Breath Spells --

  sets.midcast['Blue Magic'].Breath = {
    ammo = "Mavi Tathlum",
    head = "Mirage Keffiyeh",
    neck = "Cougar Pendant",
    body = "Assimilator's Jubbah +1",
    hands = "Iuitl Wristbands +1",
    ring1 = "Griffon Ring",
    legs = "Assimilator's Shalwar +1",
    feet = "Assimilator's Charuqs +1",
  }

  -- Other Types --

  sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy, {})

  sets.midcast['Blue Magic']['White Wind'] = {}

  sets.midcast['Blue Magic'].Healing = {
    head = "Assimilator's Keffiyeh +1",
    neck = "Imbodla Necklace",
    body = "Jhakri Robe +1",
    hands = "Jhakri Cuffs +1",
    back = "Cornflower Cape",
    legs = "Assimilator's Shalwar +1",
    feet = "Jhakri Pigaches +1",
  }

  sets.midcast['Blue Magic'].SkillBasedBuff = {
    ammo = "Mavi Tathlum",
    head = "Mirage Keffiyeh",
    body = "Assimilator's Jubbah +1",
    back = "Cornflower Cape",
    feet = "Luhlaza Charuqs",
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
  -- body = "Assimilator's Jubbah +1",
  -- ammo = "Mavi Tathlum",

  -- Gear for getting more CP.
  sets.CP = {
    back = "Mecistopins Mantle",
  }

  sets.latent_refresh = {
    waist = "Fucho-no-Obi",
  }

  -- Resting sets
  sets.resting = {
    body = "Assimilator's Jubbah",
    waist = "Fucho-no-Obi",
  }

  -- Idle sets
  sets.idle = {
    main = "Usonmunku",
    sub = "Usonmunku",
    ammo = "Ginsen",
    head = "Whirlpool Mask",
    neck = "Twilight Torque",
    ear1 = "Dudgeon Earring",
    ear2 = "Heartseeker Earring",
    body = "Jhakri Robe +1",
    hands = "Iuitl Wristbands +1",
    ring1 = "Defending Ring",
    ring2 = "Rajas Ring",
    back = "Repulse Mantle",
    waist = "Flume Belt +1",
    legs = "Crimson Cuisses",
    feet = "Assimilator's Charuqs +1",
  }

  -- sets.idle.PDT = {}

  -- sets.idle.Town = {}

  sets.idle.Learning = set_combine(sets.idle, sets.Learning)

  sets.idle.Nuking = set_combine(sets.idle, {
    main = "Bolelabunga",
    sub = "Tamaxchi",
  })

  sets.idle.CP = set_combine(sets.idle, sets.CP)


  -- Defense sets
  sets.defense.PDT = {
    neck = "Twilight Torque",
    hands = "Iuitl Wristbands +1",
    ring1 = "Defending Ring",
    waist = "Flume Belt +1",
    back = "Repulse Mantle",
  }

  sets.defense.MDT = {
    neck = "Twilight Torque",
    ring1 = "Defending Ring",
  }

  sets.Kiting = {
    ring1 = "Defending Ring",
    waist = "Flume Belt +1",
    back = "Repulse Mantle",
    legs = "Crimson Cuisses",
  }

  -- Engaged sets

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion

  -- Normal melee group
  sets.engaged = {
    ammo = "Ginsen",
    head = "Whirlpool Mask",
    neck = "Asperity Necklace",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Qaaxo Harness",
    hands = "Iuitl Wristbands +1",
    ring1 = "Epona's Ring",
    ring2 = "Rajas Ring",
    back = "Rosmerta's Cape",
    waist = "Windbuffet Belt +1",
    legs = "Taeon Tights",
    feet = "Assimilator's Charuqs +1",
  }

  sets.engaged.Acc = {
    ammo = "Honed Tathlum",
    neck = "Fortitude Torque",
    body = "Jhakri Robe +1",
    hands = "Jhakri Cuffs +1",
    legs = "Espial Hose",
    feet = "Jhakri Pigaches +1",
  }

  sets.engaged.Refresh = set_combine(sets.engaged, {
    body = "Assimilator's Jubbah +1",
  })

  sets.engaged.DW = set_combine(sets.engaged, {
    ear1 = "Dudgeon Earring",
    ear2 = "Heartseeker Earring",
  })

  sets.engaged.DW.Acc = set_combine(sets.engaged.DW, sets.engaged.Acc)

  sets.engaged.DW.Refresh = set_combine(sets.engaged.DW, {
    body = "Jhakri Robe +1",
  })

  sets.engaged.Learning = set_combine(sets.engaged, sets.Learning)
  sets.engaged.DW.Learning = set_combine(sets.engaged.DW, sets.Learning)

  sets.engaged.CP = set_combine(sets.engaged, sets.CP)
  sets.engaged.DW.CP = set_combine(sets.engaged.DW, sets.CP)

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
  elseif player.sub_job == 'THF' then
    set_macro_page(2, 16)
  elseif player.sub_job == 'WAR' then
    set_macro_page(3, 16)
  elseif player.sub_job == 'RDM' then
    set_macro_page(4, 16)
  else
    set_macro_page(1, 16)
  end
end
