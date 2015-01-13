-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  state.OffenseMode:options('Normal', 'Acc')
  state.WeaponskillMode:options('Normal', 'Acc')
  state.CastingMode:options('Normal', 'Resistant')
  state.PhysicalDefenseMode:options('PDT', 'HP')
  state.MagicalDefenseMode:options('MDT', 'HP')

  update_defense_mode()

  select_default_macro_book()
end

function user_unload()

end


-- Define sets and vars used by this job file.
function init_gear_sets()
  --------------------------------------
  -- Precast sets
  --------------------------------------

  -- Precast sets to enhance JAs
  sets.precast.JA['Invincible'] = {}
  sets.precast.JA['Holy Circle'] = {}
  sets.precast.JA['Shield Bash'] = {}
  sets.precast.JA['Sentinel'] = {}
  sets.precast.JA['Rampart'] = {}
  sets.precast.JA['Fealty'] = {}
  sets.precast.JA['Divine Emblem'] = {}
  sets.precast.JA['Cover'] = {}

  -- add mnd for Chivalry
  sets.precast.JA['Chivalry'] = {}

  -- Waltz set (chr and vit)
  sets.precast.Waltz = {
    ammo = "Sonia's Plectrum",
  }

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}

  -- Fast cast sets for spells

  sets.precast.FC = {}


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {}
  sets.precast.WS.Acc = {}

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

  -- Chant du Cygne has a DEX: 80% modifier and is aligned with the Light, Aqua,
  -- and Snow gorgets/belts.
  sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
    neck = "Light Gorget",
  })
  sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {
    neck = "Light Gorget",
  })

  -- Requiescat has a MND 73~85% modifier and is aligned with the Shadow and
  -- Soil gorgets/belts.
  sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
    neck = "Shadow Gorget",
  })
  sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {
    neck = "Shadow Gorget",
  })

  -- Sanguine Blade has STR 30% and MND 50% modifiers and isn't aligned with any
  -- element.
  sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {})

  -- Atonement damage is based on enmity and is aligned with the Light, Aqua,
  -- and Flame gorgets/belts.
  sets.precast.WS['Atonement'] = {
    neck = "Light Gorget",
  }
  sets.precast.WS['Atonement'].Acc = {
    neck = "Light Gorget",
  }

  -- Savage Blade has STR: 50% and MND 50% modifiers and is aligned with the
  -- Breeze, Thunder, and Soil gorgets/belts.
  sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
    waist = "Thunder Belt",
  })
  sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {
    waist = "Thunder Belt",
  })


  --------------------------------------
  -- Midcast sets
  --------------------------------------

  sets.midcast.FastRecast = {}

  sets.midcast.Enmity = {}

  sets.midcast.Flash = set_combine(sets.midcast.Enmity, {})

  sets.midcast.Cure = {}

  sets.midcast['Enhancing Magic'] = {}
  sets.midcast.Protect = {}
  sets.midcast.Shell = {}

  --------------------------------------
  -- Idle/resting/defense/etc sets
  --------------------------------------

  sets.resting = {}

  -- Idle sets
  sets.idle = {}

  -- sets.idle.Town = {}

  -- sets.idle.Weak = {}


  --------------------------------------
  -- Defense sets
  --------------------------------------

  sets.defense.PDT = {}
  sets.defense.HP = {}
  -- To cap MDT with Shell IV (52/256), need 76/256 in gear.
  -- Shellra V can provide 75/256, which would need another 53/256 in gear.
  sets.defense.MDT = {}


  --------------------------------------
  -- Engaged sets
  --------------------------------------

  sets.engaged = {}

  sets.engaged.Acc = {}

  sets.engaged.DW = {}

  sets.engaged.DW.Acc = {}

  sets.engaged.PDT = set_combine(sets.engaged, {})
  sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, {})

  sets.engaged.DW.PDT = set_combine(sets.engaged.DW, {})
  sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc, {})


  --------------------------------------
  -- Custom buff sets
  --------------------------------------

  sets.buff.Sentinel = {}
  sets.buff.Cover = {}
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_defense_mode()
  if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
    if player.equipment.sub and not player.equipment.sub:contains('Shield') and
      player.equipment.sub ~= 'Svalinn' then
      state.CombatForm:set('DW')
    else
      state.CombatForm:reset()
    end
  end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
  -- Default macro set/book
  if player.sub_job == 'WAR' then
    set_macro_page(1, 7)
  elseif player.sub_job == 'RDM' then
    set_macro_page(2, 7)
  elseif player.sub_job == 'NIN' then
    set_macro_page(3, 7)
  elseif player.sub_job == 'DNC' then
    set_macro_page(4, 7)
  else
    set_macro_page(1, 7)
  end
end
