local Events = require("Events")
local Class = require("Class")
local Util = require("Util")

local Player = Class.New("Player")
Player:SetSize(25,25)
Player:SetPosition(10,10)

Util:Print(5, "Test")
Util:Print(5, "Test")
Util:Print(5, "Test")

Events:On("Update", "Update", function(DeltaTime)
    if love.keyboard.isDown(Player.Controls.Up) then
        Player:SetVelocity(Player.Velocity.X, -Player.WalkSpeed)
    end
    if love.keyboard.isDown(Player.Controls.Down) then
        Player:SetVelocity(Player.Velocity.X, Player.WalkSpeed)
    end
    if love.keyboard.isDown(Player.Controls.Left) then
        Player:SetVelocity(-Player.WalkSpeed, Player.Velocity.Y)
    end
    if love.keyboard.isDown(Player.Controls.Right) then
        Player:SetVelocity(Player.WalkSpeed, Player.Velocity.Y)
    end
    if love.keyboard.isDown(Player.Controls.Sprint) then
        Player.WalkSpeed = 2
    else
        Player.WalkSpeed = 1
    end
    Player:ActVelocity()
    if Player.Velocity.X > 0 then
        Player.Velocity.X = Player.Velocity.X - 0.05
    end
    if Player.Velocity.Y > 0 then
        Player.Velocity.Y = Player.Velocity.Y - 0.05
    end
    if Player.Velocity.Y < 0 then
        Player.Velocity.Y = Player.Velocity.Y + 0.05
    end
    if Player.Velocity.X < 0 then
        Player.Velocity.X = Player.Velocity.X + 0.05
    end
end)

Events:On("Draw", "Draw", function()
    Util:Draw()
    Player:Draw()
end)