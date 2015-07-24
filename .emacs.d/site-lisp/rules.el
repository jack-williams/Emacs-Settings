;; rules.el -- a simple tool for typesetting inference rules in text buffers
;;
;; Benjamin C. Pierce, 1995-1997
;;
;; (Thanks to Martin Hofmann for help in eliminating a few last bugs...
;;  BCP, March 1997)
;;
;; --------------------------------------------------------------------
;; USAGE: 
;;
;; First, add the following (or something similar) to your .emacs file:
;;
;; (add-hook 'text-mode-hook '(lambda ()
;;   (require 'rules)
;;   (local-set-key "\C-c\C-r" 'rules-center-this-infrule)
;; (setq auto-mode-alist (cons '("\\.txt$" . text-mode) auto-mode-alist))
;; 
;; Create a file rules.el containing this elisp code, somewhere in your
;; elisp search path.
;;
;; Now, in any text buffer, write a sloppy inference rule of the form:
;;
;;    premise     premise
;;   ------ (name)
;;    conclusion
;;
;; Press C-c C-r and it turns into this:
;;
;;                         premise     premise
;;                         -------------------                           (name)
;;                              conclusion
;;
;; The format of inference rules is:
;;    [one-line form (axiom)]: 
;;                <any text>  <name>
;;    [long form (rule)]: 
;;                 sequence of lines containing one line of the form
;;                 ------- <name>  
;;                 (i.e. any number of dashes followed by a name).
;; 
;; <name> is either "(any text)" -- including the parens -- or else blank.
;; Rules are separated from their surroundings by blank lines.
;;
;; Typing C-c C-r in a region that does not have one of the above forms
;; will produce a result that may or may not be what you wanted.

(defvar rules-name-column 79)
(defvar rules-max-column 79)

(setq rules-blankline-patt "^[ \C-i\C-l]*$")
(setq rules-oneline-rule-patt "^[ \C-i]*.+[ \C-i]*\\((.*)\\|\\)$")
(setq rules-line-patt "^[ \C-i]*-+[ \C-i]*\\((.*)\\|\\)$")
(setq rules-dashes 
      (concat "---------------------------------------------------------" 
              "---------------------------------------------------------"))

(defun rules-center-this-infrule ()
  (interactive)
  (save-excursion
  (let (rulestart ruleend linestart lineend)
    (if (re-search-backward rules-blankline-patt (point-min) 'nofail)
	(progn (end-of-line) (forward-char 1)))
    (setq rulestart (point-marker))
    (re-search-forward rules-blankline-patt (point-max) 'nofail)
    (setq ruleend (point-marker))
    (goto-char rulestart)
    (if (re-search-forward rules-line-patt ruleend t)
	;; inference rule
	(let ((rule-name (buffer-substring (match-beginning 1) (match-end 1)))
	      (linepos (progn (goto-char (match-beginning 0)) (point-marker)))
	      (maxwidth 0))
	  (delete-region (match-beginning 0) (+ (match-end 0) 1))
	  (goto-char rulestart)
	  (while (and (< (point) (point-max)) (<= (point) ruleend))
	    (re-search-forward "[ \C-i]*") 	   
	    (let ((here (point)))
	      (end-of-line)
	      (re-search-backward "[^ \C-i]")
	      (forward-char 1)
	      (setq maxwidth (max maxwidth (- (point) here) 2))
	      (end-of-line)
              (if (< (point) (point-max))
                  (forward-char 1))))
	  (goto-char linepos)
	  (insert (substring rules-dashes 0 maxwidth) "\n")
	  (backward-char 1)
	  (center-region rulestart ruleend)
	  (insert " ")
	  (if (not (string= rule-name ""))
	      (let ((goal-column 
		     (min (- rules-name-column 1)
			  (- rules-max-column (+ (length rule-name) 1)))))
		(if (< (current-column) goal-column)
		    (indent-to-column goal-column))
		(insert " ")
		(insert rule-name))))
      ;; short rule
      (if (looking-at rules-oneline-rule-patt)
	  ;; short rule with name
	  (progn
	    (let ((rule-name 
		   (buffer-substring (match-beginning 1) (match-end 1))))
	      (delete-region (match-beginning 1) (match-end 1))
	      (center-line) 
	      (end-of-line) 
              (if (not (string= rule-name ""))
                  (progn
                    (insert " ")
                    (let ((goal-column 
                           (min (- rules-name-column 1)
                                (- rules-max-column 
                                   (+ (length rule-name) 1)))))
                      (if (< (current-column) goal-column)
                          (indent-to-column goal-column))
                      (insert " ")
                      (insert rule-name))))))
	;; rule with no name or center divider
	(center-region rulestart ruleend))))))

(provide 'rules)
