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
    main = "Perdu Voulge",
    sub = "Pole Grip",
    ammo = "Tiphia Sting",
    head = "Walahra Turban",
    neck = "Chivalrous Chain",
    ear1 = "Brutal Earring",
    ear2 = "Aesir Ear Pendant",
    body = "Askar Korazin",
    hands = "Perle Moufles",
    ring1 = "Ulthalam's Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Swift Belt",
    legs = "Byakko's Haidate",
    feet = "Aurum Sabatons",
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
    main = "Perdu Voulge",
    sub = "Pole Grip",
    ammo = "Tiphia Sting",
    head = "Walahra Turban",
    neck = "Chivalrous Chain",
    ear1 = "Brutal Earring",
    ear2 = "Aesir Ear Pendant",
    body = "Askar Korazin",
    hands = "Perle Moufles",
    ring1 = "Ulthalam's Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Swift Belt",
    legs = "Byakko's Haidate",
    feet = "Aurum Sabatons",
  }

  sets.engaged.Acc = {
    head = "Optical Hat",
    body = "Perle Hauberk",
  }

  -- Melee sets for use in Assault and Salvage.  Sets should utilize gear with
  -- Assault bonuses.
  sets.engaged.Assault = set_combine(sets.engaged, {
    ring1 = "Imperial Ring",
  })

  sets.engaged.Assault.Acc = set_combine(sets.engaged.Acc, {})


  -- Precast Sets
  -- Precast sets to enhance JAs
  sets.precast.JA.Berserk = {}

  sets.precast.JA.Warcry = {}

  sets.precast.JA.Defender = {}

  sets.precast.JA.Aggressor = {}

  sets.precast.JA.Retaliation = {}

  sets.precast.JA.Restraint = {}


  -- Waltz set (chr and vit)
  sets.precast.Waltz = {
    ammo="Sonia's Plectrum",
  }

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {

  }

  sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
  sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS, {})

  sets.precast.WS['Raging Rush'].Acc = set_combine(sets.precast.WS.Acc, {})

  sets.precast.WS['Steel Cyclone'] = set_combine(sets.precast.WS, {})

  sets.precast.WS['Steel Cyclone'].Acc = set_combine(sets.precast.WS.Acc, {})

  sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS, {})

  sets.precast.WS["King's Justice"].Acc = set_combine(sets.precast.WS.Acc, {})


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
  if player.sub_job == 'SAM' then
    set_macro_page(1, 1)
  elseif player.sub_job == 'NIN' then
    set_macro_page(2, 1)
  elseif player.sub_job == 'DNC' then
    set_macro_page(3, 1)
  else
    set_macro_page(1, 1)
  end
end
