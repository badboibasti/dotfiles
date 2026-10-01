------------------
---- MONITORS ----
------------------

-- External monitor 
hl.monitor({ 
	output = "DP-2", 
	scale = 1.33, 
})

-- Framework Laptop 13 display
hl.monitor({
    output = "desc:BOE NE135A1M-NY1",
    scale = 1.88,
})

-- ThinkPad X1 Carbon Gen 13 monitor
hl.monitor({
    output = "desc:Chimei Innolux Corporation N140JLG-GT3 Unknown",
    scale = 1.33,
})

-- Office - Iiyama monitor
hl.monitor({
    output = "desc:Iiyama North America PL2875UH 0x0000007F",
    scale = 2,
})

-- Office - Philips monitor
hl.monitor({
    output = "desc:Philips Consumer Electronics Company PHL 345B1C UK02143006882",
    scale = 1.5,
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "kitty"
local menu = "hyprlauncher"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    -- VPN
    hl.exec_cmd("protonvpn connect")

    -- Blue light filter
    hl.exec_cmd("hyprsunset")

    -- Wallpaper
    hl.exec_cmd("hyprpaper")

    -- Idle / screen locking
    hl.exec_cmd("hypridle")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 20,

        border_size = 2,

        col = {
            -- Active border: white
            active_border = "rgba(ffffffff)",

            -- Inactive/unfocused: gray
            inactive_border = "rgba(808080ff)",
        },

        resize_on_border = false,
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding = 0,

        active_opacity = 0.9,
        inactive_opacity = 0.8,

        shadow = {
            enabled = false,
        },

        blur = {
            enabled = true,
            size = 6,
            passes = 2,
            vibrancy = 0.15,	   
        },
    },

    animations = {
        enabled = true,
    },
})


-----------------------
---- ANIMATIONS -------
-----------------------

-- Custom curves
hl.curve(
    "easeOut",
    {
        type = "bezier",
        points = {
            { 0.16, 1 },
            { 0.3, 1 },
        },
    }
)

hl.curve(
    "easeInOut",
    {
        type = "bezier",
        points = {
            { 0.65, 0 },
            { 0.35, 1 },
        },
    }
)

-- Window movement / resizing
hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 4,
    bezier = "easeOut",
})

-- Opening windows
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 3,
    bezier = "easeOut",
    style = "gnomed",
})

-- Closing windows
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3,
    bezier = "easeOut",
    style = "gnomed",
})

-- Window borders
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 3,
    bezier = "easeOut",
})

-- Fading
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "easeOut",
})

-- Workspace switching
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 2,
    bezier = "easeInOut",
    style = "slide",
})


-----------------------
---- DWINDLE LAYOUT ---
-----------------------

hl.config({
    dwindle = {
        preserve_split = true,
    },
})


----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "de",

        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            tap_to_click = true,
            natural_scroll = true,
            clickfinger_behavior = true,
        },
    },
})

-- HHKB external keyboard: US English
hl.device({
    name = "hhkb-hybrid_1-keyboard",
    kb_layout = "us",
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"


----------------
---- BASICS ----
----------------

-- Exit Hyprland
hl.bind(
    mainMod .. " + SHIFT + E",
    hl.dsp.exec_cmd("hyprctl dispatch 'hl.dsp.exit()'")
)

-- Terminal
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))

-- Kill focused window
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- Application launcher
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))

-- Reload configuration
hl.bind(
    mainMod .. " + SHIFT + C",
    hl.dsp.exec_cmd("hyprctl reload")
)

-- Lock screen
hl.bind(
    mainMod .. " + CTRL + Q",
    hl.dsp.exec_cmd("hyprlock")
)

----------------
---- APPS ------
----------------

-- Browser
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))

-- ChatGPT
hl.bind(
    mainMod .. " + A",
    hl.dsp.exec_cmd("firefox https://chatgpt.com")
)

-- Notes
hl.bind(
    mainMod .. " + N",
    hl.dsp.exec_cmd("kitty -e vim +'cd ~/Notes | Rg'")
)

-- Music
hl.bind(
    mainMod .. " + M",
    hl.dsp.exec_cmd("spotify-launcher")
)

