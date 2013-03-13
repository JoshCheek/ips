import Prelude
import System.Process (readProcess)
import Data.Text (pack, unpack, strip, breakOn)
-- import qualified Data.Text as T

data ProcessPid     = ProcessPid     String deriving Show
data ProcessUser    = ProcessUser    String deriving Show
data ProcessCommand = ProcessCommand String deriving Show
data Process        = Process ProcessPid ProcessUser ProcessCommand deriving Show


main = do
  pids <- getProcesses
  print pids

getProcesses = do
  rawProcesses <- readProcess "ps" ["-eo", "pid user command"] ""
  return $ map toProcess (withoutHeader $ lines rawProcesses)

space         = pack " "
withoutHeader = drop 1

-- apparently you can get pretty far with Data.Text.words, but since there doesn't seem to be
-- a way to get ps to delimit things for a program to parse them, I'm going to keep using this for now
-- even though it's gross, since it knows where the command is
toProcess rawProcess =
  (\(pid, rest) -> (\(user, unstrippedCommand) -> Process (ProcessPid     $ unpack pid)
                                                          (ProcessUser    $ unpack user)
                                                          (ProcessCommand $ unpack $ strip unstrippedCommand))
                               (breakOn space (strip rest)))
    (breakOn space $ strip $ pack rawProcess)
