;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Global Key Bindings (Non-mode Specific)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; General
(global-set-key (kbd "M-/") 'hippie-expand)

;; Dvorak friendly keymappings.
(keyboard-translate ?\C-z ?\C-x)
(keyboard-translate ?\C-x ?\C-z)
;; This has been replaced with counsel-M-x
;; (global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-h") 'previous-line)
(define-key Buffer-menu-mode-map (kbd "h") 'previous-line)

;; Avy
(define-key global-map (kbd "C-c SPC") 'avy-goto-char)
(global-set-key (kbd "C-x o") 'ace-window)

;; OSX
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(provide 'jw-keys)
