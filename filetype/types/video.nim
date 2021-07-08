include isobmff


proc isAvi*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 10 and
  buf[0] == 0x52 and
  buf[1] == 0x49 and
  buf[2] == 0x46 and
  buf[3] == 0x46 and
  buf[8] == 0x41 and
  buf[9] == 0x56 and
  buf[10] == 0x49:
    result = ("avi", "video/x-msvideo")


proc isFlv*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 3 and
  buf[0] == 0x46 and
  buf[1] == 0x4C and
  buf[2] == 0x56 and
  buf[3] == 0x01:
    result = ("flv", "video/x-flv")


proc isM4v*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 10 and
  buf[0] == 0x0 and
  buf[1] == 0x0 and
  buf[2] == 0x0 and
  buf[3] == 0x1C and
  buf[4] == 0x66 and
  buf[5] == 0x74 and
  buf[6] == 0x79 and
  buf[7] == 0x70 and
  buf[8] == 0x4D and
  buf[9] == 0x34 and
  buf[10] == 0x56:
    result = ("m4v", "video/x-m4v")


proc isMkv*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 31 and
  buf[0] == 0x1A and
  buf[1] == 0x45 and
  buf[2] == 0xDF and
  buf[3] == 0xA3 and
  (bytesToString(buf[24..31]) == "matroska" or
   bytesToString(buf[31..38]) == "matroska"):
    result = ("mkv", "video/x-matroska")


proc isMov*(buf: seq[byte]): tuple[extension, mime: string] =
  if not isIsobmff(buf):
    return ("", "")
  let
    (majorBrand, minorVersion, compatibleBrands) = getFtype(buf)
  if majorBrand == "qt  ":
    result = ("mov", "video/quicktime")


proc isMp4*(buf: seq[byte]): tuple[extension, mime: string] =
  if not isIsobmff(buf):
    return ("", "")
  let
    (majorBrand, minorVersion, compatibleBrands) = getFtype(buf)
  if majorBrand in ["mp41", "mp42", "dash", "isom", "iso2", "iso5", "iso6", "avc1"]:
    result = ("mp4", "video/mp4")


proc isMpeg*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 3 and
  buf[0] == 0x0 and
  buf[1] == 0x0 and
  buf[2] == 0x1 and
  buf[3] >= 0xb0 and
  buf[3] <= 0xbf:
    result = ("mpeg", "video/mpeg")


proc isWebm*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 27 and
  buf[0] == 0x1A and
  buf[1] == 0x45 and
  buf[2] == 0xDF and
  buf[3] == 0xA3 and
  (bytesToString(buf[24..27]) == "webm" or
   bytesToString(buf[31..34]) == "webm"):
    result = ("webm", "video/webm")


proc isWmv*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 9 and
  buf[0] == 0x30 and
  buf[1] == 0x26 and
  buf[2] == 0xB2 and
  buf[3] == 0x75 and
  buf[4] == 0x8E and
  buf[5] == 0x66 and
  buf[6] == 0xCF and
  buf[7] == 0x11 and
  buf[8] == 0xA6 and
  buf[9] == 0xD9:
    result = ("wmv", "video/x-ms-wmv")
