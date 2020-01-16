

function debugDrawRectangle(x1, y1, x2, y2)
    love.graphics.setColor(1, 1, 0);
    love.graphics.rectangle("line", x1, y1, x2 - x1, y2 - y1);
    love.graphics.setColor(1, 1, 1);
end

