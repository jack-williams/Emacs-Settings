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
;; (global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-h") 'previous-line)

;; Ace Jump
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; OSX
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(provide 'keys)
