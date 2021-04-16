import
  match, helpers


proc guess*(path: string): tuple =
  match(path)


proc guessMime*(path: string): string =
  match(path).mime


proc guessExtension*(path: string): string =
  match(path).extension
