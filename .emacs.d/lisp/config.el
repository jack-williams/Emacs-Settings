;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; General Configuration and Preferences
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; General Preferences
(fset 'yes-or-no-p 'y-or-n-p)
(column-number-mode t)
(line-number-mode t)
(customize-set-value 'inhibit-splash-screen t)
(customize-set-value 'inhibit-startup-message t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default indent-tabs-mode nil)
(show-paren-mode)
(customize-set-value 'fill-column 80)


;; Powerline
(powerline-default-theme)
(customize-set-value 'powerline-default-separator 'utf-8)
(customize-set-value 'moe-theme-mode-line-color 'w/b)
(customize-set-value 'powerline-display-buffer-size nil) 
(customize-set-value 'powerline-display-mule-info nil)

;;; Modeline
(customize-set-value 'display-time-default-load-average nil)
(display-time-mode)

;; Backup configuration
(setq backup-by-copying t
      backup-directory-alist
      '(("." . "~/.emacs_backups"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

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

;; Org
(customize-set-value 'org-agenda-files '("~/org"))
(customize-set-value 'calendar-mark-diary-entries-flag t)
(customize-set-value 'org-latex-packages-alist (quote (("" "amssymb" nil) ("" "asmath" nil))))

;; System Local Config
;; -- OSX --
(if (eq system-type 'darwin)
    (progn
      (add-to-list
       'default-frame-alist
       '(font . "-*-Source Code Pro for Powerline-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1"))
      (setq coq-prog-name
            "/Applications/CoqIDE_8.4pl5.app/Contents/Resources/bin/coqtop")))
