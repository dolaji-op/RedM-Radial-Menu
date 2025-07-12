local wheelOpen = false
local selectedIndex = 0
local hoveredIndex = 0
local animationProgress = 0.0
local fadeAlpha = 0
local itemAnimations = {}
local centerX = 0.5
local centerY = 0.5
local baseRadius = 0.15
local currentRadius = 0.0
local itemSize = 0.045
local hoverScale = 1.2

-- Add menu navigation state
local currentMenu = Config.mainMenu
local menuHistory = {} -- Stack to keep track of menu navigation

-- Position constants
local WHEEL_SETTINGS = {
    radius = 0.13,        -- Base distance from center
    itemScale = 0.075,    -- Base size of items
    bgWidth = 0.12,      -- Background width
    labelOffset = 0.025   -- Label distance from icon
}

-- DrawSprite	hud_quick_select	radial_slot_bg_8_4	0.5	0.26	0.125	0.142	180.0	0	0	0	200	false
-- DrawSprite	inventory_items_mp	clothing_generic_m_sweater	0.5	0.26	0.04	0.07	0.0	255	255	255	255	false
-- DrawSprite	hud_quick_select	radial_slot_bg_8_3	0.605	0.325	0.11	0.195	-90.0	219	2	2	200	false
-- DrawSprite	inventory_items_mp	generic_coach	0.605	0.325	0.04	0.07	0.0	255	255	255	255	false
-- DrawSprite	hud_quick_select	radial_slot_bg_8_2	0.639	0.501	0.078	0.217	0.0	0	0	0	200	false
-- DrawSprite	inventory_items_mp	kit_camp_wilderness	0.642	0.501	0.04	0.07	0.0	255	255	255	255	false
-- DrawSprite	hud_quick_select	radial_slot_bg_8_3	0.605	0.682	0.11	0.195	0.0	0	0	0	200	false
-- DrawSprite	multiwheel_emotes	emote_reaction_applause	0.605	0.682	0.04	0.07	0.0	255	255	255	255	false
-- DrawSprite	hud_quick_select	radial_slot_bg_8_4	0.506	0.751	0.125	0.142	0.0	0	0	0	200	false
-- DrawSprite	inventory_items_mp	weapon_kit_generic_animal_sample	0.506	0.751	0.04	0.07	0.0	255	255	255	255	false
-- DrawSprite	hud_quick_select	radial_slot_bg_8_5	0.405	0.689	0.112	0.195	0.0	0	0	0	200	false
-- DrawSprite	inventory_items_mp	mp_animal_snakediamondback	0.405	0.689	0.04	0.07	0.0	255	255	255	255	false
-- DrawSprite	hud_quick_select	radial_slot_bg_8_6	0.362	0.512	0.082	0.215	0.0	0	0	0	200	false
-- DrawSprite	mp_online_options	online_options_defensive	0.362	0.512	0.04	0.07	0.0	255	255	255	255	false
-- DrawSprite	hud_quick_select	radial_slot_bg_8_5	0.397	0.332	0.105	0.2	90.0	0	0	0	200	false
-- DrawSprite	inventory_items_mp	generic_camp_flag	0.397	0.332	0.04	0.07	0.0	255	255	255	255	false
-- DrawSprite	hud_radial_menu	radial_menu_center_bg	0.5	0.5	0.2	0.36	0.0	0	0	0	100	false
-- DrawSprite	inventory_items_mp	generic_coach	0.5	0.46	0.05	0.0875	0.0	255	255	255	255	false



-- center hover settings DrawSprite	mp_online_options	online_options_defensive	0.5	0.46	0.05	0.0875	0.0	255	255	255	255	false
local CenterHover_Settings = {
    texture_dict = "mp_online_options",
    texture_name = "online_options_defensive",
    xPos = 0.5,
    yPos = 0.46,
    icon_width = 0.05,
    icon_height = 0.0875,
    icon_angle = 0.0,
}

