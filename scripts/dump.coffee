#Commands:
#

module.exports = (robot) ->
  robot.hear /.*/, (msg) ->
    console.log("Someone said: #{msg.match[0]}")
