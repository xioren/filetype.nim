proc is7zip*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 5 and
  buf[0] == 0x37 and
  buf[1] == 0x7A and
  buf[2] == 0xBC and
  buf[3] == 0xAF and
  buf[4] == 0x27 and
  buf[5] == 0x1C:
    result = ("7z", "application/x-7z-compressed")


proc isAr*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 6 and
  buf[0] == 0x21 and
  buf[1] == 0x3C and
  buf[2] == 0x61 and
  buf[3] == 0x72 and
  buf[4] == 0x63 and
  buf[5] == 0x68 and
  buf[6] == 0x3E:
    result = ("ar", "application/x-unix-archive")


proc isBz2*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 2 and
  buf[0] == 0x42 and
  buf[1] == 0x5A and
  buf[2] == 0x68:
    result = ("bz2", "application/x-bzip2")


proc isCab*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 3 and
  ((buf[0] == 0x4D and
    buf[1] == 0x53 and
    buf[2] == 0x43 and
    buf[3] == 0x46) or
   (buf[0] == 0x49 and
    buf[1] == 0x53 and
    buf[2] == 0x63 and
    buf[3] == 0x28)):
     result = ("cab", "application/vnd.ms-cab-compressed")


proc isCrx*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 3 and
  buf[0] == 0x43 and
  buf[1] == 0x72 and
  buf[2] == 0x32 and
  buf[3] == 0x34:
    result = ("crx", "application/x-google-chrome-extension")


proc isDeb*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 20 and
  buf[0] == 0x21 and
  buf[1] == 0x3C and
  buf[2] == 0x61 and
  buf[3] == 0x72 and
  buf[4] == 0x63 and
  buf[5] == 0x68 and
  buf[6] == 0x3E and
  buf[7] == 0x0A and
  buf[8] == 0x64 and
  buf[9] == 0x65 and
  buf[10] == 0x62 and
  buf[11] == 0x69 and
  buf[12] == 0x61 and
  buf[13] == 0x6E and
  buf[14] == 0x2D and
  buf[15] == 0x62 and
  buf[16] == 0x69 and
  buf[17] == 0x6E and
  buf[18] == 0x61 and
  buf[19] == 0x72 and
  buf[20] == 0x79:
    result = ("deb", "application/x-deb")


proc isEot*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 35 and
  (buf[34] == 0x4C and
   buf[35] == 0x50 and
   (buf[8] == 0x02 and
    buf[9] == 0x00 and
    buf[10] == 0x01) or
   (buf[8] == 0x01 and
    buf[9] == 0x00 and
    buf[10] == 0x00) or
   (buf[8] == 0x02 and
    buf[9] == 0x00 and
    buf[10] == 0x02)):
     result = ("eot", "application/octet-stream")


proc isEpub*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 57 and
  buf[0] == 0x50 and
  buf[1] == 0x4B and
  buf[2] == 0x3 and
  buf[3] == 0x4 and
  buf[30] == 0x6D and
  buf[31] == 0x69 and
  buf[32] == 0x6D and
  buf[33] == 0x65 and
  buf[34] == 0x74 and
  buf[35] == 0x79 and
  buf[36] == 0x70 and
  buf[37] == 0x65 and
  buf[38] == 0x61 and
  buf[39] == 0x70 and
  buf[40] == 0x70 and
  buf[41] == 0x6C and
  buf[42] == 0x69 and
  buf[43] == 0x63 and
  buf[44] == 0x61 and
  buf[45] == 0x74 and
  buf[46] == 0x69 and
  buf[47] == 0x6F and
  buf[48] == 0x6E and
  buf[49] == 0x2F and
  buf[50] == 0x65 and
  buf[51] == 0x70 and
  buf[52] == 0x75 and
  buf[53] == 0x62 and
  buf[54] == 0x2B and
  buf[55] == 0x7A and
  buf[56] == 0x69 and
  buf[57] == 0x70:
    result = ("epub", "application/epub+zip")


proc isExe*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 1 and
  buf[0] == 0x4D and
  buf[1] == 0x5A:
    result = ("exe", "application/x-msdownload")


proc isGzip*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 2 and
  buf[0] == 0x1F and
  buf[1] == 0x8B and
  buf[2] == 0x8:
    result = ("gz", "application/gzip")


proc isLz*(buf: seq[byte]): tuple[extension, mime: string] =
 if buf.len > 3 and
 buf[0] == 0x4C and
 buf[1] == 0x5A and
 buf[2] == 0x49 and
 buf[3] == 0x50:
   result = ("lz", "application/x-lzip")


proc isNes*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 3 and
  buf[0] == 0x4E and
  buf[1] == 0x45 and
  buf[2] == 0x53 and
  buf[3] == 0x1A:
    result = ("nes", "application/x-nintendo-nes-rom")


proc isPdf*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 3 and
  buf[0] == 0x25 and
  buf[1] == 0x50 and
  buf[2] == 0x44 and
  buf[3] == 0x46:
    result = ("pdf", "application/pdf")


proc isPs*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 1 and
  buf[0] == 0x25 and
  buf[1] == 0x21:
    result = ("ps", "application/postscript")


proc isRar*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 6 and
  buf[0] == 0x52 and
  buf[1] == 0x61 and
  buf[2] == 0x72 and
  buf[3] == 0x21 and
  buf[4] == 0x1A and
  buf[5] == 0x7 and
  (buf[6] == 0x0 or
   buf[6] == 0x1):
     result = ("rar", "application/x-rar-compressed")


proc isRtf*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 4 and
  buf[0] == 0x7B and
  buf[1] == 0x5C and
  buf[2] == 0x72 and
  buf[3] == 0x74 and
  buf[4] == 0x66:
    result = ("rtf", "application/rtf")


proc isSqlite*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 3 and
  buf[0] == 0x53 and
  buf[1] == 0x51 and
  buf[2] == 0x4C and
  buf[3] == 0x69:
    result = ("sqlite", "application/x-sqlite3")


proc isSwf*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 2 and
  (buf[0] == 0x43 or
   buf[0] == 0x46) and
  buf[1] == 0x57 and
  buf[2] == 0x53:
    result = ("swf", "application/x-shockwave-flash")


proc isTar*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 261 and
  buf[257] == 0x75 and
  buf[258] == 0x73 and
  buf[259] == 0x74 and
  buf[260] == 0x61 and
  buf[261] == 0x72:
    result = ("tar", "application/x-tar")


proc isXz*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 5 and
  buf[0] == 0xFD and
  buf[1] == 0x37 and
  buf[2] == 0x7A and
  buf[3] == 0x58 and
  buf[4] == 0x5A and
  buf[5] == 0x00:
    result = ("xz", "application/x-xz")


proc isZ*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 1 and
  ((buf[0] == 0x1F and
    buf[1] == 0xA0) or
   (buf[0] == 0x1F and
    buf[1] == 0x9D)):
     result = ("Z", "application/x-compress")


proc isZip*(buf: seq[byte]): tuple[extension, mime: string] =
  if buf.len > 3 and
  buf[0] == 0x50 and
  buf[1] == 0x4B and
  (buf[2] == 0x3 or
   buf[2] == 0x5 or
   buf[2] == 0x7) and
  (buf[3] == 0x4 or
   buf[3] == 0x6 or
   buf[3] == 0x8):
     result = ("zip", "application/zip")
