;; -*- no-byte-compile: t; -*-
;;; private/my/packages.el
(disable-packages! cmake-mode company-irony company-irony-c-headers flycheck-irony irony irony-eldoc ivy-rtags rtags)

(package! avy)
(package! atomic-chrome)
(package! lispyville)
(package! lsp-mode)
(package! lsp-ui)
(package! lsp-java)
(package! lsp-ruby)
(package! lsp-python)
(package! dap-mode)
(package! company-lsp)

(package! eshell-autojump)
(package! evil-nerd-commenter)
(package! link-hint)
(package! smart-forward)
(package! symbol-overlay)
(package! tldr)

(package! rust-mode)
(package! lsp-rust)

(package! function-args)
(package! lpy :recipe (:fetcher github :repo "abo-abo/lpy" :files ("*")))

(disable-packages! company-prescient)







(package! ag)
(package! anki-editor)
(package! cmake-mode)
(package! eglot)
(package! flycheck-clang-tidy)
(package! lsp-mode)
(package! flycheck-clang-analyzer)
(package! lsp-ui)
(package! lsp-haskell)
(package! kotlin-mode)
(package! company-lsp)
(package! company-ghc)
(package! nand2tetris :recipe (:fetcher github :repo "FirstLoveLife/nand2tetris.el" :files ("*")))
(package! company-nand2tetris)
(package! nand2tetris-assembler)
(package! link-hint)
(package! sicp)
(package! lsp-rust)

(package! function-args)
(package! lpy :recipe (:fetcher github :repo "abo-abo/lpy" :files ("*")))
(package! aweshell :recipe (:fetcher github :repo "manateelazycat/aweshell" :files ("*")))
(package! netease-music :recipe (:fetcher github :repo "nicehiro/netease-music" :files ("*")))

(package! emacs-cpp-auto-include :recipe (:fetcher github :repo "FirstLoveLife/emacs-cpp-auto-include" :files ("*")))

;(package! pyim-greatdict :recipe (:repo "tumashu/pyim-greatdict" :fetcher github :files ("*")))
(package! company)
;(package! eaf :recipe (:repo "manateelazycat/emacs-application-framework" :fetcher github :files ("*")))
(package! ccls)
(package! multi-term)
(package! posframe)
(package! pyim)
(package! pyim-basedict)
;; (package! yasnippet-classic-snippets)
;; (package! yasnippet-snippets)
(disable-packages! irony eww rtags)
