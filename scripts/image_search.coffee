#Commands:
#  hubot yama - not yet
#

{request} = require 'request'

module.exports = (robot) ->
  robot.respond /image /i, (msg) ->
    msg.send "ちゅんちゅん"
