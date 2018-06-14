local Controls = {}
Controls.__index = Controls

function Controls:new()
    local c = {}
    setmetatable(c, Controls)

    c.powerup_thing = false

    return c
end

function Controls:update()
    --print(player1)
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
    if love.keyboard.isDown("c") and player1.boost_charges > 0 and player1.boost_released then
        player1:BOOST()
        player1.boost_charges = player1.boost_charges - 1
        player1.boost_released = false
    end
    if not love.keyboard.isDown("c") then
        player1.boost_released = true
    end

    if love.keyboard.isDown("kp0") and player2.boost_charges > 0 and player2.boost_released then
        player2:BOOST()
        player2.boost_charges = player2.boost_charges - 1
        player2.boost_released = false
    end
    if not love.keyboard.isDown("kp0") then
        player2.boost_released = true
    end

  -- POWERUPS
    if love.keyboard.isDown("lctrl") and player1.powerup_charges > 0 and player1.powerup_released then
        RandPowerup:update(player1)
        player1.powerup_charges = player1.powerup_charges - 1
        player1.powerup_released = false
    end
    if not love.keyboard.isDown("lctrl") then
        player1.powerup_released = true
    end

    if love.keyboard.isDown("rshift") and player2.powerup_charges > 0 and player2.powerup_released then
        self.powerup_thing = true
        player2.powerup_charges = player2.powerup_charges - 1
        player2.powerup_released = false
    end
    if not love.keyboard.isDown("rshift") then
        player2.powerup_released = true
    end

    if self.powerup_thing then
        RandPowerup:update(player2)
    end
end

return Controls