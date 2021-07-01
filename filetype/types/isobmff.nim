import ../utils


proc isIsobmff(buf: array[signatureBytes, uint8]): bool =
  if buf.len < 16 or bytesToString(buf[4..7]) != "ftyp":
    # FIXME: buf.len will always be signatureBytes and not actual bytes read
    discard
  if buf.len < bytesToInt(buf[0..3]):
    discard
  else:
    result = true


proc getFtype(buf: array[signatureBytes, uint8]): tuple[x: string, y: int, z: seq[string]] =
  let
    ftypeLen = bytesToInt(buf[0..3])
    majorBrand = bytesToString(buf[8..11])
    minorVersion = bytesToInt(buf[12..15])
  var
    compatibleBrands: seq[string] = @[]

  for i in countup(16, pred(ftypeLen), 4):
    compatibleBrands.add(bytesToString(buf[i..i+3]))

  result = (majorBrand, minorVersion, compatibleBrands)
