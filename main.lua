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
end

--update screen every tick
function love.update()
    -- Player 1 Controls
    --move up if 'w' pressed
    if love.keyboard.isDown("w") then
      if player1.y > 0 + player1.radius then
        player1.y = player1.y - player1.y_speed --move player
      else
        player1.y = 0 + player1.radius --reset player location if moving off screen
      end
    end
    --move down if 's' pressed
    if love.keyboard.isDown("s") then
      if player1.y < 720 - player1.radius then
        player1.y = player1.y + player1.y_speed
      else
        player1.y = 720 - player1.radius
      end
    end
    --move left if 'a' pressed
    if love.keyboard.isDown("a") then
      if player1.x > 0 + player1.radius then
        player1.x = player1.x - player1.x_speed
      else
        player1.x = 0 + player1.radius
      end
    end
    --move right if 'd' pressed
    if love.keyboard.isDown("d") then
      if player1.x < 1280 - player1.radius then
        player1.x = player1.x + player1.x_speed
      else
        player1.x = 1280 - player1.radius
      end
    end

    -- Player 2 Controls
    --move up if up arrow pressed
    if love.keyboard.isDown("up") then
      if player2.y > 0 + player2.radius then
        player2.y = player2.y - player2.y_speed --move player
      else
        player2.y = 0 + player2.radius --reset player location if moving off screen
      end
    end
    --move down if down arrow pressed
    if love.keyboard.isDown("down") then
      if player2.y < 720 - player2.radius then
        player2.y = player2.y + player2.y_speed
      else
        player2.y = 720 - player2.radius
      end
    end
    --move left if left arrow pressed
    if love.keyboard.isDown("left") then
      if player2.x > 0 + player2.radius then
        player2.x = player2.x - player2.x_speed
      else
        player2.x = 0 + player2.radius
      end
    end
    --move right if right arrow pressed
    if love.keyboard.isDown("right") then
      if player2.x < 1280 - player2.radius then
        player2.x = player2.x + player2.x_speed
      else
        player2.x = 1280 - player2.radius
      end
    end

    -- update methods
    ball:update(player1, player2)
    left_goal:update(ball)
    right_goal:update(ball)
end

function love.draw()
    love.graphics.circle("fill", player1.x, player1.y, player1.radius)
    love.graphics.circle("fill", player2.x, player2.y, player2.radius)
    love.graphics.circle("line", ball.x, ball.y, ball.radius)
    love.graphics.rectangle("line", left_goal.x, left_goal.y, left_goal.width, left_goal.height)
    love.graphics.rectangle("line", right_goal.x, right_goal.y, right_goal.width, right_goal.height)
end
