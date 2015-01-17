# Smogon-API

API to get (Poké|Ability|Item|Move|Moveset)dex from Smogon.

`Installation: [sudo] gem install smogon`


    require 'smogon'

    puts Smogon::Pokedex.get    'Blaziken'
    puts Smogon::Abilitydex.get 'Synchronize'
    puts Smogon::Itemdex.get    'Leftovers'
    puts Smogon::Movedex.get    'Extreme Speed'
    puts Smogon::Movesetdex.get 'Abomasnow', 'UU', 'bw'

# About the latest Smogon redesign...
Well, they rebuilt the whole website, so now they have a back-end that servs the APIs and a front-end that just catches it and then fills the data into the DOM. This means that now we can (fortunately) just get whatever we want from the public APIs, instead of parsing static HTML pages.

Integrating these changes in the version 0.6, I decided to give the users the ability to get Smogon data in two ways:

- The first is actually the same of the previous versions, so you will not feel any difference since both the requests and the responses are the same old ones.

- The second way is more powerful and let Smogon-API to works just like a 1:1 wrapper: You provide it the fields you need (maybe following the XHR calls that Smogon performs), and it will return them inside a simple Hash. This can be useful just if you need some infos that Smogon-API doesn't normally give you (for example, the height and the weight of a Pokémon).
To do this, just give in the last parameter of every `#get` method an array like the one I give by default in the sources.
