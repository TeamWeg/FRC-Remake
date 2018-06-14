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
    boost_charges = 1,
    powerup_charges = 0,
    start_time = love.timer.getTime(),
    boost_released = true,
    powerup_released = true,
    color = {math.random(255), math.random(255), math.random(255)}
}
Player.__index = Player

function Player:new(x, y, color)
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
    p.boost_charges = 0
    p.powerup_charges = 0
    p.start_time = love.timer.getTime()
    p.boost_released = true
    p.powerup_released = true
    p.color = color

    return p
end

function Player:BOOST()
    self.boost = true
    self.start_time = love.timer.getTime()
end

function Player:reset()
    self.x = self.start_x
    self.y = self.start_y
    self.boost_charges = 0
    self.powerup_charges = 0
end

function Player:draw()
    love.graphics.setColor(0,0,0)
    love.graphics.circle("fill", self.x, self.y, self.radius)
    love.graphics.setColor(self.color)
    love.graphics.circle("fill", self.x, self.y, self.radius - 10)
end

function Player:update()
    if self.boost then
        self.x_speed = 10
        self.y_speed = 10
    end
    if (love.timer.getTime() - self.start_time) >= 0.5 then
        self.x_speed = 5
        self.y_speed = 5
        self.boost = false
    end
end

return Player
