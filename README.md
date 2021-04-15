### A nearly direct port of https://github.com/h2non/filetype.py to Nim


```nim
import filetype


proc main(path: string) =
  let kind = guess(path)

  if kind.extension == "":
    echo "Cannot guess file type!"
  else:
    echo "File extension: ", kind.extension
    echo "File MIME type: ", kind.mime


when isMainModule:
  main("/path/to/sample.ext")
```
