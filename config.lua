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
    --- Emote Menu
    {
        name = "emotes_menu",
        label = "Emotes",
        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_reaction_applause" },
        color = { r = 255, g = 255, b = 255, a = 255 },
        submenu = {
            -- Actions submenu (most useful actions)
            {
                name = "actions_menu",
                label = "Actions",
                icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_action_point" },
                color = { r = 255, g = 255, b = 255, a = 255 },
                submenu = {
                    {
                        name = "point",
                        label = "Point",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_action_point" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_ACTION_POINT_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "follow_me",
                        label = "Follow Me",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_action_follow_me" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_ACTION_FOLLOW_ME_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "stop_here",
                        label = "Stop Here",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_action_stop_here" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_ACTION_STOP_HERE_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "lets_go",
                        label = "Let's Go",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_action_lets_go" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_ACTION_LETS_GO_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "look_distance",
                        label = "Look Distance",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_look_to_distance" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_ACTION_LOOK_DISTANCE_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "look_yonder",
                        label = "Look Yonder",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_action_look_yonder" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_ACTION_LOOK_YONDER_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "posse_up",
                        label = "Posse Up",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_action_posse_up" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_ACTION_POSSE_UP_1"), 0, 0, 0, 0, 0)
                        end
                    }
                }
            },

            -- Greetings submenu
            {
                name = "greetings_menu",
                label = "Greetings",
                icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_greet_tip_hat" },
                color = { r = 255, g = 255, b = 255, a = 255 },
                submenu = {
                    {
                        name = "hat_tip",
                        label = "Hat Tip",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_greet_tip_hat" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_GREET_HAT_TIP_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "hat_flick",
                        label = "Hat Flick",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_greet_hat_flick" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_GREET_HAT_FLICK_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "gentle_wave",
                        label = "Gentle Wave",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_greet_gentlewave" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_GREET_GENTLEWAVE_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "thumbs_up",
                        label = "Thumbs Up",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_greet_thumbs_up" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_GREET_THUMBSUP_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "get_over_here",
                        label = "Get Over Here",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_greet_get_over_here" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_GREET_GET_OVER_HERE_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "hey_you",
                        label = "Hey You",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_greet_hey_you" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_GREET_HEY_YOU_1"), 0, 0, 0, 0, 0)
                        end
                    }
                }
            },

            -- Reactions submenu
            {
                name = "reactions_menu",
                label = "Reactions",
                icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_reaction_applause" },
                color = { r = 255, g = 255, b = 255, a = 255 },
                submenu = {
                    {
                        name = "applause",
                        label = "Applause",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_reaction_applause" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_REACTION_APPLAUSE_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "nod_head",
                        label = "Nod Head",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_reaction_nod_head" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_REACTION_NOD_HEAD_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "shake_head",
                        label = "Shake Head",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_reaction_shake_head" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_REACTION_SHAKEHEAD_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "surrender",
                        label = "Surrender",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_reaction_surrender" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_REACTION_SURRENDER_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "slow_clap",
                        label = "Slow Clap",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_reaction_slow_clap" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_REACTION_SLOW_CLAP_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "thumbs_down",
                        label = "Thumbs Down",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_reaction_thumbsdown" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_REACTION_THUMBSDOWN_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "yeehaw",
                        label = "Yeehaw",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_reaction_yeehaw" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_REACTION_YEEHAW_1"), 0, 0, 0, 0, 0)
                        end
                    }
                }
            },

            -- Taunts submenu
            {
                name = "taunts_menu",
                label = "Taunts",
                icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_taunt_versus" },
                color = { r = 255, g = 255, b = 255, a = 255 },
                submenu = {
                    {
                        name = "you_vs_me",
                        label = "You Vs. Me",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_taunt_versus" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_TAUNT_VERSUS_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "im_watching_you",
                        label = "I'm Watching You",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_taunt_im_watching_you" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_TAUNT_IM_WATCHING_YOU_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "throat_slit",
                        label = "Throat Slit",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_taunt_throat_slit" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_TAUNT_THROAT_SLIT_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "war_cry",
                        label = "War Cry",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_taunt_war_cry" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_TAUNT_WAR_CRY_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "provoke",
                        label = "Provoke",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_taunt_provoke" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_TAUNT_PROVOKE_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "you_stink",
                        label = "You Stink",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_taunt_you_stink" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_TAUNT_YOUSTINK_1"), 0, 0, 0, 0, 0)
                        end
                    }
                }
            },

            -- Dances submenu
            {
                name = "dances_menu",
                label = "Dances",
                icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_dance" },
                color = { r = 255, g = 255, b = 255, a = 255 },
                submenu = {
                    {
                        name = "dance_awkward",
                        label = "Awkward Dance",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_dance_awkward_a" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_DANCE_AWKWARD_A_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "dance_carefree",
                        label = "Carefree Dance",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_dance_carefree_a" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_DANCE_CAREFREE_A_1"), 0, 0, 0, 0, 0)
                        end
                    },
                    {
                        name = "dance_drunk",
                        label = "Drunk Dance",
                        icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_dance_drunk_a" },
                        color = { r = 255, g = 255, b = 255, a = 255 },
                        action = function()
                            Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                                GetHashKey("KIT_EMOTE_DANCE_DRUNK_A_1"), 0, 0, 0, 0, 0)
                        end
                    }
                }
            },

            -- Quick access to common emotes
            {
                name = "smoke_cigarette",
                label = "Smoke Cigarette",
                icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_action_smoke_cigarette" },
                color = { r = 255, g = 255, b = 255, a = 255 },
                action = function()
                    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                        GetHashKey("KIT_EMOTE_ACTION_SMOKE_CIGARETTE_1"), 0, 0, 0, 0, 0)
                end
            },
            {
                name = "smoke_cigar",
                label = "Smoke Cigar",
                icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_action_smoke_cigar" },
                color = { r = 255, g = 255, b = 255, a = 255 },
                action = function()
                    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                        GetHashKey("KIT_EMOTE_ACTION_SMOKE_CIGAR_1"), 0, 0, 0, 0, 0)
                end
            },
            {
                name = "coin_flip",
                label = "Flip Coin",
                icon = { texture_dict = "multiwheel_emotes", texture_name = "emote_action_coin_flip" },
                color = { r = 255, g = 255, b = 255, a = 255 },
                action = function()
                    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 2,
                        GetHashKey("KIT_EMOTE_ACTION_COIN_FLIP_1"), 0, 0, 0, 0, 0)
                end
            },
        }
    },

    --- Reload Skin
    {
        name = "reload_skin",
        label = "Reload Skin",
        icon = { texture_dict = "inventory_items", texture_name = "clothing_generic_outfit" },
        color = { r = 255, g = 255, b = 255, a = 255 },
        action = function()
            ExecuteCommand('rc')
        end
    },

    --- Camp Fire
    {
        name = "camp_fire",
        label = "Camp Fire",
        icon = { texture_dict = "inventory_items", texture_name = "kit_camp" },
        color = { r = 255, g = 255, b = 255, a = 255 },
        action = function()
            ExecuteCommand('campfire')
        end
    },

    --- open map
    {
        name = "open_map",
        label = "Open Map",
        icon = { texture_dict = "inventory_items_mp", texture_name = "document_map_moonshiner_maggie" },
        color = { r = 255, g = 255, b = 255, a = 255 },
        action = function()
            ExecuteCommand('map')
        end
    },


    --- toggle lantern
    {
        name = "toggle_lantern",
        label = "Toggle Lantern",
        icon = { texture_dict = "inventory_items_mp", texture_name = "weapon_kit_metal_detector" },
        color = { r = 255, g = 255, b = 255, a = 255 },
        action = function()
            ExecuteCommand('lantern')
        end
    },
    {
        label = "Inventory",
        icon = {
            texture_dict = "inventory_items_mp",
            texture_name = "kit_collectors_bag",
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
            texture_dict = "inventory_items_mp",
            texture_name = "generic_horse_equip_mask",
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
            --- revive horse
            {
                label = "Revive Horse",
                icon = {
                    texture_dict = "inventory_items_mp",
                    texture_name = "consumable_tonic_animal_reviver",
                },
                color = { r = 255, g = 255, b = 255, a = 255 },
                action = function()
                    print("Reviving horse")
                end,
            },

            --- open saddle bag
            {
                label = "Open Saddle Bag",
                icon = {
                    texture_dict = "inventory_items",
                    texture_name = "generic_horse_equip_saddlebag",
                },
                color = { r = 255, g = 255, b = 255, a = 255 },
                action = function()
                    print("Opening saddle bag")
                end,
            },
        }
    },
    {
        label = "Crafting",
        icon = {
            texture_dict = "inventory_items_mp",
            texture_name = "generic_bundle_crafting",
        },
        color = { r = 255, g = 255, b = 255, a = 255 },
        action = function()
            print("Crafting Menu")
            -- TriggerEvent('crafting:open')
        end
    }
}
