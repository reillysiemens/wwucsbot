# Description:
#   Catme is the most important thing in it's life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot cat me - Observe a cat
#   hubot pug bomb N - endure N cats
#   hubot how many cats are there - the number of cats.

module.exports = (robot) ->

  robot.respond /cat me/i, (msg) ->    
    msg.send("http://http://placekitten.com/g/" + (50 + Math.floor(Math.random() * 1000)) + "/" + (50 + Math.floor(Math.random() * 1000)))


  robot.respond /cat bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 6
    i for i in [1..count]
      msg.send("http://http://placekitten.com/g/" + (50 + Math.floor(Math.random() * 1000)) + "/" + (50 + Math.floor(Math.random() * 1000)))

  robot.respond /how many cats are there/i, (msg) ->
    msg.send "There are more cats than pugs."


