local Immovable = {}
Immovable.__index = Immovable

function Immovable:new()
    local i = {}
    setmetatable(i, Immovable)

    i.start_time = 0

    return i
end

setmetatable(Immovable, {__index = Powerup})

function Immovable:update(player1, player2, ball)
    temp_x = ball:get_speed_x()
    temp_y = ball:get_speed_y()

    if self.used then
        ball:draw()
        ball:set_speed_x(temp_x)
        ball:set_speed_y(temp_y)
    else
        self.used = true
        ball:set_speed_x(0)
        ball:set_speed_y(0)
        
    end
end
