(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))

(setq use-package-always-ensure t
      use-package-verbose t)
