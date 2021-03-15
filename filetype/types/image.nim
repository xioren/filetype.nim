include isobmff


proc is_bmp*(buf: string): string =
  if buf.len > 1 and
  buf[0].byte == 0x42 and
  buf[1].byte == 0x4D:
    result = "bpm"


proc is_cr2*(buf: string): string =
  if buf.len > 9 and
  ((buf[0].byte == 0x49 and
    buf[1].byte == 0x49 and
    buf[2].byte == 0x2A and
    buf[3].byte == 0x0) or
   (buf[0].byte == 0x4D and
    buf[1].byte == 0x4D and
    buf[2].byte == 0x0 and
    buf[3].byte == 0x2A)) and
   buf[8].byte == 0x43 and
   buf[9].byte == 0x52:
     result = "cr2"


proc is_dcm*(buf: string): string =
 const offset = 128
 if buf.len > offset + 4 and
 buf[offset + 0].byte == 0x44 and
 buf[offset + 1].byte == 0x49 and
 buf[offset + 2].byte == 0x43 and
 buf[offset + 3].byte == 0x4D:
   result = "dcm"


proc is_gif*(buf: string): string =
  if len(buf) > 2 and
  buf[0].byte == 0x47 and
  buf[1].byte == 0x49 and
  buf[2].byte == 0x46:
    result = "gif"


proc is_heic*(buf: string): string =
  if not is_isobmff(buf):
      return ""
  const
    brands = ["mif1", "msf1"]
  let
    (major_brand, minor_version, compatible_brands) = get_ftype(buf)

  if major_brand == "heic" or
  (major_brand in brands and "heic" in compatible_brands):
    result = "heic"


proc is_ico*(buf: string): string =
  if buf.len > 3 and
  buf[0].byte == 0x00 and
  buf[1].byte == 0x00 and
  buf[2].byte == 0x01 and
  buf[3].byte == 0x00:
    result = "ico"


proc is_jpeg*(buf: string): string =
  if buf.len > 2 and
  buf[0].byte == 0xFF and
  buf[1].byte == 0xD8 and
  buf[2].byte == 0xFF:
    result = "jpeg"


proc is_jpx*(buf: string): string =
  if buf.len > 50 and
  buf[0].byte == 0x00 and
  buf[1].byte == 0x00 and
  buf[2].byte == 0x00 and
  buf[3].byte == 0x0C and
  buf[16..<24] == "ftypjp2 ":
    result = "jpx"


proc is_jxr*(buf: string): string =
  if buf.len > 2 and
  buf[0].byte == 0x49 and
  buf[1].byte == 0x49 and
  buf[2].byte == 0xBC:
    result = "jxr"


proc is_png*(buf: string): string =
  if buf.len > 3 and
  buf[0].byte == 0x89 and
  buf[1].byte == 0x50 and
  buf[2].byte == 0x4E and
  buf[3].byte == 0x47:
    result = "png"


proc is_psd*(buf: string): string =
  if buf.len > 3 and
  buf[0].byte == 0x38 and
  buf[1].byte == 0x42 and
  buf[2].byte == 0x50 and
  buf[3].byte == 0x53:
    result = "psd"


proc is_tiff*(buf: string): string =
  if buf.len > 3 and
  (buf[0].byte == 0x49 and
   buf[1].byte == 0x49 and
   buf[2].byte == 0x2A and
   buf[3].byte == 0x0) or
  (buf[0].byte == 0x4D and
   buf[1].byte == 0x4D and
   buf[2].byte == 0x0 and
   buf[3].byte == 0x2A):
    result = "tiff"


proc is_webp*(buf: string): string =
  if len(buf) > 13 and
  buf[0].byte == 0x52 and
  buf[1].byte == 0x49 and
  buf[2].byte == 0x46 and
  buf[3].byte == 0x46 and
  buf[8].byte == 0x57 and
  buf[9].byte == 0x45 and
  buf[10].byte == 0x42 and
  buf[11].byte == 0x50 and
  buf[12].byte == 0x56 and
  buf[13].byte == 0x50:
    result = "webp"
