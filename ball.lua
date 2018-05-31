local Ball = {
    x = 0,
    y = 0,
    radius = 10,
    x_speed = 0,
    y_speed = 0
}
Ball.__index = Ball

function Ball:new()
    local b = {}
    setmetatable(b, Ball)

    b.x = window.width / 2
    b.y = window.height / 2
    b.radius = 10
    x_speed = 0
    y_speed = 0

    return b
end

function Ball:update(player1, player2)
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

    if func.check_collision_circle(self, player1) then
        if self.x > player1.x then
            self.x_speed = 10
        end
        if self.x < player1.x then
            self.x_speed = -10
        end
        if self.y > player1.y then
            self.y_speed = 10
        end
        if self.y < player1.y then
            self.y_speed = -10
        end
    end

    self.x = self.x + self.x_speed
    self.y = self.y + self.y_speed
    
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
