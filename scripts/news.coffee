#Commands:
#  hubot yama - not yet
#


docomo_api_key = process.env.DOCOMO_API_KEY

module.exports = (robot) ->
  robot.respond /newsg (.+)/i, (msg) ->
    request = require('request');
    id = msg.match[1]
    num = 5
    url = "https://api.apigw.smt.docomo.ne.jp/webCuration/v3/contents?APIKEY=#{docomo_api_key}&genreId=#{id}&s=1&n=#{num}&lang=ja"
    request.get(url, (error, response, body) ->
      if error or response.statusCode != 200
        return msg.send('記事取得失敗ちゅん……')
      data = JSON.parse(body)
      text = ['最新ニュースだ']
      for n in [0 .. num]
        title = data["articleContents"][n]["contentData"]["title"]
        url = data["articleContents"][n]["contentData"]["linkUrl"]
        text.push(title)
        text.push(url)
      msg.send text.join('\n') )
