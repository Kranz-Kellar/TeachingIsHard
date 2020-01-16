

PhysicsManager = {};
PhysicsManager.world = love.physics.newWorld(0, 1, true);
function PhysicsManager:init()
    --PhysicsManager.world = love.physics.newWorld(0, 0, false);
    PhysicsManager.world = love.physics.newWorld(0, 1, true);
    PhysicsManager.world:setCallbacks(beginContact, endContact, preSolve, postSolve);
end

function PhysicsManager:createBody(x, y, type)
    return love.physics.newBody(PhysicsManager.world, x, y, type);
end

function PhysicsManager:updateWorld(dt)
    PhysicsManager.world:update(dt);
end

function beginContact(a, b, coll)
    print(a:getUserData());
    print(b:getUserData());
end
function endContact(a, b, coll)
    
end
 
function preSolve(a, b, coll)
 
end
 
function postSolve(a, b, coll, normalimpulse, tangentimpulse)
 
end