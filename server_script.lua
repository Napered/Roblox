local HttpService = game:GetService("HttpService")

local function checkChat(player, message)
    local url = "http://YOUR_FLASK_SERVER_ADDRESS/analyze"
    local data = {text = message}
    local response = HttpService:PostAsync(url, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
    
    local result = HttpService:JSONDecode(response)
    
    -- 부적절한 발언이 감지되면 플레이어를 킥
    if result.is_bad then
        player:Kick("부적절한 발언으로 인해 퇴장되었습니다.")
    end
end

game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        checkChat(player, message)
    end)
end)
