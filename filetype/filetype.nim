import types/all
import match, helpers


proc guess*(path: string): tuple =
  match(path, allMatchers)
