;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Interface Configuration
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(column-number-mode t)
(line-number-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Add this since I've hidden menu bar on OSX
(display-time-mode t)

;; Powerline
(powerline-default-theme)
(customize-set-value 'powerline-default-separator 'utf-8)
(customize-set-value 'moe-theme-mode-line-color 'w/b)
(customize-set-value 'powerline-display-buffer-size nil) 
(customize-set-value 'powerline-display-mule-info nil)
(customize-set-value 'powerline-display-hud nil)

;;; Modeline
(customize-set-value 'display-time-default-load-average nil)
(setq solarized-high-contrast-mode-line t)
(setq solarized-distinct-fringe-background t)

(load-theme 'solarized-dark t)


(provide 'jw-ui)
