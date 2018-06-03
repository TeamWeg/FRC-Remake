local Boost = Powerup:new()

function Boost:new(x, y)
    local b = {}
    setmetatable(b, Boost)

    b.x = x 
    b.y = y
    b.radius = 10
    b.used = false
    b.color = (255, 215, 0)

    return b
end

function Boost:update(player1, player2)
    if self.used == false then
        if func.check_collision_circle(self, player1) then
            player1.boost_charges = player1.boost_charges + 1
        end
        if func.check_collision_circle(self, player2) then
            player2.boost_charges = player2.boost_charges + 1
        end
    else

    end
end

return Boost