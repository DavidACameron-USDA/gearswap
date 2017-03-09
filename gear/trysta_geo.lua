--------------------------------------------------------------------------------
-- User setup functions for this job.
--------------------------------------------------------------------------------

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
  -- Precast sets
  --------------------------------------

  -- Precast sets to enhance JAs
  sets.precast.JA['Full Circle'] = {
    head = "Azimuth Hood",
    hands = "Bagua Mitaines",
  }
  sets.precast.JA.Bolster = {
    body = "Bagua Tunic"
  }
  sets.precast.JA['Life cycle'] = {
    body = "Geomancy Tunic",
    back = "Nantosuelta's Cape",
  }
  sets.precast.JA['Radial Arcana'] = {
    feet = "Bagua Sandals",
  }

  -- Fast cast sets for spells

  sets.precast.FC = {
    head = "Haruspex Hat",
    ear1 = "Loquacious Earring",
    back = "Lifestream Cape",
    legs = "Geomancy Pants",
    feet = "Almaric Nails",
  }

  sets.precast.FC.Cure = set_combine(sets.precast.FC, {
    ear2 = "Mendicant's Earring",
  })

  sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

  sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
    ear2 = "Barkarole Earring",
    hands = "Bagua Mitaines",
  })


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    ear2 = "Moonshade Earring",
    ring2 = "Rufescent Ring",
    legs = "Merlinic Shalwar",
  }

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
  sets.precast.WS['Flash Nova'] = {}

  sets.precast.WS['Starlight'] = {}

  sets.precast.WS['Moonlight'] = {}


  --------------------------------------
  -- Midcast sets
  --------------------------------------

  -- Base fast recast for spells
  sets.midcast.FastRecast = {
    head = "Haruspex Hat",
    ear2 = "Loquacious Earring",
    back = "Lifestream Cape",
    legs = "Geomancy Pants",
    feet = "Almaric Nails",
  }

  sets.midcast.Geomancy = {
    head = "Azimuth Hood",
    body = "Bagua Tunic",
    neck = "Incanter's Torque",
    hands = "Geomancy Mitaines +1",
    ring2 = "Renaye Ring",
    back = "Lifestream Cape",
    feet = "Bagua Sandals",
  }
  sets.midcast.Geomancy.Indi = {
    head = "Azimuth Hood",
    body = "Bagua Tunic",
    neck = "Incanter's Torque",
    hands = "Geomancy Mitaines +1",
    ring2 = "Renaye Ring",
    back = "Lifestream Cape",
    legs = "Bagua Pants",
    feet = "Azimuth Gaiters",
  }

  sets.midcast['Elemental Magic'] = {
    head = "Geomancy Galero",
    neck = "Sanctity Necklace",
    ear1 = "Friomisi Earring",
    ear2 = "Barkarole Earring",
    body = "Azimuth Coat",
    hands = "Merlinic Dastanas",
    ring1 = "Shiva Ring",
    ring2 = "Shiva Ring",
    back = "Nantosuelta's Cape",
    waist = "Refoccilation Stone",
    legs = "Merlinic Shalwar",
    feet = "Almaric Nails",
  }

  sets.midcast['Dark Magic'] = {
    head = "Bagua Galero",
    neck = "Incanter's Torque",
    ear1 = "Friomisi Earring",
    ear2 = "Barkarole Earring",
    body = "Geomancy Tunic",
    hands = "Merlinic Dastanas",
    ring1 = "Shiva Ring",
    ring2 = "Evanescence Ring",
    back = "Nantosuelta's Cape",
    waist = "Refoccilation Stone",
    legs = "Azimuth Tights",
    feet = "Almaric Nails",
  }

  sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
    head = "Pixie Hairpin +1",
  })

  sets.midcast.Aspir = sets.midcast.Drain

  sets.midcast.Cure = {
    main = "Tamaxchi",
    head = "Wayfarer Circlet",
    neck = "Incanter's Torque",
    ear1 = "Lifestorm Earring",
    ear2 = "Mendicant's Earring",
    body = "Wayfarer Robe",
    hands = "Weatherspoon Cuffs +1",
    ring1 = "Ephedra Ring",
    ring2 = "Leviathan Ring",
    back = "Solemnity Cape",
    waist = "Bishop's Sash",
    legs = "Merlinic Shalwar",
    feet = "Almaric Nails",
  }

  sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
    ring1 = "Metamorph Ring +1",
  })

  sets.midcast.Protectra = {}

  sets.midcast.Shellra = {}

  sets.midcast.Stoneskin = {}

  sets.midcast.IntEnfeebles = {
    head = "Wayfarer Circlet",
    neck = "Incanter's Torque",
    ear2 = "Barkarole Earring",
    body = "Azimuth Coat",
    hands = "Azimuth Gloves",
    ring1 = "Metamorph Ring +1",
    ring2 = "Tamas Ring",
    back = "Nantosuelta's Cape",
    waist = "Penitent's Rope",
    legs = "Merlinic Shalwar",
    feet = "Bagua Sandals",
  }

  sets.midcast.MndEnfeebles = {
    head = "Wayfarer Circlet",
    neck = "Incanter's Torque",
    ear1 = "Lifestorm Earring",
    ear2 = "Barkarole Earring",
    body = "Azimuth Coat",
    hands = "Azimuth Gloves",
    ring1 = "Metamorph Ring +1",
    ring2 = "Leviathan Ring",
    back = "Nantosuelta's Cape",
    waist = "Demonry Sash",
    legs = "Merlinic Shalwar",
    feet = "Bagua Sandals",
  }


  --------------------------------------
  -- Idle/resting/defense/etc sets
  --------------------------------------

  -- Resting sets
  sets.resting = {
    main = "Bolelabunga",
    body = "Azimuth Coat",
    ring2 = "Renaye Ring",
    legs = "Assiduity Pants",
  }


  -- Idle sets

  sets.idle = {
    main = "Solstice",
    range = "Dunna",
    head = "Wayfarer Circlet",
    neck = "Sanctity Necklace",
    ear1 = "Friomisi Earring",
    ear2 = "Barkarole Earring",
    body = "Azimuth Coat",
    hands = "Bagua Mitaines",
    ring1 = "Metamorph Ring +1",
    ring2 = "Renaye Ring",
    back = "Solemnity Cape",
    waist = "Refoccilation Stone",
    legs = "Assiduity Pants",
    feet = "Geomancy Sandals",
  }

  sets.idle.PDT = {}

  -- .Pet sets are for when Luopan is present.
  sets.idle.Pet = {
    head = "Azimuth Hood",
    ear2 = "Handler's Earring",
    hands = "Geomancy Mitaines +1",
    feet = "Bagua Sandals",
  }

  sets.idle.PDT.Pet = {
    ear2 = "Handler's Earring",
    hands = "Geomancy Mitaines +1",
    back = "Lifestream Cape",
  }

  -- Indi sets are for when an Indi-spell is active.
  sets.idle.Indi = set_combine(sets.idle, {})
  sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {})
  sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {})
  sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

  -- sets.idle.Town = {}

  -- Defense sets

  sets.defense.PDT = {
    back = "Solemnity Cape",
    feet = "Azimuth Gaiters",
  }

  sets.defense.MDT = {
    back = "Solemnity Cape",
  }

  sets.Kiting = {
    feet = "Geomancy Sandals",
  }

  sets.latent_refresh = {}


  --------------------------------------
  -- Engaged sets
  --------------------------------------

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion

  -- Normal melee group
  sets.engaged = {}

  --------------------------------------
  -- Custom buff sets
  --------------------------------------

end


--------------------------------------------------------------------------------
-- Utility functions specific to this job.
--------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
  set_macro_page(9, 3)
end
