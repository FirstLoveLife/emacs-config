;; -*- no-byte-compile: t; -*-
;;; private/eaf/packages.el

(package! eaf
  :recipe
  (
   :host github
   :repo "manateelazycat/emacs-application-framework"
   :files ("*") ))

(package! epc)
