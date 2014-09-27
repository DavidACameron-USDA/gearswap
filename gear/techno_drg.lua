-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.
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

  -- Precast Sets
  -- Precast sets to enhance JAs
  sets.precast.JA.Jump = {
    head = "Perle Salade",
    hands = "Hecatomb Mittens",
    ring1 = "Flame Ring",
    waist = "Wyrm Belt",
    legs = "Perle Brayettes",
    feet = "Hecatomb Leggings",
  }
  sets.precast.JA['Spirit Link'] = {
    head = "Drachen Armet +1",
  }
  sets.precast.JA['Ancient Circle'] = {
    legs = "Drachen Brais +1",
  }

  -- Waltz set (chr and vit)
  sets.precast.Waltz = {
    ammo="Sonia's Plectrum",
  }

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {}
  sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
  sets.precast.WS.Drakesbane = set_combine(sets.precast.WS, {})
  sets.precast.WS.Drakesbane.Acc = set_combine(sets.precast.WS.Acc, {})


  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {}


  -- Idle sets
  sets.idle = {
    main = "Valkyrie's Fork",
    sub = "Pole Grip",
    ammo = "Tiphia Sting",
    head = "Walahra Turban",
    neck = "Love Torque",
    ear1 = "Brutal Earring",
    ear2 = "Aesir Ear Pendant",
    body = "Askar Korazin",
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

  -- Defense sets
  sets.defense.PDT = {}

  sets.defense.MDT = {}

  sets.Kiting = {}

  -- Engaged sets

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will
  -- fall back on previous sets if more refined versions aren't defined. If
  -- you create a set with both offense and defense modes, the offense mode
  -- should be first, e.g. sets.engaged.Dagger.Accuracy.Evasion.

  -- Normal melee group
  sets.engaged = {
    ammo = "Tiphia Sting",
    head = "Walahra Turban",
    neck = "Love Torque",
    ear1 = "Brutal Earring",
    ear2 = "Aesir Ear Pendant",
    body = "Askar Korazin",
    hands = "Homam Manopolas",
    ring1 = "Ulthalam's Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Swift Belt",
    legs = "Blitzer Poleyn",
    feet = "Homam Gambieras",
  }

  sets.engaged.Acc = {}

  sets.engaged.PDT = {}

  sets.engaged.Acc.PDT = {}
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
  -- Default macro set/book
  if player.sub_job == 'SAM' then
      set_macro_page(1, 14)
  elseif player.sub_job == 'WAR' then
      set_macro_page(2, 14)
  elseif player.sub_job == 'BLU' then
      set_macro_page(3, 14)
  elseif player.sub_job == 'BLM' then
      set_macro_page(4, 14)
  elseif player.sub_job == 'RDM' then
      set_macro_page(5, 14)
  elseif player.sub_job == 'WHM' then
      set_macro_page(5, 14)
  elseif player.sub_job == 'NIN' then
      set_macro_page(6, 14)
  end
end
