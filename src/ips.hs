-- $ ps -eo pid
import System.Process
import Data.Text

main = do
  let space = Data.Text.pack " "
  let extractCommand rawProcess = Prelude.map Data.Text.unpack (
        (\line -> (\(pid, rest) -> (\(user, unstrippedCommand) -> [pid, user, (Data.Text.strip unstrippedCommand)])
                                     (breakOn space (Data.Text.strip rest)))
                    (breakOn space line))
          (Data.Text.strip
            (Data.Text.pack rawProcess)))

  rawProcesses <- System.Process.readProcess "ps" ["-eo", "pid user command"] ""
  let pids = Prelude.map extractCommand (Prelude.drop 1 $ Prelude.lines rawProcesses)
  print pids
