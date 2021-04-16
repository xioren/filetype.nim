import types/all
import utils


proc match*(path: string, matchers: seq[proc]): tuple =
  ## test against specific matchers
  let magic = getSignatureBytes(path)

  for matcher in matchers:
    result = matcher(magic)
    if not (result.extension == ""):
      break


proc match*(path: string): tuple =
  ## test against all supported matchers
  let magic = getSignatureBytes(path)

  for matcherType in allMatchers:
    for matcher in matcherType:
      result = matcher(magic)
      if not (result.extension == ""):
        return result


proc imageMatch*(path: string): tuple =
  match(path, imageMatchers)


proc fontMatch*(path: string): tuple =
  match(path, fontMatchers)


proc videoMatch*(path: string): tuple =
  match(path, videoMatchers)


proc audioMatch*(path: string): tuple =
  match(path, audioMatchers)


proc archiveMatch*(path: string): tuple =
  match(path, archiveMatchers)


proc applicationMatch*(path: string): tuple =
  match(path, applicationMatchers)
