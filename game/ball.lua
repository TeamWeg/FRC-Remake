local Ball = {
    x = 0,
    y = 0,
    radius = 10,
    x_speed = 0,
    y_speed = 0,
    img = love.graphics.newImage("assets/media/ball.png")
}
Ball.__index = Ball

function Ball:new()
    local b = {}
    setmetatable(b, Ball)

    x, y = love.window.getMode()
    b.x = x / 2
    b.y = y  / 2
    b.radius = 10
    b.x_speed = 0
    b.y_speed = 0
    b.img = love.graphics.newImage("assets/media/ball.png")

    return b
end

function Ball:reset()
    self.x = love.window.getMode() / 2
    self.y = love.window.getMode() / 2
    self.x_speed = 0
    self.y_speed = 0
end

function Ball:draw()
    love.graphics.draw(self.img, self.x - 10, self.y - 10)
end

function Ball:update(player1, player2)
    -- check if ball is off the screen, is so move it back onto the screen
    if self.x < 0 or self.x > 1280 then
        if self.x < 0 then
            self.x = self.radius
        end
        if self.x > 1280 then
            self.x = 1280 - self.radius
        end

        self.x_speed = self.x_speed * -1
    end
    if self.y < 0 or self.y > 720 then
        if self.y < 0 then
            self.y = 0
        end
        if self.y > 720 then
            self.y = 720
        end

        self.y_speed = self.y_speed * -1
    end

    -- TODO do real trig to create realistic paths --
    -- check if player has booped the ball
    if func.check_collision_circle(self, player1) then
        if self.x > player1.x + 20 then
            self.x_speed = player1.x_speed * 2
        end
        if self.x < player1.x - 20 then
            self.x_speed = player1.x_speed * -2
        end
        if self.y > player1.y + 20 then
            self.y_speed = player1.y_speed * 2
        end
        if self.y < player1.y - 20 then
            self.y_speed = player1.y_speed * -2
        end
    end
    if func.check_collision_circle(self, player2) then
        if self.x > player2.x + 20 then
            self.x_speed = player2.x_speed * 2
        end
        if self.x < player2.x - 20 then
            self.x_speed = player2.x_speed * -2
        end
        if self.y > player2.y + 20 then
            self.y_speed = player2.y_speed * 2
        end
        if self.y < player2.y - 20 then
            self.y_speed = player2.y_speed * -2
        end
    end
    
    -- moves ball
    self.x = self.x + self.x_speed
    self.y = self.y + self.y_speed
    
    -- decelerates ball
    if self.x_speed > 0 then
        self.x_speed = self.x_speed - .5
    end
    if self.x_speed < 0 then
        self.x_speed = self.x_speed + .5
    end
    if self.y_speed > 0 then
        self.y_speed = self.y_speed - .5
    end
    if self.y_speed < 0 then
        self.y_speed = self.y_speed + .5
    end
end

return Ball
