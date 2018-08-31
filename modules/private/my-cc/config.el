;;; my-cc/config.el -*- lexical-binding: t; -*-

(after! cc-mode
  ;; https://github.com/radare/radare2
  (setq c-default-style "bsd"))

(def-package! ccls
  :init
;  (add-hook! (c-mode c++-mode objc-mode) #'+ccls//enable)
  (add-hook 'c++-mode-hook
          '(lambda ()
            (require 'company-lsp)
	    (message "hello")
	     (setq company-transformers nil company-lsp-cache-candidates nil)
             (push 'company-lsp company-backends)
	     (company-mode)
	     (require 'lsp-ui)
	     (+ccls//enable)))
  :config
  ;; overlay is slow
  ;; Use https://github.com/emacs-mirror/emacs/commits/feature/noverlay
  (setq ccls-sem-highlight-method 'font-lock)
  (ccls-use-default-rainbow-sem-highlight)
  ;; https://github.com/maskray/ccls/blob/master/src/config.h

  (with-eval-after-load 'projectile
    (add-to-list 'projectile-globally-ignored-directories ".ccls-cache")))

(setq ccls-executable "~/dev/ccls/Release/ccls")

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


 (setq-default c-basic-offset 4
                   tab-width 4
                   )
                   ;indent-tabs-mode t)
(setq c-default-style "bsd"
          c-basic-offset 4)
    (add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))
