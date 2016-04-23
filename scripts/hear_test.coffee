
module.exports = (robot) ->
  robot.hear /ちゅん/i, (msg) ->
    msg.send "ちゅんちゅん！"
