Utils = {}

-- Draw sprite with custom settings
function Utils.DrawSprite(textureDict, textureName, x, y, width, height, rotation, r, g, b, a)
    if not HasStreamedTextureDictLoaded(textureDict) then
        RequestStreamedTextureDict(textureDict, false)
        while not HasStreamedTextureDictLoaded(textureDict) do
            Wait(0)
        end
    end

    DrawSprite(textureDict, textureName, x, y, width, height, rotation, r, g, b, a)
end

-- Draw text with custom settings
function Utils.DrawText(text, x, y, scale, r, g, b, a, center)
    SetTextScale(scale, scale)
    SetTextColor(r, g, b, a)
    SetTextCentre(center)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextFontForCurrentCommand(6) -- RedM font
    DisplayText(CreateVarString(10, "LITERAL_STRING", text), x, y)
end

-- Calculate position on circle
function Utils.GetCirclePosition(centerX, centerY, radius, angle)
    local x = centerX + radius * math.cos(math.rad(angle))
    local y = centerY + radius * math.sin(math.rad(angle))
    return x, y
end

-- Linear interpolation for smooth animations
function Utils.Lerp(a, b, t)
    return a + (b - a) * t
end

-- Ease out quad for smooth animations
function Utils.EaseOutQuad(t)
    return t * (2 - t)
end