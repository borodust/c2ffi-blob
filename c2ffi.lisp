(cl:defpackage :c2ffi-blob
  (:use :cl))


#+windows
(claw.support:register-c2ffi-program
 (asdf:system-relative-pathname :c2ffi-blob "x86_64/windows/c2ffi.exe"))
