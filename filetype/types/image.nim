include isobmff


proc isBmp*(buf: seq[uint8]): tuple[extension, mime: string] =
  if buf.len > 1 and
  buf[0] == 0x42 and
  buf[1] == 0x4D:
    result = ("bmp", "image/bmp")


proc isCr2*(buf: seq[uint8]): tuple[extension, mime: string] =
  if buf.len > 9 and
  ((buf[0] == 0x49 and
    buf[1] == 0x49 and
    buf[2] == 0x2A and
    buf[3] == 0x0) or
   (buf[0] == 0x4D and
    buf[1] == 0x4D and
    buf[2] == 0x0 and
    buf[3] == 0x2A)) and
   buf[8] == 0x43 and
   buf[9] == 0x52:
     result = ("cr2", "image/x-canon-cr2")


proc isDcm*(buf: seq[uint8]): tuple[extension, mime: string] =
 const offset = 128
 if buf.len > offset + 4 and
 buf[offset + 0] == 0x44 and
 buf[offset + 1] == 0x49 and
 buf[offset + 2] == 0x43 and
 buf[offset + 3] == 0x4D:
   result = ("dcm", "application/dicom")


proc isGif*(buf: seq[uint8]): tuple[extension, mime: string] =
  if len(buf) > 2 and
  buf[0] == 0x47 and
  buf[1] == 0x49 and
  buf[2] == 0x46:
    result = ("gif", "image/gif")


proc isHeic*(buf: seq[uint8]): tuple[extension, mime: string] =
  if not is_isobmff(buf):
      return ("", "")
  const
    brands = ["mif1", "msf1"]
  let
    (major_brand, minor_version, compatible_brands) = get_ftype(buf)

  if major_brand == "heic" or
  (major_brand in brands and "heic" in compatible_brands):
    result = ("heic", "image/heic")


proc isIco*(buf: seq[uint8]): tuple[extension, mime: string] =
  if buf.len > 3 and
  buf[0] == 0x00 and
  buf[1] == 0x00 and
  buf[2] == 0x01 and
  buf[3] == 0x00:
    result = ("ico", "image/x-icon")


proc isJpeg*(buf: seq[uint8]): tuple[extension, mime: string] =
  if buf.len > 2 and
  buf[0] == 0xFF and
  buf[1] == 0xD8 and
  buf[2] == 0xFF:
    result = ("jpeg", "image/jpeg")


proc isJpx*(buf: seq[uint8]): tuple[extension, mime: string] =
  if buf.len > 50 and
  buf[0] == 0x00 and
  buf[1] == 0x00 and
  buf[2] == 0x00 and
  buf[3] == 0x0C and
  bytesToString(buf[16..23]) == "ftypjp2 ":
    result = ("jpx", "image/jpx")


proc isJxr*(buf: seq[uint8]): tuple[extension, mime: string] =
  if buf.len > 2 and
  buf[0] == 0x49 and
  buf[1] == 0x49 and
  buf[2] == 0xBC:
    result = ("jxr", "image/vnd.ms-photo")


proc isPng*(buf: seq[uint8]): tuple[extension, mime: string] =
  if buf.len > 3 and
  buf[0] == 0x89 and
  buf[1] == 0x50 and
  buf[2] == 0x4E and
  buf[3] == 0x47:
    result = ("png", "image/png")


proc isPsd*(buf: seq[uint8]): tuple[extension, mime: string] =
  if buf.len > 3 and
  buf[0] == 0x38 and
  buf[1] == 0x42 and
  buf[2] == 0x50 and
  buf[3] == 0x53:
    result = ("psd", "image/vnd.adobe.photoshop")


proc isTiff*(buf: seq[uint8]): tuple[extension, mime: string] =
  if buf.len > 3 and
  ((buf[0] == 0x49 and
    buf[1] == 0x49 and
    buf[2] == 0x2A and
    buf[3] == 0x0) or
   (buf[0] == 0x4D and
    buf[1] == 0x4D and
    buf[2] == 0x0 and
    buf[3] == 0x2A)):
    result = ("tiff", "image/tiff")


proc isWebp*(buf: seq[uint8]): tuple[extension, mime: string] =
  if len(buf) > 13 and
  buf[0] == 0x52 and
  buf[1] == 0x49 and
  buf[2] == 0x46 and
  buf[3] == 0x46 and
  buf[8] == 0x57 and
  buf[9] == 0x45 and
  buf[10] == 0x42 and
  buf[11] == 0x50 and
  buf[12] == 0x56 and
  buf[13] == 0x50:
    result = ("webp", "image/webp")
