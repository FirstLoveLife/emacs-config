;;; private/my-cc/config.el -*- lexical-binding: t; -*-

(after! cc-mode

  ;; (setq c-default-style "bsd")
  (lsp)
  (add-to-list 'auto-mode-alist '("\\.inc\\'" . +cc-c-c++-objc-mode))
  (add-hook 'c-mode-common-hook
            (lambda ()
              ;; TODO work around https://github.com/hlissner/doom-emacs/issues/1006
              ;; (when (and buffer-file-name (string-match-p "binutils\\|glibc" buffer-file-name))
              ;;   (setq tab-width 8)
              ;;   (c-set-style "gnu"))
              ;; (setq flymake-diagnostic-functions '(lsp--flymake-backend t))
              (modify-syntax-entry ?_ "w")
              ))

  )


(def-package! ccls
  :init
  (add-hook! (c-mode c++-mode cuda-mode objc-mode) #'+ccls//enable)
  (setq ccls-executable "~/dev/ccls/Release/ccls")
  :config
  ;; overlay is slow
  ;; Use https://github.com/emacs-mirror/emacs/commits/feature/noverlay
  ;; (setq ccls-sem-highlight-method 'font-lock)
  ;; (add-hook 'lsp-after-open-hook #'ccls-code-lens-mode)
  ;; (ccls-use-default-rainbow-sem-highlight)
  ;; (setq ccls-initialization-options )
  ;; https://github.com/maskray/ccls/blob/master/src/config.h
  (setq
   ccls-initialization-options
   `(
     :cacheDirectory "/home/firstlove/tmp/cclscache"
     )
   )

  (evil-set-initial-state 'ccls-tree-mode 'emacs)
  (set-company-backend! '(c-mode c++-mode cuda-mode objc-mode) 'company-lsp)
  )


;; (def-package! cpp-auto-include
;;   :load-path "/home/firstlove/dev/emacs-cpp-auto-include")

;; :cacheDirectory ("~/tmp/cclscache")
