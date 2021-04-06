import strutils


proc is_isobmff(buf: string): bool =
  if buf.len < 16 or buf[4..<8] != "ftyp":
    result = false
  elif buf.len < parseHexInt(toHex(buf[0..<4])):
    result = false
  else:
    result = true


proc get_ftype(buf: string): tuple[x: string, y: int, z: seq[string]] =
  let
    ftype_len = parseHexInt(toHex(buf[0..<4]))
    major_brand = buf[8..<12]
    minor_version = parseHexInt(toHex(buf[12..<16]))
  var
    compatible_brands: seq[string] = @[]

  for i in countup(16, ftype_len - 1, 4):
    compatible_brands.add(buf[i..<i+4])

  result = (major_brand, minor_version, compatible_brands)
