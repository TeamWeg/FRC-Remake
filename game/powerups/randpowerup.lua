local RandPowerup = {}
RandPowerup.__index = RandPowerup

function RandPowerup:new()
    local r = {}
    setmetatable(r, RandPowerup)

    return r
end

setmetatable(RandPowerup, {__index = Powerup})

function RandPowerup:update(p)
    if p.powerup_type == 1 then
        immovable:update()
    -- elseif  p.powerup_type == 2 then
    --     self.immovable:update(p)
    -- elseif  p.powerup_type == 3 then
    --     self.immovable:update(p)
    -- else
    --     self.immovable:update(p)
    end
end

return RandPowerup