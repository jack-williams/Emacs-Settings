;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; General Configuration and Preferences
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; General Preferences
(fset 'yes-or-no-p 'y-or-n-p)
(customize-set-value 'inhibit-splash-screen t)
(customize-set-value 'inhibit-startup-message t)
(setq-default indent-tabs-mode nil)
(show-paren-mode)
(customize-set-value 'fill-column 80)
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message "* Notes")



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

;; System Local Config
;; -- OSX --
(if (eq system-type 'darwin)
    (progn
      (add-to-list
       'default-frame-alist
       '(font . "-*-Source Code Pro for Powerline-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1"))
      (setq coq-prog-name
            "/Applications/CoqIDE_8.4pl5.app/Contents/Resources/bin/coqtop")))


(provide 'jw-config)
