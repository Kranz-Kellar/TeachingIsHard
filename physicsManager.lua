

PhysicsManager = {};
PhysicsManager.world = {};


function PhysicsManager:createBody(x, y, width, height, owner)
    local body = {};
    body.x = x;
    body.y = y;
    body.width = width;
    body.height = height;
    body.owner = owner;

    table.insert(PhysicsManager.world, body);

    return body;
end


