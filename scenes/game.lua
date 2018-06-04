local Game = {
    player1 = Player:new(160, 360),
    player2 = Player:new(1120, 360),

    ball = Ball:new(),

    left_goal = Goal:new(0, 245),
    right_goal = Goal:new(1205, 245),

    world = World:new(),
    scores = Scores:new(),
    controls = Controls:new(),

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
    },

    -- powerups
    powerup_list = {
        powerup1 = Powerup:new(270, 180), -- top left
        powerup2 = Powerup:new(1010, 180), -- top right
        powerup3 = Powerup:new(270, 540), -- bottom left
        powerup4 = Powerup:new(1010, 540) -- bottom right
    }
}
Game.__index = Game

function Game:new()
    local g = {}
    setmetatable(g, Game)

    g.player1 = Player:new(160, 360)
    g.player2 = Player:new(1120, 360)

    g.ball = Ball:new()

    g.left_goal = Goal:new(0, 245)
    g.right_goal = Goal:new(1205, 245)

    g.world = World:new()
    g.scores = Scores:new()
    g.controls = Controls:new()

    -- boosts (which are, in fact, powerups)
    g.boost_list = {
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
    g.powerup_list = {
        powerup1 = Powerup:new(270, 180), -- top left
        powerup2 = Powerup:new(1010, 180), -- top right
        powerup3 = Powerup:new(270, 540), -- bottom left
        powerup4 = Powerup:new(1010, 540) -- bottom right
    }

    return g
end

function Game:update()
    -- update methods
	self.controls:update()
	self.ball:update(self.player1, self.player2)
	self.left_goal:update(self.ball)
	self.right_goal:update(self.ball)
	self.player1:update()
	self.player2:update()

	for _,v in pairs(self.boost_list) do
		v:update(self.player1, self.player2)
	end

	for _,v in pairs(self.powerup_list) do
		v:update(self.player1, self.player2)
	end
end

function Game:draw()
    -- world --
	self.world:draw()

	-- scores --
	self.scores:draw()

	-- ball --
	self.ball:draw()

	-- goals --
	self.left_goal:draw()
	self.right_goal:draw()

	-- powerups --
	for _,v in pairs(self.boost_list) do
		v:draw()
	end

	for _,v in pairs(self.powerup_list) do
		v:draw()
	end

	-- players --
	self.player1:draw()
	self.player2:draw()

	-- framerate --
	love.graphics.setColor(0, 0, 0)
	love.graphics.setFont(love.graphics.newFont(12))
	love.graphics.print(love.timer.getFPS(), 1250, 700)
end

return Game