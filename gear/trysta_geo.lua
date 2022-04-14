--------------------------------------------------------------------------------
-- User setup functions for this job.
--------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  state.OffenseMode:options('None', 'Normal')
  state.CastingMode:options('Normal', 'Resistant')
  state.IdleMode:options('Normal', 'PDT')

  gear.nant_cape_nuke = { name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
  gear.nant_cape_pet_regen = { name="Nantosuelta's Cape", augments={'Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}

  gear.telchine_legs_pet = { name="Telchine Braconi", augments={'Pet: "Regen"+3','Pet: Damage taken -4%',}}

  select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()

  --------------------------------------
  -- Precast sets
  --------------------------------------

  -- Precast sets to enhance JAs
  sets.precast.JA['Full Circle'] = {
    head = "Azimuth Hood +1",
    hands = "Bagua Mitaines +1",
  }
  sets.precast.JA.Bolster = {
    body = "Bagua Tunic +1"
  }
  sets.precast.JA['Life cycle'] = {
    body = "Geomancy Tunic +3",
    back = gear.nant_cape_pet_regen,
  }
  sets.precast.JA['Radial Arcana'] = {
    feet = "Bagua Sandals +3",
  }

  -- Fast cast sets for spells

  sets.precast.FC = {
    head = "Haruspex Hat",
    ear1 = "Malignance Earring",
    ear2 = "Loquacious Earring",
	ring2 = "Kishar Ring",
    back = "Lifestream Cape",
    legs = "Geomancy Pants +2",
    feet = "Amalric Nails",
  }

  sets.precast.FC.Cure = set_combine(sets.precast.FC, {
    ear2 = "Mendicant's Earring",
  })

  sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

  sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
    ear2 = "Barkarole Earring",
    body = "Mallquis Saio",
    hands = "Bagua Mitaines +1",
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
    legs = "Geomancy Pants +2",
    feet = "Amalric Nails",
  }

  sets.midcast.Geomancy = {
    head = "Azimuth Hood +1",
    ear1 = "Gna Earring",
    ear2 = "Calamitous Earring",
    body = "Bagua Tunic +1",
    neck = "Incanter's Torque",
    hands = "Geomancy Mitaines +3",
    ring2 = "Renaye Ring",
    back = "Lifestream Cape",
  }
  sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
    legs = "Bagua Pants",
    feet = "Azimuth Gaiters",
  })

  sets.midcast['Elemental Magic'] = {
    head = "Jhakri Coronal +2",
    neck = "Mizukage-no-Kubikazari",
    ear1 = "Malignance Earring",
    ear2 = "Barkarole Earring",
    body = "Jhakri Robe +2",
    hands = "Jhakri Cuffs +1",
    ring1 = "Shiva Ring",
    ring2 = "Shiva Ring",
    back = gear.nant_cape_nuke,
    waist = "Refoccilation Stone",
    legs = "Merlinic Shalwar",
    feet = "Jhakri Pigaches +2",
  }

  sets.midcast['Dark Magic'] = {
    head = "Mallquis Chapeau +1",
	neck = "Erra Pendant",
    ear1 = "Malignance Earring",
    ear2 = "Barkarole Earring",
    body = "Geomancy Tunic +3",
    hands = "Mallquis Cuffs +1",
    ring1 = "Shiva Ring",
    ring2 = "Evanescence Ring",
    back = gear.nant_cape_nuke,
    waist = "Refoccilation Stone",
    legs = "Azimuth Tights",
    feet = "Mallquis Clogs +1",
  }

  sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
    head = "Pixie Hairpin +1",
	neck = "Erra Pendant",
  })

  sets.midcast.Aspir = sets.midcast.Drain

  sets.midcast.Cure = {
    main = "Tamaxchi",
    head = "Geomancy Galero +2",
    neck = "Incanter's Torque",
    ear1 = "Malignance Earring",
    ear2 = "Mendicant's Earring",
    body = "Mallquis Saio",
    hands = "Weatherspoon Cuffs +1",
    ring1 = "Ephedra Ring",
    ring2 = "Leviathan Ring",
    back = "Solemnity Cape",
    waist = "Bishop's Sash",
    legs = "Perdition Slops",
    feet = "Mallquis Clogs",
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
    ear1 = "Malignance Earring",
    ear2 = "Barkarole Earring",
    body = "Jhakri Robe +2",
    hands = "Azimuth Gloves",
    ring1 = "Metamorph Ring +1",
	ring2 = "Kishar Ring",
    back = gear.nant_cape_nuke,
    waist = "Penitent's Rope",
    legs = "Jhakri Slops +1",
    foot = "Jhakri Pigaches +2",
  }

  sets.midcast.MndEnfeebles = {
    head = "Geomancy Galero +2",
    neck = "Incanter's Torque",
    ear1 = "Malignance Earring",
    ear2 = "Barkarole Earring",
    body = "Jhakri Robe +2",
    hands = "Azimuth Gloves",
    ring1 = "Metamorph Ring +1",
	ring2 = "Kishar Ring",
    back = gear.nant_cape_nuke,
    waist = "Porous Rope",
    legs = "Jhakri Slops +1",
    foot = "Jhakri Pigaches +2",
  }


  --------------------------------------
  -- Idle/resting/defense/etc sets
  --------------------------------------

  -- Resting sets
  sets.resting = {
    main = "Bolelabunga",
    neck = "Sanctity Necklace",
    body = "Jhakri Robe +2",
    hands = "Bagua Mitaines +1",
    ring2 = "Renaye Ring",
    legs = "Assiduity Pants +1",
  }


  -- Idle sets

  sets.idle = {
    main = "Idris",
	sub = "Genmei Shield",
    range = "Dunna",
    head = "Hike Khat +1",
    neck = "Loricate Torque +1",
    ear1 = "Malignance Earring",
    ear2 = "Lugalbanda Earring",
    body = "Jhakri Robe +2",
    hands = "Bagua Mitaines +1",
    ring1 = "Defending Ring",
    ring2 = "Renaye Ring",
    back = "Solemnity Cape",
    waist = "Refoccilation Stone",
    legs = "Assiduity Pants +1",
    feet = "Geomancy Sandals +2",
  }

  sets.idle.PDT = {
    body = "Mallquis Saio",
    hands = "Geomancy Mitaines +3",
    ring1 = "Defending Ring",
    back = "Solemnity Cape",
    feet = "Azimuth Gaiters",
  }

  -- .Pet sets are for when Luopan is present.
  sets.idle.Pet = {
    head = "Azimuth Hood +1",
	neck = "Bagua Charm +2",
    ear2 = "Handler's Earring",
	body = "Geomancy Tunic +3",
    hands = "Geomancy Mitaines +3",
    back = gear.nant_cape_pet_regen,
    waist = "Isa Belt",
	legs = gear.telchine_legs_pet,
    feet = "Bagua Sandals +3",
  }

  sets.idle.PDT.Pet = {
    hands = "Artsieq Cuffs",
  }

  -- Indi sets are for when an Indi-spell is active.
  sets.idle.Indi = set_combine(sets.idle, {})
  sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {})
  sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {})
  sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

  -- sets.idle.Town = {}

  -- Defense sets

  sets.defense.PDT = {
    body = "Mallquis Saio",
    hands = "Geomancy Mitaines +3",
    ring1 = "Defending Ring",
    back = "Solemnity Cape",
    feet = "Azimuth Gaiters",
  }

  sets.defense.MDT = {
    body = "Mallquis Saio",
    ring1 = "Defending Ring",
    back = "Solemnity Cape",
  }

  sets.Kiting = {
    ring1 = "Defending Ring",
    feet = "Geomancy Sandals +2",
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
