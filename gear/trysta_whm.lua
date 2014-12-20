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
    ear2 = "Loquacious Earring",
  }

  sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

  sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

  sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {})

  sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

  sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
    head = "Theophany Cap",
  })

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
    head = "Wayfarer Circlet",
    ear2 = "Loquacious Earring",
    body = "Wayfarer Robe",
    hands = "Weatherspoon Cuffs +1",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }

  -- Cure sets
  sets.midcast.CureSolace = {
    body = "Orison Bliaud +1",
  }

  sets.midcast.Cure = {
    main = "Eminent Wand",
    sub = "Sors Shield",
    ammo = "Kalboron Stone",
    head = "Theophany Cap",
    neck = "Imbodla Necklace",
    ear1 = "Influx Earring",
    body = "Gendewitha Bliaut",
    hands = "Weatherspoon Cuffs +1",
    ring1 = "Ephedra Ring",
    ring2 = "Tamas Ring",
    back = "Orison Cape",
    waist = "Bishop's Sash",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.Curaga = {
    main = "Eminent Wand",
    sub = "Sors Shield",
    ammo = "Kalboron Stone",
    head = "Theophany Cap",
    neck = "Imbodla Necklace",
    ear1 = "Influx Earring",
    body = "Gendewitha Bliaut",
    hands = "Weatherspoon Cuffs +1",
    ring1 = "Omega Ring",
    ring2 = "Tamas Ring",
    back = "Orison Cape",
    waist = "Demonry Sash",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.CureMelee = set_combine(sets.midcast.Cure, {
    main = "",
    sub = "",
  })

  sets.midcast.StatusRemoval = {
    head = "Orison Cap +2",
  }

  sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {
    ring1 = "Ephedra Ring",
    legs = "Theophany Pantaloons",
    feet = "Gendewitha Galoshes",
  })

  -- 110 total Enhancing Magic Skill; caps even without Light Arts
  sets.midcast['Enhancing Magic'] = {
    feet = "Cleric's Duckbills",
  }

  sets.midcast.Stoneskin = {
    main = "Eminent Wand",
    ammo = "Kalboron Stone",
    head = "Wayfarer Circlet",
    neck = "Imbodla Necklace",
    ear1 = "Influx Earring",
    body = "Wayfarer Robe",
    hands = "Wayfarer Cuffs",
    ring1 = "Omega Ring",
    ring2 = "Tamas Ring",
    back = "Aslan Cape",
    waist = "Demonry Sash",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.Auspice = {}

  sets.midcast.BarElement = {
    legs = "Cleric's Pantaloons",
  }

  sets.midcast.Regen = {
    body = "Cleric's Briault",
    hands = "Orison Mitts +1",
    legs = "Theophany Pantaloons",
  }

  sets.midcast.Protectra = {}

  sets.midcast.Shellra = {}


  sets.midcast['Divine Magic'] = {
    head = "Wayfarer Circlet",
    ear1 = "Influx Earring",
    body = "Wayfarer Robe",
    hands = "Wayfarer Cuffs",
    waist = "Bishop's Sash",
    legs = "Theophany Pantaloons",
    feet = "Gendewitha Galoshes",
  }

  sets.midcast['Dark Magic'] = {}

  -- Custom spell classes
  sets.midcast.MndEnfeebles = {
    ammo = "Kalboron Stone",
    head = "Wayfarer Circlet",
    neck = "Imbodla Necklace",
    ear1 = "Influx Earring",
    body = "Healer's Briault",
    hands = "Cleric's Mitts",
    ring1 = "Omega Ring",
    ring2 = "Tamas Ring",
    back = "Aslan Cape",
    waist = "Demonry Sash",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.IntEnfeebles = {
    head = "Wayfarer Circlet",
    neck = "Imbodla Necklace",
    body = "Healer's Briault",
    hands = "Cleric's Mitts",
    ring1 = "Omega Ring",
    ring2 = "Tamas Ring",
    waist = "Demonry Sash",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }


  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {
    main = "Dark Staff",
    head = "Wayfarer Circlet",
    body = "Wayfarer Robe",
    neck = "Grandiose Chain",
    hands = "Wayfarer Cuffs",
    waist = "Hierarch Belt",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }


  -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
  sets.idle = {
    main = "Eminent Wand",
    sub = "Sors Shield",
    ammo = "Kalboron Stone",
    head = "Wayfarer Circlet",
    neck = "Imbodla Necklace",
    ear1 = "Influx Earring",
    ear2 = "Loquacious Earring",
    body = "Gendewitha Bliaut",
    hands = "Weatherspoon Cuffs +1",
    ring1 = "Ephedra Ring",
    ring2 = "Tamas Ring",
    back = "Orison Cape",
    legs = "Tatsumaki Sitagoromo",
    feet = "Gendewitha Galoshes",
  }

  -- sets.idle.PDT = {}

  sets.idle.Town = set_combine(sets.idle, {
    legs = "Tatsumaki Sitagoromo",
  })

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
  sets.engaged = {
    main = "Eminent Wand",
    sub = "Sors Shield",
    ammo = "Kalboron Stone",
    head = "Wayfarer Circlet",
    neck = "Imbodla Necklace",
    ear1 = "Influx Earring",
    ear2 = "Loquacious Earring",
    body = "Wayfarer Robe",
    hands = "Weatherspoon Cuffs +1",
    ring1 = "Ephedra Ring",
    ring2 = "Tamas Ring",
    back = "Orison Cape",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }


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
