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
  sets.precast.JA['Life cycle'] = {body = "Geomancy Tunic +1"}

  -- Fast cast sets for spells

  sets.precast.FC = {
    head = "Nahtirah Hat",
    neck = "Baetyl Pendant",
    ear2 = "Loquacious Earring",
    ring1 = "Weatherspoon Ring",
    back = "Lifestream Cape",
    legs = "Geomancy Pants",
    feet = "Helios Boots",
  }

  sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

  sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
    waist = "Siegel Sash",
  })

  sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    neck = gear.ElementalGorget,
    hands = "Jhakri Cuffs",
    waist = gear.ElementalBelt,
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
    
  }

  sets.midcast.Geomancy = {
    range = "Nepote Bell",
    hands = "Geomancy Mitaines +1",
    back = "Lifestream Cape",
  }
  sets.midcast.Geomancy.Indi = {
    range = "Nepote Bell",
    hands = "Geomancy Mitaines +1",
    back = "Lifestream Cape",
  }

  sets.midcast['Elemental Magic'] = {
    head = "Jhakri Coronal +1",
    neck = "Eddy Necklace",
    ear1 = "Friomisi Earring",
    ear2 = "Hecate's Earring",
    body = "Jhakri Robe +1",
    hands = "Jhakri Cuffs +1",
    ring1 = "Shiva Ring",
    ring2 = "Metamorph Ring",
    back = "Argochampsa Mantle",
    waist = gear.ElementalObi,
    legs = "Hagondes Pants",
    foot = "Jhakri Pigaches",
  }

  sets.midcast['Dark Magic'] = {
    head = "Jhakri Coronal +1",
    neck = "Eddy Necklace",
    ear1 = "Friomisi Earring",
    ear2 = "Hecate's Earring",
    body = "Jhakri Robe +1",
    hands = "Jhakri Cuffs +1",
    ring1 = "Shiva Ring",
    ring2 = "Metamorph Ring",
    back = "Argochampsa Mantle",
    waist = gear.ElementalObi,
    legs = "Hagondes Pants",
    foot = "Jhakri Pigaches",
  }

  sets.midcast.Cure = {
    main = "Tamaxchi",
  }

  sets.midcast.Curaga = sets.midcast.Cure

  sets.midcast.Protectra = {}

  sets.midcast.Shellra = {}

  sets.midcast.Stoneskin = {
    waist = "Siegel Sash",
  }

  sets.midcast.IntEnfeebles = {
    head = "Jhakri Coronal +1",
    neck = "Imbodla Necklace",
    ear1 = "Lifestorm Earring",
    ear2 = "Psystorm Earring",
    body = "Jhakri Robe +1",
    hands = "Jhakri Cuffs +1",
    ring1 = "Shiva Ring",
    back = "Lifestream Cape",
    waist = "Yamabuki-no-obi",
    legs = "Perdition Slops",
    foot = "Jhakri Pigaches",
  }

  sets.midcast.MndEnfeebles = {
    head = "Jhakri Coronal +1",
    neck = "Imbodla Necklace",
    ear1 = "Lifestorm Earring",
    ear2 = "Psystorm Earring",
    body = "Jhakri Robe +1",
    hands = "Jhakri Cuffs +1",
    ring1 = "Weatherspoon Ring",
    back = "Lifestream Cape",
    waist = "Demonry Sash",
    legs = "Perdition Slops",
    foot = "Jhakri Pigaches",
  }


  --------------------------------------
  -- Idle/resting/defense/etc sets
  --------------------------------------

  -- Resting sets
  sets.resting = {
    
  }


  -- Idle sets

  sets.idle = {
    main = "Bolelabunga",
    range = "Nepote Bell",
    head = "Jhakri Coronal +1",
    neck = "Twilight Torque",
    ear1 = "Friomisi Earring",
    ear2 = "Hecate's Earring",
    body = "Jhakri Robe +1",
    hands = "Geomancy Mitaines +1",
    ring1 = "Weatherspoon Ring",
    ring2 = "Metamorph Ring",
    back = "Repulse Mantle",
    waist = "Yamabuki-no-obi",
    legs = "Assiduity Pants",
    feet = "Geomancy Sandals +1",
  }

  sets.idle.PDT = {
    
  }

  -- .Pet sets are for when Luopan is present.
  sets.idle.Pet = {
    hands = "Geomancy Mitaines +1",
    back = "Lifestream Cape",
  }

  sets.idle.PDT.Pet = {
    hands = "Geomancy Mitaines +1",
    back = "Repulse Mantle",
  }

  -- Indi sets are for when an Indi-spell is active.
  sets.idle.Indi = set_combine(sets.idle, {})
  sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {})
  sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {})
  sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

  -- sets.idle.Town = {}

  -- Defense sets

  sets.defense.PDT = {
    
  }

  sets.defense.MDT = {
    
  }

  sets.Kiting = {
    
  }

  sets.latent_refresh = {waist = "Fucho-no-obi"}


  --------------------------------------
  -- Engaged sets
  --------------------------------------

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion

  -- Normal melee group
  sets.engaged = {
    ear1 = "Steelflash Earring",
    ear2 = "Bladeborn Earring",
    ring1 = "K'ayres Ring",
    ring2 = "Petrov Ring",
    waist = "Windbuffet Belt +1",
  }

  --------------------------------------
  -- Custom buff sets
  --------------------------------------

end


--------------------------------------------------------------------------------
-- Utility functions specific to this job.
--------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
  set_macro_page(5, 20)
end
