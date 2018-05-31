local Player = {
    x = 0,
    y = 0,
    radius = 25,
    x_speed = 5,
    y_speed = 5
}
Player.__index = Player

function Player:new(x, y)
    local p = {}
    setmetatable(p, Player)

    p.x = x
    p.y = y
    p.radius = 50
    p.x_speed = 5
    p.y_speed = 5

    return p
end

return Player
