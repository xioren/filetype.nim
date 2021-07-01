import os, strutils


const signatureBytes* = 262


proc getSignatureBytes*(path: string): array[signatureBytes, uint8] =
  var f: File
  if getFileSize(path) == 0:
    discard
  else:
    if f.open(path):
      try:
        let i = f.readBytes(result, 0, signatureBytes)
      except OSError:
        echo "error reading: ", path
      finally:
        f.close()


proc bytesToString*(bytes: openarray[uint8]): string =
  for b in bytes:
    result.add(parseHexStr(toHex(b)))


proc bytesToInt*(bytes: openarray[uint8]): int =
  var byteString: string
  for b in bytes:
    byteString.add(toHex(b))
  result = parseHexInt(byteString)
