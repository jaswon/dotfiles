(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defvar my-packages
  '(
    color-theme-sanityinc-tomorrow
    paredit
    expand-region
    change-inner
    clojure-mode
    clojure-mode-extra-font-locking
    cider
    rainbow-delimiters
    tagedit
    magit
    exec-path-from-shell
    org))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

(exec-path-from-shell-initialize)

;; modularize
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/customizations")

;; load customizations
(load "ui.el")
(load "qol.el")
(load "setup-org.el")
(load "nav.el")
(load "editing.el")
(load "lisp.el")
(load "setup-clj.el")
(load "setup-js.el")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
