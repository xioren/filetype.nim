import os

import types/all
import utils


proc match*(path: string, matchers: seq[proc]): string =
  var ext: string
  let magic = getSignatureBytes(path)

  for matcher in matchers:
    ext = matcher(magic)
    if not (ext == ""):
      return ext


proc match*(path: string, matchers: seq[seq[proc]]): string =
  var ext: string
  let magic = getSignatureBytes(path)

  # TEMP: until a more eloquent solution for combining procs with and without
  # side effects into a single seq is found
  for matcher in specialMatchers:
    ext = matcher(magic)
    if not (ext == ""):
      return ext

  for matcherType in matchers:
    for matcher in matcherType:
      ext = matcher(magic)
      if not (ext == ""):
        return ext


proc imageMatch*(path: string): string =
  match(path, imageMatchers)


proc fontMatch*(path: string): string =
  match(path, fontMatchers)


proc videoMatch*(path: string): string =
  match(path, videoMatchers)


proc audioMatch*(path: string): string =
  match(path, audioMatchers)


proc archiveMatch*(path: string): string =
  match(path, archiveMatchers)


proc applicationMatch*(path: string): string =
  match(path, applicationMatchers)
