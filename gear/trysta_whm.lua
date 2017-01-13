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
    head = "Haruspex Hat",
    body = "Inyanga Jubbah +1",
    hands = "Gendewitha Gages",
    back = "Swith Cape",
  }

  sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

  sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

  sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
    legs = "Ebers Pantaloons",
  })

  sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

  sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
    head = "Theophany Cap",
    ear1 = "Nourishing Earring +1",
    ear2 = "Mendicant's Earring",
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
    head = "Haruspex Hat",
    ear2 = "Loquacious Earring",
    body = "Inyanga Jubbah +1",
    hands = "Gendewitha Gages",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }

  -- Cure sets
  sets.midcast.CureSolace = {
    main = "Tamaxchi",
    sub = "Sors Shield",
    ammo = "Kalboron Stone",
    head = "Ebers Cap",
    neck = "Imbodla Necklace",
    ear1 = "Nourishing Earring +1",
    ear2 = "Mendicant's Earring",
    body = "Ebers Bliaud",
    hands = "Weatherspoon Cuffs +1",
    ring1 = "Ephedra Ring",
    ring2 = "Tamas Ring",
    back = "Alaunus's Cape",
    waist = "Bishop's Sash",
    legs = "Ebers Pantaloons",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.Cure = {
    main = "Tamaxchi",
    sub = "Sors Shield",
    ammo = "Kalboron Stone",
    head = "Ebers Cap",
    neck = "Imbodla Necklace",
    ear1 = "Nourishing Earring +1",
    ear2 = "Mendicant's Earring",
    body = "Gendewitha Bliaut",
    hands = "Weatherspoon Cuffs +1",
    ring1 = "Ephedra Ring",
    ring2 = "Tamas Ring",
    back = "Alaunus's Cape",
    waist = "Bishop's Sash",
    legs = "Ebers Pantaloons",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.Curaga = {
    main = "Tamaxchi",
    sub = "Sors Shield",
    ammo = "Kalboron Stone",
    head = "Ebers Cap",
    neck = "Imbodla Necklace",
    ear1 = "Nourishing Earring +1",
    ear2 = "Mendicant's Earring",
    body = "Gendewitha Bliaut",
    hands = "Weatherspoon Cuffs +1",
    ring1 = "Leviathan Ring",
    ring2 = "Tamas Ring",
    back = "Alaunus's Cape",
    waist = "Demonry Sash",
    legs = "Ebers Pantaloons",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.CureMelee = set_combine(sets.midcast.Cure, {
    main = "",
    sub = "",
  })

  sets.midcast.StatusRemoval = {
    head = "Ebers Cap",
    legs = "Ebers Pantaloons",
  }

  sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {
    ring1 = "Ephedra Ring",
    back = "Alaunus's Cape",
    legs = "Theophany Pantaloons",
    feet = "Gendewitha Galoshes",
  })

  -- 110 total Enhancing Magic Skill; caps even without Light Arts
  sets.midcast['Enhancing Magic'] = {
    hands = "Inyanga Dastanas +1",
    feet = "Ebers Duckbills",
  }

  sets.midcast.Stoneskin = {
    main = "Bolelabunga",
    ammo = "Kalboron Stone",
    head = "Inyanga Tiara",
    neck = "Imbodla Necklace",
    ear1 = "Influx Earring",
    body = "Inyanga Jubbah +1",
    hands = "Inyanga Dastanas +1",
    ring1 = "Leviathan Ring",
    ring2 = "Tamas Ring",
    back = "Alaunus's Cape",
    waist = "Demonry Sash",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.Auspice = {
    feet = "Ebers Duckbills",
  }

  sets.midcast.BarElement = {
    head = "Ebers Cap",
    body = "Ebers Bliaud",
    hands = "Ebers Mitts",
    legs = "Cleric's Pantaloons",
    feet = "Ebers Duckbills",
  }

  sets.midcast.Regen = {
    main = "Bolelabunga",
    head = "Inyanga Tiara",
    body = "Cleric's Briault",
    hands = "Ebers Mitts",
    legs = "Theophany Pantaloons",
  }

  sets.midcast.Protectra = {}

  sets.midcast.Shellra = {}


  sets.midcast['Divine Magic'] = {
    head = "Inyanga Tiara",
    ear1 = "Influx Earring",
    body = "Inyanga Jubbah +1",
    hands = "Inyanga Dastanas +1",
    back = "Alaunus's Cape",
    waist = "Bishop's Sash",
    legs = "Theophany Pantaloons",
    feet = "Gendewitha Galoshes",
  }

  sets.midcast['Dark Magic'] = {}

  -- Custom spell classes
  sets.midcast.MndEnfeebles = {
    ammo = "Kalboron Stone",
    head = "Inyanga Tiara",
    neck = "Imbodla Necklace",
    ear1 = "Influx Earring",
    body = "Inyanga Jubbah +1",
    hands = "Inyanga Dastanas +1",
    ring1 = "Metamorph Ring +1",
    ring2 = "Leviathan Ring",
    back = "Alaunus's Cape",
    waist = "Demonry Sash",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.IntEnfeebles = {
    head = "Inyanga Tiara",
    neck = "Imbodla Necklace",
    body = "Inyanga Jubbah +1",
    hands = "Inyanga Dastanas +1",
    ring1 = "Metamorph Ring +1",
    ring2 = "Tamas Ring",
    back = "Alaunus's Cape",
    waist = "Demonry Sash",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }


  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {
    main = "Bolelabunga",
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
    main = "Bolelabunga",
    sub = "Sors Shield",
    ammo = "Kalboron Stone",
    head = "Inyanga Tiara",
    neck = "Imbodla Necklace",
    ear1 = "Nourishing Earring +1",
    ear2 = "Mendicant's Earring",
    body = "Ebers Bliaud",
    hands = "Inyanga Dastanas +1",
    ring1 = "Metamorph Ring +1",
    ring2 = "Tamas Ring",
    back = "Alaunus's Cape",
    legs = "Ebers Pantaloons",
    feet = "Herald's Gaiters",
  }

  sets.idle.PDT = {
    body = "Gendewitha Bliaut",
  }

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
    main = "Bolelabunga",
    sub = "Sors Shield",
    ammo = "Kalboron Stone",
    head = "Inyanga Tiara",
    neck = "Imbodla Necklace",
    ear1 = "Nourishing Earring +1",
    ear2 = "Loquacious Earring",
    body = "Inyanga Jubbah +1",
    hands = "Inyanga Dastanas +1",
    ring1 = "Ephedra Ring",
    ring2 = "Tamas Ring",
    back = "Alaunus's Cape",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }


  -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
  sets.buff['Divine Caress'] = {
    hands = "Ebers Mitts",
  }
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
  -- Default macro set/book
  set_macro_page(1, 3)
end
