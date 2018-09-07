local Util = {}
Display = {}

function Util:Draw()
    local Dip = 0
    for i,v in pairs(Display) do
        coroutine.wrap(function()
            love.graphics.setColor(255, 255, 255)
            love.graphics.print(math.random(Display[i].Time/50).." | "..Display[i].Content, 1, Dip)
            Display[i].Time = Display[i].Time - 1
            if Display[i].Time <= 0 then
                Display[i] = nil
            end
        end)()
        Dip = Dip + 15
    end
end

function Util:Print(Seconds, Text)
    Display[#Display+1] = {Time = Seconds*50, Content = Text}
end

return Util