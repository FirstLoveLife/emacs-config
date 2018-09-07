(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:font "-*-Iosevka-*-*-*-*-18-*-*-*-*-*-*-*"))))
 '(font-lock-constant-face ((t (:foreground "#C792EA"))))
 '(font-lock-keyword-face ((t (:foreground "#2BA3FF" :slant italic))))
 '(font-lock-preprocessor-face ((t (:inherit bold :foreground "#2BA3FF" :slant italic :weight normal))))
 '(font-lock-string-face ((t (:foreground "#C3E88D"))))
 '(font-lock-type-face ((t (:foreground "#FFCB6B"))))
 '(font-lock-variable-name-face ((t (:foreground "#FF5370")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-all-windows (quote all-frames))
 '(avy-background t)
 '(avy-timeout-seconds 0.2)
 '(c-basic-offset 4)
 '(cmake-tab-width 4)
 '(company-auto-complete t)
 '(company-auto-complete-chars (quote (41 46)))
 '(company-backends
   (quote
    (company-elisp company-keywords company-capf company-dabbrev-code company-files company-ghc company-nand2tetris)))
 '(company-frontends
   (quote
    (company-pseudo-tooltip-frontend company-echo-frontend)))
 '(company-global-modes t)
 '(custom-safe-themes
   (quote
    ("cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "086970da368bb95e42fd4ddac3149e84ce5f165e90dfc6ce6baceae30cf581ef" default)))
 '(default-input-method "pyim")
 '(display-line-numbers-width nil)
 '(global-visual-line-mode t)
 '(line-number-mode nil)
 '(lsp-ui-doc-header t)
 '(lsp-ui-doc-include-signature t)
 '(lsp-ui-peek-always-show t)
 '(lsp-ui-sideline-enable t)
 '(nand2tetris-core-base-dir "~/backup/nand2tetris/")
 '(nand2tetris-tools-dir "~/backup/nand2tetris/tools/")
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
    (+version-control|git-gutter-maybe hl-todo-mode yas-minor-mode-on hl-line-mode highlight-escape-sequences-mode highlight-numbers-mode vi-tilde-fringe-mode)))
 '(scheme-program-name "scheme"))
