;;;;
;; org mode
;;;;

(require 'org)

;; indented outline
(setq org-startup-indented t)


(load "texmathp.el")
(load "cdlatex.el")
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
