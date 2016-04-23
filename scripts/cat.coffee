#Commands:
#  cat - shows you cat image
#

{LineImageAction} = require 'hubot-line'
cat_api_key = process.env.CAT_API_KEY

module.exports = (robot) ->
  robot.hear /(cat|猫|ねこ)/i, (msg) ->
    request = require('request');
    url = "http://thecatapi.com/api/images/get?api_key=#{cat_api_key}&format=xml"
    request.get({uri:url, json:true}, (error, response, body) ->
      if error or response.statusCode != 200
        return msg.send('画像取得失敗ちゅん……')
      imageurl = JSON.parse(body)["response"]["data"]["images"]["image"]["url"]
    msg.emote new LineImageAction imageurl, imageurl)
