#Commands:
#

module.exports = (robot) ->
  robot.hear /.*/, (msg) ->
    console.log(msg.match[0])
