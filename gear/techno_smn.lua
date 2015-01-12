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
  -- Base Sets
  --------------------------------------

  sets['Summoning Magic Skill'] = {
    head = "Convoker's Horn",
    neck = "Caller's Pendant",
    body = "Caller's Doublet +2",
    hands = "Glyphic Bracers",
    ring1 = "Fervor Ring",
    back = "Conveyance Cape",
    feet = "Nashira Crackows",
  }


  --------------------------------------
  -- Precast Sets
  --------------------------------------

  -- Precast sets to enhance JAs
  sets.precast.JA['Astral Flow'] = {}

  sets.precast.JA['Elemental Siphon'] = set_combine(sets['Summoning Magic Skill'], {
    back = "Conveyance Cape",
  })

  sets.precast.JA['Mana Cede'] = {
    hands = "Caller's Bracers +2",
  }

  -- Pact delay reduction gear
  sets.precast.BloodPactWard = {
    head = "Convoker's Horn",
    body = "Convoker's Doublet",
    hands = "Glyphic Bracers",
    legs = "Summoner's Spats +2",
    feet = "Summoner's Pgch. +2",
  }

  sets.precast.BloodPactRage = sets.precast.BloodPactWard

  -- Fast cast sets for spells

  sets.precast.FC = {
    ear1 = "Loquacious Earring",
  }

  sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    head = "Bokwus Circlet",
    ear2 = "Influx Earring",
    body = "Hagondes Coat +1",
    hands = "Glyphic Bracers",
    legs = "Convoker's Spats +1",
    feet = "Artsieq Boots",
  }

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

  -- Myrkr is not aligned with any elemental gorget/belt.
  sets.precast.WS.Myrkr = set_combine(sets.precast.WS, {})

  -- Garland of Bliss has STR: 30% and MND 70% modifiers and is aligned with the
  -- Flame, Light, and Aqua gorgets/belts.
  sets.precast.WS['Garland of Bliss'] = set_combine(sets.precast.WS, {
    neck = "Light Gorget",
  })

  -- Retribution has STR: 30% and MND 50% modifiers and is aligned with the
  -- Shadow, Soil, and Aqua gorgets/belts.
  sets.precast.WS.Retribution = set_combine(sets.precast.WS, {
    neck = "Shadow Gorget",
  })

  -- Spirit Taker has INT: 50% and MND 50% modifiers and is not aligned with any
  -- elemental gorget/belt.
  sets.precast.WS['Spirit Taker'] = set_combine(sets.precast.WS, {})


  --------------------------------------
  -- Midcast sets
  --------------------------------------

  sets.midcast.FastRecast = {
    head = "Convoker's Horn",
    ear1 = "Loquacious Earring",
    hands = "Glyphic Bracers",
    waist = "Paewr Belt",
    legs = "Convoker's Spats +1",
    feet = "Artsieq Boots",
  }

  sets.midcast.Cure = {
    head = "Bokwus Circlet",
    ear2 = "Influx Earring",
    body = "Hagondes Coat +1",
    hands = "Glyphic Bracers",
    legs = "Convoker's Spats +1",
    feet = "Artsieq Boots",
  }

  sets.midcast.Stoneskin = {
    head = "Bokwus Circlet",
    ear2 = "Influx Earring",
    body = "Hagondes Coat +1",
    hands = "Glyphic Bracers",
    legs = "Convoker's Spats +1",
    feet = "Artsieq Boots",
  }

  sets.midcast['Elemental Magic'] = {
    head = "Bokwus Circlet",
    body = "Hagondes Coat +1",
    hands = "Glyphic Bracers",
    legs = "Convoker's Spats +1",
    feet = "Artsieq Boots",
  }

  sets.midcast['Dark Magic'] = {
    head = "Bokwus Circlet",
    body = "Hagondes Coat +1",
    hands = "Glyphic Bracers",
    legs = "Convoker's Spats +1",
    feet = "Artsieq Boots",
  }


  -- Avatar pact sets.  All pacts are Ability type.

  sets.midcast.Pet.BloodPactWard = set_combine(sets['Summoning Magic Skill'], {})

  sets.midcast.Pet.DebuffBloodPactWard = set_combine(sets['Summoning Magic Skill'], {})

  sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard

  sets.midcast.Pet.PhysicalBloodPactRage = set_combine(sets['Summoning Magic Skill'], {
    body = "Convoker's Doublet",
    feet = "Convoker's Pigaches",
  })

  sets.midcast.Pet.PhysicalBloodPactRage.Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
    hands = "Glyphic Bracers",
    legs = "Convoker's Spats +1",
  })

  sets.midcast.Pet.MagicalBloodPactRage = set_combine(sets['Summoning Magic Skill'], {
    body = "Convoker's Doublet",
    back = "Altius Mantle",
    legs = "Summoner's Spats +2",
    feet = "Hagondes Sabots",
  })

  sets.midcast.Pet.MagicalBloodPactRage.Acc = sets.midcast.Pet.MagicalBloodPactRage


  -- Spirits cast magic spells, which can be identified in standard ways.

  sets.midcast.Pet.WhiteMagic = {
    legs = "Summoner's Spats +2",
  }

  sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.BloodPactRage, {
    legs = "Summoner's Spats +2 "
  })

  sets.midcast.Pet['Elemental Magic'].Resistant = {}


  --------------------------------------
  -- Idle/resting/defense/etc sets
  --------------------------------------

  -- Resting sets
  sets.resting = {
    main = "Dark Staff",
    head = "Convoker's Horn",
    body = "Hagondes Coat +1",
    waist = "Fucho-no-Obi",
  }

  -- Idle sets
  sets.idle = {
    main = "Patriarch Cane",
    sub = "Genbu's Shield",
    ammo = "Eminent Sachet",
    head = "Convoker's Horn",
    neck = "Caller's Pendant",
    ear1 = "Loquacious Earring",
    ear2 = "Influx Earring",
    body = "Hagondes Coat +1",
    hands = "Glyphic Bracers",
    ring1 = "Fervor Ring",
    ring2 = "Evoker's Ring",
    back = "Conveyance Cape",
    waist = "Fucho-no-Obi",
    legs = "Convoker's Spats +1",
    feet = "Artsieq Boots",
  }

  sets.idle.PDT = {
    back = "Repulse Mantle",
  }

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

  sets.idle.Avatar = set_combine(sets.idle, {
    head = "Convoker's Horn",
    body = "Caller's Doublet +2",
    hands = "Nashira Gages",
    legs = "Convoker's Spats +1",
    feet = "Convoker's Pigaches",
  })

  -- sets.idle.PDT.Avatar = {}

  sets.idle.Spirit = {
    head = "Convoker's Horn",
    body = "Hagondes Coat +1",
    hands = "Glyphic Bracers",
    feet = "Convoker's Pigaches",
  }

  -- sets.idle.Town = {}

  -- Favor uses Caller's Horn instead of Convoker's Horn for refresh
  sets.idle.Avatar.Favor = {
    head = "Convoker's Horn",
    body = "Caller's Doublet +2",
    hands = "Nashira Gages",
    legs = "Convoker's Spats +1",
    feet = "Convoker's Pigaches",
  }

  sets.idle.Avatar.Melee = {}

  sets.perp = {
    main = "Patriarch Cane",
    head = "Convoker's Horn",
    body = "Caller's Doublet +2",
    hands = "Nashira Gages",
    ring2 = "Evoker's Ring",
    feet = "Convoker's Pigaches",
  }

  -- Caller's Bracer's halve the perp cost after other costs are accounted for.
  -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
  -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
  -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
  sets.perp.Day = {
    head = "Convoker's Horn",
    body = "Hagondes Coat +1",
    hands = "Caller's Bracers +2",
  }

  sets.perp.Weather = {
    head = "Convoker's Horn",
    neck = "Caller's Pendant",
    body = "Hagondes Coat +1",
    hands = "Caller's Bracers +2",
  }

  sets.perp.Carbuncle = {
    head = "Convoker's Horn",
    body = "Hagondes Coat +1",
    hands = "Carbuncle Mitts",
  }

  sets.perp.staff_and_grip = {}

  -- Defense sets
  sets.defense.PDT = {
    back = "Repulse Mantle",
  }

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
