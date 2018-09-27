;; -*- no-byte-compile: t; -*-
;;; private/my/packages.el
(disable-packages! cmake-mode company-irony company-irony-c-headers flycheck-irony irony irony-eldoc ivy-rtags rtags)

(package! avy)
(package! lispyville)
(package! lsp-mode)
(package! lsp-ui)
(package! lsp-java)
(package! lsp-ruby)
(package! lsp-python)
(package! dap-mode)
(package! company-lsp)

(package! lsp-rust)

(package! ag)
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
(package! sicp)
(package! lsp-rust)

(package! emacs-cpp-auto-include :recipe (:fetcher github :repo "FirstLoveLife/emacs-cpp-auto-include" :files ("*")))
(package! lsp-racket :recipe (:fetcher github :repo "vishesh/lsp-racket" :files ("*")))
(package! geiser)
(package! pamparam :recipe (:fetcher github :repo "abo-abo/pamparam" :files ("*")))
(package! ccls)
(package! posframe)
