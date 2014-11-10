# Description:
#   Randomly select one of the original 151 Pokémon.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot Pokémon me - Observe a Pokémon
#   hubot Pokémon bomb N - endure N Pokémon
#   hubot how many Pokémon are there - the number of Pokémon

Pokémon = [ "Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon",
            "Charizard", "Squirtle", "Wartortle", "Blastoise", "Caterpie",
            "Metapod", "Butterfree", "Weedle", "Kakuna", "Beedrill", "Pidgey",
            "Pidgeotto", "Pidgeot", "Rattata", "Raticate", "Spearow", "Fearow",
            "Ekans", "Arbok", "Pikachu", "Raichu ", "Sandshrew", "Sandslash",
            "Nidoran♀", "Nidorina", "Nidoqueen", "Nidoran♂", "Nidorino",
            "Nidoking", "Clefairy", "Clefable", "Vulpix", "Ninetales",
            "Jigglypuff", "Wigglytuff", "Zubat", "Golbat", "Oddish", "Gloom",
            "Vileplume", "Paras", "Parasect", "Venonat", "Venomoth", "Diglett",
            "Dugtrio", "Meowth", "Persian", "Psyduck", "Golduck", "Mankey",
            "Primeape", "Growlithe", "Arcanine", "Poliwag", "Poliwhirl",
            "Poliwrath", "Abra", "Kadabra", "Alakazam", "Machop", "Machoke",
            "Machamp", "Bellsprout", "Weepinbell", "Victreebel", "Tentacool",
            "Tentacruel", "Geodude", "Graveler", "Golem", "Ponyta", "Rapidash",
            "Slowpoke", "Slowbro", "Magnemite", "Magneton", "Farfetch'd",
            "Doduo", "Dodrio", "Seel", "Dewgong", "Grimer", "Muk", "Shellder",
            "Cloyster", "Gastly", "Haunter", "Gengar", "Onix", "Drowzee",
            "Hypno", "Krabby", "Kingler", "Voltorb", "Electrode", "Exeggcute",
            "Exeggutor", "Cubone", "Marowak", "Hitmonlee", "Hitmonchan",
            "Lickitung", "Koffing", "Weezing", "Rhyhorn", "Rhydon", "Chansey",
            "Tangela", "Kangaskhan", "Horsea", "Seadra", "Goldeen", "Seaking",
            "Staryu", "Starmie", "Mr. Mime", "Scyther", "Jynx", "Electabuzz",
            "Magmar", "Pinsir", "Tauros", "Magikarp", "Gyarados", "Lapras",
            "Ditto", "Eevee", "Vaporeon", "Jolteon", "Flareon", "Porygon",
            "Omanyte", "Omastar", "Kabuto", "Kabutops", "Aerodactyl",
            "Snorlax", "Articuno", "Zapdos", "Moltres", "Dratini", "Dragonair",
            "Dragonite", "Mewtwo", "Mew" ]

# How many Pokémon are there?
numPokémon = Pokémon.length

# Pick one of 'em.
choosePokémon = () ->
  Pokémon[Math.floor(Math.random() * numPokémon)]

module.exports = (robot) ->

  robot.respond /pok(é|e)mon me/i, (msg) ->
    msg.send "#{choosePokémon()}"

  robot.respond /pok(é|e)mon bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] or 5
    if count < 1
      msg.send "C'mon, that's too few Pokémon."
    else if count > numPokémon
      msg.send "There are only #{numPokémon} Pokémon."
    else
      msg.send "#{choosePokémon()}" for i in [1..count]

  robot.respond /how many pok(é|e)mon are there/i, (msg) ->
    msg.send "There are #{numPokémon} Pokémon."
