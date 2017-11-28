;; theme
(load-theme 'sanityinc-tomorrow-day t)

;; clean ui
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

;; line numbers
(global-linum-mode)

;; font
(set-face-attribute 'default nil :family "GohuFont" :height 160)

;; initial frame
;;(setq initial-frame-alist '((top . 150) (left . 750) (width . 100) (height . 50)))

;; no bell
(setq ring-bell-function 'ignore)
