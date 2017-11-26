;;;;
;; javascript
;;;;

(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-hook 'js-mode-hook 'subword-mode)
(add-hook 'html-mode-hook 'subword-mode)

;; indent level
(setq js-indent-level 2)

