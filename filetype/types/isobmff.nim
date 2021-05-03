import strutils


proc isIsobmff(buf: string): bool =
  if buf.len < 16 or buf[4..<8] != "ftyp":
    discard
  elif buf.len < parseHexInt(toHex(buf[0..<4])):
    discard
  else:
    result = true


proc getFtype(buf: string): tuple[x: string, y: int, z: seq[string]] =
  let
    ftypeLen = parseHexInt(toHex(buf[0..<4]))
    majorBrand = buf[8..<12]
    minorVersion = parseHexInt(toHex(buf[12..<16]))
  var
    compatibleBrands: seq[string] = @[]

  for i in countup(16, ftypeLen - 1, 4):
    compatibleBrands.add(buf[i..<i+4])

  result = (majorBrand, minorVersion, compatibleBrands)
