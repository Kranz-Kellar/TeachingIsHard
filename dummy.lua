require("transform")
require("debugDraw")
require("physicsManager")

Dummy = {};


function Dummy:create(x, y, speed, timeToLife, direction, sprite)
    local object = {};
    object.type = "dummy";
    local transform = Transform:create(x, y, 1, 1, sprite:getWidth(), sprite:getHeight(), direction);
    object.transform = transform;
    object.sprite = sprite;
    object.speed = speed or 10;
    --TimeToLife measures in seconds
    object.timeToLife = timeToLife or 5;
    object.isEnabled = true;

    object.body = PhysicsManager:createBody(x, y, sprite:getWidth(), sprite:getHeight(), object);
    
    setmetatable(object, self);
    self.__index = self;
    return object;
end

function Dummy:draw()
    
    love.graphics.draw(self.sprite, self.transform.position.x, self.transform.position.y,
    0, self.transform.size.x, self.transform.size.y);

    local xForPrintingText = self.transform.position.x + self.transform.width / 2;
    local yForPrintingText = self.transform.position.y - self.transform.height / 2 - 10;
    

    

end

function Dummy:drawDebugInfo()
    --For debuggin purposes
    love.graphics.print("x1 "..self.transform.position.x, self.transform.position.x, self.transform.position.y - 40);
    love.graphics.print("y2 "..self.transform.position.y, self.transform.position.x, self.transform.position.y - 20);
    love.graphics.print("x3 "..self.transform.position.x + self.transform.width, 
    self.transform.position.x + self.transform.width, self.transform.position.y + self.transform.height + 5);
    love.graphics.print("y4 "..self.transform.position.y + self.transform.height, 
    self.transform.position.x + self.transform.width, self.transform.position.y + self.transform.height + 25);

    love.graphics.setColor(1,0,0);
    love.graphics.polygon("line", self.transform.position.x, self.transform.position.y,
    self.transform.position.x + self.transform.width, self.transform.position.y,
    self.transform.position.x + self.transform.width, self.transform.position.y + self.transform.height,
    self.transform.position.x, self.transform.position.y+ self.transform.height)
    love.graphics.setColor(1,1,1);
    love.graphics.print(math.upper(self.timeToLife), xForPrintingText, yForPrintingText);
end

function Dummy:move(dt)
   -- self.transform.position.x = self.transform.position.x * self.transform.dir.x + self.speed * dt;
    --self.transform.position.y = self.transform.position.y * self.transform.dir.y + self.speed * dt;
    local vx = math.cos(self.transform.direction) * self.speed * dt;
    local vy = math.sin(self.transform.direction) * self.speed * dt;

    self.transform.position.x = self.transform.position.x + vx;
    self.transform.position.y = self.transform.position.y + vy;

    self.body.x = self.transform.position.x;
    self.body.y = self.transform.position.y;

    if(self.transform.position.x + self.transform.width < 0 or self.transform.position.x > love.graphics.getWidth()) then
        self.isEnabled = false;
    end
    if(self.transform.position.y + self.transform.height < 0 or self.transform.position.y > love.graphics.getHeight()) then
        self.isEnabled = false;
    end
    
end

function Dummy:loosingHisLife(dt)
    self.timeToLife = self.timeToLife - dt;
    if self.timeToLife <= 0 then
        self.isEnabled = false;
    end
end

function Dummy:control(dt)
    if love.keyboard.isDown("e") then
        self.transform.direction = self.transform.width + 1 * dt;
    end
    if love.keyboard.isDown("q") then
        self.transform.direction = self.transform.width - 1 * dt;
    end
end

function Dummy:update(dt)
    self:move(dt);
    self:loosingHisLife(dt);
    self:control(dt);
end