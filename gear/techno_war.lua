-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.
function user_setup()
  state.OffenseMode:options('Normal', 'Acc')
  state.WeaponskillMode:options('Normal', 'Acc')
  state.IdleMode:options('Normal', 'PDT')

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
    main = "Eminent Voulge",
    sub = "Pole Grip",
    ammo = "Aqreqaq Bomblet",
    head = "Outrider Mask",
    neck = "Asperity Necklace",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Outrider Mail",
    hands = "Outrider Mittens",
    ring1 = "Ulthalam's Ring",
    ring2 = "Rajas Ring",
    back = "Atheling Mantle",
    waist = "Paewr Belt",
    legs = "Outrider Hose",
    feet = "Outrider Greaves",
  }

  -- sets.idle.Town = {}

  -- sets.idle.Field = {}

  -- sets.idle.Weak = {}

  sets.idle.PDT = set_combine(sets.idle, {
    ring1 = "Patronus Ring",
  })


  -- Engaged sets

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion

  -- Normal melee group
  sets.engaged = {
    main = "Eminent Voulge",
    sub = "Pole Grip",
    ammo = "Aqreqaq Bomblet",
    head = "Outrider Mask",
    neck = "Asperity Necklace",
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    body = "Outrider Mail",
    hands = "Outrider Mittens",
    ring1 = "Ulthalam's Ring",
    ring2 = "Rajas Ring",
    back = "Atheling Mantle",
    waist = "Paewr Belt",
    legs = "Outrider Hose",
    feet = "Outrider Greaves",
  }

  sets.engaged.Acc = {}

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

  sets.precast.JA['Blood Rage'] = {}


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
    head = "Outrider Mask",
    neck = "Justice Torque",
    ear1 = "Brutal Earring",
    ear2 = "Kemas Earring",
    body = "Outrider Mail",
    hands = "Hecatomb Mittens",
    ring1 = "Flame Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = "Warwolf Belt",
    legs = "Outrider Hose",
    feet = "Outrider Greaves",
  }

  sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

  -- Raging Rush has a STR: 35% modifier and is aligned with the Snow and Aqua
  -- gorgets/belts.
  sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS, {neck="Snow Gorget"})

  sets.precast.WS['Raging Rush'].Acc = set_combine(sets.precast.WS.Acc, {neck="Snow Gorget"})

  -- Steel Cyclone has STR: 60% and VIT 60% modifiers and is aligned with the
  -- Breeze, Aqua, and Snow gorgets/belts.
  sets.precast.WS['Steel Cyclone'] = set_combine(sets.precast.WS, {neck="Snow Gorget"})

  sets.precast.WS['Steel Cyclone'].Acc = set_combine(sets.precast.WS.Acc, {neck="Snow Gorget"})

  -- King's Justice has a STR: 50% modifier and is aligned with the Breeze,
  -- Thunder, and Soil gorgets/belts.
  sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS, {
    waist = "Thunder Belt",
  })

  sets.precast.WS["King's Justice"].Acc = set_combine(sets.precast.WS.Acc, {
    waist = "Thunder Belt",
  })

  -- Fell Cleave has a STR: 60% modifier and is aligned with the Breeze,
  -- Thunder, and Soil gorgets/belts.
  sets.precast.WS["Fell Cleave"] = set_combine(sets.precast.WS, {
    waist = "Thunder Belt",
  })

  sets.precast.WS["Fell Cleave"].Acc = set_combine(sets.precast.WS.Acc, {
    waist = "Thunder Belt",
  })


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
