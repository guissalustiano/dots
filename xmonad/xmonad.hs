import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

main :: IO ()
main = xmonad . ewmhFullscreen . ewmh . xmobarProp $ myConfig

myConfig = def
        { modMask = mod4Mask
        , terminal = "alacritty"
        , layoutHook = myLayout
        }
        `additionalKeysP`
        [ ("M-S-p", spawn "flameshot gui")
        , ("M-<F12>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%")
        , ("M-<F11>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
        , ("M-<F10>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%")
        , ("M-<F1>", spawn "light -A 10")
        , ("M-<F2>", spawn "light -U 10")
        ]

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

