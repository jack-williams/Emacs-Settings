;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org Settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'org)

(defvar jw-org-dir "~/org/")
(defvar jw-org-diary-file (concat jw-org-dir "diary.org"))

(customize-set-value 'org-directory jw-org-dir)
(customize-set-value 'org-agenda-diary-file jw-org-diary-file)
(customize-set-value 'org-agenda-files `(,jw-org-dir))

(setq org-agenda-file-regexp "\\`[^.].*\\.org\\'\\|[0-9]+")
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
