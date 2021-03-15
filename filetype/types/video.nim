include isobmff


proc is_avi*(buf: string): string =
  if buf.len > 10 and
  buf[0].byte == 0x52 and
  buf[1].byte == 0x49 and
  buf[2].byte == 0x46 and
  buf[3].byte == 0x46 and
  buf[8].byte == 0x41 and
  buf[9].byte == 0x56 and
  buf[10].byte == 0x49:
    result = "avi"


proc is_flv*(buf: string): string =
  if buf.len > 3 and
  buf[0].byte == 0x46 and
  buf[1].byte == 0x4C and
  buf[2].byte == 0x56 and
  buf[3].byte == 0x01:
    result = "flv"


proc is_m4v*(buf: string): string =
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
    result = "m4v"


proc is_mkv*(buf: string): string =
  if (buf.len > 15 and
  buf[0].byte == 0x1A and
  buf[1].byte == 0x45 and
  buf[2].byte == 0xDF and
  buf[3].byte == 0xA3 and
  buf[4].byte == 0x93 and
  buf[5].byte == 0x42 and
  buf[6].byte == 0x82 and
  buf[7].byte == 0x88 and
  buf[8].byte == 0x6D and
  buf[9].byte == 0x61 and
  buf[10].byte == 0x74 and
  buf[11].byte == 0x72 and
  buf[12].byte == 0x6F and
  buf[13].byte == 0x73 and
  buf[14].byte == 0x6B and
  buf[15].byte == 0x61) or
  (buf.len > 38 and
   buf[31].byte == 0x6D and
   buf[32].byte == 0x61 and
   buf[33].byte == 0x74 and
   buf[34].byte == 0x72 and
   buf[35].byte == 0x6f and
   buf[36].byte == 0x73 and
   buf[37].byte == 0x6B and
   buf[38].byte == 0x61):
    result = "mkv"


proc is_mov*(buf: string): string =
  if not is_isobmff(buf):
    return ""
  let
    (major_brand, minor_version, compatible_brands) = get_ftype(buf)
  if major_brand == "qt  ":
    result = "mov"


proc is_mp4*(buf: string): string =
  if not is_isobmff(buf):
    return ""
  let
    (major_brand, minor_version, compatible_brands) = get_ftype(buf)
  if major_brand in ["mp41", "mp42", "isom", "dash"]:
    result = "mp4"


proc is_mpeg*(buf: string): string =
  if buf.len > 3 and
  buf[0].byte == 0x0 and
  buf[1].byte == 0x0 and
  buf[2].byte == 0x1 and
  buf[3].byte >= 0xb0 and
  buf[3].byte <= 0xbf:
    result = "mpeg"


proc is_webm*(buf: string): string =
  if buf.len > 3 and
  buf[0].byte == 0x1A and
  buf[1].byte == 0x45 and
  buf[2].byte == 0xDF and
  buf[3].byte == 0xA3:
    result = "webm"


proc is_wmv*(buf: string): string =
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
    result = "wmv"
