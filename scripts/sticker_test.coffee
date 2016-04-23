{LineStickerListener, LineStickerAction} = require 'hubot-line'

module.exports = (robot) ->
  robot.listeners.push new LineStickerListener robot, (() -> true), (res) ->
    valid_stickerID = [
      1
      2
      3
      4
      5
      6
      7
      8
      9
      10
      11
      12
      13
      14
      15
      16
      17
      21
      100
      101
      102
      103
      104
      105
      106
      107
      108
      109
      110
      111
      112
      113
      114
      115
      116
      117
      118
      119
      120
      121
      122
      123
      124
      125
      126
      127
      128
      129
      130
      131
      132
      133
      134
      135
      136
      137
      138
      139
      401
      402
      403
      404
      405
      406
      407
      408
      409
      410
      411
      412
      413
      414
      415
      416
      417
      418
      419
      420
      421
      422
      423
      424
      425
      426
      427
      428
      429
      430
    ]
    res.emote new LineStickerAction valid_stickerID[Math.random()*valid_stickerID.length], res.message.STKPKGID
