;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Mode Configurations
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TypeScript
(require 'typescript-mode)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))


;; Haskell
(defun my-haskell-hook ()
  (progn
    (interactive-haskell-mode)
    (haskell-doc-mode)
    (haskell-indentation-mode)))

(add-hook 'haskell-mode-hook 'my-haskell-hook)

;; Start Haskell Interactive mode without prompts
;;
;;(eval-after-load "haskell-mode"
;;  '(progn


;;     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
;;     (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
;;     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
;;     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
;;     (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;;     (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))
;;
;; Text Mode
(defun my-random-text-hook ()
  (local-set-key "\C-c\C-t" 'insert-typing-judgement)
  (local-set-key "\C-c\C-r" 'rules-center-this-infrule))

(add-hook 'text-mode-hook 'my-random-text-hook)


;; HELM
(require 'helm-config)
(require 'helm-swoop)
(helm-mode t)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(define-key helm-map (kbd "C-h") 'helm-previous-line)
(define-key helm-find-files-map (kbd "C-h") 'helm-previous-line)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(setq helm-buffers-fuzzy-matching t)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-j") 'helm-select-action)
