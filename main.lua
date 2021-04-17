la = love.audio
ld = love.data
le = love.event
lfile = love.filesystem
lf = love.font
lg = love.graphics
li = love.image
lj = love.joystick
lk = love.keyboard
lm = love.math
lmouse = love.mouse
lp = love.physics
lsound = love.sound
lsys = love.system
lth = love.thread
lt = love.timer
ltouch = love.touch
lv = love.video
lw = love.window

lg.setDefaultFilter("nearest", "nearest", 1)
lg.setLineStyle('rough')

splash = require "libs/splash"

function love.draw() splash:update() end
splash:startSplashScreen("start_screen.png", "", 1500, 500, 0, {}, function()

input = require "libs/input"

push = require "libs/push"
game_width, game_height = 1500, 500
window_width, window_height = game_width, game_height
lw.setMode(window_width, window_height, {borderless = false})
push:setupScreen(game_width, game_height, window_width, window_height, {fullscreen = false, resizable = true, borderless = false})

screen = require "libs/shack"
screen:setDimensions(push:getDimensions())

player = require "Player"
blocks = require "Blocks"

bg_img = lg.newImage("bg.png")
buffer = 4

font = lg.newFont(35)
number_blocks = 3

function love.draw()
    screen:apply()
    push:start()

    lg.draw(bg_img)

    player:Draw()
    blocks:Draw()

    lg.draw(main_text, 5, 5)

    push:finish()
end

function love.update(dt)
    screen:update(dt)
    player:Update(dt)
    blocks:Update(dt)
    main_text = lg.newText(font, "wasd / arrow keys to move + space to jump\nClick to place blocks\n"..tostring(number_blocks))
end

function love.keypressed(key)
    if key == "escape" then le.quit() end
    if key == "return" and lk.isDown("lalt") then push:switchFullscreen() end
end

function love.mousepressed(x, y, button)
    blocks:Click()
end

function love.resize(w, h)
  push:resize(w, h)
  lg.clear()
end

end)