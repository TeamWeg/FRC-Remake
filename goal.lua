local Goal = {
    x = 0,
    y = 0,
    width = 0,
    height = 0,
    top = {},
    bottom = {}
}
Goal.__index = Goal

function Goal:new(x, y)
    local g = {}
    setmetatable(g, Goal)

    g.x = x
    g.y = y
    g.width = 75
    g.height = 225
    g.top = {
        x = g.x,
        y = g.y - 5,
        width = g.width,
        height = 5
    }
    g.bottom = {
        x = g.x, 
        y = g.y + g.height, 
        width = g.width,
        height = 5
    }

    return g
end

function Goal:update(ball)
    local ball_rect = {
        x = ball.x - ball.radius,
        y = ball.y - ball.radius,
        width = ball.radius * 2,
        height = ball.radius * 2
    }
    if ball.x == Goal.x + Goal.width or ball.x + ball.radius == Goal.x then
        ball.x_speed = ball.x_speed * -1
    elseif func.check_collision_rect(self.top, ball_rect) or func.check_collision_rect(self.bottom, ball_rect) then
        ball.y_speed = ball.y_speed * -1
    end

    if func.check_collision_rect(self, ball_rect) then
        if self.x >= 0 and self.x <= 300 then
            player2.score = player2.score + 1
            ball:reset()
            player1:reset()
            player2:reset()
        end
        if self.x >= 980 and self.x <= 1280 then
            player1.score = player1.score + 1
            ball:reset()
            player1:reset()
            player2:reset()
        end
    end
end

function Goal:draw()
    love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

return Goal
