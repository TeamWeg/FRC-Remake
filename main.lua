-- game
func = require "assets/func"
Ball = require "game/ball"
Goal = require "game/goal"
World = require "game/world"
Powerup = require "game/powerups/powerup"
Boost = require "game/powerups/boost"
Player = require "game/player"
RandPowerup = require "game/powerups/randpowerup"
Scores = require "game/scores"
Controls = require "game/controls"
Immovable = require "game/powerups/immovable"

-- scenes
SceneManager = require "scenes/scenemanager"

function love.load()
	window = {}
	window.width = 1280
	window.height = 720
	love.window.setMode(window.width, window.height)
	love.window.setTitle("Soccer2d")
	-- love.window.setFullscreen(true)

	scenemanager = SceneManager:new()

	scenemanager:set_scene("MainMenu")

	min_dt = 1/60 --fps
	   next_time = love.timer.getTime()
end

-- update screen every tick
function love.update(dt)
	next_time = next_time + min_dt

	-- update current scene
	scenemanager:update()
end

function love.draw()
	scenemanager:draw()
--	love.graphics.print(scenes)

	local cur_time = love.timer.getTime()
  	if next_time <= cur_time then
    	next_time = cur_time
    	return
 	end
  	love.timer.sleep(next_time - cur_time)
end
