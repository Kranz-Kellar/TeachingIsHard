require("transform")
require("debugDraw")


Dummy = {};


function Dummy:create(x, y, speed, learningFactor, amountOfKnowledge, sprite)
    local object = {};
    local transform = Transform:create(x, y, 1, 1, sprite:getWidth(), sprite:getHeight(), 0);
    object.transform = transform;
    object.sprite = sprite;
    object.speed = speed or 10;
    object.learningFactor = learningFactor or 0.1;
    object.amountOfKnowledge = amountOfKnowledge or 10;

    setmetatable(object, self);
    self.__index = self;
    return object;
end

function Dummy:draw()
    love.graphics.draw(self.sprite, self.transform.position.x, self.transform.position.y,
    self.transform.dir, self.transform.size.x, self.transform.size.y, self.transform.width/2, self.transform.height/2);

end

function Dummy:learn(dt)
    self.amountOfKnowledge = self.amountOfKnowledge + self.learningFactor * dt;
end

function Dummy:move(dt)
    self.transform.position.x = self.transform.position.x - self.speed * dt;

end

function Dummy:update(dt)
    self:learn(dt);
    self:move(dt);
end