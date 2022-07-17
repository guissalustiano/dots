import XMonad
import XMonad.Config

main = xmonad defaultConfig
        { modMask = mod4Mask
        , terminal = "alacritty"
        }
