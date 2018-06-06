local Boost = {}
Boost.__index = Boost

function Boost:new(x, y)
    local b = {}
    setmetatable(b, Boost)

    b.x = x 
    b.y = y
    b.radius = 10
    b.used = false
    b.color = {255, 215, 0}
    b.start_time = 0

    return b
end

setmetatable(Boost, {__index = Powerup})

function Boost:update(player1, player2)
    if self.used then
        self.color = {100, 100, 100}
        if (love.timer.getTime() - self.start_time) >= 5 then
            self.used = false
        end
    else
        self.color = {255, 215, 0}
        if func.check_collision_circle(self, player1) then
            player1.boost_charges = player1.boost_charges + 1
            self.used = true
            self.start_time = love.timer.getTime()
        end
        if func.check_collision_circle(self, player2) then
            player2.boost_charges = player2.boost_charges + 1
            self.used = true
            self.start_time = love.timer.getTime()
        end
    end
end

return Boost