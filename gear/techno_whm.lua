-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  state.OffenseMode:options('None', 'Normal')
  state.CastingMode:options('Normal', 'Resistant')
  state.IdleMode:options('Normal', 'PDT')

  gear.fc_helios_boots = {name="Helios Boots", augments={'"Mag. Atk. Bns."+4', '"Fast Cast"+5', 'Mag. crit. hit dmg. +8%'}}

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
    head = "Natirah Hat",
    neck = "Baetyl Pendant",
    ear2 = "Loquacious Earring",
    body = "Inyanga Jubbah",
    ring1 = "Weatherspoon Ring",
    back = "Swith Cape",
    legs = "Orvail Pants +1",
    feet = gear.fc_helios_boots
  }

  sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
    waist = "Siegel Sash",
  })

  sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

  sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
    legs = "Ebers Pantaloons",
  })

  sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

  sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
    ear1 = "Nourishing Earring",
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
  }

  sets.precast.WS['Flash Nova'] = {}


  -- Midcast Sets

  sets.midcast.FastRecast = {
    head = "Natirah Hat",
    neck = "Baetyl Pendant",
    ear2 = "Loquacious Earring",
    body = "Inyanga Jubbah",
    ring1 = "Weatherspoon Ring",
    legs = "Orvail Pants +1",
    feet = gear.fc_helios_boots
  }

  -- Cure sets
  sets.midcast.CureSolace = {
    main = "Tamaxchi",
    head = "Chironic Hat",
    neck = "Incanter's Torque",
    ear1 = "Nourishing Earring",
    ear2 = "Glorious Earring",
    body = "Inyanga Jubbah",
    hands = "Telchine Gloves",
    ring2 = "Metamorph Ring",
    back = "Solemnity Cape",
    waist = "Demonry Sash",
    legs = "Ebers Pantaloons",
    feet = "Medium's Sabots",
  }

  sets.midcast.Cure = {
    main = "Tamaxchi",
    head = "Chironic Hat",
    neck = "Incanter's Torque",
    ear1 = "Nourishing Earring",
    ear2 = "Glorious Earring",
    body = "Inyanga Jubbah",
    hands = "Telchine Gloves",
    ring2 = "Metamorph Ring",
    back = "Solemnity Cape",
    waist = "Demonry Sash",
    legs = "Ebers Pantaloons",
    feet = "Medium's Sabots",
  }

  sets.midcast.Curaga = {
    main = "Tamaxchi",
    head = "Chironic Hat",
    neck = "Imbodla Necklace",
    ear1 = "Nourishing Earring",
    ear2 = "Glorious Earring",
    body = "Inyanga Jubbah",
    hands = "Telchine Gloves",
    ring2 = "Metamorph Ring",
    back = "Solemnity Cape",
    waist = "Demonry Sash",
    legs = "Ebers Pantaloons",
    feet = "Medium's Sabots",
  }

  sets.midcast.CureMelee = set_combine(sets.midcast.Cure, {
    main = "",
    sub = "",
  })

  sets.midcast.StatusRemoval = {
    legs = "Ebers Pantaloons",
  }

  sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {
    back = "Mending Cape",
    feet = "Gendewitha Galoshes",
  })

  -- 110 total Enhancing Magic Skill; caps even without Light Arts
  sets.midcast['Enhancing Magic'] = {
    head = "Umuthi Hat",
    hands = "Chironic Gloves",
    feet = "Ebers Duckbills",
  }

  sets.midcast.Stoneskin = {
    main = "Nibiru Cudgel",
    head = "Umuthi Hat",
    neck = "Imbodla Necklace",
    ear1 = "Influx Earring",
    ear2 = "Lifestorm Earring",
    body = "Inyanga Jubbah",
    hands = "Inyanga Dastanas",
    ring2 = "Metamorph Ring",
    back = "Swith Cape",
    waist = "Siegel Sash",
    legs = "Inyanga Shalwar",
    feet = "Medium's Sabots",
  }

  sets.midcast.Auspice = {}

  sets.midcast.BarElement = {}

  sets.midcast.Regen = {
    main = "Bolelabunga",
    head = "Inyanga Tiara",
  }

  sets.midcast.Protectra = {}

  sets.midcast.Shellra = {}


  sets.midcast['Divine Magic'] = {
    head = "Inyanga Tiara",
    neck = "Incanter's Torque",
    ear1 = "Influx Earring",
    ear2 = "Lifestorm Earring",
    body = "Inyanga Jubbah",
    hands = "Inyanga Dastanas",
    ring1 = "Weatherspoon Ring",
    ring2 = "Metamorph Ring",
    back = "Swith Cape",
    waist = "Refoccilation Stone",
    legs = "Inyanga Shalwar",
    feet = "Medium's Sabots",
  }

  sets.midcast['Dark Magic'] = {}

  -- Custom spell classes
  sets.midcast.MndEnfeebles = {
    head = "Inyanga Tiara",
    neck = "Incanter's Torque",
    ear1 = "Psystorm Earring",
    ear2 = "Lifestorm Earring",
    body = "Inyanga Jubbah",
    hands = "Inyanga Dastanas",
    ring1 = "Weatherspoon Ring",
    ring2 = "Metamorph Ring",
    back = "Mending Cape",
    waist = "Demonry Sash",
    legs = "Inyanga Shalwar",
    feet = "Medium's Sabots",
  }

  sets.midcast.IntEnfeebles = {
    head = "Inyanga Tiara",
    neck = "Incanter's Torque",
    ear1 = "Psystorm Earring",
    ear2 = "Lifestorm Earring",
    body = "Inyanga Jubbah",
    hands = "Inyanga Dastanas",
    ring1 = "Weatherspoon Ring",
    ring2 = "Metamorph Ring",
    back = "Mending Cape",
    waist = "Demonry Sash",
    legs = "Inyanga Shalwar",
    feet = "Medium's Sabots",
  }


  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {
    main = "Bolelabunga",
    neck = "Sanctity Necklace",
    body = "Artsieq Jubbah",
    legs = "Assiduity Pants",
  }


  -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
  sets.idle = {
    main = "Bolelabunga",
    head = "Inyanga Tiara",
    neck = "Twilight Torque",
    ear1 = "Nourishing Earring",
    ear2 = "Glorious Earring",
    body = "Artsieq Jubbah",
    hands = "Inyanga Dastanas",
    ring1 = "Defending Ring",
    ring2 = "Metamorph Ring",
    back = "Solemnity Cape",
    waist = "Fucho-no-Obi",
    legs = "Assiduity Pants",
    feet = "Chironic Slippers",
  }

  sets.idle.PDT = {
    neck = "Twilight Torque",
    back = "Solemnity Cape",
    feet = "Chironic Slippers",
  }

  -- sets.idle.Town = {}

  -- sets.idle.Weak = {}

  -- Defense sets

  sets.defense.PDT = {
    head = "Ayanmo Zucchetto",
    neck = "Twilight Torque",
    body = "Ayanmo Corazza",
    hands = "Ayanmo Manopolas +1",
    back = "Solemnity Cape",
    legs = "Ayanmo Cosciales",
    feet = "Chironic Slippers",
  }

  sets.defense.MDT = {
    head = "Inyanga Tiara",
    neck = "Twilight Torque",
    body = "Inyanga Jubbah",
    hands = "Inyanga Dastanas",
    back = "Solemnity Cape",
    legs = "Ayanmo Cosciales",
  }

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
