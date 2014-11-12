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
    hands = "Blessed Mitts",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }

  -- Cure sets
  sets.midcast.CureSolace = {}

  sets.midcast.Cure = {
    main = "Eminent Wand",
    ammo = "Kalboron Stone",
    head = "Theophany Cap",
    neck = "Morgana's Choker",
    body = "Noble's Tunic",
    hands = "Wayfarer Cuffs",
    ring1 = "Omega Ring",
    ring2 = "Tamas Ring",
    back = "Aslan Cape",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.Curaga = {
    main = "Eminent Wand",
    ammo = "Kalboron Stone",
    head = "Theophany Cap",
    neck = "Morgana's Choker",
    body = "Noble's Tunic",
    hands = "Wayfarer Cuffs",
    ring1 = "Omega Ring",
    ring2 = "Tamas Ring",
    back = "Aslan Cape",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.CureMelee = {
    ammo = "Kalboron Stone",
    head = "Theophany Cap",
    neck = "Morgana's Choker",
    body = "Noble's Tunic",
    hands = "Wayfarer Cuffs",
    ring1 = "Omega Ring",
    ring2 = "Tamas Ring",
    back = "Aslan Cape",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.StatusRemoval = {

  }

  sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {
    legs = "Theophany Pantaloons",
  })

  -- 110 total Enhancing Magic Skill; caps even without Light Arts
  sets.midcast['Enhancing Magic'] = {
    feet = "Cleric's Duckbills",
  }

  sets.midcast.Stoneskin = {
    main = "Eminent Wand",
    ammo = "Kalboron Stone",
    head = "Wayfarer Circlet",
    neck = "Morgana's Choker",
    body = "Wayfarer Robe",
    hands = "Wayfarer Cuffs",
    ring1 = "Omega Ring",
    ring2 = "Tamas Ring",
    back = "Aslan Cape",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }

  sets.midcast.Auspice = {}

  sets.midcast.BarElement = {
    legs = "Cleric's Pantaloons",
  }

  sets.midcast.Regen = {
    body = "Cleric's Briault",
    legs = "Theophany Pantaloons",
  }

  sets.midcast.Protectra = {}

  sets.midcast.Shellra = {}


  sets.midcast['Divine Magic'] = {
    head = "Wayfarer Circlet",
    body = "Wayfarer Robe",
    hands = "Wayfarer Cuffs",
    legs = "Theophany Pantaloons",
    feet = "Wayfarer Clogs",
  }

  sets.midcast['Dark Magic'] = {}

  -- Custom spell classes
  sets.midcast.MndEnfeebles = {
    ammo = "Kalboron Stone",
    head = "Wayfarer Circlet",
    neck = "Imbodla Necklace",
    body = "Healer's Briault",
    hands = "Cleric's Mitts",
    ring1 = "Omega Ring",
    ring2 = "Tamas Ring",
    back = "Aslan Cape",
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
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
  }


  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {
    main = "Dark Staff",
    head = "Wayfarer Circlet",
    ear1 = "Antivenom Earring",
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
    sub = "Tariqah",
    ammo = "Kalboron Stone",
    head = "Wayfarer Circlet",
    neck = "Morgana's Choker",
    ear1 = "Insomnia Earring",
    ear2 = "Loquacious Earring",
    body = "Wayfarer Robe",
    hands = "Wayfarer Cuffs",
    ring1 = "Omega Ring",
    ring2 = "Tamas Ring",
    back = "Aslan Cape",
    waist = "Hierarch Belt",
    legs = "Wayfarer Slops",
    feet = "Wayfarer Clogs",
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
    sub = "Tariqah",
    ammo = "Kalboron Stone",
    head = "Wayfarer Circlet",
    neck = "Morgana's Choker",
    ear1 = "Insomnia Earring",
    ear2 = "Loquacious Earring",
    body = "Wayfarer Robe",
    hands = "Wayfarer Cuffs",
    ring1 = "Omega Ring",
    ring2 = "Tamas Ring",
    back = "Aslan Cape",
    waist = "Hierarch Belt",
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
