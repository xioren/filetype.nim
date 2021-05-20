import match


proc isImage*(path: string): bool =
  imageMatch(path).extension != ""


proc isArchive*(path: string): bool =
  archiveMatch(path).extension != ""


proc isAudio*(path: string): bool =
  audioMatch(path).extension != ""


proc isVideo*(path: string): bool =
  videoMatch(path).extension != ""


proc isFont*(path: string): bool =
  fontMatch(path).extension != ""


proc isApplication*(path: string): bool =
  applicationMatch(path).extension != ""
