;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Taken from http://batsov.com/articles/2012/02/19/
;;            package-management-in-emacs-the-good-the-bad-and-the-ugly/
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl)

(when (>= emacs-major-version 24)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t))

(defvar prelude-packages
  '(use-package
    auctex
    haskell-mode
    powerline
    typescript-mode
    flycheck
    magit
    ivy
    avy
    counsel)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  "Check if all packages in `prelude-packages' are installed."
  (every #'package-installed-p prelude-packages))

(defun prelude-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package prelude-packages)
    (add-to-list 'prelude-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun prelude-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'prelude-require-package packages))

(define-obsolete-function-alias 'prelude-ensure-module-deps 'prelude-require-packages)

(defun prelude-install-packages ()
  "Install all packages listed in `prelude-packages'."
  (unless (prelude-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs Prelude is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (prelude-require-packages prelude-packages)))

;; run package installation
(prelude-install-packages)

(provide 'jw-package-init)
