from ../utils import signatureBytes


proc isWasm*(buf: array[signatureBytes, uint8]): tuple[extension, mime: string] =
  ## web assembly
  if buf[0] == 0x00 and
  buf[1] == 0x61 and
  buf[2] == 0x73 and
  buf[3] == 0x6d and
  buf[4] == 0x01 and
  buf[5] == 0x00 and
  buf[6] == 0x00 and
  buf[8] == 0x00:
    result = ("wasm", "application/wasm")
