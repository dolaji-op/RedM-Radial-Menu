Config = {}

-- Key Bindings
Config.controls = {
    -- Menu Toggle Key (LEFT ALT by default)
    toggleKey = 0x8AAA0AD4,  -- LEFT ALT

    -- Menu Selection Key (Left Mouse Click by default)
    selectKey = `INPUT_CURSOR_ACCEPT`,

    -- Controls to disable when menu is open
    disabledControls = {
        `INPUT_ATTACK`,                    -- Disable normal attack
        `INPUT_ATTACK2`,                   -- Disable heavy attack
        `INPUT_MELEE_ATTACK_LIGHT`,        -- Disable light melee
        `INPUT_MELEE_ATTACK_HEAVY`,        -- Disable heavy melee
        `INPUT_MELEE_ATTACK_ALTERNATE`,    -- Disable alternate melee
        `INPUT_MELEE_ATTACK_ALTERNATE2`    -- Disable alternate melee 2
    }
}

-- Visual Settings
Config.zoomEffectEnabled = false

Config.lockIcon = {
    texture_dict = 'generic_textures',
    texture_name = 'lock',
    scale = 0.02,
    offsetX = 0.015,
    offsetY = 0.015,
    color = { r = 255, g = 255, b = 255, a = 255 }
}

-- Sound Settings
Config.sounds = {
    menu = {
        open = {
            name = "MENU_ENTER",
            set = "HUD_PLAYER_MENU"
        },
        close = {
            name = "MENU_CLOSE",
            set = "HUD_PLAYER_MENU"
        },
        hover = {
            name = "NAV_UP",
            set = "HUD_PLAYER_MENU"
        },
        select = {
            name = "SELECT",
            set = "HUD_PLAYER_MENU"
        },
        back = {
            name = "BACK",
            set = "HUD_PLAYER_MENU"
        },

        submenu_enter = {
            name = "INFO_SHOW",
            set = "Study_Sounds"
        },
        submenu_exit = {
            name = "INFO_HIDE",
            set = "Study_Sounds"
        },
        disabled = {
            name = "UNAFFORDABLE",
            set = "Ledger_Sounds"
        }
    }
}


-- Menu Items (8 slots maximum per menu level)
Config.mainMenu = {
    {
        label = "Inventory",
        icon = {
            texture_dict = "inventory_items",
            texture_name = "upgrade_camp_tent",
        },
        color = { r = 255, g = 255, b = 255, a = 255 },
        canInteract = function()
            return true
        end,
        action = function()
            print("Opening Inventory")
            -- TriggerEvent('inventory:open')
        end,
        isDisabled = function ()
            return true
        end
    },
    {
        label = "Horse",
        icon = {
            texture_dict = "inventory_items",
            texture_name = "kit_horse_brush",
        },
        color = { r = 255, g = 255, b = 255, a = 255 },
        submenu = {
            {
                label = "Horse Brush",
                icon = {
                    texture_dict = "inventory_items",
                    texture_name = "kit_horse_brush",
                },
                color = { r = 255, g = 255, b = 255, a = 255 },
                action = function()
                    print("Using horse brush")
                end,
            },
            {
                label = "Horse Feed",
                icon = {
                    texture_dict = "inventory_items",
                    texture_name = "consumable_hay",
                },
                color = { r = 255, g = 255, b = 255, a = 255 },
                action = function()
                    print("Feeding horse")
                end
            }
        }
    },
    {
        label = "Emotes",
        icon = {
            texture_dict = "multiwheel_emotes",
            texture_name = "emote_action_beckon_1",
        },
        color = { r = 255, g = 255, b = 255, a = 255 },
        submenu = {
            {
                label = "Actions",
                icon = {
                    texture_dict = "multiwheel_emotes",
                    texture_name = "emote_action_beckon_1",
                },
                color = { r = 255, g = 255, b = 255, a = 255 },
                submenu = {
                    {
                        label = "Wave",
                        icon = {
                            texture_dict = "multiwheel_emotes",
                            texture_name = "emote_action_wave",
                        },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            print("Wave emote")
                        end
                    },
                    {
                        label = "Dance",
                        icon = {
                            texture_dict = "multiwheel_emotes",
                            texture_name = "emote_action_dance",
                        },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            print("Dance emote")
                        end
                    }
                }
            },
            {
                label = "Greets",
                icon = {
                    texture_dict = "multiwheel_emotes",
                    texture_name = "emote_greet_hey_you",
                },
                color = { r = 255, g = 255, b = 255, a = 255 },
                action = function()
                    print("Greet emote")
                end
            }
        }
    },
    {
        label = "Crafting",
        icon = {
            texture_dict = "inventory_items",
            texture_name = "kit_camp",
        },
        color = { r = 255, g = 255, b = 255, a = 255 },
        action = function()
            print("Crafting Menu")
            -- TriggerEvent('crafting:open')
        end
    }
}
