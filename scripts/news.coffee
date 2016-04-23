#Commands:
#  hubot yama - not yet
#


docomo_api_key = process.env.DOCOMO_API_KEY

module.exports = (robot) ->
  robot.respond /newsg (.+)/i, (msg) ->
    request = require('request');
    id = msg.match[1]
    num = 8
    url = "https://api.apigw.smt.docomo.ne.jp/webCuration/v3/contents?APIKEY=#{docomo_api_key}&genreId=#{id}&s=1&n=#{num}&lang=ja"
    request.get(url, (error, response, body) ->
      if error or response.statusCode != 200
        return msg.send('記事取得失敗ちゅん……')
      data = JSON.parse(body)
      text = ['最新ニュースだ\n']
      for n in [0 .. num-1]
        title = data["articleContents"][n]["contentData"]["title"]
        url = data["articleContents"][n]["contentData"]["linkUrl"]
        text.push(title)
        text.push(url)
        text.push('\n')
      msg.send text.join('\n') )
  robot.respond /newsglist/i, (msg) ->
    request = require('request')
    url = "https://api.apigw.smt.docomo.ne.jp/webCuration/v3/genre?APIKEY=#{docomo_api_key}&lang=ja"
    console.log(url)
    request.get(url, (error, response, body) ->
      if error or response.statusCode != 200
        return msg.send('ジャンルリスト取得失敗ちゅん……')
      genres = JSON.parse(body)["genre"]
      text = ['ジャンルのリストだ\n']
      for genre, i in genres
        genreid = genre["genreId"]
        desc = genre["description"]
        line = "#{genreid}: #{desc}"
        text.push(line)
      msg.send text.join('\n') )
