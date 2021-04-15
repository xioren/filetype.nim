import mimetypes

import types/all
import match, helpers


let mimetypesDB = newMimetypes()


type Kind = object
  extension*: string
  mime*: string


proc guess*(path: string): Kind =
  let ext = match(path, allMatchers)
  Kind(extension: ext, mime: getMimetype(mimetypesDB, ext, default=""))
