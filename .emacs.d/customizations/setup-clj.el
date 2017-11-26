;;;;
;; Clojure
;;;;

;; paredit
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; subword
(add-hook 'clojure-mode-hook 'subword-mode)

;; more syntax highlighting
(require 'clojure-mode-extra-font-locking)

;; REPL buffer on connect
(setq cider-repl-pop-to-buffer-on-connect t)
