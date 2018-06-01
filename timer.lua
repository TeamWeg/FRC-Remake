local Timer = {
    length = 0,
    start_time = love.timer.getTime()
}
Timer.__index = Timer

function Timer:new(length)
    local t = {}
    setmetatable(t, Timer)

    t.length = length
    t.start_time = love.timer.getTime()

    return t
end

function Timer:reset()
    self.start_time = love.timer.getTime()
end

function Timer:update()
    if (love.timer.getTime() - self.start_time) >= self.length then
        return true
    end
    return false
end

return Timer