-- $ ps -eo pid
import Prelude
import System.Process
import Data.Text (pack, unpack, strip, breakOn)
-- import qualified Data.Text as T

main = do
  pids <- getProcesses
  print pids

getProcesses = do
  let withoutHeader = drop 1
  rawProcesses <- System.Process.readProcess "ps" ["-eo", "pid user command"] ""
  let processes = map toProcess (withoutHeader $ lines rawProcesses)
  return processes

toProcess rawProcess =
  map unpack (
    (\line -> (\(pid, rest) -> (\(user, unstrippedCommand) -> [pid, user, (strip unstrippedCommand)])
                                 (breakOn space (strip rest)))
                (breakOn space line))
      (strip
        (pack rawProcess)))

space = pack " "
