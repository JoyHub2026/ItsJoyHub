local KEY = getgenv().ItsLunarHubBase
local LP = game:GetService("Players").LocalPlayer

local function fetch(url)
    local ok, res = pcall(function()
        return game:HttpGet(url)
    end)

    return ok and res or nil
end

if not KEY or KEY == "" then
    LP:Kick("JoyHub: Please provide a key in the script!")
    return
end

local keyData = fetch("https://raw.githubusercontent.com/JoyHub2026/JoyHub/main/keys.txt")

if not keyData then
    LP:Kick("LunarHub: Could not reach key server!")
    return
end

local keyValid = false

for line in keyData:gmatch("[^\r\n]+") do
    if line:match("^%s*(.-)%s*$") == KEY then
        keyValid = true
        break
    end
end

if not keyValid then
    LP:Kick("LunarHub: Invalid or Expired Key")
    return
end

-- Debug
print("PlaceId:", game.PlaceId)
print("GameId:", game.GameId)

if game.PlaceId == 13822889 then
    -- Da Hood
    loadstring(fetch("https://raw.githubusercontent.com/JoyHub2026/JoyHubDaHood/main/JoyHubDaHood.lua"))()

elseif game.PlaceId == 1234 then
    -- COMING SOON
    loadstring(fetch("https://"))()

else
    LP:Kick(
        "JoyHub: This game is not supported. PlaceId: "
        .. tostring(game.PlaceId)
    )
end

getgenv().ItsLunarHubBase = nil
