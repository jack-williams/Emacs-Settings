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

(use-package spacemacs-theme
  :defer t
  :init
  (load-theme 'spacemacs-dark t)
  (setq spacemacs-theme-org-agenda-height nil)
  (setq spacemacs-theme-org-height nil))

(use-package doom-modeline
  :ensure t
  :defer t
  :hook
  (after-init
   . (lambda ()
       (setq doom-modeline-height 20)
       (setq doom-modeline-bar-width 4)
       (setq doom-modeline-icon (not (eq system-type 'windows-nt)))
       (setq doom-modeline-icon nil)
       (setq doom-modeline-major-mode-icon nil)
       (doom-modeline-init))))

;; Make ace-window leading character face match buffer
(custom-set-faces
 '(aw-leading-char-face
   ((t (:height 1.0)))))

(provide 'jw-ui)
