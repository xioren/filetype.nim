import filetype


proc main(path: string) =
  let
    ext = guess(path)
  if ext == "":
    echo "Cannot guess file type!"
    return
  else:
    let
      mime = guessMime(path)

    echo "File extension: ", ext
    echo "File MIME type: ", mime


when isMainModule:
    main("/home/xioren/Downloads/image.jpeg")
