;; -*- no-byte-compile: t; -*-
;;; private/my/packages.el
(disable-packages! cmake-mode company-irony company-irony-c-headers flycheck-irony irony irony-eldoc ivy-rtags rtags)

(package! avy)
(package! lispyville)
(package! lsp-java)
(package! lsp-ruby)
(package! lsp-python)
(package! dap-mode)
(package! company-lsp)
(package! clang-format)

(package! lsp-rust)
(package! edit-server)
(package! ag)
(package! sml-mode)
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
(package! spinner)

(package! nand2tetris :recipe (:fetcher github :repo "FirstLoveLife/nand2tetris.el" :files ("*")))
(package! flymake-sml :recipe (:fetcher github :repo "oskimura/flymake-sml" :files ("*")))

(package! company-sml :recipe (:fetcher github :repo "nverno/company-sml" :files ("*")))

(package! rmsbolt
	  :recipe
  (:files (:defaults "starters")
          :fetcher gitlab
          :repo "jgkamat/rmsbolt"))

(package! company-nand2tetris)
(package! nand2tetris-assembler)
(package! exwm)
(package! sicp)
(package! lsp-rust)

(package! lsp-racket :recipe (:fetcher github :repo "vishesh/lsp-racket" :files ("*")))
(package! pamparam :recipe (:fetcher github :repo "abo-abo/pamparam" :files ("*")))
(package! helm-rg)
(package! ccls)
(package! posframe)
