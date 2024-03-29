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
	ring2 = "Kishar Ring",
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
  sets.precast.WS = {
    ear2 = "Moonshade Earring",
    ring2 = "Rufescent Ring",
  }

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
    main = "Queller Rod",
    sub = "Sors Shield",
    ammo = "Kalboron Stone",
    head = "Ebers Cap",
    neck = "Incanter's Torque",
    ear1 = "Nourishing Earring +1",
    ear2 = "Glorious Earring",
    body = "Ebers Bliaut +1",
    hands = "Weatherspoon Cuffs +1",
    ring1 = "Ephedra Ring",
    ring2 = "Tamas Ring",
    back = "Alaunus's Cape",
    waist = "Bishop's Sash",
    legs = "Ebers Pantaloons",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.Cure = {
    main = "Queller Rod",
    sub = "Sors Shield",
    ammo = "Kalboron Stone",
    head = "Ebers Cap",
    neck = "Incanter's Torque",
    ear1 = "Nourishing Earring +1",
    ear2 = "Glorious Earring",
    body = "Gendewitha Bliaut",
    hands = "Inyanga Dastanas +1",
    ring1 = "Ephedra Ring",
    ring2 = "Tamas Ring",
    back = "Alaunus's Cape",
    waist = "Bishop's Sash",
    legs = "Ebers Pantaloons",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.Curaga = {
    main = "Queller Rod",
    sub = "Sors Shield",
    ammo = "Kalboron Stone",
    head = "Ebers Cap",
    neck = "Imbodla Necklace",
    ear1 = "Nourishing Earring +1",
    ear2 = "Glorious Earring",
    body = "Gendewitha Bliaut",
    hands = "Inyanga Dastanas +1",
    ring1 = "Leviathan Ring",
    ring2 = "Tamas Ring",
    back = "Alaunus's Cape",
    waist = "Porous Rope",
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
    neck = "Incanter's Torque",
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
    waist = "Porous Rope",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.Auspice = {
    feet = "Ebers Duckbills",
  }

  sets.midcast.BarElement = {
    head = "Ebers Cap",
    body = "Ebers Bliaut +1",
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
    neck = "Sanctity Necklace",
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
    neck = "Incanter's Torque",
    ear1 = "Influx Earring",
    body = "Inyanga Jubbah +1",
    hands = "Inyanga Dastanas +1",
    ring1 = "Metamorph Ring +1",
	ring2 = "Kishar Ring",
    back = "Alaunus's Cape",
    waist = "Luminary Sash",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.IntEnfeebles = {
    head = "Inyanga Tiara",
    neck = "Incanter's Torque",
    body = "Inyanga Jubbah +1",
    hands = "Inyanga Dastanas +1",
    ring1 = "Metamorph Ring +1",
	ring2 = "Kishar Ring",
    back = "Alaunus's Cape",
    waist = "Luminary Sash",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }


  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {
    main = "Bolelabunga",
    neck = "Sanctity Necklace",
    body = "Ebers Bliaut +1",
    waist = "Hierarch Belt",
    legs = "Assiduity Pants +1",
  }


  -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
  sets.idle = {
    main = "Bolelabunga",
    sub = "Sors Shield",
    ammo = "Kalboron Stone",
    head = "Inyanga Tiara",
    neck = "Sanctity Necklace",
    ear1 = "Nourishing Earring +1",
    ear2 = "Glorious Earring",
    body = "Ebers Bliaut +1",
    hands = "Inyanga Dastanas +1",
    ring1 = "Defending Ring",
    ring2 = "Tamas Ring",
    back = "Solemnity Cape",
    waist = "Luminary Sash",
    legs = "Assiduity Pants +1",
    feet = "Herald's Gaiters",
  }

  sets.idle.PDT = {
    body = "Gendewitha Bliaut",
    ring1 = "Defending Ring",
  }

  sets.idle.Town = set_combine(sets.idle, {
    legs = "Tatsumaki Sitagoromo",
  })

  -- sets.idle.Weak = {}

  -- Defense sets

  sets.defense.PDT = {
    ring1 = "Defending Ring",
  }

  sets.defense.MDT = {
    ring1 = "Defending Ring",
  }

  sets.Kiting = {
    ring1 = "Defending Ring",
  }

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
    neck = "Sanctity Necklace",
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
