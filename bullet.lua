require("transform")
require("debugDraw")

Bullet = {};


function Bullet:create(x, y, damage, direction, speed, sprite)
    local object = {};
    local transform = Transform:create(x, y, 1, 1, sprite:getWidth(),
     sprite:getHeight(), direction);
     object.transform = transform;
    object.sprite = sprite;
    object.isEnabled = true;
    object.speed = speed or 100;
    object.damage = damage or 10;


    setmetatable(object, self)
    self.__index = self;

    return object;
end

function Bullet:update(dt)
    self:move(dt);
end

function Bullet:draw()
    love.graphics.draw(self.sprite, self.transform.position.x,
     self.transform.position.y, self.transform.dir,
      self.transform.size.x, self.transform.size.y, self.transform.width / 2, self.transform.height / 2);

end

function Bullet:move(dt)
    self.transform.position.x = self.transform.position.x +
    math.cos(self.transform.dir) * self.speed * dt;
   self.transform.position.y = self.transform.position.y +
    math.sin(self.transform.dir) * self.speed * dt;

end


function Bullet:destroy()

end