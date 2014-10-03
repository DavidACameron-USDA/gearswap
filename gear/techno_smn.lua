-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  state.OffenseMode:options('None', 'Normal', 'Acc')
  state.CastingMode:options('Normal', 'Resistant')
  state.IdleMode:options('Normal', 'PDT')

  gear.perp_staff = {name=""}

  select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
  --------------------------------------
  -- Precast Sets
  --------------------------------------

  -- Precast sets to enhance JAs
  sets.precast.JA['Astral Flow'] = {}

  sets.precast.JA['Elemental Siphon'] = {

  }

  sets.precast.JA['Mana Cede'] = {}

  -- Pact delay reduction gear
  sets.precast.BloodPactWard = {

  }

  sets.precast.BloodPactRage = sets.precast.BloodPactWard

  -- Fast cast sets for spells

  sets.precast.FC = {

  }

  sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {

  }

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
  sets.precast.WS['Myrkr'] = {}


  --------------------------------------
  -- Midcast sets
  --------------------------------------

  sets.midcast.FastRecast = {}

  sets.midcast.Cure = {}

  sets.midcast.Stoneskin = {}

  sets.midcast['Elemental Magic'] = {}

  sets.midcast['Dark Magic'] = {}


  -- Avatar pact sets.  All pacts are Ability type.

  sets.midcast.Pet.BloodPactWard = {

  }

  sets.midcast.Pet.DebuffBloodPactWard = {

  }

  sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard

  sets.midcast.Pet.PhysicalBloodPactRage = {

  }

  sets.midcast.Pet.PhysicalBloodPactRage.Acc = sets.midcast.Pet.PhysicalBloodPactRage

  sets.midcast.Pet.MagicalBloodPactRage = {

  }

  sets.midcast.Pet.MagicalBloodPactRage.Acc = sets.midcast.Pet.MagicalBloodPactRage


  -- Spirits cast magic spells, which can be identified in standard ways.

  sets.midcast.Pet.WhiteMagic = {legs="Summoner's Spats"}

  sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.BloodPactRage, {legs="Summoner's Spats"})

  sets.midcast.Pet['Elemental Magic'].Resistant = {}


  --------------------------------------
  -- Idle/resting/defense/etc sets
  --------------------------------------

  -- Resting sets
  sets.resting = {

  }

  -- Idle sets
  sets.idle = {

  }

  -- sets.idle.PDT = {}

  -- perp costs:
  -- spirits: 7
  -- carby: 11 (5 with mitts)
  -- fenrir: 13
  -- others: 15
  -- avatar's favor: -4/tick

  -- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
  -- Aim for -14 perp, and refresh in other slots.

  -- -perp gear:
  -- Gridarvor: -5
  -- Glyphic Horn: -4
  -- Caller's Doublet +2/Glyphic Doublet: -4
  -- Evoker's Ring: -1
  -- Convoker's Pigaches: -4
  -- total: -18

  -- Can make due without either the head or the body, and use +refresh items in those slots.

  sets.idle.Avatar = {

  }

  sets.idle.PDT.Avatar = {}

  sets.idle.Spirit = {}

  -- sets.idle.Town = {}

  -- Favor uses Caller's Horn instead of Convoker's Horn for refresh
  sets.idle.Avatar.Favor = {}
  sets.idle.Avatar.Melee = {}

  sets.perp = {}
  -- Caller's Bracer's halve the perp cost after other costs are accounted for.
  -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
  -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
  -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
  sets.perp.Day = {body="Hagondes Coat",hands="Caller's Bracers +2"}

  sets.perp.Weather = {neck="Caller's Pendant",body="Hagondes Coat",hands="Caller's Bracers +2"}

  -- Carby: Mitts+Conv.feet = 1/tick perp.  Everything else should be +refresh
  sets.perp.Carbuncle = {

  }

  sets.perp.staff_and_grip = {main=gear.perp_staff,sub="Achaq Grip"}

  -- Defense sets
  sets.defense.PDT = {}

  sets.defense.MDT = {}

  sets.Kiting = {}

  sets.latent_refresh = {}


  --------------------------------------
  -- Engaged sets
  --------------------------------------

  -- Normal melee group
  sets.engaged = {}
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
  if reset == 'reset' then
    -- lost pet, or tried to use pact when pet is gone
  end

  -- Default macro set/book
  set_macro_page(1, 15)
end
