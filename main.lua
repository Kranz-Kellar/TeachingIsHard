require("player")
require("bulletManager")
require("dummyManager")
require("debugDraw")
require("physicsManager")
require("wall")


function love.load()
    PhysicsManager:init();
    player = Player:create(10, 10, 400, 10, 0.1, love.graphics.newImage("player.png"));
    dummy = DummyManager:createDummy();
    wall = Wall:create(500, 250, 100, 800, love.graphics.newImage("player.png"));
    
end


function love.update(dt)
    player:update(dt);
    BulletManager:update(dt);
    DummyManager:updateAllDummies(dt);
    PhysicsManager:updateWorld(dt);
end

function love.draw()
    love.graphics.print(player.currentShootCouldown, 100, 100);
    love.graphics.print(player.shakeMagnitude, 100, 120);
    love.graphics.print(table.getn(BulletManager.pool), 100, 140);

    
    BulletManager:draw();
    DummyManager:drawAllDummies();
    player:draw();

    wall:draw();
end