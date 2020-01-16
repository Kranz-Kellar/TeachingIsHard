require("transform")
require("debugDraw")
require("physicsManager")

Bullet = {};


function Bullet:create(x, y, damage, direction, speed, sprite, world)
    local object = {};
    object.type = "bullet";
    local transform = Transform:create(x, y, 1, 1, sprite:getWidth(),
     sprite:getHeight(), direction);
     object.transform = transform;
    object.sprite = sprite;
    object.isEnabled = true;
    object.speed = speed or 100;
    object.damage = damage or 10;
    object.physics = {};
    object.physics.body = PhysicsManager:createBody(x, y, "dynamic");
    object.physics.shape = love.physics.newRectangleShape(sprite:getWidth(), sprite:getHeight());
    object.physics.fixture = love.physics.newFixture(object.physics.body, object.physics.shape);
    object.physics.fixture:setUserData("bullet");


    setmetatable(object, self)
    self.__index = self;

    return object;
end

function Bullet:update(dt)
    self:move(dt);

    self.physics.body:applyForce(100, 0);
    self.transform.position.x = self.physics.body:getX();
    self.transform.position.y = self.physics.body:getY();
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
    print("Destroyed")
    self = nil;
end