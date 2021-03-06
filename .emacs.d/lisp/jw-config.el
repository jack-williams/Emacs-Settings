;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; General Configuration and Preferences
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'hydra)

;; General Preferences
(fset 'yes-or-no-p 'y-or-n-p)
(customize-set-value 'inhibit-splash-screen t)
(customize-set-value 'inhibit-startup-message t)
(setq-default indent-tabs-mode nil)
(menu-bar-mode -1)
(customize-set-value 'fill-column 80)

;; Parens
(use-package smartparens
  :ensure t
  :defer t
  :diminish smartparens-mode
  :init (let ((sp-hook (lambda ()
                         (require 'smartparens-config)
                         (show-smartparens-global-mode 1)
                         (smartparens-global-mode t))))
          (progn
            (add-hook 'prog-mode-hook sp-hook)
            (add-hook 'LaTeX-mode-hook sp-hook))))

;; Start-up Screen
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message
      (concat "* Notes " (format-time-string "%d/%m/%y")))

;; Hippie Expand Preferences
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line))

;; Backup
(setq make-backup-files nil)

;; System Local Config
;; -- OSX --
(if (eq system-type 'darwin)
    (progn
      (add-to-list
       'default-frame-alist
       '(font . "-*-Space Code Pro-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1"))))

;; -- Windows --
(if (eq system-type 'windows-nt)
    (progn
      (setq visible-bell 1)
      (add-to-list
       'default-frame-alist
       '(font . "-outline-Consolas-normal-normal-normal-mono-27-*-*-*-c-*-iso8859-1"))))

(use-package yasnippet
  :diminish yas-minor-mode
  :init
  (yas-global-mode)
  :config
  (yas-reload-all))

(provide 'jw-config)
