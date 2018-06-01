Player = require "player"
func = require "func"
Ball = require "ball"
Goal = require "goal"

function love.load()
	window = {}
	window.width = 1280
	window.height = 720
	love.window.setMode(window.width, window.height)
	love.window.setTitle("Soccer2d")

	player1 = Player:new(160, 360)
	player2 = Player:new(1120, 360)

	ball = Ball:new()

	left_goal = Goal:new(0, 245)
	right_goal = Goal:new(1205, 245)

	min_dt = 1/60 --fps
	   next_time = love.timer.getTime()
end

-- update screen every tick
function love.update(dt)
	next_time = next_time + min_dt
	-- Player 1 Controls
	-- move up if 'w' pressed
	if love.keyboard.isDown("w") then
	  	if player1.y > 0 + player1.radius then
			player1.y = player1.y - player1.y_speed --move player
	  	else
			player1.y = 0 + player1.radius --reset player location if moving off screen
	  	end
	end
	-- move down if 's' pressed
	if love.keyboard.isDown("s") then
	  	if player1.y < 720 - player1.radius then
			player1.y = player1.y + player1.y_speed
	  	else
			player1.y = 720 - player1.radius
	  	end
	end
	-- move left if 'a' pressed
	if love.keyboard.isDown("a") then
	  	if player1.x > 0 + player1.radius then
			player1.x = player1.x - player1.x_speed
	  	else
			player1.x = 0 + player1.radius
	  	end
	end
	-- move right if 'd' pressed
	if love.keyboard.isDown("d") then
	  	if player1.x < 1280 - player1.radius then
			player1.x = player1.x + player1.x_speed
	  	else
			player1.x = 1280 - player1.radius
	  	end
	end

	-- Player 2 Controls
	-- move up if up arrow pressed
	if love.keyboard.isDown("up") then
	  	if player2.y > 0 + player2.radius then
			player2.y = player2.y - player2.y_speed --move player
	  	else
			player2.y = 0 + player2.radius --reset player location if moving off screen
	  	end
	end
	-- move down if down arrow pressed
	if love.keyboard.isDown("down") then
	  	if player2.y < 720 - player2.radius then
			player2.y = player2.y + player2.y_speed
	  	else
			player2.y = 720 - player2.radius
	  	end
	end
	-- move left if left arrow pressed
	if love.keyboard.isDown("left") then
	  	if player2.x > 0 + player2.radius then
			player2.x = player2.x - player2.x_speed
	  	else
			player2.x = 0 + player2.radius
	  	end
	end
	-- move right if right arrow pressed
	if love.keyboard.isDown("right") then
	  	if player2.x < 1280 - player2.radius then
			player2.x = player2.x + player2.x_speed
	  	else
			player2.x = 1280 - player2.radius
	  	end
	end

	-- GO SPEEDY FAST FAST
  	if love.keyboard.isDown("lshift") then
	  	player1:BOOST()
  	end

	if love.keyboard.isDown("kp0") then
		player2:BOOST()
	end
	

	-- update methods
	ball:update(player1, player2)
	left_goal:update(ball)
	right_goal:update(ball)
	player1:update()
	player2:update()
end

function love.draw()
    
	-- world --
	love.graphics.setColor(0, 155, 0)
	love.graphics.rectangle("fill", 0, 0, 1280, 720)
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", 637.5, 0, 5, 720)
	love.graphics.circle("line", 640, 360, 150)

	-- scores --
	love.graphics.setFont(love.graphics.newFont("fonts/Boogaloo-Regular.ttf", 36))
	love.graphics.print(player1.score, 10, 5)
	love.graphics.print(player2.score, 1250, 5)

	-- players --
	love.graphics.circle("fill", player1.x, player1.y, player1.radius)
	love.graphics.circle("fill", player2.x, player2.y, player2.radius)

	-- ball --
	love.graphics.draw(ball.img, ball.x, ball.y)

	-- goals --
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("line", left_goal.x, left_goal.y, left_goal.width, left_goal.height)
	love.graphics.rectangle("line", right_goal.x, right_goal.y, right_goal.width, right_goal.height)

	-- framerate --
	love.graphics.setColor(0, 0, 0)
	love.graphics.setFont(love.graphics.newFont(12))
	love.graphics.print(love.timer.getFPS(), 1250, 680)

	local cur_time = love.timer.getTime()
  	 if next_time <= cur_time then
    	  next_time = cur_time
    	  return
 	end
  	love.timer.sleep(next_time - cur_time)
end
