{LineStickerListener, LineStickerAction} = require 'hubot-line'

module.exports = (robot) ->
  robot.listeners.push new LineStickerListener robot, (() -> true), (res) ->
    res.emote new LineStickerAction res.message.STKID+1, res.message.STKPKGID
