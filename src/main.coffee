window.engine = Engine
  backgroundColor: Color("burntorange")
  canvas: $("canvas").powerCanvas()
  zSort: true

player = engine.add
  class: "Player"
  x: 20
  y: 20

box = engine.add
  sprite: "rocks"
  x: 60
  y: 180
  zIndex: 6

water = engine.add
  color: "blue"
  x: 0
  y: 160
  width: App.width
  height: App.height
  zIndex: 0

destruction = engine.add
  color: "red"
  x: -240
  y: 0
  width: 10
  height: App.height

destruction.bind "update", ->
  destruction.I.x += 2

water.bind "update", ->
  water.I.x = player.I.x - App.width/2

clock = 0
engine.bind "update", ->
  clock += 1

  if clock % 30 == 0
    engine.add
      sprite: "rocks"
      x: destruction.I.x + 2 * App.width + 32
      y: 160 + rand(160)
      zIndex: 6


engine.bind "afterUpdate", ->
  engine.I.cameraTransform = Matrix.translation(App.width/2 - player.I.x, App.height/2 - player.I.y)

engine.start()


