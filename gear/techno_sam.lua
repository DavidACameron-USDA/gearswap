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
    main = "Ichimonji-Yofusa",
    sub = "Pole Grip",
    ammo = "Tiphia Sting",
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


  -- Engaged sets

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion

  -- Normal melee group
  sets.engaged = {
    main = "Ichimonji-Yofusa",
    sub = "Pole Grip",
    ammo = "Tiphia Sting",
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

  sets.engaged.Acc = set_combine(sets.engaged, {
    ear2 = "Bushinomimi",
    neck = "Justice Torque",
  })

  -- Melee sets for use in Assault and Salvage.  Sets should utilize gear with
  -- Assault bonuses.
  sets.engaged.Assault = set_combine(sets.engaged, {
    ring1 = "Imperial Ring",
  })

  sets.engaged.Assault.Acc = set_combine(sets.engaged.Acc, {})


  -- Precast Sets
  -- Precast sets to enhance JAs
  sets.precast.JA.Meditate = {
    head="Wakido Kabuto",
  }

  sets.precast.JA['Warding Circle'] = {
    head="Wakido Kabuto",
  }

  sets.precast.JA['Blade Bash'] = {}


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
    ear2 = "Bushinomimi",
    body = "Outrider Mail",
    hands = "Myochin Kote +1",
    ring1 = "Flame Ring",
    ring2 = "Rajas Ring",
    back = "Unkai Sugemino",
    waist = "Warwolf Belt",
    legs = "Outrider Hose",
    feet = "Outrider Greaves",
  }

  sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
  -- sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {neck="Snow Gorget"})

  -- sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS.Acc, {neck="Snow Gorget"})

  -- sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {})

  -- sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {})

  sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {neck="Snow Gorget"})

  sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {neck="Snow Gorget"})

  sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {neck="Shadow Gorget"})

  sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {})

  sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {neck="Snow Gorget"})

  sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {})

  sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {})


  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {}


  -- Defense sets
  sets.defense.PDT = {}

  sets.defense.MDT = {}

  sets.Kiting = {}


  sets.buff.Sekkanoki = {}

  sets.buff.Sengikori = {}

  sets.buff['Meikyo Shisui'] = {}
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
    set_macro_page(1, 12)
  elseif player.sub_job == 'DNC' then
    set_macro_page(2, 12)
  elseif player.sub_job == 'THF' then
    set_macro_page(3, 12)
  elseif player.sub_job == 'NIN' then
    set_macro_page(4, 12)
  else
    set_macro_page(1, 12)
  end
end
