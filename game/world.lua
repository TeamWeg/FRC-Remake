local World = {
    width = 1280,
    height = 720,
    img = love.graphics.newImage("assets/media/World-BG.png")
}
World.__index = World

function World:new()
    local w = {}
    setmetatable(w, World)

    w.width = 1280
    w.height = 720
    w.img = love.graphics.newImage("assets/media/World-BG.png")

    return w
end

function World:get_dimensions()
    return self.width, self.height
end

function World:draw()
    love.graphics.setColor(0, 155, 0)
    love.graphics.draw(self.img, 0, 0)
	--love.graphics.rectangle("fill", 0, 0, 1280, 720)
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", 637.5, 0, 5, 720)
	love.graphics.circle("line", 640, 360, 150)
end

return World