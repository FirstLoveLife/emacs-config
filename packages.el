;; -*- no-byte-compile: t; -*-
;;; private/my/packages.el
(disable-packages!  company-irony company-irony-c-headers flycheck-irony irony irony-eldoc ivy-rtags rtags)

(package! avy)
(package! yasnippet-classic-snippets)
(package! ag)
(package! anki-editor)
(package! cmake-mode)
(package! flycheck-clang-tidy)
(package! lispyville)
(package! lsp-mode)
(package! exwm)
(package! lsp-ui)
(package! company-lsp)

(package! eshell-autojump)
(package! evil-nerd-commenter)
(package! link-hint)
(package! realgud)
(package! smart-forward)
(package! symbol-overlay)
(package! tldr)

(package! rust-mode)
(package! lsp-rust)

(package! function-args)
(package! lpy :recipe (:fetcher github :repo "abo-abo/lpy" :files ("*")))
(package! aweshell :recipe (:fetcher github :repo "manateelazycat/aweshell" :files ("*")))

(package! auto-save
  :recipe (:fetcher wiki))

(package! yasnippet-snippets)
(disable-packages! irony rtags)