-- Email
hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd("kitty -e neomutt")
)

-- Todo
hl.bind(
    mainMod .. " + T",
    hl.dsp.exec_cmd("kitty -e taskwarrior-tui")
)

-- Password manager
hl.bind(
    mainMod .. " + P",
    hl.dsp.exec_cmd("keepassxc")
)


--------------------------
---- WINDOW NAVIGATION ---
--------------------------

-- Vim keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Arrow keys
hl.bind(mainMod .. " + LEFT",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + DOWN",  hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + UP",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "right" }))


--------------------------
---- MOVE WINDOWS -------
--------------------------

-- Vim keys
hl.bind(
    mainMod .. " + SHIFT + H",
    hl.dsp.window.move({ direction = "left" })
)

hl.bind(
    mainMod .. " + SHIFT + J",
    hl.dsp.window.move({ direction = "down" })
)

hl.bind(
    mainMod .. " + SHIFT + K",
    hl.dsp.window.move({ direction = "up" })
)

hl.bind(
    mainMod .. " + SHIFT + L",
    hl.dsp.window.move({ direction = "right" })
)

-- Arrow keys
hl.bind(
    mainMod .. " + SHIFT + LEFT",
    hl.dsp.window.move({ direction = "left" })
)

hl.bind(
    mainMod .. " + SHIFT + DOWN",
    hl.dsp.window.move({ direction = "down" })
)

hl.bind(
    mainMod .. " + SHIFT + UP",
    hl.dsp.window.move({ direction = "up" })
)

hl.bind(
    mainMod .. " + SHIFT + RIGHT",
    hl.dsp.window.move({ direction = "right" })
)


---------------------
---- WORKSPACES ----
---------------------

for i = 1, 10 do
    local key = i % 10

    -- Switch workspace
    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    -- Move window to workspace
    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end


--------------------
---- LAYOUT -------
--------------------

-- Toggle split
hl.bind(
    mainMod .. " + D",
    hl.dsp.layout("togglesplit")
)

-- Fullscreen
hl.bind(
    mainMod .. " + F",
    hl.dsp.window.fullscreen()
)

-- Floating
hl.bind(
    mainMod .. " + SHIFT + SPACE",
    hl.dsp.window.float({ action = "toggle" })
)


---------------------
---- SCRATCHPAD -----
---------------------

-- Move window to scratchpad
hl.bind(
    mainMod .. " + SHIFT + MINUS",
    hl.dsp.window.move({ workspace = "special:magic" })
)

-- Show/hide scratchpad
hl.bind(
    mainMod .. " + MINUS",
    hl.dsp.workspace.toggle_special("magic")
)


------------------------
---- MOUSE / FLOATING --
------------------------

-- Drag floating windows
hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

-- Resize windows
hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)


-------------------------
---- MULTIMEDIA KEYS ----
-------------------------

-- Volume
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = false }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)

-- Microphone
hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"),
    { locked = true, repeating = true }
)

-- Brightness
hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 5%-"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set +5%"),
    { locked = true, repeating = true }
)

-- External monitor brightness
hl.bind(
    mainMod .. " + F5",
    hl.dsp.exec_cmd("ddcutil setvcp 10 + 10")
)

-- Screenshot
hl.bind(
    "PRINT",
    hl.dsp.exec_cmd("grim")
)


--------------------------------
---- WINDOW / BORDER RULES ----
--------------------------------

-- Keep 1px border on floating windows too
hl.window_rule({
    name = "floating-border",
    match = {
        float = true,
    },

    border_size = 1,
})

-- Prevent applications from forcing maximize
hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*",
    },

    suppress_event = "maximize",
})


---------------------
---- LID SWITCH -----
---------------------

-- Disable Framework display when lid closes
hl.bind(
    "switch:on:Lid Switch",
    function()
        hl.monitor({
            output = "eDP-1",
            disabled = true,
        })
    end,
    { locked = true }
)

-- Re-enable Framework display when lid opens
hl.bind(
    "switch:off:Lid Switch",
    function()
        hl.monitor({
            output = "eDP-1",
            disabled = false,
        })
    end,
    { locked = true }
)

