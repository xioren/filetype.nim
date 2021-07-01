import
  match, helpers


proc guess*(path: string): tuple =
  match(path)


proc guessMime*(path: string): string =
  match(path).mime


proc guessExtension*(path: string): string =
  match(path).extension

const
    iPath = "/home/xioren/Downloads/image.jpeg"
    vPath = "/home/xioren/Downloads/video.mp4"

echo guess(iPath)
echo guess(vPath)
