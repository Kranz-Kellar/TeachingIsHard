require("dummy")
require("vector")

DummyManager = {};
DummyManager.pool = {};
math.randomseed(os.time())

function DummyManager:createDummy()
    local sprite = love.graphics.newImage("dummy.png")
    local x = math.random(1, love.graphics.getWidth() - sprite:getWidth());
    local y = math.random(1, love.graphics.getHeight() - sprite:getHeight());
    local vectorOfDirection = math.random(360);
    local timeToLife = math.random(5, 160);
    local speed = math.random(5, 12);
    local newDummy = Dummy:create(x, y, speed, timeToLife, vectorOfDirection, sprite);
    table.insert(DummyManager.pool, newDummy);
end

function DummyManager:createInfiniteDummy()
    local x = math.random(1, love.graphics.getWidth());
    local y = math.random(1, love.graphics.getHeight());
    local vectorOfDirection = math.random(360);
    local sprite = love.graphics.newImage("dummy.png")
    local timeToLife = 100000000;
    local speed = math.random(5, 12);
    local newDummy = Dummy:create(x, y, speed, timeToLife, vectorOfDirection, sprite);
    table.insert(DummyManager.pool, newDummy);
end

function DummyManager:updateAllDummies(dt)
    for i, dummy in pairs(DummyManager.pool) do
        if dummy.isEnabled then
            dummy:update(dt);
        else 
            table.remove(DummyManager.pool, i);
        end
    end
end

function DummyManager:drawAllDummies()
    
    for i, dummy in pairs(DummyManager.pool) do
        dummy:draw();
    end
end