;;; -*- Mode: Emacs-Lisp; -*-

;;; .emacs.d/mqt-keybindings.el : Mark Tran <mark@nirv.net>

;; function keys
(global-set-key [(f1)] (lambda ()
                              (interactive) 
                              (switch-or-start 'w3m "w3m")))
(global-set-key [(f2)] (lambda () 
                              (interactive) 
                              (switch-or-start 'gnus "*Group*")))
(global-set-key [(f3)] '(lambda () 
                                (interactive) 
                                (erc-tls :server "lambda.nirv.net"
                                         :port 65535
                                         :nick "mqt")))
(global-set-key [(f4)] 'replace-regexp)
(global-set-key [(f5)] 'switch-to-scratch-or-previous)
(global-set-key [(f6)] 'kmacro-end-or-call-macro)
(global-set-key [(f12)] '(lambda () 
                                (interactive) 
                                (magit-status default-directory)))

(global-set-key [(shift f6)] 'kmacro-start-or-end)
(global-set-key [(shift f12)] '(lambda () 
                                      (interactive) 
                                      (kill-buffer (current-buffer))))

;; miscellaneous
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-l") 'goto-line)

(global-set-key (kbd "C-/") 'comment-dwim-line)
(global-set-key (kbd "M-;") 'comment-dwim-line)

(global-set-key (kbd "C-c C-c") 'copy-line)
(global-set-key (kbd "C-c i") 'increment-number-at-point)

(global-set-key (kbd "C-t") 'ido-switch-buffer)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-S-t") 'ido-goto-symbol)

(global-set-key (kbd "M-<tab>") 'smart-tab)
(global-set-key (kbd "M-/") 'hippie-expand)

;; window movement
(global-set-key [C-left] 'windmove-left)
(global-set-key [C-right] 'windmove-right)
(global-set-key [C-up] 'windmove-up)
(global-set-key [C-down] 'windmove-down)

(provide 'mqt-keybindings)
