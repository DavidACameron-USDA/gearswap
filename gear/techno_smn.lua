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
    head = "Evoker's Horn",
    neck = "Summoning Torque",
    hands = "Summoner's Bracers",
    feet = "Nashira Crackows",
  }

  sets.precast.JA['Mana Cede'] = {}

  -- Pact delay reduction gear
  sets.precast.BloodPactWard = {
    head = "Summoner's Horn",
    body = "Yinyang Robe",
    hands = "Summoner's Bracers",
    legs = "Summoner's Spats",
    feet = "Summoner's Pgch.",
  }

  sets.precast.BloodPactRage = sets.precast.BloodPactWard

  -- Fast cast sets for spells

  sets.precast.FC = {
    hands = "Nashira Gages",
    waist = "Swift Belt",
    feet = "Nashira Crackows",
  }

  sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    head = "Optical Hat",
  }

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

  -- Myrkr is not aligned with any elemental gorget/belt.
  sets.precast.WS.Myrkr = {}

  -- Garland of Bliss has STR: 30% and MND 70% modifiers and is aligned with the
  -- Flame, Light, and Aqua gorgets/belts.
  sets.precast.WS['Garland of Bliss'] = {
    head = "Yigit Turban",
    legs = "Summoner's Spats",
    feet = "Yigit Crackows",
  }

  -- Retribution has STR: 30% and MND 50% modifiers and is aligned with the
  -- Shadow, Soil, and Aqua gorgets/belts.
  sets.precast.WS.Retribution = {
    head = "Yigit Turban",
    neck = "Shadow Gorget",
    legs = "Summoner's Spats",
    feet = "Yigit Crackows",
  }

  -- Spirit Taker has INT: 50% and MND 50% modifiers and is not aligned with any
  -- elemental gorget/belt.
  sets.precast.WS['Spirit Taker'] = {
    head = "Yigit Turban",
    legs = "Summoner's Spats",
    feet = "Yigit Crackows",
  }


  --------------------------------------
  -- Midcast sets
  --------------------------------------

  sets.midcast.FastRecast = {}

  sets.midcast.Cure = {
    main = "Light Staff",
  }

  sets.midcast.Stoneskin = {
    main = "Water Staff",
  }

  sets.midcast['Elemental Magic'] = {}

  sets.midcast['Dark Magic'] = {}


  -- Avatar pact sets.  All pacts are Ability type.

  sets.midcast.Pet.BloodPactWard = {
    head = "Evoker's Horn",
    neck = "Summoning Torque",
    hands = "Summoner's Bracers",
    feet = "Nashira Crackows",
  }

  sets.midcast.Pet.DebuffBloodPactWard = {
    head = "Evoker's Horn",
    neck = "Summoning Torque",
    hands = "Summoner's Bracers",
    feet = "Nashira Crackows",
  }

  sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard

  sets.midcast.Pet.PhysicalBloodPactRage = {
    head = "Evoker's Horn",
    neck = "Summoning Torque",
    body = "Summoner's Doublet",
    hands = "Summoner's Bracers",
    legs = "Evoker's Spats",
    feet = "Summoner's Pgch.",
  }

  sets.midcast.Pet.PhysicalBloodPactRage.Acc = sets.midcast.Pet.PhysicalBloodPactRage

  sets.midcast.Pet.MagicalBloodPactRage = {
    head = "Evoker's Horn",
    neck = "Summoning Torque",
    hands = "Summoner's Bracers",
    back = "Altius Mantle",
    feet = "Nashira Crackows",
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
    main = "Dark Staff",
    neck = "Grandiose Chain",
    ear2 = "Antivenom Earring",
    head = "Yigit Turban",
    body = "Yigit Gomlek",
    back = "Intensifying Cape",
    legs = "Yigit Seraweels",
  }

  -- Idle sets
  sets.idle = {
    main = "Earth Staff",
    sub = "Staff Strap",
    ammo = "Phantom Tathlum",
    neck = "Morgana's Choker",
    ear1 = "Loquacious Earring",
    ear2 = "Antivenom Earring",
    head = "Walahra Turban",
    body = "Yinyang Robe",
    hands = "Nashira Gages",
    ring1 = "Ether Ring",
    ring2 = "Evoker's Ring",
    back = "Intensifying Cape",
    waist = "Hierarch Belt",
    legs = "Yigit Seraweels",
    feet = "Evoker's Pigaches +1",
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

  sets.idle.Avatar = set_combine(sets.idle, {
    legs = "Evoker's Spats",
  })

  -- sets.idle.PDT.Avatar = {}

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
  sets.perp.Day = {
    body="Summoner's Doublet",
  }

  sets.perp.Weather = {
    head = "Summoner's Horn"
  }

  sets.perp.Carbuncle = {
    main = "Light Staff",
    hands = "Carbuncle Mitts",
  }

  sets.perp.Fenrir = {
    main = "Dark Staff",
  }

  sets.perp.Ifrit = {
    main = "Fire Staff",
  }

  sets.perp.Titan = {
    main = "Earth Staff",
  }

  sets.perp.Leviathan = {
    main = "Water Staff",
  }

  sets.perp.Garuda = {
    main = "Wind Staff",
    head = "Karura Hachigane",
  }

  sets.perp.Shiva = {
    main = "Ice Staff",
  }

  sets.perp.Ramuh = {
    main = "Thunder Staff",
  }

  sets.perp.Diabolos = {
    main = "Dark Staff",
  }

  sets.perp.staff_and_grip = {}

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
