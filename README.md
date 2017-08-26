# Smogon-API

Wrapper around the Smogon APIs to get (Poké|Ability|Item|Move|Moveset)dex data from their database.

Since 2015.

# Setup

`$ gem install smogon`

# Examples

```rb
  require 'smogon'

  puts Smogon::Pokedex.get    'Blaziken'
  puts Smogon::Abilitydex.get 'Synchronize'
  puts Smogon::Itemdex.get    'Leftovers'
  puts Smogon::Movedex.get    'Extreme Speed'
  puts Smogon::Movesetdex.get 'Abomasnow', 'UU', 'bw'
```

Read under `lib/smogon/types/` for more informations.
