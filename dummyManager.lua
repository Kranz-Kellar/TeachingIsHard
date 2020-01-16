require("dummy")


DummyManager = {};
DummyManager.pool = {};

function DummyManager:createDummy()
    local newDummy = Dummy:create(500, 500, 10, 0.2, 11, love.graphics.newImage("dummy.png"));
    table.insert(DummyManager.pool, newDummy);
end

function DummyManager:updateAllDummies(dt)
    for i, dummy in pairs(DummyManager.pool) do
        dummy:update(dt)
    end
end

function DummyManager:drawAllDummies()
    for i, dummy in pairs(DummyManager.pool) do
        dummy:draw();
    end
end