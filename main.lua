Player = require "player"
func = require "func"
Ball = require "ball"

function love.load()
    window = {}
    window.width = 1280
    window.height = 720
    love.window.setMode(window.width, window.height)
    love.window.setTitle("Soccer2d")

    player1 = Player:new(80, 360)
    player2 = Player:new(1200, 360)

    ball = Ball:new()
end

function love.update()
    -- controls
    if love.keyboard.isDown("w") then
      if player1.y > 0 + player1.radius then
        player1.y = player1.y - player1.y_speed
      else
        player1.y = 0 + player1.radius
      end
    end
    if love.keyboard.isDown("s") then
      if player1.y < 720 - player1.radius then
        player1.y = player1.y + player1.y_speed
      else
        player1.y = 720 - player1.radius
      end
    end
    if love.keyboard.isDown("a") then
      if player1.x > 0 + player1.radius then
        player1.x = player1.x - player1.x_speed
      else
        player1.x = 0 + player1.radius
      end
    end
    if love.keyboard.isDown("d") then
      if player1.x < 1280 - player1.radius then
        player1.x = player1.x + player1.x_speed
      else
        player1.x = 1280 - player1.radius
      end
    end

    if love.keyboard.isDown("up") then
      if player2.y > 0 + player2.radius then
        player2.y = player2.y - player2.y_speed
      else
        player2.y = 0 + player2.radius
      end
    end
    if love.keyboard.isDown("down") then
      if player2.y < 720 - player2.radius then
        player2.y = player2.y + player2.y_speed
      else
        player2.y = 720 - player2.radius
      end
    end
    if love.keyboard.isDown("left") then
      if player2.x > 0 + player2.radius then
        player2.x = player2.x - player2.x_speed
      else
        player2.x = 0 + player2.radius
      end
    end
    if love.keyboard.isDown("right") then
      if player2.x < 1280 - player2.radius then
        player2.x = player2.x + player2.x_speed
      else
        player2.x = 1280 - player2.radius
      end
    end

    ball:update(player1, player2)
end

function love.draw()
    love.graphics.circle("fill", player1.x, player1.y, player1.radius)
    love.graphics.circle("fill", player2.x, player2.y, player2.radius)
    love.graphics.circle("line", ball.x, ball.y, ball.radius)
end
