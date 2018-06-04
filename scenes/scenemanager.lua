local SceneManager = {
    scenes = nil,
    current_scene = nil
}
SceneManager.__index = SceneManager

function SceneManager:new(scenes)
    local s = {}
    setmetatable(s, SceneManager)

    s.scenes = scenes
    s.current_scene = nil

    return s
end

function SceneManager:set_scene(scene)
    if scenes[scene] then
        self.current_scene = scene
    end
end

function SceneManager:update()
    self.current_scene.update()
end

function SceneManager:draw()
    self.current_scene.draw()
end

return SceneManager