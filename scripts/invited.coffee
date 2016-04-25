{LineFriendListener} = require 'hubot-line'

module.exports = (robot) ->
  robot.listeners.push new LineFriendListener robot, (() -> true), (res) ->
    res.send "これからよろしく\n buncho help でコマンドを確認できるぞ"
