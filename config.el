;;; private/my/config.el -*- lexical-binding: t; -*-



 
(add-to-list 'load-path "/home/firstlove/dev/emacs-cpp-auto-include")
  
(load! "+bindings")
(load! "+org")
(load! "+ui")

(setq doom-scratch-buffer-major-mode 'emacs-lisp-mode)
(after! doom-themes
  :init
  (setq doom-theme 'doom-dracula)
  ;; (setq doom-theme 'doom-tomorrow-day)
  )
  ;; (setq doom-theme 'doom-one))

(def-package! avy
  :commands (avy-goto-char-timer)
  :init
  (setq avy-timeout-seconds 0.2)
  (setq avy-all-windows t)
  (setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?q ?w ?e ?r ?u ?i ?o ?p))
  )

(after! company
  (setq company-minimum-prefix-length 2
        company-quickhelp-delay nil
        company-show-numbers t
        ))

(def-package! company-lsp
  :after company
  :config
  (add-hook 'java-mode-hook (lambda () (push 'company-lsp company-backends)))
  (push 'java-mode company-global-modes)
  (setq company-transformers nil company-lsp-cache-candidates nil)
  )


(after! flycheck
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  )


(def-package! lispy
  :hook ( (emacs-lisp-mode scheme-mode racket-mode) . lispy-mode)
  :config
  (lispy-set-key-theme '(special paredit c-digits))
  (setq lispy-outline "^;; \\(?:;[^#]\\|\\*+\\)"
        lispy-outline-header ";; "
        lispy-ignore-whitespace t))

;; Also use lispyville in prog-mode for [ ] < >
(def-package! lispyville
  :demand t
  :after (evil)
  :hook (lispy-mode . lispyville-mode))

(def-package! lsp-mode
  :defer t
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (setq lsp-project-blacklist '("/CC/"))
  (setq lsp--json-array-use-vector t)
  )

(def-package! lsp-ui
  :demand t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq
   lsp-ui-sideline-enable nil
   lsp-ui-sideline-ignore-duplicate t
   lsp-ui-doc-header nil
   lsp-ui-doc-include-signature nil
   lsp-ui-doc-background (doom-color 'base4)
   lsp-ui-doc-border (doom-color 'fg)

   lsp-ui-peek-force-fontify nil
   lsp-ui-peek-expand-function (lambda (xs) (mapcar #'car xs)))
 )

(setq magit-repository-directories '(("~/dev" . 2)))


;; (def-package! lsp-rust
;;   :init (add-hook 'rust-mode-hook #'lsp-rust-enable))

;; (after! projectile
;;   (setq projectile-require-project-root t)
;;   (setq compilation-read-command nil)  ; no prompt in projectile-compile-project

;;   (projectile-register-project-type 'cmake '("CMakeLists.txt")
;;                                     :configure "cmake %s"
;;                                     :compile "cmake --build Debug"
;;                                     :test "ctest")
;;   )


;; (def-package! eglot
;;   :init
;;   (add-hook 'haskell-mode-hook 'eglot-ensure)
;;   ;; (add-hook 'c++-mode-hook 'eglot-ensure)
;;   ;; (add-hook 'ruby-mode-hook 'eglot-ensure)
;;   ;; (add-hook 'python-mode-hook 'eglot-ensure)
;;   (add-hook 'kotlin-mode-hook 'eglot-ensure))
;; ;; (add-hook 'haskell-mode-hook 'flycheck-mode)
;;                                         ;(add-to-list 'company-backends 'company-ghc)

;;                                         ;(set-company-backend! 'haskell-mode
;;                                         ;  'company-ghc)
;; (set-company-backend! 'emacs-lisp-mode
;;   'company-elisp)
;; (set-company-backend! 'ruby-mode
;;   'company-lsp)

;; ;; (set-company-backend! 'haskell-mode 'company-lsp)
;; ;; (set-company-backend! 'ruby-mode
;; ;;   'company-elisp)

;; ;; (after! haskell-mode
;; ;;   (require 'lsp-ui )
;; ;;   (require 'lsp-haskell)
;; ;;   (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;; ;;   (add-hook 'haskell-mode-hook #'lsp-haskell-enable)
;; ;;   (add-hook 'haskell-mode-hook 'flycheck-mode))


 (def-package! nand2tetris
   :config
   (setq nand2tetris-core-base-dir "~/nand2tetris")
                                         ;(add-to-list 'company-backends 'company-nand2tetris)
   (set-company-backend! 'nand2tetris-mode
     'company-nand2tetris)
   )

;; (add-hook 'java-mode-hook  'lsp-java-enable)

;; (def-package! lsp-ruby
;;   :init
;;   (add-hook 'ruby-mode-hook #'lsp-ruby-enable)
;;   :config
;;   (setq lsp-hover-text-function 'lsp--text-document-signature-help)
;;   )



;; (def-package! lsp-python
;;   :after lsp-mode
;;   :config
;;   (add-hook 'python-mode-hook #'lsp-python-enable)
;;   )


;; (advice-add 'eldoc-display-message-p :override 'my/eldoc-display-message-p)

;; (set-company-backend! 'c++-mode
;;      'company-lsp)
;; (def-package! lsp-racket
;;  :config
;;  :after lsp-mode
;;  (add-hook 'racket-mode-hook #'lsp-racket-enable))


(require 'edit-server)
(edit-server-start)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;; (after! ccls
;;       (map!
;;        :map c++-mode-map
;;        :leader
;        :desc "Include header and format buffer" :nv "ih" (lambda! (my/cpp-auto-include))) )
