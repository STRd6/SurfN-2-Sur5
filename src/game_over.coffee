{Util:{defaults}, GameObject} = require "dust"

module.exports = GameObject.registry.GameOver = (I={}) ->
  defaults I,
    zIndex: 10

  lineHeight = 24

  self = GameObject(I)

  self.off "draw"
  self.on "overlay", (canvas) ->

    # TODO: Extract multiline text rendering
    lines = """
      surf'd for #{I.distance.toFixed(2)} meters
      sur5'd for #{(I.time / 30).toFixed(2)} seconds
      succumb'd to #{I.causeOfDeath}
    """.split("\n")

    lines.forEach (line, i) ->
      canvas.centerText
        font: "24px bold 'HelveticaNeue-Light', 'Helvetica Neue Light', 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande', sans-serif"
        color: "#FFF"
        text: line
        y: 160 - (lines.length/2 - i) * lineHeight

  self.on "update", ->
    if keydown.space or keydown.return or keydown.escape
      engine.trigger "restart"

  return self
