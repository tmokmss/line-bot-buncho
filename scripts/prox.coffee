{LineStickerListener} = require 'hubot-line'

###
module.exports = (robot) ->
  robot.listeners.push new LineStickerListener robot, (() -> true), (res) ->
    res.send "Received a sticker. id: #{res.message.id} STKPKGID: #{res.message.STKPKGID}"
###

module.exports = (robot) ->
  robot.respond /日本語で/i, (msg) ->
    msg.send "ちゅんちゅん"
