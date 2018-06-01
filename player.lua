local Player = {
    x = 0,
    y = 0,
    start_x = 0,
    start_y = 0,
    radius = 25,
    x_speed = 5,
    y_speed = 5,
    score = 0,
    boost = false,
    start_time = love.timer.getTime()
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
    p.boost = false
    p.start_time = love.timer.getTime()

    return p
end

function Player:BOOST()
    self.boost = true
    self.start_time = love.timer.getTime()
end

function Player:reset()
    self.x = self.start_x
    self.y = self.start_y
end

function Player:update()
    if self.boost then
        self.x_speed = 10
        self.y_speed = 10
    end
    if (love.timer.getTime() - self.start_time) >= 2 then
        self.x_speed = 5
        self.y_speed = 5
        self.boost = false
    end
end

return Player
