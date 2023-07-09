local object = {
propId = 0,
parentObject,
skipParenting = 1,
wheelRadius = 78, --temporal, make a function calculating radius from scale later!!!!!!!
freefallCounter = 0,
rotZ = 0
}

function object:update()
end

return object