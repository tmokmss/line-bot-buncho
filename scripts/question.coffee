#Commands:
#  [query]? - answer you
#

docomo_api_key = process.env.DOCOMO_API_KEY

module.exports = (robot) ->
  robot.hear /(.+)(\?|？)/i, (msg) ->
    request = require('request');
    query = "#{msg.match[1]}？"
    console.log(query)
    query = encodeURIComponent(query)
    url = "https://api.apigw.smt.docomo.ne.jp/knowledgeQA/v1/ask?APIKEY=#{docomo_api_key}&q=#{query}"
    console.log(url)
    request.get(url, (error, response, body) ->
      if error or response.statusCode != 200
        return msg.send('分かりかねる')
      data = JSON.parse(body)
      text = ['教えてやろう\n']
      answer = data["answers"][0]["answerText"]
      disptext = "それは#{answer}である"
      url = data["answers"][0]["linkUrl"]
      foot = "ちゅんちゅん"
      text.push(disptext)
      text.push(url)
      text.push(foot)
      msg.send text.join('\n') )
