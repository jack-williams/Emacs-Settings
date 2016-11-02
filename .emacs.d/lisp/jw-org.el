;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org Settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar jw-org-dir "~/org")

(customize-set-value 'org-directory jw-org-dir)
(customize-set-value 'org-agenda-files `(,jw-org-dir))
(customize-set-value 'calendar-mark-diary-entries-flag t)
(setq org-agenda-file-regexp "\\`[^.].*\\.org\\'\\|[0-9]+")
(setq org-capture-templates
      '(("t" "TODO" entry (file+headline "~/org/gtd.org" "Tasks")
         "* TODO %?\n  %i\n")))
(org-toggle-sticky-agenda 1)

(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)

(provide 'jw-org)
