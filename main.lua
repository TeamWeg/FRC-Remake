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
        player1.y = player1.y - player1.y_speed
    end
    if love.keyboard.isDown("s") then
        player1.y = player1.y + player1.y_speed
    end
    if love.keyboard.isDown("a") then
        player1.x = player1.x - player1.x_speed
    end
    if love.keyboard.isDown("d") then
        player1.x = player1.x + player1.x_speed
    end

    if love.keyboard.isDown("up") then
        player2.y = player2.y - player2.y_speed
    end
    if love.keyboard.isDown("down") then
        player2.y = player2.y + player2.y_speed
    end
    if love.keyboard.isDown("left") then
        player2.x = player2.x - player2.x_speed
    end
    if love.keyboard.isDown("right") then
        player2.x = player2.x + player2.x_speed
    end

    ball:update(player1, player2)
end

function love.draw()
    love.graphics.circle("fill", player1.x, player1.y, player1.radius)
    love.graphics.circle("fill", player2.x, player2.y, player2.radius)
    love.graphics.circle("line", ball.x, ball.y, ball.radius)
end
