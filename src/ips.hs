-- $ ps -eo pid
import Prelude
import System.Process
import Data.Text (pack, unpack, strip, breakOn)
-- import qualified Data.Text as T

main = do
  -- print pids
  pids <- getProcesses
  print pids

getProcesses = do
  let space = pack " "
  let toProcess rawProcess = map unpack (
        (\line -> (\(pid, rest) -> (\(user, unstrippedCommand) -> [pid, user, (strip unstrippedCommand)])
                                     (breakOn space (strip rest)))
                    (breakOn space line))
          (strip
            (pack rawProcess)))

  rawProcesses <- System.Process.readProcess "ps" ["-eo", "pid user command"] ""
  let pids = map toProcess (drop 1 $ lines rawProcesses)
  return pids
