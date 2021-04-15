import application, archive, audio, font, image, video


const
  archiveMatchers* = @[isEpub,
                       isZip,
                       isTar,
                       isRar,
                       isGzip,
                       isBz2,
                       is7zip,
                       isPdf,
                       isExe,
                       isSwf,
                       isRtf,
                       isNes,
                       isCrx,
                       isCab,
                       isEot,
                       isPs,
                       isXz,
                       isSqlite,
                       isDeb,
                       isAr,
                       isZ,
                       isLz]

  audioMatchers* = @[isMp3,
                     isM4a,
                     isOgg,
                     isFlac,
                     isWav,
                     isMidi,
                     isAmr]

  fontMatchers* = @[isWoff,
                    isWoff2,
                    isTtf,
                    isOtf]

  imageMatchers* = @[isJpeg,
                     isJpx,
                     isPng,
                     isGif,
                     isWebp,
                     isCr2,
                     isTiff,
                     isBmp,
                     isJxr,
                     isPsd,
                     isIco,
                     isDcm]

  videoMatchers* = @[isMkv,
                     isWebm,
                     isAvi,
                     isWmv,
                     isFlv,
                     isM4v]

  applicationMatchers* = @[isWasm]

  # NOTE: special == procs with side effects
  specialMatchers* = @[isMp4,
                       isMov,
                       isHeic]

  allMatchers* = @[archiveMatchers,
                   audioMatchers,
                   fontMatchers,
                   imageMatchers,
                   videoMatchers]
