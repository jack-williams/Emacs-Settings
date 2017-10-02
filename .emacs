(defvar emacs-d
  (file-name-directory
   (file-chase-links user-emacs-directory)))

(add-to-list 'load-path (concat emacs-d "lisp"))
(add-to-list 'load-path (concat emacs-d "site-lisp"))

(setq custom-file (concat emacs-d "custom.el"))
(load custom-file)

(package-initialize)

;; Run the initialisation files.
(require 'jw-package-init)
(require 'jw-keys)
(require 'jw-modes)
(require 'jw-config)
(require 'jw-ui)
(require 'jw-utils)
(require 'jw-org)
(require 'jw-hydras)
