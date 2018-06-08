local Game = {}

player1 = Player:new(160, 360, {255, 0, 0})
player2 = Player:new(1120, 360, {0, 0, 255})

ball = Ball:new()

left_goal = Goal:new(0, 245)
right_goal = Goal:new(1205, 245)

world = World:new()
scores = Scores:new()
controls = Controls:new()

immovable = Immovable:new()

-- boosts (which are, in fact, powerups)
boost_list = {
	boost1 = Boost:new(100, 100), -- top left
	boost2 = Boost:new(1180, 100), -- top right
	boost3 = Boost:new(100, 620), -- bottom left
	boost4 = Boost:new(1180, 620), -- bottom right
	boost5 = Boost:new(270, 360), -- mid left
	boost6 = Boost:new(640, 210), -- mid top
	boost7 = Boost:new(640, 510), -- mid bottom
	boost8 = Boost:new(1010, 360) -- mid right
}

-- powerups
powerup_list = {
	powerup1 = Powerup:new(270, 180), -- top left
	powerup2 = Powerup:new(1010, 180), -- top right
	powerup3 = Powerup:new(270, 540), -- bottom left
	powerup4 = Powerup:new(1010, 540) -- bottom right
}

function Game.update()
    -- update methods
	controls:update()
	ball:update(player1, player2)
	left_goal:update(ball)
	right_goal:update(ball)
	player1:update()
	player2:update()

	for _,v in pairs(boost_list) do
		v:update(player1, player2)
	end

	for _,v in pairs(powerup_list) do
		v:update(player1, player2)
	end
end

function Game.draw()
    -- world --
	world:draw()

	-- scores --
	scores:draw()

	-- ball --
	ball:draw()

	-- goals --
	left_goal:draw()
	right_goal:draw()

	-- powerups --
	for _,v in pairs(boost_list) do
		v:draw()
	end

	for _,v in pairs(powerup_list) do
		v:draw()
	end

	-- players --
	player1:draw()
	player2:draw()

	-- framerate --
	love.graphics.setColor(0, 0, 0)
	love.graphics.setFont(love.graphics.newFont(12))
	love.graphics.print(love.timer.getFPS(), 1250, 700)
end

return Game