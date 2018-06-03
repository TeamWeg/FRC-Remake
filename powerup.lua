local Powerup = {
    x = 0,
    y = 0,
    radius = 0,
    used = false,
    color = {0, 0, 0},
    start_time = 0
}
Powerup.__index = Powerup

function Powerup:new(x, y)
    local p = {}
    setmetatable(p, Powerup)

    p.x = x
    p.y = y
    p.radius = 10
    p.used = false
    p.color = {0, 0, 0}
    p.start_time = 0

    return p
end

function Powerup:draw()
    love.graphics.setColor(self.color)
    love.graphics.circle("fill", self.x, self.y, self.radius)
end

function Powerup:update(player1, player2) end

return Powerup