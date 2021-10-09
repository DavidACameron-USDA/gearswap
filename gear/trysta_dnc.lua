-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('Evasion', 'PDT')

    -- Additional local binds
    send_command('bind ^= gs c cycle mainstep')
    send_command('bind != gs c cycle altstep')
    send_command('bind ^- gs c toggle selectsteptarget')
    send_command('bind !- gs c toggle usealtstep')
    send_command('bind ^` input /ja "Chocobo Jig" <me>')
    send_command('bind !` input /ja "Chocobo Jig II" <me>')

    gear.sen_mantle_tp = { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}}
	gear.sen_mantle_crit = { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
    gear.sen_mantle_wsd = { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}


    select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind ^=')
    send_command('unbind !=')
    send_command('unbind ^-')
    send_command('unbind !-')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs

    sets.precast.JA['No Foot Rise'] = {
	  body = "Horos Casaque +3",
	}

    sets.precast.JA['Trance'] = {
	  head = "Horos Tiara",
	}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
	  head = "Horos Tiara",
	  body = "Maxixi Casaque +1",
	  feet = "Maxixi Toe Shoes +1",
	}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Samba = {
	  head = "Maxixi Tiara +2",
	}

    sets.precast.Jig = {
	  legs = "Horos Tights",
	  feet = "Maxixi Toe Shoes +1",
	}

    sets.precast.Step = {
      head = "Maxixi Tiara +2",
	  feet = "Horos Toe Shoes",
	}
    sets.precast.Step['Feather Step'] = {
	  feet = "Charis Shoes +2",
	}

    sets.precast.Flourish1 = {}
	sets.precast.Flourish1['Animated Flourish'] = {
	  neck = "Unmoving Collar",
	  hands = "Horos Bangles",
	}
    sets.precast.Flourish1['Violent Flourish'] = {
	  body = "Horos Casaque +3",
	}
    sets.precast.Flourish1['Desperate Flourish'] = {
	}

    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {
	  hands = "Charis Bangles +2",
	}

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {
	  body = "Charis Casaque +2",
	}
    sets.precast.Flourish3['Climactic Flourish'] = {
	  head = "Charis Tiara +2",
	}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
	  head = "Herculean Helm",
	  ear2 = "Loquacious Earring",
	}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
	  ammo = "Cath Palug Stone",
	  neck = "Caro Necklace",
	  ear2 = "Moonshade Earring",
      body = "Horos Casaque +3",
	  hands = "Maxixi Bangles +2",
	  ring1 = "Ramuh Ring",
	  ring2 = "Ilabrat Ring",
	  back = gear.sen_mantle_wsd,
	  legs = gear.dw_herc_trousers,
	}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
	  legs = "Malignance Tights",
	})
    
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    -- Exenterator has an AGI modifier, the value of which depends on the number
    -- of merits.  fTP is transferred to all hits.
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
      ear1 = "Sherida Earring",
	  ear2 = "Mache Earring",
      body = "Horos Casaque +3",
      ring1 = "Epona's Ring",
	  legs = "Meghanada Chausses +2",
	})
    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {
	})

    sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {
	  head = "Skormoth Mask",
      ear1 = "Sherida Earring",
	  ear2 = "Mache Earring",
      ring1 = "Epona's Ring",
	  legs = "Meghanada Chausses +2",
	})
    sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS.Acc, {
	})

    -- Evisceration has a DEX 50% modifier and has a chance of dealing critical
    -- damage.  fTP is transferred to all hits.
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
	  head = "Mummu Bonnet +1",
      ear1 = "Sherida Earring",
	  ear2 = "Mache Earring",
	  body = "Meghanada Cuirie +2",
	  hands = "Mummu Wrists +2",
      ring1 = "Epona's Ring",
	  ring2 = "Hetairoi Ring",
	  back = gear.sen_mantle_crit,
	  waist = "Sarissaphoroi Belt",
	  legs = "Mummu Kecks +2",
	  feet = gear.qa_herc_boots,
	})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {
	})

  -- Rudra's Storm has a DEX 80% modifier.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
	  body = "Meghanada Cuirie +2",
	})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {
	})

  -- Aeolian Edge has DEX 40% and INT 40% modifiers.
    sets.precast.WS['Aeolian Edge'] = {
	}
    
    sets.precast.Skillchain = {
	  hands = "Charis Bangles +2",
	}
    
    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {
	}
        
    -- Specific spells
    sets.midcast.Utsusemi = {
	}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
	}
    sets.ExtraRegen = {
	}
    

    -- Idle sets

    sets.idle = {
	  main = "Tauret",
	  sub = "Enchufla",
	  ammo = "Ginsen",
	  head = "Meghanada Visor +1",
	  neck = "Loricate Torque +1",
      body = "Horos Casaque +3",
	  hands = "Meghanada Gloves +1",
      ring1 = "Defending Ring",
	  ring2 = "Ilabrat Ring",
	  back = gear.sen_mantle_tp,
	  legs = "Malignance Tights",
	  feet = gear.qa_herc_boots,
	}

    -- Defense sets

    sets.defense.Evasion = {
	  legs = "Malignance Tights",
	}

    sets.defense.PDT = {
	  head = "Meghanada Visor +1",
	  neck = "Loricate Torque +1",
	  body = "Meghanada Cuirie +2",
	  hands = "Meghanada Gloves +1",
      ring1 = "Defending Ring",
	  back = gear.sen_mantle_tp,
	  legs = "Malignance Tights",
	  feet = gear.qa_herc_boots,
	}

    sets.defense.MDT = {
	  neck = "Loricate Torque +1",
      ring1 = "Defending Ring",
	  legs = "Malignance Tights",
	}

    sets.Kiting = {
	}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
	  ammo = "Ginsen",
	  head = "Maxixi Tiara +2",
	  neck = "Sanctity Necklace",
      ear1 = "Sherida Earring",
	  ear2 = "Mache Earring",
      body = "Horos Casaque +3",
	  hands = "Mummu Wrists +2",
      ring1 = "Epona's Ring",
	  ring2 = "Ilabrat Ring",
	  back = gear.sen_mantle_tp,
	  waist = "Sarissaphoroi Belt",
	  legs = "Meghanada Chausses +2",
	  feet = gear.qa_herc_boots,
	}

    sets.engaged.Acc = set_combine(sets.engaged, {
	  ammo = "Cath Palug Stone",
	  legs = "Malignance Tights",
	})
    sets.engaged.Evasion = set_combine(sets.engaged, {
	  legs = "Malignance Tights",
	})
    sets.engaged.PDT = set_combine(sets.engaged, {
	})
    sets.engaged.Acc.Evasion = set_combine(sets.engaged, {
	})
    sets.engaged.Acc.PDT = set_combine(sets.engaged, {
	})

    -- Custom melee group: High Haste (2x March or Haste)
    sets.engaged.HighHaste = set_combine(sets.engaged, {
	})
    sets.engaged.Acc.HighHaste = set_combine(sets.engaged.HighHaste, {
	})
    sets.engaged.Evasion.HighHaste = set_combine(sets.engaged.HighHaste, {
	})
    sets.engaged.Acc.Evasion.HighHaste = set_combine(sets.engaged.HighHaste, {
	})
    sets.engaged.PDT.HighHaste = set_combine(sets.engaged.HighHaste, {
	})
    sets.engaged.Acc.PDT.HighHaste = set_combine(sets.engaged.HighHaste, {
	})


    -- Custom melee group: Max Haste (2x March + Haste)
    sets.engaged.MaxHaste = set_combine(sets.engaged.HighHaste, {
	})
    sets.engaged.Acc.MaxHaste = set_combine(sets.engaged.MaxHaste, {
	})
    sets.engaged.Evasion.MaxHaste = set_combine(sets.engaged.MaxHaste, {
	})
    sets.engaged.Acc.Evasion.MaxHaste = set_combine(sets.engaged.MaxHaste, {
	})
    sets.engaged.PDT.MaxHaste = set_combine(sets.engaged.MaxHaste, {
	})
    sets.engaged.Acc.PDT.MaxHaste = set_combine(sets.engaged.MaxHaste, {
	})



    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Saber Dance'] = {
	  legs = "Horos Tights",
	}
	sets.buff['Fan Dance'] = {
	  hands = "Horos Bangles",
	}
    sets.buff['Climactic Flourish'] = {
	  head = "Charis Tiara +2",
	  body = "Meghanada Cuirie +2",
	}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 20)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 20)
    else
        set_macro_page(1, 20)
    end
end
