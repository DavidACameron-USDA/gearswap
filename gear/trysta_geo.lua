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
  sets.precast.JA.Bolster = {body = "Bagua Tunic"}
  sets.precast.JA['Life cycle'] = {
    body = "Geomancy Tunic",
    back = "Nantosuelta's Cape",
  }

  -- Fast cast sets for spells

  sets.precast.FC = {
    head = "Haruspex Hat",
    ear2 = "Loquacious Earring",
    back = "Swith Cape",
    legs = "Geomancy Pants",
    feet = "Almaric Nails",
  }

  sets.precast.FC.Cure = set_combine(sets.precast.FC, {
    ear2 = "Mendicant's Earring",
  })

  sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

  sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
    hands = "Bagua Mitaines",
  })


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    ear2 = "Moonshade Earring",
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
    back = "Swith Cape",
    legs = "Geomancy Pants",
    feet = "Almaric Nails",
  }

  sets.midcast.Geomancy = {
    body = "Bagua Tunic",
    neck = "Deceiver's Torque",
    hands = "Geomancy Mitaines +1",
    feet = "Bagua Sandals",
  }
  sets.midcast.Geomancy.Indi = {
    body = "Bagua Tunic",
    neck = "Deceiver's Torque",
    hands = "Geomancy Mitaines +1",
    back = "Nantosuelta's Cape",
    legs = "Bagua Pants",
    feet = "Bagua Sandals",
  }

  sets.midcast['Elemental Magic'] = {
    head = "Geomancy Galero",
    neck = "Sanctity Necklace",
    ear1 = "Friomisi Earring",
    ear2 = "Abyssal Earring",
    body = "Bagua Tunic",
    hands = "Geomancy Mitaines +1",
    ring1 = "Shiva Ring",
    ring2 = "Shiva Ring",
    back = "Nantosuelta's Cape",
    waist = "Refoccilation Stone",
    legs = "Wayfarer Slops",
    feet = "Almaric Nails",
  }

  sets.midcast['Dark Magic'] = {
    head = "Bagua Galero",
    neck = "Deceiver's Torque",
    ear1 = "Friomisi Earring",
    ear2 = "Abyssal Earring",
    body = "Geomancy Tunic",
    hands = "Geomancy Mitaines +1",
    ring1 = "Shiva Ring",
    ring2 = "Evanescence Ring",
    back = "Nantosuelta's Cape",
    waist = "Refoccilation Stone",
    legs = "Wayfarer Slops",
    feet = "Almaric Nails",
  }

  sets.midcast.Cure = {
    main = "Tamaxchi",
    head = "Wayfarer Circlet",
    neck = "Imbodla Necklace",
    ear1 = "Lifestorm Earring",
    ear2 = "Mendicant's Earring",
    body = "Wayfarer Robe",
    hands = "Weatherspoon Cuffs +1",
    ring1 = "Ephedra Ring",
    ring2 = "Leviathan Ring",
    back = "Swith Cape",
    waist = "Bishop's Sash",
    legs = "Wayfarer Slops",
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
    neck = "Imbodla Necklace",
    ear2 = "Abyssal Earring",
    body = "Wayfarer Robe",
    hands = "Geomancy Mitaines +1",
    ring1 = "Metamorph Ring +1",
    ring2 = "Tamas Ring",
    back = "Nantosuelta's Cape",
    waist = "Penitent's Rope",
    legs = "Wayfarer Slops",
    feet = "Bagua Sandals",
  }

  sets.midcast.MndEnfeebles = {
    head = "Wayfarer Circlet",
    neck = "Imbodla Necklace",
    ear1 = "Lifestorm Earring",
    body = "Wayfarer Robe",
    hands = "Geomancy Mitaines +1",
    ring1 = "Metamorph Ring +1",
    ring2 = "Leviathan Ring",
    back = "Nantosuelta's Cape",
    waist = "Demonry Sash",
    legs = "Wayfarer Slops",
    feet = "Bagua Sandals",
  }


  --------------------------------------
  -- Idle/resting/defense/etc sets
  --------------------------------------

  -- Resting sets
  sets.resting = {
    main = "Bolelabunga",
  }


  -- Idle sets

  sets.idle = {
    main = "Solstice",
    range = "Dunna",
    head = "Wayfarer Circlet",
    neck = "Sanctity Necklace",
    ear1 = "Friomisi Earring",
    ear2 = "Loquacious Earring",
    body = "Geomancy Tunic",
    hands = "Bagua Mitaines",
    ring1 = "Metamorph Ring +1",
    ring2 = "Tamas Ring",
    back = "Nantosuelta's Cape",
    waist = "Refoccilation Stone",
    legs = "Geomancy Pants",
    feet = "Geomancy Sandals",
  }

  sets.idle.PDT = {}

  -- .Pet sets are for when Luopan is present.
  sets.idle.Pet = {
    ear2 = "Handler's Earring",
    hands = "Geomancy Mitaines +1",
  }

  sets.idle.PDT.Pet = {
    ear2 = "Handler's Earring",
    hands = "Geomancy Mitaines +1",
  }

  -- Indi sets are for when an Indi-spell is active.
  sets.idle.Indi = set_combine(sets.idle, {})
  sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {})
  sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {})
  sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

  -- sets.idle.Town = {}

  -- Defense sets

  sets.defense.PDT = {}

  sets.defense.MDT = {}

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
