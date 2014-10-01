-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
  mote_include_version = 2

  -- Load and initialize the include file.
  include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
  state.Buff.Hasso = buffactive.Hasso or false
  state.Buff.Seigan = buffactive.Seigan or false
  state.Buff.Sekkanoki = buffactive.Sekkanoki or false
  state.Buff.Sengikori = buffactive.Sengikori or false
  state.Buff['Meikyo Shisui'] = buffactive['Meikyo Shisui'] or false
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)
  if spell.type == 'WeaponSkill' then
    -- Change any GK weaponskills to polearm weaponskill if we're using a polearm.
    if player.equipment.main=='Quint Spear' or player.equipment.main=='Quint Spear' then
      if spell.english:startswith("Tachi:") then
        send_command('@input /ws "Penta Thrust" '..spell.target.raw)
        eventArgs.cancel = true
      end
    end
  end
end

-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
  if spell.type:lower() == 'weaponskill' then
    if state.Buff.Sekkanoki then
      equip(sets.buff.Sekkanoki)
    end
    if state.Buff.Sengikori then
      equip(sets.buff.Sengikori)
    end
    if state.Buff['Meikyo Shisui'] then
      equip(sets.buff['Meikyo Shisui'])
    end
  end
end


-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
  update_combat_form()
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end
