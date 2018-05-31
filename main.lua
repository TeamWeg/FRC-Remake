Player = require "player"

function love.load()
    window = {}
    window.width = 1280
    window.height = 720
    love.window.setMode(window.width, window.height)

    player1 = Player:new(20, 300)
    player2 = Player:new(650, 300)
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
end

function love.draw()
    love.graphics.circle("fill", player1.x, player1.y, player1.width)
    love.graphics.circle("fill", player2.x, player2.y, player2.width)
end
