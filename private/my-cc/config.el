;;; my-cc/config.el -*- lexical-binding: t; -*-

(after! cc-mode
  ;; https://github.com/radare/radare2
  (setq c-default-style "bsd")

  (map!
   :map (c-mode-map c++-mode-map)
   (:leader
     :n "=" #'clang-format-region
     )
   (:localleader
     :n "a" #'ccls/references-address
     :n "f" #'ccls/references-not-call
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
  :load-path "~/Downloads/ccls/Release/ccls"
  :init (add-hook! (c-mode c++-mode objc-mode) #'+ccls//enable)
  :config
  ;; overlay is slow
  ;; Use https://github.com/emacs-mirror/emacs/commits/feature/noverlay
  (setq ccls-sem-highlight-method 'font-lock)
  (ccls-use-default-rainbow-sem-highlight)
  ;; https://github.com/maskray/ccls/blob/master/src/config.h
  (setq ccls-extra-init-params '(
          :completion (:detailedLabel t)
          :diagnostics (:frequencyMs 5000)
          :index (:reparseForDependency 1)))

  (with-eval-after-load 'projectile
    (add-to-list 'projectile-globally-ignored-directories ".ccls-cache"))

  (evil-set-initial-state 'ccls-tree-mode 'emacs)
  (set! :company-backend '(c-mode c++-mode objc-mode) 'company-lsp))

(setq ccls-executable "~/Downloads/ccls/Release/ccls")

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
