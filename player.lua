local Player = {
    x = 0,
    y = 0,
    width = 50,
    height = 50,
    x_speed = 5,
    y_speed = 5
}

function Player:new(x, y)
    local p = {}
    setmetatable(p, Player)

    p.x = x
    p.y = y
    p.width = 50
    p.height = 50
    p.x_speed = 5
    p.y_speed = 5

    return p
end

function Player:move_x(speed)
    self.x = self.x + speed
end

function Player:move_y(speed)
    self.y = self.y + speed
end

return Player