;; yes/no -> y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; backup files in tmp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; remap cmd to M-
(setq mac-command-modifier 'meta) 

;; insert newline on previous line
(global-set-key (kbd "<C-return>") 
		(lambda () (interactive)
		  (move-end-of-line -0)
		  (newline)))
