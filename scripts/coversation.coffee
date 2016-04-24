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
      "context" : "1982374892121"
      "sex" : "女"
      "birthdateY" : "1995"
      "age" : "18"
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