local ITEMS_SETTINGS = {
    -- Top (12 o'clock)
    [1] = {
        xPos = 0.5,
        yPos = 0.26,
        bg_width = 0.125,
        bg_height = 0.142,
        bg_angle = 180.0,
        bg_texture = 'radial_slot_bg_8_4',
        icon_width = 0.04,
        icon_height = 0.07,
        icon_angle = 0.0,
        bg_color = {r = 0, g = 0, b = 0},
    },
    -- Top-Right (1:30 o'clock)
    [2] = {
        xPos = 0.605,
        yPos = 0.325,
        bg_width = 0.11,
        bg_height = 0.195,
        bg_angle = -90.0,
        bg_texture = 'radial_slot_bg_8_3',
        icon_width = 0.04,
        icon_height = 0.07,
        icon_angle = 0.0,
        bg_color = {r = 0, g = 0, b = 0},
    },
    -- Right (3 o'clock)
    [3] = {
        xPos = 0.639,
        yPos = 0.501,
        bg_width = 0.078,
        bg_height = 0.217,
        bg_angle = 0.0,
        bg_texture = 'radial_slot_bg_8_2',
        icon_width = 0.04,
        icon_height = 0.07,
        icon_angle = 0.0,
        bg_color = {r = 0, g = 0, b = 0},
    },
    -- Bottom-Right (4:30 o'clock)
    [4] = {
        xPos = 0.605,
        yPos = 0.682,
        bg_width = 0.11,
        bg_height = 0.195,
        bg_angle = 0.0,
        bg_texture = 'radial_slot_bg_8_3',
        icon_width = 0.04,
        icon_height = 0.07,
        icon_angle = 0.0,
        bg_color = {r = 0, g = 0, b = 0},
    },
    -- Bottom (6 o'clock)
    [5] = {
        xPos = 0.506,
        yPos = 0.751,
        bg_width = 0.125,
        bg_height = 0.142,
        bg_angle = 0.0,
        bg_texture = 'radial_slot_bg_8_4',
        icon_width = 0.04,
        icon_height = 0.07,
        icon_angle = 0.0,
        bg_color = {r = 0, g = 0, b = 0},
    },
    -- Bottom-Left (7:30 o'clock)
    [6] = {
        xPos = 0.405,
        yPos = 0.689,
        bg_width = 0.112,
        bg_height = 0.195,
        bg_angle = 0.0,
        bg_texture = 'radial_slot_bg_8_5',
        icon_width = 0.04,
        icon_height = 0.07,
        icon_angle = 0.0,
        bg_color = {r = 0, g = 0, b = 0},
    },
    -- Left (9 o'clock)
    [7] = {
        xPos = 0.362,
       yPos = 0.512,
        bg_width = 0.082,
        bg_height = 0.215,
        bg_angle = 0.0,
        bg_texture = 'radial_slot_bg_8_6',
        icon_width = 0.04,
        icon_height = 0.07,
        icon_angle = 0.0,
        bg_color = {r = 0, g = 0, b = 0},
    },
    -- Top-Left (10:30 o'clock)
    [8] = {
        xPos = 0.397,
        yPos = 0.332,
        bg_width = 0.105,
        bg_height = 0.2,
        bg_angle = 90.0,
        bg_texture = 'radial_slot_bg_8_5',
        icon_width = 0.04,
        icon_height = 0.07,
        icon_angle = 0.0,
        bg_color = {r = 0, g = 0, b = 0},
    }
}

-- Initialize animations for each item
local function InitializeAnimations()
    for i = 1, 8 do
        itemAnimations[i] = {
            scale = 1.0,
            alpha = 0.0,
            offsetX = 0.0,
            offsetY = 0.0
        }
    end
end

local screenWidth = nil
local screenHeight = nil
local screenAspectRatio = 1.0
RegisterNUICallback('screenResolution', function(params, cb)
    screenWidth = params.width
    screenHeight = params.height
    print('Screen resolution', screenWidth, screenHeight)
    screenAspectRatio = (screenWidth / screenHeight)
    screenAspectRatio = math.floor(screenAspectRatio * 100) / 100
    print(screenAspectRatio)
    cb(true)
end)

-- Calculate angle for each slot (8 items)
local function GetSlotAngle(index)
    local itemCount = #Config.mainMenu
    -- Calculate the angle step based on item count
    local angleStep = 360 / itemCount
    -- Start from top (-90) and adjust for index, ensuring full 360 coverage
    local angle = -90 + ((index - 1) * angleStep)
    -- Ensure angle stays within -180 to 180 range for proper positioning
    if angle > 180 then
        angle = angle - 360
    end
    return angle
end

-- Add helper function for playing sounds
local function PlayMenuSound(soundType)
    if Config.sounds.menu[soundType] then
        local sound = Config.sounds.menu[soundType]
        PlaySoundFrontend(sound.name, sound.set, true, 0)
    end
end

-- Function to navigate to submenu
local function NavigateToSubmenu(submenu)
    table.insert(menuHistory, currentMenu)
    currentMenu = submenu
    hoveredIndex = 0
    InitializeAnimations()
    PlayMenuSound('submenu_enter')
end

-- Function to navigate back to parent menu
local function NavigateBack()
    if #menuHistory > 0 then
        currentMenu = table.remove(menuHistory)
        hoveredIndex = 0
        InitializeAnimations()
        PlayMenuSound('submenu_exit')
        return true
    end
    return false
end

-- Function to filter menu items based on canInteract
local function GetInteractableItems(menu)
    local interactableItems = {}
    for _, item in ipairs(menu) do
        if not item.canInteract or item.canInteract() then
            table.insert(interactableItems, item)
        end
    end
    return interactableItems
end

-- Update GetHoveredItem to use filtered items
local function GetHoveredItem()
    -- Get normalized cursor position (0-1)
    local cursorX = GetControlNormal(0, `INPUT_CURSOR_X`)
    local cursorY = GetControlNormal(0, `INPUT_CURSOR_Y`)

    -- Get aspect ratio and adjust Y accordingly
    local aspectRatio = GetAspectRatio()
    local normCursorX = cursorX
    local normCursorY = cursorY / aspectRatio

    local closestIndex = 0
    local closestDistance = math.huge

    -- Get only interactable items
    local interactableItems = GetInteractableItems(currentMenu)
    local itemCount = #interactableItems

    for k, i in pairs(ITEMS_SETTINGS) do
        local itemX, itemY = i.xPos, i.yPos
        -- Only check for valid menu items that actually exist
        if itemX and itemY and k <= 8 and k <= itemCount then
            -- Adjust itemY for aspect ratio as well
            local normItemX = itemX
            local normItemY = itemY / aspectRatio

            -- Calculate Euclidean distance in normalized space
            local dx = normCursorX - normItemX
            local dy = normCursorY - normItemY
            local dist = math.sqrt(dx * dx + dy * dy)

            -- Use a reasonable threshold for selection (tweak as needed)
            local threshold = 0.08
            if dist < threshold and dist < closestDistance then
                closestDistance = dist
                closestIndex = k
            end
        end
    end

    -- Check if cursor is at the center (within a small radius of center)
    local centerX, centerY = 0.5, 0.5 / aspectRatio
    local dxCenter = normCursorX - centerX
    local dyCenter = normCursorY - centerY
    local centerDist = math.sqrt(dxCenter * dxCenter + dyCenter * dyCenter)
    local centerThreshold = 0.045 -- tweak as needed for "center" detection

    if centerDist < centerThreshold then
        return 10
    end

    return closestIndex
end

-- Draw selection highlight
local lastChangedIndex = nil
local lastHoveredIndex = nil
local function DrawSelectionHighlight()
    if wheelOpen and hoveredIndex ~= lastHoveredIndex and hoveredIndex > 0 then
        PlayMenuSound('hover')
        lastHoveredIndex = hoveredIndex
    elseif not wheelOpen then
        lastHoveredIndex = 0
    end

    if hoveredIndex > 0 and hoveredIndex <= #currentMenu then
        local item = currentMenu[hoveredIndex]
        if item then
            Utils.DrawSprite(
                item.icon.texture_dict,
                item.icon.texture_name,
                CenterHover_Settings.xPos, CenterHover_Settings.yPos,
                CenterHover_Settings.icon_width,
                CenterHover_Settings.icon_height,
                CenterHover_Settings.icon_angle,
                255, 255, 255,
                255
            )
            Utils.DrawText(
                item.label,
                0.5, 0.55,
                0.37,
                255, 255, 255,
                255, true
            )
        end
    end
end



local function normalizeValue(size, baseResolution, currentResolution)
    local aspectRatioBase = baseResolution.x / baseResolution.y
    local aspectRatioCurrent = currentResolution.x / currentResolution.y

    local ratio = aspectRatioBase / aspectRatioCurrent
    return size * ratio
end


-- Update DrawMenuItems to use filtered items
local function DrawMenuItems()
    -- Get only interactable items
    local interactableItems = GetInteractableItems(currentMenu)
    local itemCount = #interactableItems

    if itemCount == 0 then return end
    SetScriptGfxDrawOrder(11)

    -- Always show 8 slots maximum
    local totalSlots = 8

    -- Calculate the actual radius based on animation
    local actualRadius = WHEEL_SETTINGS.radius * (currentRadius / baseRadius)

    -- IMPORTANT: To make a perfect circle, we need to adjust Y coordinates by aspect ratio
    local aspectRatio = GetAspectRatio()

    for i = 1, totalSlots do
        -- Calculate angle for this item
        local angleStep = 360 / totalSlots
        local angle = ((i - 1) * angleStep) - 90
        local radians = math.rad(angle)

        -- Calculate position in a perfect circle
        local circleX = math.cos(radians) * actualRadius
        local circleY = math.sin(radians) * actualRadius

        -- CRITICAL: Apply aspect ratio to Y coordinate to make circle appear round
        circleY = circleY * aspectRatio

        -- Final position
        local itemX = centerX + circleX
        local itemY = centerY + circleY

        -- Apply animation offsets
        local animOffset = itemAnimations[i] or {offsetX = 0, offsetY = 0, alpha = 0, scale = 1.0}
        itemX = itemX + (animOffset.offsetX or 0)
        itemY = itemY + (animOffset.offsetY or 0)

        -- Calculate item alpha and size
        local itemAlpha = math.floor((animOffset.alpha or 0) * (fadeAlpha / 255))
        local currentItemSize = itemSize * (animOffset.scale or 1.0)

        -- Background size
        local bgSize = normalizeValue(WHEEL_SETTINGS.bgWidth, {x = 1920, y = 1080}, {x = screenWidth, y = screenHeight})

        -- Icon size
        local iconSize = normalizeValue(currentItemSize, {x = 1920, y = 1080}, {x = screenWidth, y = screenHeight})

        -- Always draw background, but with different alpha for empty slots
        local bgAlpha = i <= itemCount and 170 or 100

        -- Get background color based on hover state
        local bgColor = {r = 0, g = 0, b = 0}
        if i == hoveredIndex and i <= itemCount then
            bgColor = {r = 255, g = 0, b = 0}
        end

        -- Check if item is disabled
        local item = interactableItems[i]
        local disabled = false
        if item and item.isDisabled and item.isDisabled() then
            disabled = true
            itemAlpha = 100
        end

        -- Draw background for all slots
        Utils.DrawSprite(
            "hud_quick_select",
            ITEMS_SETTINGS[i].bg_texture,
            ITEMS_SETTINGS[i].xPos, ITEMS_SETTINGS[i].yPos,
            ITEMS_SETTINGS[i].bg_width,
            ITEMS_SETTINGS[i].bg_height,
            ITEMS_SETTINGS[i].bg_angle,
            bgColor.r, bgColor.g, bgColor.b,
            bgAlpha
        )

        -- Only draw icon and handle submenu indicators for actual menu items
        if i <= itemCount then
            local item = interactableItems[i]
            if item and item.icon and item.icon.texture_dict and item.icon.texture_name then
                ITEMS_SETTINGS[i].config = item

                -- Draw icon
                Utils.DrawSprite(
                    item.icon.texture_dict,
                    item.icon.texture_name,
                    ITEMS_SETTINGS[i].xPos, ITEMS_SETTINGS[i].yPos,
                    ITEMS_SETTINGS[i].icon_width,
                    ITEMS_SETTINGS[i].icon_height,
                    ITEMS_SETTINGS[i].icon_angle,
                    item.color.r, item.color.g, item.color.b,
                    itemAlpha
                )
            end
        end
        if disabled then
          Utils.DrawSprite(
            Config.lockIcon.texture_dict,
            Config.lockIcon.texture_name,
            ITEMS_SETTINGS[i].xPos + Config.lockIcon.offsetX, ITEMS_SETTINGS[i].yPos + Config.lockIcon.offsetY,
            Config.lockIcon.scale,
            Config.lockIcon.scale,
            ITEMS_SETTINGS[i].icon_angle,
            Config.lockIcon.color.r,
            Config.lockIcon.color.g,
            Config.lockIcon.color.b,
            Config.lockIcon.color.a
          )
        end
    end
end


-- Helper function to get aspect ratio
function GetAspectRatio()
    -- Use the screenAspectRatio variable you already have
    return screenAspectRatio or (screenWidth / screenHeight)
end


-- Update animations
local function UpdateAnimations(deltaTime)
    -- Update fade animation
    if wheelOpen then
        fadeAlpha = Utils.Lerp(fadeAlpha, 255, deltaTime * 10)
        currentRadius = Utils.Lerp(currentRadius, baseRadius, deltaTime * 8)
    else
        fadeAlpha = Utils.Lerp(fadeAlpha, 0, deltaTime * 15)
        currentRadius = Utils.Lerp(currentRadius, 0, deltaTime * 12)
    end

    -- Update item animations
    for i = 1, 8 do
        local targetAlpha = wheelOpen and 255 or 0
        local targetScale = (i == hoveredIndex) and hoverScale or 1.0

        -- Stagger the animations for a nice effect
        local delay = wheelOpen and (i * 0.02) or 0

        if GetGameTimer() / 1000.0 > delay then
            itemAnimations[i].alpha = Utils.Lerp(itemAnimations[i].alpha, targetAlpha, deltaTime * 8)
            itemAnimations[i].scale = Utils.Lerp(itemAnimations[i].scale, targetScale, deltaTime * 12)
        end

        -- Apply zoom effect if enabled
        if Config.zoomEffectEnabled and i == hoveredIndex then
            local angle = GetSlotAngle(i)
            itemAnimations[i].offsetX = Utils.Lerp(itemAnimations[i].offsetX, math.cos(math.rad(angle)) * 0.015, deltaTime * 10)
            itemAnimations[i].offsetY = Utils.Lerp(itemAnimations[i].offsetY, math.sin(math.rad(angle)) * 0.015, deltaTime * 10)
        else
            itemAnimations[i].offsetX = Utils.Lerp(itemAnimations[i].offsetX, 0, deltaTime * 10)
            itemAnimations[i].offsetY = Utils.Lerp(itemAnimations[i].offsetY, 0, deltaTime * 10)
        end
    end
end


-- Main render thread
Citizen.CreateThread(function()
    InitializeAnimations()
    local lastFrameTime = GetGameTimer()

    while true do
        local currentTime = GetGameTimer()
        local deltaTime = (currentTime - lastFrameTime) / 1000.0
        lastFrameTime = currentTime

        if wheelOpen or fadeAlpha > 1 then
            if wheelOpen then
                -- Disable all configured attack controls
                for _, control in ipairs(Config.controls.disabledControls) do
                    DisableControlAction(0, control, true)
                end

                -- Update hovered item
                hoveredIndex = GetHoveredItem()

                Utils.DrawSprite(
                    "hud_radial_menu",
                    "radial_menu_center_bg",
                    centerX, centerY,
                    0.20, 0.35,
                    0.0, 0, 0, 0, 155
                )

                -- Show back button if we're in a submenu
                if #menuHistory > 0 then
                    if hoveredIndex == 10 then
                        Utils.DrawSprite(
                            "generic_textures",
                            "selection_arrow_left",
                            CenterHover_Settings.xPos, CenterHover_Settings.yPos,
                            CenterHover_Settings.icon_width,
                            CenterHover_Settings.icon_height,
                            CenterHover_Settings.icon_angle,
                            255, 255, 255,
                            255
                        )
                        Utils.DrawText(
                            "Back",
                            0.5, 0.55,
                            0.37,
                            255, 255, 255,
                            255, true
                        )
                    end
                end

                -- Check for click using configured select key
                if IsControlJustPressed(0, Config.controls.selectKey) then
                    if hoveredIndex > 0 and hoveredIndex <= #currentMenu then
                        local item = currentMenu[hoveredIndex]
                        if item.isDisabled and item.isDisabled() then
                            PlayMenuSound('disabled')
                        else
                            if item then
                                if item.submenu then
                                    NavigateToSubmenu(item.submenu)
                                    PlaySoundFrontend("SELECT", "HUD_SHOP_SOUNDSET", true, 0)
                                elseif item.action then
                                    item.action()
                                    wheelOpen = false
                                end
                            end
                        end
                    elseif hoveredIndex == 10 and #menuHistory > 0 then
                        if not NavigateBack() then
                            wheelOpen = false
                        end
                    end
                end
            end

            -- Update animations
            UpdateAnimations(deltaTime)

            -- Draw menu
            DrawMenuItems()
            DrawSelectionHighlight()
            SetMouseCursorActiveThisFrame()
        end
        Wait(0)
    end
end)

-- Update key handler thread to use new toggle key
Citizen.CreateThread(function()
    local wasHeld = false
    while true do
        if IsControlPressed(0, Config.controls.toggleKey) then
            if not wheelOpen then
                wheelOpen = true
                currentMenu = Config.mainMenu -- Reset to main menu
                menuHistory = {} -- Clear navigation history
                PlaySoundFrontend("SELECT", "HUD_SHOP_SOUNDSET", true, 0)
            end
            wasHeld = true
        else
            if wheelOpen and wasHeld then
                wheelOpen = false
                PlaySoundFrontend("BACK", "HUD_SHOP_SOUNDSET", true, 0)
            end
            wasHeld = false
        end
        Wait(0)
    end
end)


-- Resource cleanup
AddEventHandler('onResourceStop', function(resourceName)
end)