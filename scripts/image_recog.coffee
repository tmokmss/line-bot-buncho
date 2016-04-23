#Commands:
#  hubot newsglist - shows the list of news genre id
#  hubot newsg [genreId] - shows latest news of specified genre
#


docomo_api_key = process.env.DOCOMO_API_KEY

module.exports = (robot) ->
  robot.listeners.push new LineImageListener robot, (() -> true), (res) ->
    res.message.content (content) -> 0
      res.message.previewContent (previewContent) ->
        res.http(https://api.apigw.smt.docomo.ne.jp/imageRecognition/v1/concept/classify/)
          .headers('Content-Type': 'multipart/form-data')
          .query('APIKEY', docomo_api_key)
          .post(previewContent)
