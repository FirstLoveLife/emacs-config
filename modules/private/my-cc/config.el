;;; private/my-cc/config.el -*- lexical-binding: t; -*-

(after! cc-mode

  (setq c-default-style "bsd")
  (add-to-list 'auto-mode-alist '("\\.inc\\'" . +cc-c-c++-objc-mode))

  (map!
   :map (c-mode-map c++-mode-map)
   :n "C-h" (λ! (ccls-navigate "U"))
   :n "C-j" (λ! (ccls-navigate "R"))
   :n "C-k" (λ! (ccls-navigate "L"))
   :n "C-l" (λ! (ccls-navigate "D"))
   (:localleader
     :n "a" #'ccls/references-address
     :n "c" #'ccls/callers
     :n "f" #'ccls/references-not-call
     :n "lp" #'ccls-preprocess-file
     :n "lf" #'ccls-reload
     :n "m" #'ccls/references-macro
     :n "r" #'ccls/references-read
     :n "w" #'ccls/references-write
     :desc "breakpoint"
     :n "db" (lambda ()
               (interactive)
               (evil-open-above 1)
               (insert "volatile static int z=0;while(!z)asm(\"pause\");")
               (evil-normal-state))))
  )

(def-package! clang-format
  :commands (clang-format-region)
  )

(def-package! ccls
  :defer t
  :init
  (add-hook! (c-mode c++-mode objc-mode) #'+ccls//enable)
  (setq ccls-executable "~/dev/ccls/Release/ccls")
  :config
  ;; overlay is slow
  ;; Use https://github.com/emacs-mirror/emacs/commits/feature/noverlay
  ;; (setq ccls-sem-highlight-method 'font-lock)
  (setq ccls-sem-highlight-method 'overlay)
  (ccls-use-default-rainbow-sem-highlight)
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
  (set-company-backend! '(c-mode c++-mode objc-mode) 'company-lsp)
  )
