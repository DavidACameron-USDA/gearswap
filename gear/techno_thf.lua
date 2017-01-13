--------------------------------------------------------------------------------
-- User setup functions for this job.
--------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  state.OffenseMode:options('Normal', 'Acc')
  state.HybridMode:options('Normal', 'Evasion')
  state.RangedMode:options('Normal', 'Acc')
  state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
  state.PhysicalDefenseMode:options('Evasion', 'PDT')


  gear.default.weaponskill_neck = "Asperity Necklace"
  gear.default.weaponskill_waist = "Caudata Belt"
  gear.AugQuiahuiz = {name="Quiahuiz Trousers", augments={'Haste+2','"Snapshot"+2','STR+8'}}

  -- Additional local binds
  send_command('bind ^` input /ja "Flee" <me>')
  send_command('bind ^= gs c cycle treasuremode')
  send_command('bind !- gs c cycle targetmode')

  select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
  send_command('unbind ^`')
  send_command('unbind !-')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
  --------------------------------------
  -- Special sets (required by rules)
  --------------------------------------

  sets.TreasureHunter = {}
  sets.ExtraRegen = {}
  sets.Kiting = {}

  sets.buff['Sneak Attack'] = {
    ring1 = "Ramuh Ring",
  }

  sets.buff['Trick Attack'] = {}

  -- Actions we want to use to tag TH.
  sets.precast.Step = sets.TreasureHunter
  sets.precast.Flourish1 = sets.TreasureHunter
  sets.precast.JA.Provoke = sets.TreasureHunter


  --------------------------------------
  -- Precast sets
  --------------------------------------

  -- Precast sets to enhance JAs
  sets.precast.JA['Collaborator'] = {}
  sets.precast.JA['Accomplice'] = {}
  sets.precast.JA['Flee'] = {}
  sets.precast.JA['Hide'] = {}
  sets.precast.JA['Conspirator'] = {}
  sets.precast.JA['Steal'] = {}
  sets.precast.JA['Despoil'] = {}
  sets.precast.JA['Perfect Dodge'] = {}
  sets.precast.JA['Feint'] = {}

  sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
  sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


  -- Waltz set (CHR and VIT)
  sets.precast.Waltz = {
    ammo="Sonia's Plectrum",
  }

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}


  -- Fast cast sets for spells
  sets.precast.FC = {
    neck = "Baetyl Pendant",
    ear2 = "Loquacious Earring",
    ring1 = "Weatherspoon Ring",
    legs = "Rawhide Trousers",
  }

  sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck = "Magoraga Beads"})


  -- Ranged snapshot gear
  sets.precast.RA = {}


  -- Weaponskill sets

  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    head = "Adhemar Bonnet +1",
    neck = gear.ElementalGorget,
    ear1 = "Brutal Earring",
    ear2 = "Moonshade Earring",
    body = "Rawhide Vest",
    hands = "Floral Gauntlets",
    ring1 = "Epona's Ring",
    ring2 = "Rajas Ring",
    back = "Cuchulain's Mantle",
    waist = gear.ElementalBelt,
    legs = "Taeon Tights",
    feet = "Mummu Gamashes +1",
  }
  sets.precast.WS.Acc = set_combine(sets.precast.WS, {
    head = "Mummu Bonnet +1",
    body = "Mummu Jacket +1",
    hands = "Mummu Wrists +1",
    waist = "Kentarch Belt",
    legs = "Mummu Kecks +1",
  })

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
  sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
  sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {})
  sets.precast.WS['Exenterator'].Mod = set_combine(sets.precast.WS['Exenterator'], {})
  sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'].Mod, {})
  sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'].Mod, {})
  sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'].Mod, {})

  sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS, {})
  sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS['Dancing Edge'], {})
  sets.precast.WS['Dancing Edge'].Mod = set_combine(sets.precast.WS['Dancing Edge'], {})
  sets.precast.WS['Dancing Edge'].SA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {})
  sets.precast.WS['Dancing Edge'].TA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {})
  sets.precast.WS['Dancing Edge'].SATA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {})

  sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
    head = "Mummu Bonnet +1",
    body = "Mummu Jacket +1",
    hands = "Mummu Wrists +1",
    legs = "Mummu Kecks +1",
    feet = "Mummu Gamashes +1",
  })
  sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {})
  sets.precast.WS['Evisceration'].Mod = set_combine(sets.precast.WS['Evisceration'], {})
  sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Mod, {})
  sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Mod, {})
  sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Mod, {})

  sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {})
  sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {})
  sets.precast.WS["Rudra's Storm"].Mod = set_combine(sets.precast.WS["Rudra's Storm"], {})
  sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {})
  sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {})
  sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {})

  sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {})
  sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'], {})
  sets.precast.WS['Shark Bite'].Mod = set_combine(sets.precast.WS['Shark Bite'], {})
  sets.precast.WS['Shark Bite'].SA = set_combine(sets.precast.WS['Shark Bite'].Mod, {})
  sets.precast.WS['Shark Bite'].TA = set_combine(sets.precast.WS['Shark Bite'].Mod, {})
  sets.precast.WS['Shark Bite'].SATA = set_combine(sets.precast.WS['Shark Bite'].Mod, {})

  sets.precast.WS['Mandalic Stab'] = set_combine(sets.precast.WS, {})
  sets.precast.WS['Mandalic Stab'].Acc = set_combine(sets.precast.WS['Mandalic Stab'], {})
  sets.precast.WS['Mandalic Stab'].Mod = set_combine(sets.precast.WS['Mandalic Stab'], {})
  sets.precast.WS['Mandalic Stab'].SA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {})
  sets.precast.WS['Mandalic Stab'].TA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {})
  sets.precast.WS['Mandalic Stab'].SATA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {})

  sets.precast.WS['Aeolian Edge'] = {}
  sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)


  --------------------------------------
  -- Midcast sets
  --------------------------------------

  sets.midcast.FastRecast = {
    
  }

  -- Ranged gear
  sets.midcast.RA = {}

  sets.midcast.RA.Acc = {}


  --------------------------------------
  -- Idle/resting/defense sets
  --------------------------------------

  -- Resting sets
  sets.resting = {}


  -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

  sets.idle = {
    main = "Izhiikoh",
    sub = "Atoyac",
    range = "Raider's Boomerang",
    head = "Mummu Bonnet +1",
    neck = "Twilight Torque",
    ear1 = "Dudgeon Earring",
    ear2 = "Heartseeker Earring",
    body = "Mummu Jacket +1",
    hands = "Floral Gauntlets",
    ring1 = "Defending Ring",
    ring2 = "Petrov Ring",
    back = "Repulse Mantle",
    waist = "Flume Belt +1",
    legs = "Mummu Kecks +1",
    feet = "Fajin Boots",
  }

  -- sets.idle.Town = {}


  -- Defense sets

  sets.defense.Evasion = {}

  sets.defense.PDT = {
    neck = "Twilight Torque",
    ring1 = "Defending Ring",
    back = "Repulse Mantle",
    legs = "Mummu Kecks +1",
  }

  sets.defense.MDT = {
    neck = "Twilight Torque",
    ring1 = "Defending Ring",
  }


  --------------------------------------
  -- Melee sets
  --------------------------------------

  -- Normal melee group
  sets.engaged = {
    head = "Adhemar Bonnet",
    neck = "Asperity Necklace",
    ear1 = "Dudgeon Earring",
    ear2 = "Heartseeker Earring",
    body = "Rawhide Vest",
    hands = "Floral Gauntlets",
    ring1 = "Ramuh Ring",
    ring2 = "Petrov Ring",
    back = "Atheling Mantle",
    waist = "Windbuffet Belt +1",
    legs = "Taeon Tights",
    feet = "Mummu Gamashes +1",
  }
  sets.engaged.Acc = {
    head = "Mummu Bonnet +1",
    body = "Mummu Jacket +1",
    hands = "Mummu Wrists +1",
    waist = "Kentarch Belt",
    legs = "Mummu Kecks +1",
  }

  sets.engaged.Evasion = {}
  sets.engaged.Acc.Evasion = {}

  sets.engaged.PDT = {}
  sets.engaged.Acc.PDT = {}

end


--------------------------------------------------------------------------------
-- Utility functions specific to this job.
--------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 6)
    elseif player.sub_job == 'WAR' then
        set_macro_page(2, 6)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 6)
    else
        set_macro_page(1, 6)
    end
end
