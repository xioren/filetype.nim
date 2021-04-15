proc isWasm*(buf: string): string =
  ## web assembly
  if buf[0].byte == 0x00 and
  buf[1].byte == 0x61 and
  buf[2].byte == 0x73 and
  buf[3].byte == 0x6d and
  buf[4].byte == 0x01 and
  buf[5].byte == 0x00 and
  buf[6].byte == 0x00 and
  buf[8].byte == 0x00:
    result = "wasm"
