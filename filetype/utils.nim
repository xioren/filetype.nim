import os, strutils


const signatureBytes* = 262


proc getSignatureBytes*(path: string): seq[uint8] =
  if getFileSize(path) == 0:
    discard
  else:
    var
      f: File
      buffer: array[signatureBytes, uint8]
    if f.open(path):
      try:
        let i = f.readBytes(buffer, 0, signatureBytes)
        result = buffer[0..<i]
      except OSError:
        echo "error reading: ", path
      finally:
        f.close()


proc bytesToString*(bytes: seq[uint8]): string =
  for b in bytes:
    result.add(parseHexStr(toHex(b)))


proc bytesToInt*(bytes: seq[uint8]): int =
  var hexString: string
  for b in bytes:
    hexString.add(toHex(b))
  result = parseHexInt(hexString)
