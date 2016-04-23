#Commands:
#  hubot yama - not yet
#

{request} = require 'request'

docomo_api_key = process.env.DOCOMO_API_KEY

module.exports = (robot) ->
  robot.respond /newsg (.+)/i, (msg) ->
    id = msg.match[1]
    url = "https://api.apigw.smt.docomo.ne.jp/webCuration/v3/contents?APIKEY=#{docomo_api_key}&genreId=#{id}&s=1&n=5&lang=ja"
    request.get(url, (error, response, body) ->
      if error or response.statusCode != 200
        return msg.send('記事取得に失敗しました...')
      data = JSON.parse(body)[0]
      title = data["articleContents"][0]['contentData']['title']
      url = data['articleContents'][0]['contentData']['linkUrl']
      msg.send "#{title}\n#{url}" )
