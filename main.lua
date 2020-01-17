require("player")
require("bulletManager")
require("dummyManager")
require("debugDraw")
require("physicsManager")
require("mouseController")
require("wall")


function love.load()
    for i = 1, 1 do
        DummyManager:createDummy();
    end

   -- DummyManager:createInfiniteDummy();
    mouseX = 0;
    mouseY = 0;
    deltaTime = 0;
end


function love.update(dt)
    deltaTime = dt;
    BulletManager:update(dt);
    DummyManager:updateAllDummies(dt);
    MouseController:update(dt);

    if love.keyboard.isDown("f") then
        DummyManager:createDummy();
    end
    if love.keyboard.isDown("q") then
        collectgarbage();
    end
end

function love.draw()
    
    BulletManager:draw();
    DummyManager:drawAllDummies();
    --player:draw();

   -- wall:draw();
   love.graphics.setColor(0, 1, 0);
    love.graphics.print("dt "..deltaTime, 10, 30);
    love.graphics.print("Pool of dummies "..#DummyManager.pool, 10, 10);
    love.graphics.print('Memory actually used (in kB): ' .. collectgarbage('count'), 10,50)
    local stats = love.graphics.getStats()
 
    local str = string.format("Estimated amount of texture memory used: %.2f MB", stats.texturememory / 1024 / 1024)
    love.graphics.print(str, 10, 70)
    love.graphics.setColor(1, 1, 1);
end