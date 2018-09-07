local Class = {}
Objects = {
    ["Player"] = {Controls = {Up = "w", Down = "s", Left = "a", Right = "d", Sprint = "lshift"}, WalkSpeed = 1, Pyschics = true}
}

function deepcopy(orig) -- http://lua-users.org/wiki/CopyTable
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function Class.New(Class)
    if Objects[Class] then
        local New = deepcopy(Objects[Class])
        New.Velocity = {X = 0, Y = 0}
        New.Position = {X = 0, Y = 0}
        New.Size = {X = 0, Y = 0}
        New.Color = {R = 255, G = 255, B = 255}
        function New:SetSize(nX, nY)
            self.Size.X = nX or self.Size.X
            self.Size.Y = nY or self.Size.Y
        end
        function New:SetPosition(pX, pY)
            self.Position.X = pX or self.Position.X
            self.Position.Y = pY or self.Position.Y
        end
        function New:Move(mX, mY)
            self.Position.X = self.Position.X + mX or 0
            self.Position.Y = self.Position.Y + mY or 0
        end
        function New:SetVelocity(vX, vY)
            self.Velocity.X = vX or self.Velocity.X
            self.Velocity.Y = vY or self.Velocity.Y
        end
        function New:ActVelocity()
            self:Move(self.Velocity.X, self.Velocity.Y)
        end
        function New:Draw()
            love.graphics.setColor(self.Color.R, self.Color.G, self.Color.B)
            love.graphics.rectangle("fill", self.Position.X, self.Position.Y, self.Size.X, self.Size.Y)
        end
        return New
    end
end

return Class