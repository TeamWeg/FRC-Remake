local Immovable = {}
Immovable.__index = Immovable

function Immovable:new()
    local i = {}
    setmetatable(i, Immovable)

    i.start_time = 0

    return i
end

setmetatable(Immovable, {__index = Powerup})

function Immovable:update()
    print("loser")
    ball:set_speed_x(0)
    ball:set_speed_y(0)
end

return Immovable