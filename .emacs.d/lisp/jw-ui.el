;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Interface Configuration
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(column-number-mode t)
(line-number-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Add this since I've hidden menu bar on OSX
(display-time-mode t)

(use-package spacemacs-theme
  :ensure t
  :init
  (load-theme 'spacemacs-dark t)
  (setq spacemacs-theme-org-agenda-height nil)
  (setq spacemacs-theme-org-height nil))

(use-package spaceline
  :demand t
  :init
  (setq powerline-default-separator 'arrow-fade)
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme))

(provide 'jw-ui)
