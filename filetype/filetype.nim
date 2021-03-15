import mimetypes

import types/all
import match, helpers


# NOTE: based on https://github.com/h2non/filetype.py


let mimetypesDB = newMimetypes()


proc guess*(path: string): string =
  match(path, allMatchers)


proc guessMime*(path: string): string =
  let ext = match(path, allMatchers)
  getMimetype(mimetypesDB, ext, default="")
