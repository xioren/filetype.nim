proc is_otf*(buf: string): string =
  if buf.len > 4 and
  buf[0].byte == 0x4F and
  buf[1].byte == 0x54 and
  buf[2].byte == 0x54 and
  buf[3].byte == 0x4F and
  buf[4].byte == 0x00:
    result = "otf"


proc is_ttf*(buf: string): string =
  if buf.len > 4 and
  buf[0].byte == 0x00 and
  buf[1].byte == 0x01 and
  buf[2].byte == 0x00 and
  buf[3].byte == 0x00 and
  buf[4].byte == 0x00:
    result = "ttf"


proc is_woff*(buf: string): string =
  if buf.len > 7 and
  buf[0].byte == 0x77 and
  buf[1].byte == 0x4F and
  buf[2].byte == 0x46 and
  buf[3].byte == 0x46 and
  buf[4].byte == 0x00 and
  buf[5].byte == 0x01 and
  buf[6].byte == 0x00 and
  buf[7].byte == 0x00:
    result = "woff"


proc is_woff2*(buf: string): string =
  if buf.len > 7 and
  buf[0].byte == 0x77 and
  buf[1].byte == 0x4F and
  buf[2].byte == 0x46 and
  buf[3].byte == 0x32 and
  buf[4].byte == 0x00 and
  buf[5].byte == 0x01 and
  buf[6].byte == 0x00 and
  buf[7].byte == 0x00:
    result = "woff2"
