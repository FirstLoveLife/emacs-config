;;; config/dotfiles/config.el -*- lexical-binding: t; -*-

(defun dotfiles-hook ()
  "If the current buffer is '~/.dotfiles.org' the code-blocks are
       tangled."
  (when (equal (buffer-file-name)
               (expand-file-name (concat doom-private-dir
                                         "/README.org")))
    (org-babel-tangle)))

(add-hook 'after-save-hook 'dotfiles-hook)

