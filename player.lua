local Player = {
    x = 0,
    y = 0,
    start_x = 0,
    start_y = 0,
    radius = 25,
    x_speed = 5,
    y_speed = 5,
    score = 0,
    timer = Timer:new(2)
}
Player.__index = Player

function Player:new(x, y)
    local p = {}
    setmetatable(p, Player)

    p.x = x
    p.y = y
    p.start_x = x
    p.start_y = y
    p.radius = 50
    p.x_speed = 5
    p.y_speed = 5
    p.score = 0

    return p
end

function Player:BOOST()

    self.x_speed = 10
    self.y_speed = 10
end

function Player:reset()
    self.x = self.start_x
    self.y = self.start_y
end

function Player:update()
    timer:update()
end

return Player
