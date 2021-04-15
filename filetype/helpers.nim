import match


proc isImage*(path: string): bool =
  not (imageMatch(path).extension == "")


proc isArchive*(path: string): bool =
  not (archiveMatch(path).extension == "")


proc isAudio*(path: string): bool =
  not (audioMatch(path).extension == "")


proc isVideo*(path: string): bool =
  not (videoMatch(path).extension == "")


proc isFont*(path: string): bool =
  not (fontMatch(path).extension == "")


proc isApplication*(path: string): bool =
  not (applicationMatch(path).extension == "")
