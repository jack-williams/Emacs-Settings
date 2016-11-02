(if (version<= "24.0" emacs-version)
    (package-initialize))

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; Run the initialisation files.
(require 'jw-package-init)
(require 'jw-keys)
(require 'jw-modes)
(require 'jw-themes)
(require 'jw-utils)
(require 'jw-org)
(require 'jw-config)

