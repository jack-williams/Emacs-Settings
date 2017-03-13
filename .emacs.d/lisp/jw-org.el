;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org Settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'org)

(defvar jw-org-dir "~/org")
(defvar jw-notes-dir "~/notes")
(defvar jw-org-diary-file (concat jw-org-dir "diary.org"))

(defun sa-find-org-file-recursively (&optional directory filext)
  "Return .org and .org_archive files recursively from DIRECTORY.
If FILEXT is provided, return files with extension FILEXT instead."
  (interactive "DDirectory: ")
  (let* (org-file-list
	 (case-fold-search t)	      ; filesystems are case sensitive
	 (file-name-regex "^[^.#].*") ; exclude dot, autosave, and backup files
	 (filext (or filext "org$\\\|org_archive"))
	 (fileregex (format "%s\\.\\(%s$\\)" file-name-regex filext))
	 (cur-dir-list (directory-files directory t file-name-regex)))
    ;; loop over directory listing
    (dolist (file-or-dir cur-dir-list org-file-list) ; returns org-file-list
      (cond
       ((file-regular-p file-or-dir) ; regular files
	(if (string-match fileregex file-or-dir) ; org files
	    (add-to-list 'org-file-list file-or-dir)))
       ((file-directory-p file-or-dir)
	(dolist (org-file (sa-find-org-file-recursively file-or-dir filext)
			  org-file-list) ; add files found to result
          (add-to-list 'org-file-list org-file)))))))

(customize-set-value 'org-directory jw-org-dir)
(customize-set-value 'org-agenda-diary-file jw-org-diary-file)
(customize-set-value 'org-agenda-files
                     (append (sa-find-org-file-recursively jw-org-dir)
                             (sa-find-org-file-recursively jw-notes-dir)))
(customize-set-value 'org-use-tag-inheritance nil)

(require 'org-bullets)
(customize-set-value
 'org-bullets-bullet-list
 '(;;; Large
   "●"
   "●"
   "○"
   "○"
   "○"
   ;; ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶
    ;;; Small
   ;; ► • ★ ▸
   ))
(add-hook 'org-mode-hook
          (lambda ()
            (progn
              (org-indent-mode 1)
              (flyspell-mode)
              (org-bullets-mode 1))))



;;(setq org-agenda-file-regexp "\\`[^.].*\\.org\\'\\|[0-9]+")
(setq org-capture-templates
      '(("t" "TODO" entry (file+headline "~/org/gtd.org" "Tasks")
         "* TODO %?\n  %i\n")
        ("d" "Diary - Date" entry (file+datetree+prompt jw-org-diary-file)
         "* %?\n  %i %t\n" :kill-buffer t)
        ("e" "Diary - Event" entry (file+datetree+prompt jw-org-diary-file)
         "* %?\n  %i %T\n" :kill-buffer t)
        ))

(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)

(provide 'jw-org)
