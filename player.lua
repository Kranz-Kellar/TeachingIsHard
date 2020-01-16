require("myMath")
require("bulletManager")
require("transform")
require("debugDraw")


Player = {};

function Player:create(x, y, speed, damage, shootCouldown, sprite)
    local object = {};
    local transform = Transform:create(x, y, 1, 1, sprite:getWidth(), sprite:getHeight(), 0);
    object.transform = transform;
    object.sprite = sprite;
    object.speed = speed or 100;
    object.coins = 0;
    object.maxHealth = 100;
    object.currentHealth = object.maxHealth;
    object.damage = damage or 10;
    object.shootCouldown = shootCouldown or 0.2;
    object.currentShootCouldown = shootCouldown or 0.2;
    object.shakeMagnitude = 0;
    


    setmetatable(object, self);
    self.__index = self;
    return object;
end


function Player:shoot(dt)
    self.currentShootCouldown = self.currentShootCouldown + dt;
    if love.keyboard.isDown("space") and self.shootCouldown < self.currentShootCouldown then
        print("SHOOT");
        BulletManager:createBullet(self.transform.position.x, self.transform.position.y, self.damage,
    self.transform.dir, 700);
        self.currentShootCouldown = 0;
    end
end

function Player:getDamage(amount)

end

function Player:die()

end

function Player:move(dt)

    if love.keyboard.isDown("w") then
        self.transform.position.y = self.transform.position.y - self.speed * dt;
    end

    if love.keyboard.isDown("s") then 
        self.transform.position.y = self.transform.position.y + self.speed * dt;
    end

    if love.keyboard.isDown("a") then
        self.transform.position.x = self.transform.position.x - self.speed * dt;
    end

    if love.keyboard.isDown("d") then 
        self.transform.position.x = self.transform.position.x + self.speed * dt;
    end

    if love.keyboard.isDown("e") then
        self.shakeMagnitude = self.shakeMagnitude + 0.5 ;
        self.shakeMagnitude = clamp(0, self.shakeMagnitude, 2);
    end

    if love.keyboard.isDown("z") then
        self.transform.dir = self.transform.dir + 1 * dt;
    end

    if love.keyboard.isDown("x") then
        self.transform.dir = self.transform.dir - 1 * dt;
    end

end

function Player:draw()
    self:drawShakedScreen();
    love.graphics.draw(self.sprite, self.transform.position.x, self.transform.position.y,
     self.transform.dir, self.transform.size.x, self.transform.size.y, self.transform.width/2, self.transform.height/2);



end

function Player:drawShakedScreen()
    local dx = love.math.random(-self.shakeMagnitude, self.shakeMagnitude);
    local dy = love.math.random(-self.shakeMagnitude, self.shakeMagnitude);
    love.graphics.translate(dx, dy);
end

function Player:relaxScreen(dt)
    if self.shakeMagnitude > 0 then
        self.shakeMagnitude = self.shakeMagnitude - dt * 2;
    end
    self.shakeMagnitude = clamp(0, self.shakeMagnitude, 2);
end 

function Player:update(dt)
    self:move(dt);
    self:shoot(dt);
    self:relaxScreen(dt);
end

return Player;