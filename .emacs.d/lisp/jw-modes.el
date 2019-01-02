;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Mode Configurations
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package typescript-mode
  :mode "\\.ts\\'"
  :init
  (add-hook
   'typescript-mode-hook
   (lambda ()
     (tide-setup)
     (flycheck-mode +1)
     (setq flycheck-check-syntax-automatically '(save mode-enabled))
     (eldoc-mode +1)
     (tide-hl-identifier-mode +1)
     (define-key tide-mode-map (kbd "C-c f") #'tide-jsdoc-template)
     (define-key tide-mode-map (kbd "C-c C-f") #'tide-format)
     ))
  :config
  (setq typescript-indent-level 4)
  (setq typescript-switch-indent-offset typescript-indent-level)
  (setq js-indent-level 4)
  (setq tide-tsserver-executable "~/Developer/TypeScript/built/local/tsserver.js"))

(use-package haskell-mode
  :mode "\\.hs\\'"
  :config
  (setq haskell-process-type 'stack-ghci)
  (setq haskell-process-args-stack-ghci '("--ghci-options=-ferror-spans -fshow-loaded-modules"))
  (defun my-haskell-hook ()
    (progn
      (interactive-haskell-mode)
      (haskell-doc-mode)
      (haskell-indentation-mode)))
  (add-hook 'haskell-mode-hook 'my-haskell-hook))

;; Text Mode
(defun my-random-text-hook ()
  (require 'rules)
  (local-set-key "\C-c\C-t" 'insert-typing-judgement)
  (local-set-key "\C-cr" 'rules-center-this-infrule))

(add-hook 'text-mode-hook 'my-random-text-hook)

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :init
  (ivy-mode 1)
  :config
  (progn
    (ivy-mode)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-re-builders-alist
          '((t . ivy--regex-plus)))
    (setq ivy-initial-inputs-alist nil)
    (setq counsel-grep-base-command
          "rg -i -M 120 --no-heading --line-number --color never %s %s")
    (global-set-key "\C-s" 'counsel-grep-or-swiper)
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
    (global-set-key (kbd "C-c k") 'counsel-rg)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "M-y") 'counsel-yank-pop)
    (global-set-key (kbd "C-c w") 'ivy-push-view)
    (global-set-key (kbd "C-c W") 'ivy-pop-view)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

;; LaTeX Config
(setq-default TeX-master nil)
(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-auto-save t) ; Enable parse on save.
(setq reftex-plug-into-AUCTeX t)
(setq TeX-view-program-selection '((output-pdf "Skim")))
(setq TeX-view-program-list
      '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -r -b -b -g %n %o %b")))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (progn
              (reftex-mode t)
              (setq reftex-cite-format 'natbib)
              (flyspell-mode t)
              (push
               '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
                 :help "Run latexmk on file")
               TeX-command-list))))

(add-hook 'TeX-mode-hook
          '(lambda ()
             (setq TeX-command-default "latexmk")))

(provide 'jw-modes)
