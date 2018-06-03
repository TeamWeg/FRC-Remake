local Scores = {
    player1_score = 0,
    player1_score_pos_x = 10,
    player1_score_pos_y = 5,
    player1_boost_pos_x = 10,
    player1_boost_pos_y = 680,

    player2_score = 0,
    player2_score_pos_x = 1250,
    player2_score_pos_y = 5,
    player2_boost_pos_x = 1240,
    player2_boost_pos_y = 680
}
Scores.__index = Scores

function Scores:new()
    local s = {}
    setmetatable(s, Scores)

    s.player1_score_pos_x = 10
    s.player1_score_pos_y = 5
    s.player1_boost_pos_x = 10
    s.player1_boost_pos_y = 680

    s.player2_score_pos_x = 1250
    s.player2_score_pos_y = 5
    s.player2_boost_pos_x = 1240
    s.player2_boost_pos_y = 680

    return s
end

function Scores:draw()
    love.graphics.setFont(love.graphics.newFont("fonts/Boogaloo-Regular.ttf", 36))
	love.graphics.print(player1.score, self.player1_score_pos_x, self.player1_score_pos_y)
    love.graphics.print(player2.score, self.player2_score_pos_x, self.player2_score_pos_y)
    love.graphics.setFont(love.graphics.newFont("fonts/Boogaloo-Regular.ttf", 24))
    love.graphics.print(player1.boost_charges, self.player1_boost_pos_x, self.player1_boost_pos_y)
    love.graphics.print(player2.boost_charges, self.player2_boost_pos_x, self.player2_boost_pos_y)
end

return Scores