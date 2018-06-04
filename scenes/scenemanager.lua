Game = require "scenes/game"
--MainMenu = require "scenes/mainmenu"

local SceneManager = {
    scenes = {},
    current_scene = nil
    -- mainmenu = MainMenu:new()
}
SceneManager.__index = SceneManager

function SceneManager:new()
    local s = {}
    setmetatable(s, SceneManager)

    s.scenes = {
        "Game",
        "MainMenu"
    }
    s.current_scene = ""
    --s.mainmenu = MainMenu:new()

    return s
end

function SceneManager:set_scene(scene)
    self.current_scene = scene
end

function SceneManager:update()
    Game.update()
    if self.current_scene == "Game" then

    elseif self.current_scene == "MainMenu" then
     --   self.mainmenu:update()
    end
end

function SceneManager:draw()
    Game.draw()
    if self.current_scene == "Game" then
        --Game.draw()
    elseif self.current_scene == "MainMenu" then
     --   self.mainmenu:draw()
    end
end

return SceneManager