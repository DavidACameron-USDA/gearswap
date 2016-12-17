-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
  mote_include_version = 2

  -- Load and initialize the include file.
  include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
  state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
  state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
  state.Buff.Convergence = buffactive.Convergence or false
  state.Buff.Diffusion = buffactive.Diffusion or false
  state.Buff.Efflux = buffactive.Efflux or false

  state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false


  blue_magic_maps = {}

  -- Mappings for gear sets to use for various blue magic spells.
  -- While Str isn't listed for each, it's generally assumed as being at least
  -- moderately signficant, even for spells with other mods.

  -- Physical Spells --

  -- Physical spells with no particular (or known) stat mods
  blue_magic_maps.Physical = S{
    'Bilgestorm'
  }

  -- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
  blue_magic_maps.PhysicalAcc = S{
    'Heavy Strike',
  }

  -- Physical spells with Str stat mod
  blue_magic_maps.PhysicalStr = S{
    'Battle Dance',
    'Bloodrake',
    'Death Scissors',
    'Dimensional Death',
    'Empty Thrash',
    'Quadrastrike',
    'Sinker Drill',
    'Spinal Cleave',
    'Uppercut',
    'Vertical Cleave'
  }

  -- Physical spells with Dex stat mod
  blue_magic_maps.PhysicalDex = S{
    'Amorphic Spikes',
    'Asuran Claws',
    'Barbed Crescent',
    'Claw Cyclone',
    'Disseverment',
    'Foot Kick',
    'Frenetic Rip',
    'Goblin Rush',
    'Hysteric Barrage',
    'Paralyzing Triad',
    'Seedspray',
    'Sickle Slash',
    'Smite of Rage',
    'Terror Touch',
    'Thrashing Assault',
    'Vanity Dive'
  }

  -- Physical spells with Vit stat mod
  blue_magic_maps.PhysicalVit = S{
    'Body Slam',
    'Cannonball',
    'Delta Thrust',
    'Glutinous Dart',
    'Grand Slam',
    'Power Attack',
    'Quad. Continuum',
    'Saurian Slide',
    'Sprout Smack',
    'Sub-zero Smash',
    'Sweeping Gouge'
  }

  -- Physical spells with Agi stat mod
  blue_magic_maps.PhysicalAgi = S{
    'Benthic Typhoon',
    'Feather Storm',
    'Helldive',
    'Hydro Shot',
    'Jet Stream',
    'Pinecone Bomb',
    'Spiral Spin',
    'Wild Oats'
  }

  -- Physical spells with Int stat mod
  blue_magic_maps.PhysicalInt = S{
    'Mandibular Bite',
    'Queasyshroom'
  }

  -- Physical spells with Mnd stat mod
  blue_magic_maps.PhysicalMnd = S{
    'Ram Charge',
    'Screwdriver',
    'Tourbillion'
  }

  -- Physical spells with Chr stat mod
  blue_magic_maps.PhysicalChr = S{
    'Bludgeon'
  }

  -- Physical spells with HP stat mod
  blue_magic_maps.PhysicalHP = S{
    'Final Sting'
  }

  -- Magical Spells --

  -- Magical spells with the typical Int mod
  blue_magic_maps.Magical = S{
    'Blastbomb',
    'Blazing Bound',
    'Bomb Toss',
    'Cesspool',
    'Crashing Thunder',
    'Cursed Sphere',
    'Dark Orb',
    'Death Ray',
    'Droning Whirlwind',
    'Embalming Earth',
    'Firespit',
    'Foul Waters',
    'Ice Break',
    'Leafstorm',
    'Maelstrom',
    'Molting Plumage',
    'Polar Roar',
    'Regurgitation',
    'Rending Deluge',
    'Retinal Glare',
    'Spectral Floe',
    'Subduction',
    'Tearing Gust',
    'Tem. Upheaval',
    'Water Bomb'
  }

  blue_magic_maps.MagicalStr = S{
    'Blinding Fulgor',
    'Searing Tempest'
  }

  -- Magical spells with a primary Mnd mod
  blue_magic_maps.MagicalMnd = S{
    'Acrid Stream',
    'Diffusion Ray',
    'Evryone. Grudge',
    'Magic Hammer',
    'Mind Blast',
    'Nectarous Deluge',
    'Rail Cannon',
    'Scouring Spate',
    'Tenebral Crush'
  }

  -- Magical spells with a primary Chr mod
  blue_magic_maps.MagicalChr = S{
    'Eyes On Me',
    'Mysterious Light'
  }

  -- Magical spells with a Vit stat mod (on top of Int)
  blue_magic_maps.MagicalVit = S{
    'Entomb',
    'Thermal Pulse',
    'Uproot'
  }

  -- Magical spells with a Dex stat mod (on top of Int)
  blue_magic_maps.MagicalDex = S{
    'Anvil Lightning',
    'Charged Whisker',
    'Gates of Hades'
  }

  blue_magic_maps.MagicalAgi = S{
    'Palling Salvo',
    'Silent Storm'
  }

  -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
  -- Add Int for damage where available, though.
  blue_magic_maps.MagicAccuracy = S{
    '1000 Needles',
    'Absolute Terror',
    'Actinic Burst',
    'Atra. Libations',
    'Auroral Drape',
    'Awful Eye',
    'Blank Gaze',
    'Blistering Roar',
    'Blood Drain',
    'Blood Saber',
    'Chaotic Eye',
    'Cimicine Discharge',
    'Cold Wave',
    'Corrosive Ooze',
    'Cruel Joke',
    'Demoralizing Roar',
    'Digest',
    'Dream Flower',
    'Enervation',
    'Feather Tickle',
    'Filamented Hold',
    'Frightful Roar',
    'Geist Wall',
    'Hecatomb Wave',
    'Infrasonics',
    'Jettatura',
    'Light of Penance',
    'Lowing',
    'Mind Blast',
    'Mortal Ray',
    'MP Drainkiss',
    'Osmosis',
    'Reaving Wind',
    'Sandspin',
    'Sandspray',
    'Sheep Song',
    'Soporific',
    'Sound Blast',
    'Stinking Gas',
    'Sub-zero Smash',
    'Venom Shell',
    'Voracious Trunk',
    'Yawn'
  }

  -- Breath-based spells
  blue_magic_maps.Breath = S{
    'Bad Breath',
    'Flying Hip Press',
    'Frost Breath',
    'Heat Breath',
    'Hecatomb Wave',
    'Magnetite Cloud',
    'Poison Breath',
    'Radiant Breath',
    'Self-Destruct',
    'Thunder Breath',
    'Vapor Spray',
    'Wind Breath'
  }

  -- Stun spells
  blue_magic_maps.Stun = S{
    'Blitzstrahl',
    'Frypan',
    'Head Butt',
    'Sudden Lunge',
    'Tail slap',
    'Temporal Shift',
    'Thunderbolt',
    'Whirl of Rage'
  }

  -- Healing spells
  blue_magic_maps.Healing = S{
    'Healing Breeze',
    'Magic Fruit',
    'Plenilune Embrace',
    'Pollen',
    'Restoral',
    'White Wind',
    'Wild Carrot'
  }

  -- Buffs that depend on blue magic skill
  blue_magic_maps.SkillBasedBuff = S{
    'Barrier Tusk',
    'Diamondhide',
    'Magic Barrier',
    'Metallic Body',
    'Plasma Charge',
    'Pyric Bulwark',
    'Reactor Cool',
  }

  -- Other general buffs
  blue_magic_maps.Buff = S{
    'Amplification',
    'Animating Wail',
    'Battery Charge',
    'Carcharian Verve',
    'Cocoon',
    'Erratic Flutter',
    'Exuviation',
    'Fantod',
    'Feather Barrier',
    'Harden Shell',
    'Mighty Guard',
    'Memento Mori',
    'Nat. Meditation',
    'Occultation',
    'Orcish Counterstance',
    'Refueling',
    'Regeneration',
    'Saline Coat',
    'Triumphant Roar',
    'Warm-Up',
    'Winds of Promyvion',
    'Zephyr Mantle'
  }


  -- Spells that require Unbridled Learning to cast.
  unbridled_spells = S{
    'Absolute Terror',
    'Bilgestorm',
    'Blistering Roar',
    'Bloodrake',
    'Carcharian Verve',
    'Cesspool',
    'Crashing Thunder',
    'Cruel Joke',
    'Droning Whirlwind',
    'Gates of Hades',
    'Harden Shell',
    'Mighty Guard',
    'Polar Roar',
    'Pyric Bulwark',
    'Tearing Gust',
    'Thunderbolt',
    'Tourbillion',
    'Uproot'
  }
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
  if unbridled_spells:contains(spell.english) and not state.Buff['Unbridled Learning'] then
    eventArgs.cancel = true
    windower.send_command('@input /ja "Unbridled Learning" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
  end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
  -- Add enhancement gear for Chain Affinity, etc.
  if spell.skill == 'Blue Magic' then
    for buff,active in pairs(state.Buff) do
      if active and sets.buff[buff] then
        equip(sets.buff[buff])
      end
    end
    if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
      equip(sets.self_healing)
    end
  end

  -- If in learning mode, keep on gear intended to help with that, regardless of action.
  if state.OffenseMode.value == 'Learning' then
    equip(sets.Learning)
  end

  -- If in CP mode, keep on gear intended to help with that, regardless of action.
  if state.OffenseMode.value == 'CP' then
    equip(sets.CP)
  end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
  if state.Buff[buff] ~= nil then
    state.Buff[buff] = gain
  end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
-- Return custom spellMap value that can override the default spell mapping.
-- Don't return anything to allow default spell mapping to be used.
function job_get_spell_map(spell, default_spell_map)
  if spell.skill == 'Blue Magic' then
    for category,spell_list in pairs(blue_magic_maps) do
      if spell_list:contains(spell.english) then
        return category
      end
    end
  end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
  if player.mpp < 51 then
    set_combine(idleSet, sets.latent_refresh)
  end
  return idleSet
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
  update_combat_form()
end
