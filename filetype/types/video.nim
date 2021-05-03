include isobmff


proc isAvi*(buf: string): tuple[extension, mime: string] =
  if buf.len > 10 and
  buf[0].byte == 0x52 and
  buf[1].byte == 0x49 and
  buf[2].byte == 0x46 and
  buf[3].byte == 0x46 and
  buf[8].byte == 0x41 and
  buf[9].byte == 0x56 and
  buf[10].byte == 0x49:
    result = ("avi", "video/x-msvideo")


proc isFlv*(buf: string): tuple[extension, mime: string] =
  if buf.len > 3 and
  buf[0].byte == 0x46 and
  buf[1].byte == 0x4C and
  buf[2].byte == 0x56 and
  buf[3].byte == 0x01:
    result = ("flv", "video/x-flv")


proc isM4v*(buf: string): tuple[extension, mime: string] =
  if buf.len > 10 and
  buf[0].byte == 0x0 and
  buf[1].byte == 0x0 and
  buf[2].byte == 0x0 and
  buf[3].byte == 0x1C and
  buf[4].byte == 0x66 and
  buf[5].byte == 0x74 and
  buf[6].byte == 0x79 and
  buf[7].byte == 0x70 and
  buf[8].byte == 0x4D and
  buf[9].byte == 0x34 and
  buf[10].byte == 0x56:
    result = ("m4v", "video/x-m4v")


proc isMkv*(buf: string): tuple[extension, mime: string] =
  if buf.len > 31 and
  buf[0].byte == 0x1A and
  buf[1].byte == 0x45 and
  buf[2].byte == 0xDF and
  buf[3].byte == 0xA3 and
  buf[24] == 'm' and
  buf[25] == 'a' and
  buf[26] == 't' and
  buf[27] == 'r' and
  buf[28] == 'o' and
  buf[29] == 's' and
  buf[30] == 'k' and
  buf[31] == 'a':
    result = ("mkv", "video/x-matroska")


proc isMov*(buf: string): tuple[extension, mime: string] =
  if not isIsobmff(buf):
    return ("", "")
  let
    (majorBrand, minorVersion, compatibleBrands) = getFtype(buf)
  if majorBrand == "qt  ":
    result = ("mov", "video/quicktime")


proc isMp4*(buf: string): tuple[extension, mime: string] =
  if not isIsobmff(buf):
    return ("", "")
  let
    (majorBrand, minorVersion, compatibleBrands) = getFtype(buf)
  if majorBrand in ["mp41", "mp42", "dash", "isom", "iso2", "iso5", "iso6"]:
    result = ("mp4", "video/mp4")


proc isMpeg*(buf: string): tuple[extension, mime: string] =
  if buf.len > 3 and
  buf[0].byte == 0x0 and
  buf[1].byte == 0x0 and
  buf[2].byte == 0x1 and
  buf[3].byte >= 0xb0 and
  buf[3].byte <= 0xbf:
    result = ("mpeg", "video/mpeg")


proc isWebm*(buf: string): tuple[extension, mime: string] =
  if buf.len > 27 and
  buf[0].byte == 0x1A and
  buf[1].byte == 0x45 and
  buf[2].byte == 0xDF and
  buf[3].byte == 0xA3 and
  buf[24] == 'w' and
  buf[25] == 'e' and
  buf[26] == 'b' and
  buf[27] == 'm':
    result = ("webm", "video/webm")


proc isWmv*(buf: string): tuple[extension, mime: string] =
  if buf.len > 9 and
  buf[0].byte == 0x30 and
  buf[1].byte == 0x26 and
  buf[2].byte == 0xB2 and
  buf[3].byte == 0x75 and
  buf[4].byte == 0x8E and
  buf[5].byte == 0x66 and
  buf[6].byte == 0xCF and
  buf[7].byte == 0x11 and
  buf[8].byte == 0xA6 and
  buf[9].byte == 0xD9:
    result = ("wmv", "video/x-ms-wmv")
