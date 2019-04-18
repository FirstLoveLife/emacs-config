;; -*- no-byte-compile: t; -*-
;;; private/my/packages.el

(package!  aweshell :recipe (:fetcher github :repo "manateelazycat/aweshell" :files ("*")))

;; (package! evil-matchit :recipe (:fetcher github :repo "redguardtoo/evil-matchit" :commit "7d65b4167b1f0086c2b42b3aec805e47a0d355c4"))


(package! avy)
;; (package! lispyville)
(package! pamparam)
(package! company-lsp)
(package! clang-format)

(package! sml-mode)
(package! cmake-mode)
(package! eglot)
(package! lsp-mode)
(package! lsp-ui)
(package! lsp-haskell)
(package! kotlin-mode)
(package! company-lsp)
(package! spinner)
(package! org-brain)
(package! ivy)

;; (package! nand2tetris :recipe (:fetcher github :repo "FirstLoveLife/nand2tetris.el" :files ("*")))
(package! flymake-sml :recipe (:fetcher github :repo "oskimura/flymake-sml" :files ("*")))

(package! flycheck)
(package! pyim-greatdict :recipe (:fetcher github :repo "tumashu/pyim-greatdict" :files ("*")))

(package! company-sml :recipe (:fetcher github :repo "nverno/company-sml" :files ("*")))

;(package! rmsbolt
;	  :recipe
;  (:files (:defaults "starters")
;          :fetcher gitlab
;          :repo "jgkamat/rmsbolt"))

;(package! exwm)
(package! sicp)

(package! helm-rg)
(package! google-translate)
(package! ccls)
(package! posframe)


(package! org-ref)
(package! adoc-mode)
(package! pyim)
(package! pyim-basedict)

(package! anki-editor)
(package! rust-mode)
(package! cargo)
(package! flycheck-rust)
(package! emacs-snippets)
(package! cquery)
(package! gnuplot)


(package! emacs-racer :recipe (:fetcher github :repo "racer-rust/emacs-racer" :files ("*")))
(package! rustic :recipe (:fetcher github :repo "brotzeit/rustic" :files ("*")))

(package! lsp-rust :recipe (:fetcher github :repo "sethm/lsp-rust" :files ("*")))

(package! lsp-java)

(package! edit-server)

(package! ob-ipython)
