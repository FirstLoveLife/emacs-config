                                        ;-*- lexical-binding: t; -*-
;; (map!
;;  (
;;   :map general-override-mode-map
;;   ;; :prefix uos/leader
;;   ;; (
;;   ;;  (:prefix ("e" . "eaf")
;;   ;;    :n "b" #'eaf-open-browser
;;   ;;    :n "h" #'eaf-open-browser-with-history
;;   ;;    :n "c" #'eaf-open-camera
;;   ;;    :n "t" #'eaf-open-terminal)
;;   ;;  :n "s" #'evil-snipe-s)
;;   ))

(use-package! eaf
  :defer t
  :init
      (use-package epc :defer t :ensure t)
      (use-package ctable :defer t :ensure t)
      (use-package deferred :defer t :ensure t)
      (use-package s :defer t :ensure t)
  :custom
  (eaf-find-alternate-file-in-dired t)
  :config
  (setq eaf-proxy-type "http")
  (eaf-setq eaf-browser-default-zoom "2")
  ;; (eaf-setq eaf-browser-dark-mode "true")
  (add-to-list 'evil-emacs-state-modes 'eaf-mode)
  (setq eaf-proxy-host "127.0.0.1")
  (setq eaf-proxy-port "8889")
  (eaf-bind-key scroll_up "RET" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down_page "DEL" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding))
