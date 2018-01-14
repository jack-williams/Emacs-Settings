;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Interface Configuration
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Reclaim screen space
(column-number-mode t)
(line-number-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Add this since I've hidden menu bar on OSX
(display-time-mode t)

(use-package spacemacs-theme
  :defer t
  :init
  (load-theme 'spacemacs-dark t)
  (setq spacemacs-theme-org-agenda-height nil)
  (setq spacemacs-theme-org-height nil))

(use-package spaceline
  :demand t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator 'utf-8)
  (spaceline-spacemacs-theme))

(provide 'jw-ui)
