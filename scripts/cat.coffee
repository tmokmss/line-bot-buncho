#Commands:
#  cat - shows you cat image
#

{LineImageAction} = require 'hubot-line'
cat_api_key = process.env.CAT_API_KEY
parser  = require 'xml2json'

module.exports = (robot) ->
  robot.hear /(cat|猫|ねこ)/i, (msg) ->
    request = require('request');
    url = "http://thecatapi.com/api/images/get?api_key=#{cat_api_key}&format=xml"
    request.get(url, (error, response, body) ->
      if error or response.statusCode != 200
        return msg.send('画像取得失敗ちゅん……')
      console.log(body)
      datajson = parser.toJson body
      console.log(datajson)
      imageurl = JSON.parse(datajson)["response"]["data"]["images"]["image"]["url"]
      msg.emote new LineImageAction imageurl, imageurl)
