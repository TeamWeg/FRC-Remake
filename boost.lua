local Boost = Powerup:new()

Boost.x = x 
Boost.y = y
Boost.radius = 10
Boost.used = false
Boost.color = {255, 215, 0}
Boost.start_time = 0

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