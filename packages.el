;;; ~/.config/doom/packages.el

;; `doom-snippets' *is* my personal snippets library (in $DOOMDIR/snippets)
;; (package! doom-snippets :disable t)

;; I never use it.
;; (package! which-key :disable t)

;; For personal modeline
(package! anzu)
(package! evil-anzu)
(package! posframe)

(package! liberime-config
  :recipe
  (
   :host github
   :repo "merrickluo/liberime"
   :files ("CMakeLists.txt" "Makefile" "src" "*.el")))

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
(package! nov)
(package! shr-tag-pre-highlight)

(package! notdeft
  :recipe
  (
   :host github
   :repo "hasu/notdeft"
   :branch "xapian"
   :files ("xapian" "*.el")))


(package! cmake-mode)
(package! anki-editor)

(package! irony :disable t)
(package! mediawiki)
(package! kconfig-mode)
(package! dts-mode)
(package! ccls)


(unpin! apel)
(package! apel :recipe (:branch "lexical-binding") :pin "414dc330cc8327fdaf6aeb5234e9fafdd69964ca")
