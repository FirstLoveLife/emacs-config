;;; private/my-cc/config.el -*- lexical-binding: t; -*-

(after! cc-mode

  (setq c-default-style "bsd")
  (add-to-list 'auto-mode-alist '("\\.inc\\'" . +cc-c-c++-objc-mode))
  )

(def-package! ccls
  :defer t
  :init
  (add-hook! (c-mode c++-mode objc-mode) #'+ccls//enable)
  (setq ccls-executable "~/dev/ccls/Release/ccls")
  :config
  (setq ccls-inheritance-hierarchy nil)
  (setq ccls-sem-highlight-method 'font-lock)
  ;; (setq ccls-sem-highlight-method 'overlay)
  (setq ccls-cache-dir "~/tmp/cclscache")

  ;; (ccls-use-default-rainbow-sem-highlight)
  ;; https://github.com/maskray/ccls/blob/master/src/config.h
  (setq ccls-extra-init-params
        `(:clang (:pathMappings ,+ccls-path-mappings)
                 :completion
                 (
                  :includeBlacklist
                  ("^/usr/(local/)?include/c\\+\\+/[0-9\\.]+/(bits|tr1|tr2|profile|ext|debug)/"
                   "^/usr/(local/)?include/c\\+\\+/v1/"
                   ))
                 :index (:reparseForDependency 1)))

  (with-eval-after-load 'projectile
    (add-to-list 'projectile-globally-ignored-directories ".ccls-cache"))

  (evil-set-initial-state 'ccls-tree-mode 'emacs)
  (set-company-backend! '(c-mode c++-mode objc-mode) 'company-lsp))

(def-package! cpp-auto-include
  :load-path "/home/firstlove/dev/emacs-cpp-auto-include")
