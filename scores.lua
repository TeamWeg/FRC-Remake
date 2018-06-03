local Scores = {
    player1_score = 0,
    player1_score_pos_x = 10,
    player1_score_pos_y = 5,

    player2_score = 0,
    player2_score_pos_x = 1250,
    player2_score_pos_y = 5
}
Scores.__index = Scores

function Scores:new()
    local s = {}
    setmetatable(s, Scores)

    s.player1_score_pos_x = 10
    s.player1_score_pos_y = 5

    s.player2_score_pos_x = 1250
    s.player2_score_pos_y = 5

    return s
end

function Scores:draw()
    love.graphics.setFont(love.graphics.newFont("fonts/Boogaloo-Regular.ttf", 36))
	love.graphics.print(player1.score, self.player1_score_pos_x, self.player1_score_pos_y)
	love.graphics.print(player2.score, self.player2_score_pos_x, self.player2_score_pos_y)
end

return Scores