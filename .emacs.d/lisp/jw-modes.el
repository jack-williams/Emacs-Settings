;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Mode Configurations
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TypeScript
(require 'typescript-mode)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

;; Haskell
(use-package haskell-mode
  :mode "\\.hs\\'"
  :config
  (setq haskell-mode 'stack-ghci)
  (defun my-haskell-hook ()
    (progn
      (interactive-haskell-mode)
      (haskell-doc-mode)
      (haskell-indentation-mode)))
  (add-hook 'haskell-mode-hook 'my-haskell-hook))


;; Text Mode
(defun my-random-text-hook ()
  (local-set-key "\C-c\C-t" 'insert-typing-judgement)
  (local-set-key "\C-c\C-r" 'rules-center-this-infrule))

(add-hook 'text-mode-hook 'my-random-text-hook)

;; Ivy Mode
(use-package ivy
 :config
 (progn
   (ivy-mode 1)
   (setq ivy-use-virtual-buffers t)
   (setq ivy-use-virtual-buffers t)
   (setq ivy-re-builders-alist '((t . ivy--regex-plus)))
   (global-set-key "\C-s" 'swiper)
   (global-set-key (kbd "C-c C-r") 'ivy-resume)
   (global-set-key (kbd "C-x C-m") 'counsel-M-x)
   (global-set-key (kbd "C-x C-f") 'counsel-find-file)
   (global-set-key (kbd "<f1> f") 'counsel-describe-function)
   (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
   (global-set-key (kbd "<f1> l") 'counsel-load-library)
   (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
   (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
   (global-set-key (kbd "C-c g") 'counsel-git)
   (global-set-key (kbd "C-c j") 'counsel-git-grep)
   (global-set-key (kbd "C-c k") 'counsel-ag)
   (global-set-key (kbd "C-x l") 'counsel-locate)
   (global-set-key (kbd "C-c w") 'ivy-push-view)
   (global-set-key (kbd "C-c W") 'ivy-pop-view)
   (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
   ))

(provide 'jw-modes)
