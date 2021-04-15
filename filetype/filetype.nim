import types/all
import match, helpers


proc guess*(path: string): tuple =
  match(path, allMatchers)


proc guessMime*(path: string): string =
  match(path, allMatchers).mime


proc guessExtension*(path: string): string =
  match(path, allMatchers).extension
