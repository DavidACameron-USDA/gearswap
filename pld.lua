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
    state.Buff.Sentinel = buffactive.sentinel or false
    state.Buff.Cover = buffactive.cover or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

end

function user_unload()

end


-- Define sets and vars used by this job file.
function init_gear_sets()

end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_midcast(spell, action, spellMap, eventArgs)
  -- If DefenseMode is active, apply that gear over midcast choices.  Precast is
  -- allowed through for fast cast on spells, but we want to return to def gear
  -- before there's time for anything to hit us.  Exclude Job Abilities from
  -- this restriction, as we probably want the enhanced effect of whatever item
  -- of gear applies to them and only one item should be swapped out.
  if state.DefenseMode.value ~= 'None' and spell.type ~= 'JobAbility' then
    handle_equipping_gear(player.status)
    eventArgs.handled = true
  end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)

end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
  if player.mpp < 51 then
    idleSet = set_combine(idleSet, sets.latent_refresh)
  end
  return idleSet
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_defense_mode()
end

function display_current_job_state(eventArgs)

end
