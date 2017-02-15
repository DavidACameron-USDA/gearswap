--------------------------------------------------------------------------------
-- User setup functions for this job.
--------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  state.OffenseMode:options('Normal', 'Acc')
  state.HybridMode:options('Normal', 'Evasion', 'PDT')
  state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
  state.CastingMode:options('Normal', 'Resistant')
  state.PhysicalDefenseMode:options('PDT', 'Evasion')

  gear.MovementFeet = {name = "Danzo Sune-ate"}
  gear.DayFeet = "Danzo Sune-ate"
  gear.NightFeet = "Hachiya Kyahan"

  select_movement_feet()
  select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
  --------------------------------------
  -- Precast sets
  --------------------------------------

  -- Precast sets to enhance JAs
  sets.precast.JA['Mijin Gakure'] = {legs = "Mochizuki Hakama"}
  sets.precast.JA['Futae'] = {legs = "Iga Tekko +2"}
  sets.precast.JA['Sange'] = {legs = "Mochizuki Chainmail"}

  -- Waltz set (chr and vit)
  sets.precast.Waltz = {
    ammo = "Sonia's Plectrum",
    feet = "Rawhide Boots",
  }

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}

  -- Set for acc on steps, since Yonin drops acc a fair bit
  sets.precast.Step = {}

  sets.precast.Flourish1 = {}

  -- Fast cast sets for spells

  sets.precast.FC = {
    neck = "Baetyl Pendant",
    ear2 = "Loquacious Earring",
    ring1 = "Weatherspoon Ring",
    legs = "Rawhide Trousers",
  }
  sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck = "Magoraga Beads"})

  -- Snapshot for ranged
  sets.precast.RA = {}

  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    ammo = "Aqreqaq Bomblet",
    head = "Adhemar Bonnet",
    neck = gear.ElementalGorget,
    ear1 = "Brutal Earring",
    ear2 = "Moonshade Earring",
    body = "Rawhide Vest",
    hands = "Herculean Gloves",
    ring1 = "Ifrit Ring",
    ring2 = "Rufescent Ring",
    back = "Yokaze Mantle",
    waist = gear.ElementalBelt,
    legs = "Taeon Tights",
    feet = "Herculean Boots",
  }
  sets.precast.WS.Acc = set_combine(sets.precast.WS, {
    head = "Mummu Bonnet +1",
    body = "Mummu Jacket +1",
    hands = "Mummu Wrists +1",
    waist = "Kentarch Belt",
    legs = "Mummu Kecks +1",
    feet = "Mummu Gamashes +1",
  })

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
  sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS, {
    head = "Mummu Bonnet +1",
    body = "Mummu Jacket +1",
    hands = "Mummu Wrists +1",
    legs = "Mummu Kecks +1",
    feet = "Mummu Gamashes +1",
  })

  sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {
    head = "Mummu Bonnet +1",
    body = "Mummu Jacket +1",
    hands = "Mummu Wrists +1",
    legs = "Mummu Kecks +1",
    feet = "Mummu Gamashes +1",
  })

  sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {})


  --------------------------------------
  -- Midcast sets
  --------------------------------------

  sets.midcast.FastRecast = {
    
  }

  sets.midcast.Utsusemi = set_combine(sets.midcast.SelfNinjutsu, {
    neck = "Incanter's Torque",
    ear1 = "Stealth Earring",
  })

  sets.midcast.ElementalNinjutsu = {
    neck = "Incanter's Torque",
  }

  sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.Ninjutsu, {
    ear1 = "Stealth Earring",
  })

  sets.midcast.NinjutsuDebuff = {
    neck = "Incanter's Torque",
    ear1 = "Stealth Earring",
  }

  sets.midcast.NinjutsuBuff = {
    neck = "Incanter's Torque",
    ear1 = "Stealth Earring",
  }

  sets.midcast.RA = {}


  --------------------------------------
  -- Idle/resting/defense/etc sets
  --------------------------------------

  -- Resting sets
  sets.resting = {}

  -- Idle sets
  sets.idle = {
    main = "Ochu",
    sub = "Tancho",
    ammo = "Ginsen",
    head = "Mummu Bonnet +1",
    neck = "Twilight Torque",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Mummu Jacket +1",
    hands = "Herculean Gloves",
    ring1 = "Defending Ring",
    ring2 = "Petrov Ring",
    back = "Solemnity Cape",
    waist = "Flume Belt +1",
    legs = "Mummu Kecks +1",
    feet = "Danzo Sune-ate",
  }

  -- sets.idle.Town = {}

  -- Defense sets
  sets.defense.Evasion = {
    
  }

  sets.defense.PDT = {
    neck = "Twilight Torque",
    hands = "Herculean Gloves",
    ring1 = "Defending Ring",
    back = "Solemnity Cape",
    waist = "Flume Belt +1",
    legs = "Mummu Kecks +1",
    feet = "Herculean Boots",
  }

  sets.defense.MDT = {
    neck = "Twilight Torque",
    ring1 = "Defending Ring",
    back = "Solemnity Cape",
    waist = "Flume Belt +1",
  }


  sets.Kiting = {feet = gear.MovementFeet}


  --------------------------------------
  -- Engaged sets
  --------------------------------------

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion

  -- Normal melee group
  sets.engaged = {
    head = "Adhemar Bonnet",
    neck = "Asperity Necklace",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Rawhide Vest",
    hands = "Floral Gauntlets",
    ring1 = "Epona's Ring",
    ring2 = "Petrov Ring",
    back = "Yokaze Mantle",
    waist = "Windbuffet Belt +1",
    legs = "Taeon Tights",
    feet = "Herculean Boots",
  }
  sets.engaged.Acc = {
    head = "Mummu Bonnet +1",
    body = "Mummu Jacket +1",
    hands = "Mummu Wrists +1",
    waist = "Kentarch Belt",
    legs = "Mummu Kecks +1",
  }
  sets.engaged.Evasion = {
    
  }
  sets.engaged.Acc.Evasion = {
    
  }
  sets.engaged.PDT = {
    
  }
  sets.engaged.Acc.PDT = {
    
  }

  -- Custom melee group: High Haste (~20% DW)
  sets.engaged.HighHaste = {
    
  }
  sets.engaged.Acc.HighHaste = {
    
  }
  sets.engaged.Evasion.HighHaste = {
    
  }
  sets.engaged.Acc.Evasion.HighHaste = {
    
  }
  sets.engaged.PDT.HighHaste = {
    
  }
  sets.engaged.Acc.PDT.HighHaste = {
    
  }

  -- Custom melee group: Max Haste (0% DW)
  sets.engaged.MaxHaste = {
    hands = "Herculean Gloves",
  }
  sets.engaged.Acc.MaxHaste = {
    hands = "Mummu Wrists +1",
  }
  sets.engaged.Evasion.MaxHaste = {
    hands = "Mummu Wrists +1",
  }
  sets.engaged.Acc.Evasion.MaxHaste = {
    hands = "Mummu Wrists +1",
  }
  sets.engaged.PDT.MaxHaste = {
    hands = "Herculean Gloves",
  }
  sets.engaged.Acc.PDT.MaxHaste = {
    hands = "Herculean Gloves",
  }


  --------------------------------------
  -- Custom buff sets
  --------------------------------------

  sets.buff.Migawari = {}
  sets.buff.Doom = {}
  sets.buff.Yonin = {}
  sets.buff.Innin = {}
end


--------------------------------------------------------------------------------
-- Utility functions specific to this job.
--------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
  -- Default macro set/book
  if player.sub_job == 'WAR' then
    set_macro_page(1, 13)
  elseif player.sub_job == 'DNC' then
    set_macro_page(2, 13)
  else
    set_macro_page(1, 13)
  end
end
