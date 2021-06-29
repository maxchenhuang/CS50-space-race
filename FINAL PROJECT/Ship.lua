Ship = Class{}

function Ship:init(x, y, width, height)

    self.x = x 
    self.y = y
    self.width = width
    self.height = height

    self.dx = 0
end


function Ship:update(dt)
    if self.dx < 0 then 
        self.x = math.max(5, self.x + self.dx * dt)

    elseif self.dx > 0 then
        self.x = math.min(VIRTUAL_WIDTH + 1, self.x + self.dx * dt)
    end
end


function Ship:reset()
    self.x = 5
    self.dx = 0

end

function Ship:render()

    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height) 
end