(asdf:defsystem :c2ffi-blob
  :description "c2ffi executables for various platforms"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :defsystem-depends-on (:trivial-features)
  :depends-on (:claw-support)
  :components ((:file "c2ffi")))
