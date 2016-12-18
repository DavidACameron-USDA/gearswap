--------------------------------------------------------------------------------
-- User setup functions for this job.
--------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  state.OffenseMode:options('Normal', 'Acc')
  state.WeaponskillMode:options('Normal', 'Acc')
  state.PhysicalDefenseMode:options('PDT', 'Evasion')

  -- Default maneuvers 1, 2, 3 and 4 for each pet mode.
  defaultManeuvers = {
    ['Melee'] = {'Fire Maneuver', 'Thunder Maneuver', 'Wind Maneuver', 'Light Maneuver'},
    ['Ranged'] = {'Wind Maneuver', 'Fire Maneuver', 'Thunder Maneuver', 'Light Maneuver'},
    ['Tank'] = {'Earth Maneuver', 'Dark Maneuver', 'Light Maneuver', 'Wind Maneuver'},
    ['Magic'] = {'Ice Maneuver', 'Light Maneuver', 'Dark Maneuver', 'Earth Maneuver'},
    ['Heal'] = {'Light Maneuver', 'Dark Maneuver', 'Water Maneuver', 'Earth Maneuver'},
    ['Nuke'] = {'Ice Maneuver', 'Dark Maneuver', 'Light Maneuver', 'Earth Maneuver'}
  }

  update_pet_mode()
  select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()

end

-- Define sets used by this job file.
function init_gear_sets()

  -- Precast Sets

  -- Fast cast sets for spells
  sets.precast.FC = {
    neck = "Baetyl Pendant",
    ear2 = "Loquacious Earring",
    ring1 = "Weatherspoon Ring",
    back = "Swith Cape",
    legs = "Orvail Pants +1",
  }

  sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck = "Magoraga Beads"})


  -- Precast sets to enhance JAs
  sets.precast.JA['Tactical Switch'] = {}

  sets.precast.JA['Repair'] = {}

  sets.precast.JA.Maneuver = {}


  -- Waltz set (CHR and VIT)
  sets.precast.Waltz = {
  }

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    head = "Whirlpool Mask",
    neck = gear.ElementalGorget,
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Qaaxo Harness",
    hands = "Qaaxo Mitaines",
    ring1 = "Ifrit Ring",
    ring2 = "Rajas Ring",
    back = "Argochampsa Mantle",
    waist = gear.ElementalBelt,
    legs = "Taeon Tights",
    feet = "Espial Socks",
}

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

  -- Stringing Pummel has STR: 32% and VIT: 32% modifiers.
  sets.precast.WS['Stringing Pummel'] = set_combine(sets.precast.WS, {})

  -- Victory Smite has a STR: 80% modifier.
  sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {})

  -- Shijin Spiral has a DEX: 73~85% modifier.
  sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {})

  -- Asuran Fists has STR: 15% and VIT: 15% modifiers.
  sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {})


  -- Midcast Sets

  sets.midcast.FastRecast = {}


  -- Midcast sets for pet actions
  sets.midcast.Pet.Cure = {}

  sets.midcast.Pet['Elemental Magic'] = {
    back = "Argochampsa Mantle",
  }

  sets.midcast.Pet.WeaponSkill = {
    back = "Argochampsa Mantle",
  }


  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {}


  -- Idle sets

  sets.idle = {
    main = "Oatixur",
    range = "Divinator",
    head = "Whirlpool Mask",
    neck = "Twilight Torque",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Qaaxo Harness",
    hands = "Qaaxo Mitaines",
    ring1 = "Defending Ring",
    ring2 = "Rajas Ring",
    back = "Repulse Mantle",
    waist = "Windbuffet Belt +1",
    legs = "Taeon Tights",
    feet = "Espial Socks",
  }

  -- sets.idle.Town = {}

  -- Set for idle while pet is out (eg: pet regen gear)
  sets.idle.Pet = sets.idle

  -- Idle sets to wear while pet is engaged
  sets.idle.Pet.Engaged = {
    back = "Argochampsa Mantle",
  }

  sets.idle.Pet.Engaged.Ranged = set_combine(sets.idle.Pet.Engaged, {})

  sets.idle.Pet.Engaged.Nuke = set_combine(sets.idle.Pet.Engaged, {})

  sets.idle.Pet.Engaged.Magic = set_combine(sets.idle.Pet.Engaged, {
    back = "Refraction Cape",
  })


  -- Defense sets

  sets.defense.Evasion = {}

  sets.defense.PDT = {}

  sets.defense.MDT = {}

  sets.Kiting = {}

  -- Engaged sets

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion

  -- Normal melee group
  sets.engaged = {
    head = "Whirlpool Mask",
    neck = "Asperity Necklace",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Qaaxo Harness",
    hands = "Qaaxo Mitaines",
    ring1 = "Epona's Ring",
    ring2 = "Rajas Ring",
    back = "Argochampsa Mantle",
    waist = "Windbuffet Belt +1",
    legs = "Taeon Tights",
    feet = "Espial Socks",
  }

  sets.engaged.Acc = {}

  sets.engaged.DT = {}

  sets.engaged.Acc.DT = {}

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
  -- Default macro set/book
  if player.sub_job == 'DNC' then
    set_macro_page(1, 18)
  elseif player.sub_job == 'NIN' then
    set_macro_page(2, 18)
  elseif player.sub_job == 'WAR' then
    set_macro_page(3, 18)
  else
    set_macro_page(1, 18)
  end
end
