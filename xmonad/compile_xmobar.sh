#! /bin/bash

stack ghc -- --make xmobar_config.hs -fforce-recomp -threaded
