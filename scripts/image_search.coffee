#Commands:
#  hubot image - ランダムな画像を表示してくれる(tiqav API)
#  hubot image <query> - queryに関連する画像を表示してくれる(tiqav API)
#

{LineImageAction} = require 'hubot-line'
module.exports = (robot) ->
  robot.respond /image( (.*))?/i, (msg) ->
    query = msg.match[2]
    if query
      imageMe msg, 'http://api.tiqav.com/search.json', {q: query}
    else
      imageMe msg, 'http://api.tiqav.com/search/random.json'

  imageMe = (msg, url, query)->
    http = msg.http url
    if query
      http = http.query query
    http.get() (err, res, body) ->
      if res.statusCode is 404
        #msg.send process.env.HUBOT_TIQAV_404_MESSAGE or "画像ない"
        return
      else if res.statusCode isnt 200
        #msg.send process.env.HUBOT_TIQAV_ERROR_MESSAGE or "エラーっぽい"
        return
      else
        images = JSON.parse body
        image = msg.random images
        imageurl = "http://img.tiqav.com/#{image.id}.#{image.ext}"
        msg.emote new LineImageAction imageurl, imageurl
