import application, archive, audio, font, image, video


const
  archiveMatchers* = @[is_epub,
                       is_zip,
                       is_tar,
                       is_rar,
                       is_gzip,
                       is_bz2,
                       is_7zip,
                       is_pdf,
                       is_exe,
                       is_swf,
                       is_rtf,
                       is_nes,
                       is_crx,
                       is_cab,
                       is_eot,
                       is_ps,
                       is_xz,
                       is_sqlite,
                       is_deb,
                       is_ar,
                       is_z,
                       is_lzip]

  audioMatchers* = @[is_mp3,
                     is_m4a,
                     is_ogg,
                     is_flac,
                     is_wav,
                     is_midi,
                     is_amr]

  fontMatchers* = @[is_woff,
                    is_woff2,
                    is_ttf,
                    is_otf]

  imageMatchers* = @[is_jpeg,
                     is_jpx,
                     is_png,
                     is_gif,
                     is_webp,
                     is_cr2,
                     is_tiff,
                     is_bmp,
                     is_jxr,
                     is_psd,
                     is_ico,
                     is_dcm]

  videoMatchers* = @[is_mkv,
                     is_webm,
                     is_avi,
                     is_wmv,
                     is_flv,
                     is_m4v]

  applicationMatchers* = @[is_wasm]

  # NOTE: special == procs with side effects
  specialMatchers* = @[is_mp4,
                       is_mov,
                       is_heic]

  allMatchers* = @[archiveMatchers,
                   audioMatchers,
                   fontMatchers,
                   imageMatchers,
                   videoMatchers]
