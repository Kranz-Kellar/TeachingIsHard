

Transform = {};


function Transform:create(x, y, sizeX, sizeY, widthInPixels, heightInPixels, dir)
    local object = {};
    object.position = {};
    object.position.x = x or 0;
    object.position.y = y or 0;
    object.size = {};
    object.size.x = sizeX or 1;
    object.size.y = sizeY or 1;
    object.height = heightInPixels;
    object.width = widthInPixels;
    object.direction = dir;

    setmetatable(object, self);
    self.__index = self;

    return object;
end