### A nearly direct port of https://github.com/h2non/filetype.py to Nim


```nim
import filetype


proc main(path: string) =
  let ext = guess(path)

  if ext == "":
    echo "Cannot guess file type!"
  else:
    let mime = guessMime(path)

    echo "File extension: ", ext
    echo "File MIME type: ", mime


when isMainModule:
  main("/path/to/sample.jpeg")
```
