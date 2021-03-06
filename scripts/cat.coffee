#Commands:
#  cat - shows you cat image
#  ねこ|猫 - 猫画像をくれる
#

{LineImageAction} = require 'hubot-line'
parser  = require 'xml2json'

cat_api_key = process.env.CAT_API_KEY

module.exports = (robot) ->
  robot.hear /(cat|猫|ねこ)/i, (msg) ->
    request = require('request');
    url = "http://thecatapi.com/api/images/get?api_key=#{cat_api_key}&format=xml&type=jpg"
    request.get(url, (error, response, body) ->
      if error or response.statusCode != 200
        return msg.send('画像取得失敗ちゅん……')
      datajson = parser.toJson body
      imageurl = JSON.parse(datajson)["response"]["data"]["images"]["image"]["url"]
      msg.emote new LineImageAction imageurl, imageurl)
