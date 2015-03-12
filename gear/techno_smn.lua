-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  state.OffenseMode:options('None', 'Normal', 'Acc')
  state.CastingMode:options('Normal', 'Resistant')
  state.IdleMode:options('Normal', 'PDT')

  gear.perp_staff = {name=""}
  gear.fc_helios_boots = {name="Helios Boots", augments={'"Mag. Atk. Bns."+4', '"Fast Cast"+5', 'Mag. crit. hit dmg. +8%'}}

  select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
  --------------------------------------
  -- Base Sets
  --------------------------------------

  sets['Summoning Magic Skill'] = {
    main = "Tumafyrig",
    sub = "Vox Grip",
    head = "Convoker's Horn +1",
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
    feet = "Caller's Pigaches +2",
  })

  sets.precast.JA['Mana Cede'] = {
    hands = "Caller's Bracers +2",
  }

  -- Pact delay reduction gear
  sets.precast.BloodPactWard = {
    ammo = "Seraphicaller",
    head = "Convoker's Horn +1",
    body = "Glyphic Doublet",
    hands = "Glyphic Bracers",
    legs = "Glyphic Spats",
    feet = "Summoner's Pgch. +2",
  }

  sets.precast.BloodPactRage = sets.precast.BloodPactWard

  -- Fast cast sets for spells

  sets.precast.FC = {
    head = "Haruspex Hat",
    ear2 = "Loquacious Earring",
    back = "Swith Cape",
    legs = "Orvail Pants +1",
    feet = gear.fc_helios_boots,
  }

  sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    head = "Bokwus Circlet",
    neck = "Fotia Gorget",
    ear2 = "Influx Earring",
    body = "Hagondes Coat +1",
    hands = "Glyphic Bracers",
    waist = "Fotia Belt",
    legs = "Convoker's Spats +1",
    feet = "Convoker's Pigaches +1",
  }

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

  -- Myrkr is not aligned with any elemental gorget/belt.
  sets.precast.WS.Myrkr = set_combine(sets.precast.WS, {})

  -- Garland of Bliss has STR: 30% and MND 70% modifiers and is aligned with the
  -- Flame, Light, and Aqua gorgets/belts.
  sets.precast.WS['Garland of Bliss'] = set_combine(sets.precast.WS, {})

  -- Retribution has STR: 30% and MND 50% modifiers and is aligned with the
  -- Shadow, Soil, and Aqua gorgets/belts.
  sets.precast.WS.Retribution = set_combine(sets.precast.WS, {})

  -- Spirit Taker has INT: 50% and MND 50% modifiers and is not aligned with any
  -- elemental gorget/belt.
  sets.precast.WS['Spirit Taker'] = set_combine(sets.precast.WS, {})


  --------------------------------------
  -- Midcast sets
  --------------------------------------

  sets.midcast.FastRecast = {
    head = "Convoker's Horn +1",
    ear1 = "Loquacious Earring",
    hands = "Glyphic Bracers",
    waist = "Paewr Belt",
    legs = "Convoker's Spats +1",
    feet = "Convoker's Pigaches +1",
  }

  sets.midcast.Cure = {
    head = "Bokwus Circlet",
    ear2 = "Influx Earring",
    body = "Hagondes Coat +1",
    hands = "Glyphic Bracers",
    legs = "Convoker's Spats +1",
    feet = "Convoker's Pigaches +1",
  }

  sets.midcast.Stoneskin = {
    head = "Bokwus Circlet",
    ear2 = "Influx Earring",
    body = "Hagondes Coat +1",
    hands = "Glyphic Bracers",
    legs = "Convoker's Spats +1",
    feet = "Convoker's Pigaches +1",
  }

  sets.midcast['Elemental Magic'] = {
    head = "Bokwus Circlet",
    body = "Hagondes Coat +1",
    hands = "Glyphic Bracers",
    legs = "Convoker's Spats +1",
  }

  sets.midcast['Dark Magic'] = {
    head = "Bokwus Circlet",
    body = "Hagondes Coat +1",
    hands = "Glyphic Bracers",
    legs = "Convoker's Spats +1",
  }


  -- Avatar pact sets.  All pacts are Ability type.

  sets.midcast.Pet.BloodPactWard = set_combine(sets['Summoning Magic Skill'], {})

  sets.midcast.Pet.DebuffBloodPactWard = set_combine(sets['Summoning Magic Skill'], {
    legs = "Helios Spats",
  })

  sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard

  sets.midcast.Pet.PhysicalBloodPactRage = set_combine(sets['Summoning Magic Skill'], {
    main = "Tumafyrig",
    body = "Convoker's Doublet +1",
    hands = "Helios Gloves",
    back = "Argochampsa Mantle",
    legs = "Helios Spats",
  })

  sets.midcast.Pet.PhysicalBloodPactRage.Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
    main = "Gridarvor",
    hands = "Glyphic Bracers",
    legs = "Convoker's Spats +1",
  })

  sets.midcast.Pet.MagicalBloodPactRage = set_combine(sets['Summoning Magic Skill'], {
    main = "Tumafyrig",
    body = "Convoker's Doublet +1",
    hands = "Tethyan Cuffs +3",
    back = "Argochampsa Mantle",
    legs = "Helios Spats",
    feet = "Hagondes Sabots",
  })

  sets.midcast.Pet.MagicalBloodPactRage.Acc = sets.midcast.Pet.MagicalBloodPactRage


  -- Spirits cast magic spells, which can be identified in standard ways.

  sets.midcast.Pet.WhiteMagic = {
    legs = "Glyphic Spats",
  }

  sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.BloodPactRage, {
    legs = "Glyphic Spats"
  })

  sets.midcast.Pet['Elemental Magic'].Resistant = {}


  --------------------------------------
  -- Idle/resting/defense/etc sets
  --------------------------------------

  -- Resting sets
  sets.resting = {
    main = "Dark Staff",
    head = "Convoker's Horn +1",
    body = "Hagondes Coat +1",
    waist = "Fucho-no-Obi",
  }

  -- Idle sets
  sets.idle = {
    main = "Gridarvor",
    sub = "Vox Grip",
    ammo = "Seraphicaller",
    head = "Convoker's Horn +1",
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
    feet = "Convoker's Pigaches +1",
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
  -- Convoker's Pigaches +1: -4
  -- total: -18

  -- Can make due without either the head or the body, and use +refresh items in those slots.

  sets.idle.Avatar = set_combine(sets.idle, {
    main = "Gridarvor",
    head = "Convoker's Horn +1",
    body = "Glyphic Doublet",
    hands = "Glyphic Bracers",
    ring2 = "Evoker's Ring",
    legs = "Convoker's Spats +1",
    feet = "Convoker's Pigaches +1",
  })

  -- sets.idle.PDT.Avatar = {}

  -- Summoning magic skill increases spirit AI.
  sets.idle.Spirit = set_combine(sets.idle, {
    main = "Tumafyrig",
    sub = "Vox Grip",
    head = "Caller's Horn +2",
    neck = "Caller's Pendant +2",
    body = "Caller's Doublet +2",
    hands = "Glyphic Bracers",
    ring1 = "Fervor Ring",
    back = "Conveyance Mantle",
    feet = "Convoker's Pigaches +1",
  })

  -- sets.idle.Town = {}

  -- Favor uses Caller's Horn instead of Convoker's Horn for refresh.  Equip
  -- Summoning Magic skill gear for increased potency.
  sets.idle.Avatar.Favor = set_combine(sets.idle, {
    main = "Gridarvor",
    sub = "Vox Grip",
    head = "Caller's Horn +2",
    neck = "Caller's Pendant",
    body = "Caller's Doublet +2",
    hands = "Glyphic Bracers",
    ring1 = "Fervor Ring",
    legs = "Convoker's Spats +1",
    feet = "Convoker's Pigaches +1",
  })

  sets.idle.Avatar.Melee = {}

  sets.perp = {
    main = "Gridarvor",
    head = "Convoker's Horn +1",
    body = "Glyphic Doublet",
    ring2 = "Evoker's Ring",
    feet = "Convoker's Pigaches +1",
  }

  -- Caller's Bracer's halve the perp cost after other costs are accounted for.
  -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
  -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
  -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
  sets.perp.Day = {
    main = "Gridarvor",
    head = "Convoker's Horn +1",
    body = "Hagondes Coat +1",
    hands = "Caller's Bracers +2",
    ring2 = "Evoker's Ring",
    feet = "Convoker's Pigaches +1",
  }

  sets.perp.Weather = {
    main = "Gridarvor",
    head = "Convoker's Horn +1",
    neck = "Caller's Pendant",
    body = "Hagondes Coat +1",
    hands = "Caller's Bracers +2",
    ring2 = "Evoker's Ring",
    feet = "Convoker's Pigaches +1",
  }

  sets.perp.Carbuncle = {
    main = "Gridarvor",
    head = "Convoker's Horn +1",
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
