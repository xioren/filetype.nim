import os


const signatureBytes = 262
var f: File


proc getSignatureBytes*(path: string): string =
  # QUESTION: does checking filesize first add much to runtime?
  if getFileSize(path) == 0:
    return ""
  result = newString(signatureBytes)

  if f.open(path):
    try:
      let i = f.readChars(result, 0, signatureBytes)
      result.setLen(i)
    except OSError:
      echo "error reading: ", path
    finally:
      f.close()
