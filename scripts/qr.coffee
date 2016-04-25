#Commands:
#  hubot qr - 招待用QRコードを表示
#

{LineImageAction} = require 'hubot-line'
module.exports = (robot) ->
  robot.respond /qr$/i, (msg) ->
    imageurl = "https://qr-official.line.me/sid/L/xcz1817m.png"
    msg.emote new LineImageAction imageurl, imageurl
