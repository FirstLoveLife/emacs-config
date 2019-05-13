;;; private/my/+ui.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Iosevka" :size 18))
(setq doom-big-font (font-spec :family "Iosevka" :size 27))
(remove-hook 'doom-init-ui-hook #'blink-cursor-mode)

;; (setq doom-theme 'doom-nord)
