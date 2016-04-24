#Commands:
#  「会話文」: 雑談してくれる
#


docomo_api_key = process.env.DOCOMO_API_KEY

module.exports = (robot) ->
  robot.hear /(^「)(.+)(」$)/, (msg) ->
    request = require('request');
    utt = msg.match[2]
    url = "https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue?APIKEY=#{docomo_api_key}"
    console.log(msg.user)
    data = JSON.stringify({
      "utt" : utt
      "context" : "aaa"
      "age" : 12
      "t" : 20
    })
    option = {
      "uri" : url
      "method" : "POST"
      "json" : data
      }
    console.log(option)
    request(option, (error, response, body) ->
      if error or response.statusCode != 200
        console.log(response.statusCode)
        console.log(error)
        return msg.send "BEEP BEEP PARSING ERROR"
      data = JSON.parse(body)
      console.log(data)
      text = data["utt"]
      msg.send text )
