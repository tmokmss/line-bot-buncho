#Commands:
#  [query]? - answer you
#

docomo_api_key = process.env.DOCOMO_API_KEY

module.exports = (robot) ->
  robot.hear /(.+)(\?|？)/i, (msg) ->
    request = require('request');
    query = "#{msg.match[1]}？"
    query = encodeURIComponent(query)
    url = "https://api.apigw.smt.docomo.ne.jp/knowledgeQA/v1/ask?APIKEY=#{docomo_api_key}&q=#{query}"
    request.get(url, (error, response, body) ->
      if error or response.statusCode != 200
        return msg.send('また今度聞いてくれ')
      data = JSON.parse(body)
      if (data["answers"].length == 0)
        return msg.send('それは私にも分かりかねる')
      text = ['教えてやろう\n']
      answer = data["answers"][0]["answerText"]
      disptext = "それは#{answer}である ソース↓"
      if (answer.indexOf("http")==0)
        disptext = "それはこのサイトを見れば分かる"
      url = data["answers"][0]["linkUrl"]
      text.push(disptext)
      text.push(url)
      msg.send text.join('\n') )
