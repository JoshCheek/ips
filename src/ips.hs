import Prelude
import System.Process
import Data.Text (pack, unpack, strip, breakOn)
-- import qualified Data.Text as T

data ProcessPid     = ProcessPid     String
data ProcessUser    = ProcessUser    String
data ProcessCommand = ProcessCommand String
data Process        = Process ProcessPid ProcessUser ProcessCommand

main = do
  pids <- getProcesses
  print pids

getProcesses = do
  let withoutHeader = drop 1
  rawProcesses <- System.Process.readProcess "ps" ["-eo", "pid user command"] ""
  let processes = map toProcess (withoutHeader $ lines rawProcesses)
  return processes

-- apparently you can get pretty far with Data.Text.words, but since there doesn't seem to be
-- a way to get ps to delimit things for a program to parse them, I'm going to keep using this for now
-- even though it's gross, since it knows where the command is
toProcess rawProcess =
  map unpack (
    (\line -> (\(pid, rest) -> (\(user, unstrippedCommand) -> [pid, user, (strip unstrippedCommand)])
                                 (breakOn space (strip rest)))
                (breakOn space line))
      (strip
        (pack rawProcess)))

space = pack " "
