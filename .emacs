(let ((default-directory "~/.emacs.d/plugin/"))
  (setq load-path (cons default-directory load-path))
  (normal-top-level-add-subdirs-to-load-path))

;zlc
(require 'zlc)

;vimpulse
;require UndoTree
(require 'vimpulse)
(setq viper-case-fold-search t)
(setq viper-search-wrap-around t)

(setq visible-bell nil)
(define-key viper-insert-global-user-map "\C-h" 'delete-backward-char)

; モードラインを強調表示
(setq my-viper-default-face-background (face-background 'mode-line))
(defadvice viper-go-away (after my-viper-go-away-restore activate)
  (set-face-background 'mode-line my-viper-default-face-background))
(defun my-viper-set-mode-line-face ()
  (unless (minibufferp (current-buffer))
    (set-face-background 'mode-line (cdr (assq viper-current-state
        '((vi-state     . "DarkGrey")
          (insert-state . "Yellow3")))))))
(dolist (hook (list
  'viper-vi-state-hook
  'viper-insert-state-hook
  ))(add-hook hook 'my-viper-set-mode-line-face))


(setq make-backup-files nil)
(setq backup-inhibited t)
(setq delete-auto-save-files t)
(menu-bar-mode -1)

