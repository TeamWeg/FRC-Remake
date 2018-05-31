local Ball = {
    x = 0,
    y = 0,
    radius = 10
}
Ball.__index = Ball

function Ball:new()
    local b = {}
    setmetatable(b, Ball)

    b.x = window.width / 2
    b.y = window.height / 2
    b.radius = 10

    return b
end

function Ball:update(player1, player2)
    if func.check_collision_circle(self, player1) then
        self.x = self.x + 10
    end
end

return Ball
