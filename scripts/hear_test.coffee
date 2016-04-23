#Commands:
#  ちゅんちゅん！
#
module.exports = (robot) ->
  robot.hear /ちゅん/i, (msg) ->
    msg.send "ちゅんちゅん！"
  robot.hear /めきめき/i, (msg) ->
    msg.send "ぴーよぴよ！"
