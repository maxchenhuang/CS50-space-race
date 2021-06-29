Ball = Class{}

function Ball:init(x, y, width, height)
    self.x = x 
    self.y = y
    self.width = width
    self.height = height

    self.dy = (math.random(2) == 1 and -1 or 1) * (math.random(25, 50))
end


function Ball:reset()
    
    if self.y < 0 then
        self.y = VIRTUAL_HEIGHT
        self.dy = - math.random(55, 180) * 1.15

    elseif self.y > VIRTUAL_HEIGHT then
        self.y = 0
        self.dy = math.random(55, 180) * 1.15
    end
end


function Ball:collides(box)

    if self.x > box.x + box.width or self.x + self.width < box.x then
        return false
    end

    if self.y > box.y + box.height or self.y + self.height < box.y then
        return false
    end
    
    return true
end



function Ball:update(dt)
    self.y = self.y + self.dy * dt
end

function Ball:render()
    
    love.graphics.rectangle("fill", self.x, self.y, 4, 4)

end