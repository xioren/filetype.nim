import match


proc isImage*(path: string): bool =
  not (imageMatch(path) == "")


proc isArchive*(path: string): bool =
  not (archiveMatch(path) == "")


proc isAudio*(path: string): bool =
  not (audioMatch(path) == "")


proc isVideo*(path: string): bool =
  not (videoMatch(path) == "")


proc isFont*(path: string): bool =
  not (fontMatch(path) == "")


proc isApplication*(path: string): bool =
  not (applicationMatch(path) == "")
