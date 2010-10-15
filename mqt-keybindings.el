;;; .emacs.d/mqt-keybindings.el : Mark Tran <mark@nirv.net>

;; function keys
(global-set-key [(f1)] (lambda ()
                         (interactive)
                         (switch-or-start 'w3m "w3m")))
(global-set-key [(f2)] (lambda ()
                         (interactive)
                         (switch-or-start 'gnus "*Group*")))
(global-set-key [(f3)] (lambda ()
                         (interactive)
                         (erc-tls :server "lambda.nirv.net"
                                  :port 65535
                                  :nick "mqt")))
(global-set-key [(f4)] (lambda ()
                         (interactive)
                         (magit-status default-directory)))
(global-set-key [(f5)] 'replace-regexp)
(global-set-key [(f6)] 'kmacro-end-or-call-macro)
(global-set-key [(f7)] 'bookmark-ido-find-file)
(global-set-key [(f11)] 'ns-toggle-fullscreen)
(global-set-key [(f12)] (lambda ()
                          (interactive)
                          (kill-buffer (current-buffer))))

(global-set-key [(shift f6)] 'kmacro-start-or-end)

;; completion
(global-set-key (kbd "M-/") 'smart-tab)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-S-t") 'ido-goto-symbol)

;; miscellaneous
(global-set-key (kbd "C-;") 'comment-dwim-line)
(global-set-key (kbd "C-c +") 'increment-number-at-point)
(global-set-key (kbd "C-*") 'isearch-yank-symbol)
(global-set-key (kbd "C-t") 'peepopen-goto-file-gui)
(global-set-key (kbd "<C-return>") 'textmate-next-line)
(global-set-key (kbd "M-[") 'textmate-shift-left)
(global-set-key (kbd "M-]") 'textmate-shift-right)

;; window
(global-set-key (kbd "C-x t") 'transpose-windows)
(global-set-key (kbd "C-{") 'windmove-left)
(global-set-key (kbd "C-}") 'windmove-right)
(windmove-default-keybindings)

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C-{") 'windmove-left)
     (define-key paredit-mode-map (kbd "C-}") 'windmove-right)))

(provide 'mqt-keybindings)