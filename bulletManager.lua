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

        BulletManager:checkBounds(bullet, i);
    end

end

function BulletManager:checkBounds(bullet, i)
    if bullet.transform.position.x > love.graphics.getWidth() or
        bullet.transform.position.x < 0 then
        table.remove(BulletManager.pool, i);
        return;
    end


    if bullet.transform.position.y > love.graphics.getHeight() or
        bullet.transform.position.y < 0 then
        table.remove(BulletManager.pool, i);
        return;
    end
end

function BulletManager:draw()

    for i, bullet in pairs(BulletManager.pool) do
        bullet:draw();
    end

end


return BulletManager;