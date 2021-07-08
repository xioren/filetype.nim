import os, strutils


const signatureBytes = 262


proc getSignatureBytes*(path: string): seq[uint8] =
  if getFileSize(path) == 0:
    # QUESTION: should we use a zero initilized seq that will never match
    # or skip to next file?
    result = newSeq[uint8](signatureBytes)
  else:
    var
      f: File
      buffer: array[signatureBytes, byte]
    if f.open(path):
      try:
        let i = f.readBytes(buffer, 0, signatureBytes)
        result = buffer[0..<i]
      except OSError:
        echo "error reading: ", path
      finally:
        f.close()


proc bytesToString*(bytes: seq[byte]): string =
  for b in bytes:
    result.add(parseHexStr(toHex(b)))


proc bytesToInt*(bytes: seq[byte]): int =
  var hexString: string
  for b in bytes:
    hexString.add(toHex(b))
  result = parseHexInt(hexString)
