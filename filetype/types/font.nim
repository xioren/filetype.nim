from ../utils import signatureBytes


proc isOtf*(buf: array[signatureBytes, uint8]): tuple[extension, mime: string] =
  if buf.len > 4 and
  buf[0] == 0x4F and
  buf[1] == 0x54 and
  buf[2] == 0x54 and
  buf[3] == 0x4F and
  buf[4] == 0x00:
    result = ("otf", "application/font-sfnt")


proc isTtf*(buf: array[signatureBytes, uint8]): tuple[extension, mime: string] =
  if buf.len > 4 and
  buf[0] == 0x00 and
  buf[1] == 0x01 and
  buf[2] == 0x00 and
  buf[3] == 0x00 and
  buf[4] == 0x00:
    result = ("ttf", "application/font-sfnt")


proc isWoff*(buf: array[signatureBytes, uint8]): tuple[extension, mime: string] =
  if buf.len > 7 and
  buf[0] == 0x77 and
  buf[1] == 0x4F and
  buf[2] == 0x46 and
  buf[3] == 0x46 and
  buf[4] == 0x00 and
  buf[5] == 0x01 and
  buf[6] == 0x00 and
  buf[7] == 0x00:
    result = ("woff", "application/font-woff")


proc isWoff2*(buf: array[signatureBytes, uint8]): tuple[extension, mime: string] =
  if buf.len > 7 and
  buf[0] == 0x77 and
  buf[1] == 0x4F and
  buf[2] == 0x46 and
  buf[3] == 0x32 and
  buf[4] == 0x00 and
  buf[5] == 0x01 and
  buf[6] == 0x00 and
  buf[7] == 0x00:
    result = ("woff2", "application/font-woff")
