(require 'diminish)

(diminish 'undo-tree-mode)
(diminish 'visual-line-mode)
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "paredit" '(diminish 'paredit-mode))
(eval-after-load "ruby-electric" '(diminish 'ruby-electric-mode))
