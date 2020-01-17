

Vector = {};

function Vector:create(x, y, z)
    local object = {};
    object.x = x or 0;
    object.y = y or 0;
    object.z = z or 0;

    setmetatable(object, self);
    self.__index = self;

    return object;
end

