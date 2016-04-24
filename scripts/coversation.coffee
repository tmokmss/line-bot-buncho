#Commands:
#  「会話文」: 雑談してくれる
#


docomo_api_key = process.env.DOCOMO_API_KEY

module.exports = (robot) ->
  robot.hear /(^「)(.+)(」$)/, (msg) ->
    request = require('request');
    utt = msg.match[2]
    url = "https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue?APIKEY=#{docomo_api_key}"
    data = JSON.stringify({
      "utt" : utt
      "context" : "12345"
      "sex" : "男"
      "birthdateY" : "1970"
      "age" : "22"
      #"t" : "20"
    })
    option = {
      uri : url
      headers: {
        'Content-Type': ' application/json'
      }
      body : data
    }
    request.post(option, (error, response, body) ->
      if error or response.statusCode != 200
        console.log(response.statusCode)
        console.log(error)
        return
      data = JSON.parse(body)
      text = data["utt"]
      msg.send text )
