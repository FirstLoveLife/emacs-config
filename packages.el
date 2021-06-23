;;; ~/.config/doom/packages.el

;; `doom-snippets' *is* my personal snippets library (in $DOOMDIR/snippets)
;; (package! doom-snippets :disable t)

;; I never use it.
;; (package! which-key :disable t)

;; For personal modeline
(package! anzu)
(package! evil-anzu)
(package! posframe)

;; (package! awesome-tab
;;   :recipe
;;   (
;;    :host github
;;    :repo "manateelazycat/awesome-tab"))

;; (package! snails
;;   :recipe
;;   (
;;    :host github
;;    :repo "manateelazycat/snails"
;;    :no-byte-compile t
;;    :files ("*")
;;    ))

;; (package! awesomeshell
;;   :recipe
;;   (
;;    :host github
;;    :no-byte-compile t
;;    :repo "manateelazycat/aweshell"))

(package! lsp-mode)
(package! lsp-ui)
(package! ox-mediawiki)
;; (package! mediawiki)
(package! shimbun)
(package! wanderlust)
(package! w3m)
(package! lsp-docker)
;; (package! nov)
;; XXX: fatal: dumb http transport does not support shallow capabilities, full depth can fix this.
(package! nov
  :recipe (:host nil :repo "https://depp.brause.cc/nov.el.git" :depth full))


(package! shr-tag-pre-highlight)

(package! notdeft
  :recipe
  (
   :host github
   :repo "hasu/notdeft"
   :files ("xapian" "*.el")))


(package! cmake-mode)
(package! anki-editor)

(package! irony :disable t)
(package! mediawiki)
(package! kconfig-mode)
(package! dts-mode)
(package! ccls)
(package! fcitx)


(unpin! apel)
(package! apel :recipe (:branch "lexical-binding") :pin "414dc330cc8327fdaf6aeb5234e9fafdd69964ca")
(package! org-mime)
(package! wanderlust)
(package! flim)
(package! semi)
(package! shr)
(package! shr-tag-pre-highlight)

(unpin! t)

(package! shrface)
(package! adoc-mode)
(package! journalctl-mode)
