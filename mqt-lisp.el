;;; -*- Mode: Emacs-Lisp; -*-

;;; .emacs.d/mqt-lisp.el : Mark Tran <mark@nirv.net>

;; eldoc
(dolist (hook '(emacs-lisp-mode-hook
                lisp-interaction-mode-hook))
  (add-hook hook 'turn-on-eldoc-mode))

;; paredit
(autoload 'paredit-mode "paredit-beta" nil t)

(eldoc-add-command 'paredit-backward-delete
                   'paredit-close-round)

(dolist (hook '(emacs-lisp-mode-hook
                lisp-mode-hook
                scheme-mode-hook
                slime-repl-mode-hook))
  (add-hook hook 'paredit-mode))

;; slime (generate preloaded core: "./clbuild dumpcore slime cl-ppcre tilde")
(add-to-list 'load-path "~/lib/lisp/clbuild/source/slime/")
(add-to-list 'load-path "~/lib/lisp/clbuild/source/slime/contrib/")

(require 'slime-autoloads)

(set-language-environment "UTF-8")
(setq default-enable-multibyte-characters t
      inferior-lisp-program
"~/lib/lisp/clbuild/clbuild --implementation sbcl preloaded"
      slime-backend "~/lib/lisp/clbuild/.swank-loader.lisp"
      slime-net-coding-system 'utf-8-unix)
(eval-after-load 'slime
  '(progn
     (slime-setup
      '(slime-repl
        slime-asdf
        slime-autodoc
        slime-fancy
        slime-references
        slime-scratch
        slime-tramp))

     (setq slime-complete-symbol*-fancy t
           slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

     (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
     (define-key slime-mode-map (kbd "C-c TAB") 'slime-complete-form)))

(add-hook 'lisp-mode-hook (lambda ()
                            (cond ((not (featurep 'slime))
                                   (require 'slime)
                                   (normal-mode)))))

;; redshank
(require 'redshank-loader
"~/lib/lisp/clbuild/source/redshank/redshank-loader.el")

(eval-after-load "redshank-loader"
  '(redshank-setup '(lisp-mode-hook
                     slime-repl-mode-hook) t))

;; scheme
(autoload 'quack-scheme-mode-hookfunc "quack")
(autoload 'quack-inferior-scheme-mode-hookfunc "quack")

(eval-after-load 'quack
  '(setq quack-default-program "mzscheme -i -l errortrace"
         quack-fontify-style 'emacs
         quack-global-menu-p nil
         quack-remap-find-file-bindings-p nil
         quack-run-scheme-always-prompts-p nil
         quack-run-scheme-prompt-defaults-to-last-p t
         quack-tabs-are-evil-p t))

(add-hook 'scheme-mode-hook 'quack-scheme-mode-hookfunc)
(add-hook 'inferior-scheme-mode-hook 'quack-inferior-scheme-mode-hookfunc)

(provide 'mqt-lisp)
