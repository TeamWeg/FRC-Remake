local func = {}

func.check_collision_rect = function(obj1, obj2)
    return obj1.x < (obj2.x + obj2.width) and
           obj2.x < (obj1.x + obj1.width) and
           obj1.y < (obj2.y + obj2.height) and
           obj2.y < (obj1.y + obj1.height)
end

func.check_collision_circle = function(circleA, circleB)
    local dist = (circleA.x - circleB.x)^2 + (circleA.y - circleB.y)^2
    return dist <= (circleA.radius + circleB.radius)^2
end

return func
