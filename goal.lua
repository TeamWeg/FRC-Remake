local Goal = {
    x = 0,
    y = 0,
    width = 0,
    height = 0,
}
Goal.__index = Goal

function Goal:new(x, y)
    local g = {}
    setmetatable(g, Goal)

    g.x = x
    g.y = y
    g.width = 75
    g.height = 225

    return g

end

return Goal
