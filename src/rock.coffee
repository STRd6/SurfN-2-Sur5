{Util:{defaults}, GameObject} = require "dust"

Base = require "./base"

module.exports = GameObject.registry.Rock = (I={}) ->
  defaults I,
    spriteName: "rocks"
    height: 32
    radius: 16
    width: 32
    y: 160 + rand(160)
    zIndex: 6

  self = Base(I)

  self.on "update", ->
    destruction = engine.find(".destruction").first()

    if destruction
      if I.x < destruction.I.x - I.width
        I.active = false

  self
