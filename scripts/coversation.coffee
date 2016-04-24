#Commands:
#  「会話文」: 雑談してくれる
#


docomo_api_key = process.env.DOCOMO_API_KEY

module.exports = (robot) ->
  robot.hear /「(.+)」/, (msg) ->
    request = require('request');
    utt = msg.match[1]
    url = "https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue?APIKEY=#{docomo_api_key}"
    console.log(msg.user)
    data = JSON.stringfy({
      "utt" : utt
      "context" : "aaa"
      "age" : 12
      "t" : 20
    })
    option = {
      "url" : url
      "json" : data
      }
    request.get(option, (error, response, body) ->
      if error or response.statusCode != 200
        return
      data = JSON.parse(body)
      text = data["utt"]
      msg.send text )
