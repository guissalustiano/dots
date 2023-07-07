  import Xmobar

  config :: Config
  config =
    defaultConfig
      { font = "xft:Terminus-8",
        allDesktops = True,
        pickBroadest = False,
        alpha = 200,
        commands =
          [ Run XMonadLog,
            Run $ Memory ["t", "Mem: <usedratio>%"] 10,
            Run $ Kbd [],
            Run $ Cpu [
              "-L", "3",
              "-H", "50",
              "--normal", "green",
              "--high","red"
            ] 10,
            Run $ Battery [
            "-t", "<acstatus>: <left>% - <timeleft>",
            "--",
            --"-c", "charge_full",
            "-O", "AC",
            "-o", "Bat",
            "-h", "green",
            "-l", "red"
            ] 10,
            Run $ Date "%a %_d %b %Y <fc=#ee9a00>%H:%M:%S</fc>" "date" 10
          ],
        template = "%XMonadLog% }{ %kbd% | %date% | %memory% | %battery% | %cpu%",
        alignSep = "}{"
      }

  main :: IO ()
  main = xmobar config
