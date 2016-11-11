(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Run the initialisation files.
(require 'jw-package-init)
(require 'jw-keys)
(require 'jw-modes)
(require 'jw-config)
(require 'jw-ui)
(require 'jw-utils)
(require 'jw-org)
