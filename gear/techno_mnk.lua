--------------------------------------------------------------------------------
-- User setup functions for this job.
--------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  state.OffenseMode:options('Normal', 'Acc')
  state.WeaponskillMode:options('Normal', 'Acc')
  state.HybridMode:options('Normal', 'PDT', 'Counter')
  state.PhysicalDefenseMode:options('PDT', 'HP')

  update_combat_form()
  update_melee_groups()

  select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
  --------------------------------------
  -- Start defining the sets
  --------------------------------------

  -- Precast Sets

  -- Precast sets to enhance JAs on use
  sets.precast.JA['Hundred Fists'] = {}
  sets.precast.JA['Boost'] = {}
  sets.precast.JA['Dodge'] = {}
  sets.precast.JA['Focus'] = {}
  sets.precast.JA['Counterstance'] = {}
  sets.precast.JA['Footwork'] = {}
  sets.precast.JA['Formless Strikes'] = {}
  sets.precast.JA['Mantra'] = {}

  sets.precast.JA['Chi Blast'] = {}

  sets.precast.JA['Chakra'] = {}

  -- Waltz set (CHR and VIT)
  sets.precast.Waltz = {}

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}

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


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    head = "Whirlpool Mask",
    neck = gear.ElementalGorget,
    ear1 = "Brutal Earring",
    ear2 = "Moonshade Earring",
    body = "Qaaxo Harness",
    hands = "Qaaxo Mitaines",
    ring1 = "Ifrit Ring",
    ring2 = "Petrov Ring",
    back = "Cuchulain's Mantle",
    waist = gear.ElementalBelt,
    legs = "Taeon Tights",
    feet = "Espial Socks",
  }
  sets.precast.WS.Acc = set_combine(

  )

  -- Specific weaponskill sets.

  sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {})

  sets.precast.WS['Howling Fist'] = set_combine(sets.precast.WS, {})
  sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS.Acc, {})

  sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {})
  sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS.Acc, {})

  sets.precast.WS["Ascetic's Fury"] = set_combine(sets.precast.WS, {})
  sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS.Acc, {})

  sets.precast.WS["Victory Smite"] = set_combine(sets.precast.WS, {})
  sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS.Acc, {})

  sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {})
  sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS.Acc, {})

  sets.precast.WS['Dragon Kick'] = set_combine(sets.precast.WS, {})
  sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS.Acc, {})

  sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS, {})
  sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS.Acc, {})

  sets.precast.WS['Cataclysm'] = {}


  -- Midcast Sets
  sets.midcast.FastRecast = {

  }

  -- Specific spells
  sets.midcast.Utsusemi = {
    neck = "Magoraga Beads",
  }


  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {}


  -- Idle sets
  sets.idle = {
    main = "Oatixur",
    ammo = "Ginsen",
    head = "Adhemar Bonnet",
    neck = "Twilight Torque",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Qaaxo Harness",
    hands = "Nilas Gloves",
    ring1 = "Defending Ring",
    ring2 = "Petrov Ring",
    back = "Repulse Mantle",
    waist = "Windbuffet Belt +1",
    legs = "Taeon Tights",
    feet = "Espial Socks",
  }

  -- sets.idle.Town = {}

  -- Defense sets
  sets.defense.PDT = {
    neck = "Twilight Torque",
    ring1 = "Defending Ring",
    back = "Repulse Mantle",
  }

  sets.defense.HP = {

  }

  sets.defense.MDT = {
    neck = "Twilight Torque",
    ring1 = "Defending Ring",
  }

  sets.Kiting = {
    neck = "Twilight Torque",
    ring1 = "Defending Ring",
  }

  -- Engaged sets

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion

  -- Normal melee sets
  sets.engaged = {
    head = "Adhemar Bonnet",
    neck = "Asperity Necklace",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Qaaxo Harness",
    hands = "Nilas Gloves",
    ring1 = "Epona's Ring",
    ring2 = "Rajas Ring",
    back = "Atheling Mantle",
    waist = "Windbuffet Belt +1",
    legs = "Taeon Tights",
    feet = "Espial Socks",
  }
  sets.engaged.Acc = {
    head = "Whirlpool Mask",
    hands = "Qaaxo Mitaines",
  }

  -- Defensive melee hybrid sets
  sets.engaged.PDT = {

  }
  sets.engaged.Acc.PDT = {

  }
  sets.engaged.Counter = {

  }
  sets.engaged.Acc.Counter = {

  }


  -- Hundred Fists/Impetus melee set mods
  sets.engaged.HF = set_combine(sets.engaged)
  sets.engaged.HF.Impetus = set_combine(sets.engaged, {})
  sets.engaged.Acc.HF = set_combine(sets.engaged.Acc)
  sets.engaged.Acc.HF.Impetus = set_combine(sets.engaged.Acc, {})
  sets.engaged.Counter.HF = set_combine(sets.engaged.Counter)
  sets.engaged.Counter.HF.Impetus = set_combine(sets.engaged.Counter, {})
  sets.engaged.Acc.Counter.HF = set_combine(sets.engaged.Acc.Counter)
  sets.engaged.Acc.Counter.HF.Impetus = set_combine(sets.engaged.Acc.Counter, {})


  -- Footwork combat form
  sets.engaged.Footwork = {

  }
  sets.engaged.Footwork.Acc = {

  }

  -- Quick sets for post-precast adjustments, listed here so that the gear can be Validated.
  sets.impetus_body = {}
  sets.footwork_kick_feet = {}
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 2)
    else
        set_macro_page(1, 2)
    end
end
