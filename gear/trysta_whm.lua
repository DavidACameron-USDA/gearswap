-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  state.OffenseMode:options('None', 'Normal')
  state.CastingMode:options('Normal', 'Resistant')
  state.IdleMode:options('Normal', 'PDT')

  select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
  --------------------------------------
  -- Start defining the sets
  --------------------------------------

  -- Precast Sets

  -- Fast cast sets for spells
  sets.precast.FC = {
    head = "Walahra Turban",
    ear2 = "Loquacious Earring",
    hands = "Blessed Mitts",
    legs = "Blessed Trousers",
    feet = "Blessed Pumps",
  }

  sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

  sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

  sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {})

  sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

  sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {})

  sets.precast.FC.Curaga = sets.precast.FC.Cure

  -- Precast sets to enhance JAs
  sets.precast.JA.Benediction = {}

  -- Waltz set (chr and vit)
  sets.precast.Waltz = {}


  -- Weaponskill sets

  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {}

  sets.precast.WS['Flash Nova'] = {}


  -- Midcast Sets

  sets.midcast.FastRecast = {
    head = "Walahra Turban",
    ear2 = "Loquacious Earring",
    hands = "Blessed Mitts",
    legs = "Blessed Trousers",
    feet = "Blessed Pumps",
  }

  -- Cure sets
  sets.midcast.CureSolace = {}

  sets.midcast.Cure = {
    main = "Light Staff",
    ammo = "Holy Ampulla",
    head = "Teal Chapeau",
    neck = "Morgana's Choker",
    body = "Noble's Tunic",
    hands = "Blessed Mitts",
    ring1 = "Omega Ring",
    ring2 = "Tamas Ring",
    back = "Aslan Cape",
    legs = "Blessed Trousers",
    feet = "Cleric's Duckbills",
  }

  sets.midcast.Curaga = {
    main = "Light Staff",
    ammo = "Holy Ampulla",
    head = "Teal Chapeau",
    neck = "Morgana's Choker",
    body = "Noble's Tunic",
    hands = "Blessed Mitts",
    ring1 = "Omega Ring",
    ring2 = "Tamas Ring",
    back = "Aslan Cape",
    legs = "Blessed Trousers",
    feet = "Cleric's Duckbills",
  }

  sets.midcast.CureMelee = {
    ammo = "Holy Ampulla",
    head = "Teal Chapeau",
    neck = "Morgana's Choker",
    body = "Noble's Tunic",
    hands = "Blessed Mitts",
    ring1 = "Omega Ring",
    ring2 = "Tamas Ring",
    back = "Aslan Cape",
    legs = "Blessed Trousers",
    feet = "Cleric's Duckbills",
  }

  sets.midcast.StatusRemoval = {

  }

  -- 110 total Enhancing Magic Skill; caps even without Light Arts
  sets.midcast['Enhancing Magic'] = {

  }

  sets.midcast.Stoneskin = {

  }

  sets.midcast.Auspice = {

  }

  sets.midcast.BarElement = {

  }

  sets.midcast.Regen = {

  }

  sets.midcast.Protectra = {}

  sets.midcast.Shellra = {}


  sets.midcast['Divine Magic'] = {

  }

  sets.midcast['Dark Magic'] = {}

  -- Custom spell classes
  sets.midcast.MndEnfeebles = {

  }

  sets.midcast.IntEnfeebles = {

  }


  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {
    main = "Dark Staff",
    ear1 = "Antivenom Earring",
    body = "Errant Hpl.",
    neck = "Grandiose Chain",
    hands = "Oracle's Gloves",
    waist = "Hierarch Belt",
    feet = "Goliard Clogs",
  }


  -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
  sets.idle = {
    main = "Earth Staff",
    sub = "Staff Strap",
    ammo = "Holy Ampulla",
    head = "Walahra Turban",
    neck = "Morgana's Choker",
    ear1 = "Insomnia Earring",
    ear2 = "Loquacious Earring",
    body = "Cleric's Briault",
    hands = "Blessed Mitts",
    ring1 = "Omega Ring",
    ring2 = "Tamas Ring",
    back = "Aslan Cape",
    waist = "Hierarch Belt",
    legs = "Tatsumaki Sitagoromo",
    feet = "Blessed Pumps",
  }

  -- sets.idle.PDT = {}

  -- sets.idle.Town = {}

  -- sets.idle.Weak = {}

  -- Defense sets

  sets.defense.PDT = {}

  sets.defense.MDT = {}

  sets.Kiting = {}

  sets.latent_refresh = {}

  -- Engaged sets

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion

  -- Basic set for if no TP weapon is defined.
  sets.engaged = {}


  -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
  sets.buff['Divine Caress'] = {}
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
  -- Default macro set/book
  set_macro_page(1, 3)
end
