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
      "context" : "12345"
      "age" : "12"
      "t" : "20"
    })
    option = {
      uri : url
      headers: {
        'Content-Type': ' application/json'
      }
      body : data
    }
    console.log(option)
    request.post(option, (error, response, body) ->
      if error or response.statusCode != 200
        console.log(response.statusCode)
        console.log(error)
        return
      data = JSON.parse(body)
      console.log(data)
      text = data["utt"]
      msg.send text )
