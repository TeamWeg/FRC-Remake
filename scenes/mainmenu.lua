local MainMenu = {}

--all seectable options by the player
local options = {
    Play = {x = 50, y = 300},
    Quit = {x = 50, y = 400}
}

local options_length = 0

for _,v in pairs(options) do
    options_length = options_length + 1
end

-- keys for options array
options_keys = {}

-- add option's keys to a list  
for k,v in pairs(options) do
    table.insert(options_keys, k)
    print(k)
end
-- pointer position
options_pos = 1

function MainMenu.update()
    current_option = options_keys[options_pos]

    if love.keyboard.isDown("w") then
        options_pos = options_pos + 1
        if options_pos > options_length then
            options_pos = 1
        end
    end

    if love.keyboard.isDown("s") then
        options_pos = options_pos - 1
        if options_pos < 1 then
            options_pos = options_length
        end
    end

    if love.keyboard.isDown("enter") then
        if current_option == "Play" then
            scenemanager.set_scene("Game")
        elseif current_option == "Quit" then
            love.event.quit()
        end
    end
end

function MainMenu.draw()
    -- background 
    love.graphics.setColor(15, 50, 255)
    love.graphics.rectangle("fill", 0, 0, 1280, 720)

    -- menu
    love.graphics.setColor(255, 255, 255)
    love.graphics.setFont(love.graphics.newFont("assets/fonts/Boogaloo-Regular.ttf", 64))
    love.graphics.print("Soccer2d", 50, 100)
    love.graphics.setFont(love.graphics.newFont("assets/fonts/Boogaloo-Regular.ttf", 48))
    for k,v in pairs(options) do
        love.graphics.print(k, v.x, v.y)
    end

    love.graphics.print(">", options[options_keys[options_pos]].x - 40, options[options_keys[options_pos]].y)
end

return MainMenu