(if (version<= "24.0" emacs-version)
    (package-initialize))

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; Run the initialisation files.
(require 'jw-package-init)
(require 'jw-keys)
(require 'jw-modes)
(require 'jw-config)
(require 'jw-themes)
(require 'jw-utils)
(require 'jw-org)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zenburn-theme use-package typescript-mode solarized-theme scala-mode2 prop-menu powerline magit haskell-mode counsel auctex ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
