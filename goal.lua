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
        ball.x_change = ball.x_change * -1
    elseif func.check_collision_rect(self.top, ball_rect) or func.check_collision_rect(self.bottom, ball_rect) then
        ball.y_change = ball.y_change * -1
    end
end

return Goal
