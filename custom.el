(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ccls-sem-global-variable-face ((t (:underline t :weight extra-bold))))
 '(fixed-pitch ((t (:font "-*-Iosevka-*-*-*-*-18-*-*-*-*-*-*-*"))))
 '(flycheck-error ((t (:underline "#ff6c6b"))))
 '(flymake-error ((t (:underline "#ff6c6b"))))
 '(flymake-warning ((t (:underline "#da8548"))))
 '(font-lock-constant-face ((t (:foreground "#C792EA"))))
 '(font-lock-keyword-face ((t (:foreground "#2BA3FF" :slant italic))))
 '(font-lock-preprocessor-face ((t (:inherit bold :foreground "#2BA3FF" :slant italic :weight normal))))
 '(font-lock-string-face ((t (:foreground "#C3E88D"))))
 '(font-lock-type-face ((t (:foreground "#FFCB6B"))))
 '(font-lock-variable-name-face ((t (:foreground "#FF5370"))))
 '(lsp-face-highlight-read ((t (:background "sea green"))))
 '(lsp-face-highlight-write ((t (:background "brown4"))))
 '(lsp-ui-sideline-current-symbol ((t (:foreground "grey38" :box nil))))
 '(lsp-ui-sideline-symbol ((t (:foreground "grey30" :box nil)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(ccls-member-hierarchy-qualified t)
 '(company-global-modes t)
 '(dtrt-indent-verbosity 0)
 '(electric-indent-mode t)
 '(global-company-mode t)
 '(global-visual-line-mode t)
 '(helm-M-x-fuzzy-match t)
 '(helm-apropos-fuzzy-match t)
 '(helm-autoresize-mode t)
 '(helm-bookmark-show-location t)
 '(helm-buffers-fuzzy-matching t)
 '(helm-candidate-number-limit 50)
 '(helm-completion-in-region-fuzzy-match t)
 '(helm-dash-browser-func (quote eww) t)
 '(helm-dash-enable-debugging nil t)
 '(helm-default-prompt-display-function (quote +helm--set-prompt-display))
 '(helm-display-buffer-default-height 0.25)
 '(helm-display-header-line nil)
 '(helm-ff-lynx-style-map nil)
 '(helm-file-cache-fuzzy-match t)
 '(helm-flx-for-helm-locate t)
 '(helm-flx-mode t)
 '(helm-fuzzy-matching-highlight-fn (quote helm-flx-fuzzy-highlight-match))
 '(helm-fuzzy-sort-fn (quote helm-flx-fuzzy-matching-sort))
 '(helm-lisp-fuzzy-completion t)
 '(helm-locate-fuzzy-match t)
 '(helm-locate-fuzzy-sort-fn (quote helm-flx-helm-locate-fuzzy-sort-fn))
 '(helm-mode t)
 '(helm-mode-fuzzy-match t)
 '(helm-mode-handle-completion-in-region nil)
 '(helm-projectile-fuzzy-match t)
 '(helm-recentf-fuzzy-match t)
 '(indent-tabs-mode nil)
 '(lsp-ui-doc-header t)
 '(lsp-ui-doc-include-signature t)
 '(lsp-ui-doc-max-height 80)
 '(lsp-ui-sideline-enable t)
 '(org-babel-load-languages (quote ((java . t) (emacs-lisp . t))))
 '(org-structure-template-alist
   (quote
    (("sc" "#+BEGIN_SRC C++ :flags \"-Werror -Wall -Wextra -pedantic -std=c++17\"
?
#+END_SRC")
     ("n" "#+BEGIN_NOTES
?
#+END_NOTES")
     ("s" "#+BEGIN_SRC ?

#+END_SRC")
     ("e" "#+BEGIN_EXAMPLE
?
#+END_EXAMPLE")
     ("q" "#+BEGIN_QUOTE
?
#+END_QUOTE")
     ("v" "#+BEGIN_VERSE
?
#+END_VERSE")
     ("V" "#+BEGIN_VERBATIM
?
#+END_VERBATIM")
     ("c" "#+BEGIN_CENTER
?
#+END_CENTER")
     ("C" "#+BEGIN_COMMENT
?
#+END_COMMENT")
     ("l" "#+BEGIN_EXPORT latex
?
#+END_EXPORT")
     ("L" "#+LaTeX: ")
     ("h" "#+BEGIN_EXPORT html
?
#+END_EXPORT")
     ("H" "#+HTML: ")
     ("a" "#+BEGIN_EXPORT ascii
?
#+END_EXPORT")
     ("A" "#+ASCII: ")
     ("i" "#+INDEX: ?")
     ("I" "#+INCLUDE: %file ?"))))
 '(prog-mode-hook
   (quote
    (hl-todo-mode yas-minor-mode-on highlight-escape-sequences-mode highlight-numbers-mode flycheck-mode)))
 '(projectile-dynamic-mode-line nil)
 '(projectile-enable-caching t)
 '(projectile-git-command "git ls-files")
 '(projectile-git-ignored-command "git check-ignore * .*")
 '(projectile-globally-ignored-directories
   (quote
    (".attach" ".ccls-cache" ".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "~/.emacs.d/.local/" ".sync" "node_modules" "flow-typed" "Release" "clang_archive_hashes" "cmake" "third_party" "~/.emacs.d/.local/" ".sync" "node_modules" "flow-typed" "~/.emacs.d/.local/" ".sync" "node_modules" "flow-typed" "doc")))
 '(projectile-globally-ignored-file-suffixes (quote (".elc" ".pyc" ".o" ".projectile")))
 '(projectile-globally-ignored-files (quote (".DS_Store" "Icon" "TAGS")))
 '(projectile-globally-unignored-directories (quote ("src")))
 '(projectile-indexing-method (quote alien))
 '(projectile-mode t nil (projectile))
 '(projectile-require-project-root t)
 '(projectile-switch-project-action (quote +workspaces|set-project-action))
 '(sml-font-lock-symbols t))
