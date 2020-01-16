require("bullet")

BulletManager = {};
BulletManager.pool = {};
BulletManager.defaultBulletSprite = love.graphics.newImage("bullet.png");


function BulletManager:createBullet(x, y, damage, direction, speed)
    local newBullet = Bullet:create( x, y, damage, direction, speed,
     BulletManager.defaultBulletSprite );
     table.insert( BulletManager.pool, newBullet );
end

function BulletManager:update(dt)

    for i, bullet in pairs(BulletManager.pool) do
        bullet:update(dt);
    end

end

function BulletManager:draw()

    for i, bullet in pairs(BulletManager.pool) do
        bullet:draw();
    end

end


return BulletManager;