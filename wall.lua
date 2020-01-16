require("physicsManager")
require("transform")

Wall = {};


function Wall:create(x, y, width, height, sprite)
    local object = {};
    object.type = "wall"
    local transform = Transform:create(x, y, 1, 1, width, height, 0);
    object.transform = transform;
    object.sprite = sprite;
    object.physics = {};
    object.physics.body = PhysicsManager:createBody(x, y, "static");
    object.physics.shape = love.physics.newRectangleShape(width, height);
    object.physics.fixture = love.physics.newFixture(object.physics.body, object.physics.shape);
    object.physics.fixture:setUserData("wall");

    setmetatable(object, self);
    self.__index = self;

    return object;
end

function Wall:draw()
    love.graphics.polygon("fill", self.physics.body:getWorldPoints(self.physics.shape:getPoints()));
end


