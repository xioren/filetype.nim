proc is_amr*(buf: string): string =
  if buf.len > 11 and
  buf[0].byte == 0x23 and
  buf[1].byte == 0x21 and
  buf[2].byte == 0x41 and
  buf[3].byte == 0x4D and
  buf[4].byte == 0x52 and
  buf[5].byte == 0x0A:
    result = "amr"


proc is_flac*(buf: string): string =
  if buf.len > 3 and
  buf[0].byte == 0x66 and
  buf[1].byte == 0x4C and
  buf[2].byte == 0x61 and
  buf[3].byte == 0x43:
    result = "flac"


proc is_m4a*(buf: string): string =
  if buf.len > 10 and
  (buf[4].byte == 0x66 and
   buf[5].byte == 0x74 and
   buf[6].byte == 0x79 and
   buf[7].byte == 0x70 and
   buf[8].byte == 0x4D and
   buf[9].byte == 0x34 and
   buf[10].byte == 0x41) or
  (buf[0].byte == 0x4D and
   buf[1].byte == 0x34 and
   buf[2].byte == 0x41 and
   buf[3].byte == 0x20):
    result = "m4a"


proc is_midi*(buf: string): string =
  if buf.len > 3 and
  buf[0].byte == 0x4D and
  buf[1].byte == 0x54 and
  buf[2].byte == 0x68 and
  buf[3].byte == 0x64:
    result = "midi"


proc is_mp3*(buf: string): string =
  if buf.len > 2 and
  (buf[0].byte == 0x49 and
   buf[1].byte == 0x44 and
   buf[2].byte == 0x33) or
  (buf[0].byte == 0xFF and
   buf[1].byte == 0xfb):
     result = "mp3"


proc is_ogg*(buf: string): string =
  if buf.len > 3 and
  buf[0].byte == 0x4F and
  buf[1].byte == 0x67 and
  buf[2].byte == 0x67 and
  buf[3].byte == 0x53:
    result = "flac"


proc is_wav*(buf: string): string =
  if buf.len > 11 and
  buf[0].byte == 0x52 and
  buf[1].byte == 0x49 and
  buf[2].byte == 0x46 and
  buf[3].byte == 0x46 and
  buf[8].byte == 0x57 and
  buf[9].byte == 0x41 and
  buf[10].byte == 0x56 and
  buf[11].byte == 0x45:
    result = "wav"
