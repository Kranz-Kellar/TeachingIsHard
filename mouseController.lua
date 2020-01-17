require("dummyManager")

MouseController = {}


function MouseController:update(dt)
    if love.mouse.isDown(1) then
        local mouseX = love.mouse.getX();
        local mouseY = love.mouse.getY();

        for i, dummy in pairs(DummyManager.pool) do
            if MouseController:checkCollisionOfPointWithDummy(mouseX, mouseY, dummy) then
                dummy.isEnabled = false;
            end
        end
    end
end

function MouseController:checkCollisionOfPointWithDummy(pointX, pointY, dummy)
    if pointX > dummy.transform.position.x and
     pointX < dummy.transform.position.x + dummy.transform.width then
        print("x is captured")
        if pointY > dummy.transform.position.y and
        pointY < dummy.transform.position.y + dummy.transform.height then
            print("Gotcha")
            return true;
        else
            print("Aww")
            return false;
        end
    end
end