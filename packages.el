;; -*- no-byte-compile: t; -*-
;;; private/my/packages.el

(package!  aweshell :recipe (:host github :repo "manateelazycat/aweshell" :files ("*")))

;; (package! evil-matchit :recipe (:host github :repo "redguardtoo/evil-matchit" :commit "7d65b4167b1f0086c2b42b3aec805e47a0d355c4"))


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

(package! flymake-sml :recipe (:host github :repo "oskimura/flymake-sml" :files ("*")))

(package! flycheck)
(package! pyim-greatdict :recipe (:host github :repo "tumashu/pyim-greatdict" :files ("*")))

(package! company-sml :recipe (:host github :repo "nverno/company-sml" :files ("*")))

(package! rmsbolt
	  :recipe
 (:files (:defaults "starters")
         :host gitlab
         :repo "jgkamat/rmsbolt"))

(package! exwm)
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
;(package! emacs-snippets)
(package! cquery)
(package! gnuplot)


(package! emacs-racer :recipe (:host github :repo "racer-rust/emacs-racer" :files ("*")))
(package! rustic :recipe (:host github :repo "brotzeit/rustic" :files ("*")))


(package! lsp-java)

(package! edit-server)

(package! ob-ipython)

(package! mediawiki)
(package! magit-todos :disable t)

(package! alert)
(package! hydra)

(package! dts-mode)


(package! rust-analyzer :recipe (:host github :repo "rust-analyzer/rust-analyzer" :files ("editors/emacs/ra-emacs-lsp.el")))

(package! adoc-mode)

(package! ox-mediawiki)

(package! pandoc)

(package! ox-pandoc)

(package! erlang)



  (package! lsp-python-ms)
