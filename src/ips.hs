-- $ ps -eo pid
import System.Process
import Data.Text

main = do
  let strip string = Data.Text.unpack $ Data.Text.strip $ Data.Text.pack string
  string <- System.Process.readProcess "ps" ["-eo", "pid"] ""
  print $ Prelude.map strip (Prelude.lines string)
