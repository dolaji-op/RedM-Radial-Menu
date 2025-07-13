# RWHL - Red Dead Redemption 2 Radial Wheel Menu

A highly customizable and polished radial wheel menu system for RedM/FiveM, inspired by Red Dead Redemption 2's menu system. This resource provides a smooth, animated radial menu with support for submenus, item locking, sound effects, and extensive customization options.

## Features

### Core Functionality
- 8-slot radial menu with precise cursor detection
- Smooth animations and transitions
- Submenu support with back navigation
- Center button for menu navigation
- Responsive design with proper aspect ratio handling

### Visual Features
- Custom background textures for each slot
- Configurable icon support
- Dynamic hover effects
- Lock icon display for disabled items
- Customizable colors and transparency
- Optional zoom effects for hovered items

### Audio System
- Comprehensive sound effect support
- Configurable sounds for:
  - Menu open/close
  - Item hover
  - Item select
  - Submenu navigation
  - Disabled item interaction

### Item Management
- Dynamic item enabling/disabling
- Conditional item visibility
- Custom action support for each item
- Submenu support for nested navigation

## Installation

1. Copy the resource to your server's resources directory
2. Add `ensure rwhl` to your server.cfg
3. Configure the menu items in `config.lua`
4. Restart your server

## Configuration

### Basic Menu Structure
```lua
Config.mainMenu = {
    {
        label = "Inventory",
        icon = {
            texture_dict = "inventory_items",
            texture_name = "bag"
        },
        action = function()
            -- Your code here
        end
    }
}
```

### Item Properties
- `label`: Display name of the item
- `icon`: Icon configuration
  - `texture_dict`: Texture dictionary name
  - `texture_name`: Texture name
- `action`: Function to execute when selected
- `submenu`: Table of items for nested menus
- `isDisabled`: Function returning boolean for item availability
- `canInteract`: Function determining if item should be shown
- `color`: RGBA color configuration

### Controls Configuration
```lua
Config.controls = {
    toggleKey = 0x4F, -- LEFT ALT
    selectKey = 0x07, -- Mouse click
    disabledControls = {
        -- Add control IDs to disable while menu is open
    }
}
```

### Visual Configuration
```lua
Config.zoomEffectEnabled = false -- Enable/disable hover zoom
Config.lockIcon = {
    texture_dict = "generic_textures",
    texture_name = "lock",
    scale = 0.02,
    offsetX = 0.015,
    offsetY = 0.015,
    color = {r = 255, g = 255, b = 255, a = 255}
}
```

### Sound Configuration
```lua
Config.sounds = {
    menu = {
        open = {name = "SELECT", set = "HUD_SHOP_SOUNDSET"},
        close = {name = "BACK", set = "HUD_SHOP_SOUNDSET"},
        hover = {name = "NAV_UP_DOWN", set = "HUD_SHOP_SOUNDSET"},
        select = {name = "SELECT", set = "HUD_SHOP_SOUNDSET"},
        disabled = {name = "LOCKED", set = "HUD_SHOP_SOUNDSET"},
        submenu_enter = {name = "SELECT", set = "HUD_SHOP_SOUNDSET"},
        submenu_exit = {name = "BACK", set = "HUD_SHOP_SOUNDSET"}
    }
}
```

## Usage Examples

### Basic Menu Item
```lua
{
    label = "Inventory",
    icon = {
        texture_dict = "inventory_items_mp",
        texture_name = "kit_bag",
    },
    color = {r = 255, g = 255, b = 255, a = 255},
    action = function()
        TriggerEvent('inventory:open')
    end
}
```

### Submenu Item
```lua
{
    label = "Horse",
    icon = {
        texture_dict = "inventory_items_mp",
        texture_name = "horse_brush",
    },
    submenu = {
        {
            label = "Brush Horse",
            icon = {
                texture_dict = "inventory_items_mp",
                texture_name = "horse_brush",
            },
            action = function()
                TriggerEvent('horse:brush')
            end
        }
    }
}
```

### Conditional Item
```lua
{
    label = "Special Action",
    icon = {
        texture_dict = "special_items",
        texture_name = "action_icon",
    },
    isDisabled = function()
        return not HasRequiredItem()
    end,
    canInteract = function()
        return PlayerHasPermission()
    end
}
```
