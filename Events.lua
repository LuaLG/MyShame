local Events = {}

Events.Update = {}
Events.Draw = {}

function Events:Fire(Type, EventName, ...)
    for i,v in pairs(self[Type]) do
        if v.Event == EventName then
            v.Run(...)
        end
    end
end

function Events:On(Type, EventName, Callback)
    self[Type][#self[Type]+1] = {Event = EventName, Run = Callback}
end

function love.update(DeltaTime)
    Events:Fire("Update", "Update", DeltaTime)
end

function love.draw()
    Events:Fire("Draw", "Draw", nil)
end

return Events