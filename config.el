;; ;; private/my/config.el -*- lexical-binding: t; -*-


(setq doom-localleader-key ";")
(after! cc-mode
  ;; :hook (c++-mode . lispy-mode)
  ;; :init
  ;; (visual-line-mode)
  ;; (display-line-numbers-disable))
  )

(load! "+bindings")
(load! "+org")
(load! "+ui")

(setq doom-scratch-buffer-major-mode 'emacs-lisp-mode)
(def-package! doom-themes
  :init
  ;; (setq doom-theme 'doom-nord-light)
  ;; (setq doom-theme 'doom-opera-light)
  ;; (setq doom-theme 'doom-Iosvkem)
  ;; (setq doom-theme 'doom-peacock)
  ;; (setq doom-theme 'doom-one-light)
  ;; (setq doom-theme 'doom-vibrant)
  (setq doom-theme 'doom-city-lights)
  ;; (setq doom-theme 'doom-challenger-deep)
  ;; (setq doom-theme 'doom-fairy-floss)
  ;; (setq doom-theme 'doom-gruvbox)
  ;; (setq doom-theme 'doom-molokai)
  ;; (setq doom-theme 'doom-nord)
  ;; (setq doom-theme 'doom-opera)
  ;; (setq doom-theme 'doom-outrun-electric)
  ;; (setq doom-theme 'doom-nova)
  ;; (setq doom-theme 'doom-solarized-dark)
  ;; (setq doom-theme 'doom-snazzy)
  ;; (setq doom-theme 'doom-sourcerer)
  ;; (setq doom-theme 'doom-spacegrey)
  ;; (setq doom-theme 'doom-tomorrow-night)
  ;; (setq doom-theme 'doom-tomorrow-day)
  ;; (setq doom-theme 'doom-mono-dark)
  ;; (setq doom-theme 'doom-mono-light)
  ;; (setq doom-theme 'doom-tron)
  ;; (setq doom-theme ')
  ;; (setq doom-theme ')
  ;; (setq doom-theme ')
  ;; (setq doom-theme ')
  ;; (setq doom-theme ')
  ;; (setq doom-theme 'doom-one)
  ;; (setq doom-theme 'doom-solarized-light)
  ;; (setq doom-theme 'doom-dracula)
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
  (global-company-mode)
  (setq company-minimum-prefix-length 2
        company-quickhelp-delay nil
        company-idle-delay 0
        company-show-numbers t
        ))

(def-package! company-lsp
  :after company
  :config
  ;; (add-hook 'java-mode-hook (lambda () (push 'company-lsp company-backends)))
  ;; (push 'java-mode company-global-modes)
  ;; (setq company-transformers nil company-lsp-cache-candidates nil)
  )



(def-package! sml-mode
  :defer t
  :config
  (require 'company-sml)
  (add-hook 'company-sml 'company-sml-setup)
  (set-company-backend! 'sml-mode
    'company-keywords)
  )

(def-package! org-brain
  :defer 0.3
  :init
  (setq org-brain-path "~/brain")
  ;; For Evil users
  (with-eval-after-load 'evil
    (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
  :config
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/.emacs.d/.org-id-locations")
  (push '("b" "Brain" plain (function org-brain-goto-end)
          "* %i%?" :empty-lines 1)
        org-capture-templates)
  (setq org-brain-visualize-default-choices 'all)
  )

(def-package! aweshell
  :defer 1)



(require 'pyim)
(pyim-greatdict-enable)


(def-package! ccls
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp)))
  :config
  (setq ccls-initialization-options
        `(:cache (:directory ,"/home/firstlove/tmp/cclscache")))

  (ccls-use-default-rainbow-sem-highlight)
  (setq ccls-sem-highlight-method 'overlay)
  (setq ccls-executable "~/dev/ccls/build/ccls")
  )


(after! ediff-diff
  (setq-default ediff-forward-word-function 'forward-char))


(after! lsp-mode
  ;; (require 'ra-emacs-lsp)
  ;; (setq rustic-lsp-server 'rust-analyzer)
  )

;; borrowed from the :term term module
(add-hook 'term-mode-hook #'doom-mark-buffer-as-real-h)

(add-to-list 'org-capture-templates
             '("w" "Work-related Task"  entry
               (file "~/org/work.org")
               "* TODO %?" :empty-lines 1))

(require 'org-expiry)
(add-hook 'org-capture-before-finalize-hook
          #'(lambda()
              (save-excursion
                (org-back-to-heading)
                (org-expiry-insert-created))))
(add-hook 'org-insert-heading-hook
          #'(lambda()
              (save-excursion
                (org-back-to-heading)
                (org-expiry-insert-created))))
(require 'ox-mediawiki)

(after! helm-rg
  (setq
   helm-ag-base-command "rg --no-heading"))


;; line numbers in most modes
(remove-hook! '(prog-mode-hook text-mode-hook conf-mode-hook)
           #'display-line-numbers-mode)


(setq lsp-erlang-server-path "/home/firstlove/projects/erlang_ls/_build/default/bin/erlang_ls")

(require 'lsp-python-ms)
