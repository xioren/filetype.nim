import os


const signatureBytes = 262
var f: File


proc getSignatureBytes*(path: string): string =
  if unlikely(getFileSize(path) == 0):
    discard
  else:
    result = newString(signatureBytes)

    if f.open(path):
      try:
        let i = f.readChars(result, 0, signatureBytes)
        result.setLen(i)
      except OSError:
        echo "error reading: ", path
      finally:
        f.close()
