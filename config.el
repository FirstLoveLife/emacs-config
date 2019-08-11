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
;; (load! "+ui")

(setq doom-scratch-buffer-major-mode 'emacs-lisp-mode)
(def-package! doom-themes
  :init
  ;; (setq doom-theme 'doom-nord-light)
  ;; (setq doom-theme 'doom-opera-light)
  ;; (setq doom-theme 'doom-Iosvkem)
  ;; (setq doom-theme 'doom-peacock)
  ;; (setq doom-theme 'doom-one-light)
  ;; (setq doom-theme 'doom-vibrant)
  ;; (setq doom-theme 'doom-city-lights)
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
  (setq doom-theme 'doom-one)
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


;; (after! flycheck
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
;;   )

;; (def-package! lispy
;;   :hook ( (emacs-lisp-mode scheme-mode racket-mode) . lispy-mode)
;;   :config
;;   (lispy-set-key-theme '(special paredit c-digits))
;;   (setq lispy-outline "^;; \\(?:;[^#]\\|\\*+\\)"
;;         lispy-outline-header ";; "
;;         lispy-ignore-whitespace t))

;; Also use lispyville in prog-mode for [ ] < >
;; (def-package! lispyville
;;   :demand t
;;   :after (evil)
;;   :hook (lispy-mode . lispyville-mode))

(def-package! lsp-mode
  :defer t
  :init
  (setq lsp-prefer-flymake nil)

  :after  cc-mode
  :hook (lsp-mode . flycheck-mode)
  :config
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection
                                     '("rustup" "run" "nightly" "rls"))
                    :major-modes '(rust-mode rustic-mode)
                    :priority -1
                    :server-id 'rls
                    :notification-handlers (lsp-ht ("window/progress" 'lsp-clients--rust-window-progress))))
  (setq lsp-enable-snippet nil)
  (require 'lsp-clients)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  (set-face-attribute 'lsp-face-highlight-textual nil
    	                :background "#f2e8e8" :foreground "#070707"
                      )

  (setq lsp-auto-guess-root t)
  ;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (require 'lsp-ui-flycheck)
  (with-eval-after-load 'lsp-mode
    (add-hook 'lsp-after-open-hook (lambda () (lsp-ui-flycheck-enable 1))))
  )

(def-package! lsp-ui
  :demand t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq
   lsp-ui-sideline-enable t
   lsp-ui-doc-use-webkit t
   lsp-ui-sideline-ignore-duplicate t
   ;; lsp-ui-doc-header t
   ;; lsp-ui-doc-include-signature t
   ;; lsp-ui-doc-background (doom-color 'base4)
   ;; lsp-ui-doc-border (doom-color 'fg)

   lsp-ui-peek-force-fontify nil
   lsp-ui-peek-expand-function (lambda (xs) (mapcar #'car xs)))
  )



;; (def-package! eglot
;;   :defer t
;;   :init
;;   ;; (add-hook 'haskell-mode-hook 'eglot-ensure)
;;   ;; (add-hook 'c++-mode-hook 'eglot-ensure)
;;   ;; (add-hook 'ruby-mode-hook 'eglot-ensure)
;;   ;; (add-hook 'python-mode-hook 'eglot-ensure)
;;   ;; (add-hook 'java-mode-hook 'eglot-ensure)
;;   (add-hook 'kotlin-mode-hook 'eglot-ensure))
;; ;; (add-hook 'haskell-mode-hook 'flycheck-mode)
;;                                         ;(add-to-list 'company-backends 'company-ghc)

;; ;;                                         ;(set-company-backend! 'haskell-mode
;; ;;                                         ;  'company-ghc)
;; ;; (set-company-backend! 'emacs-lisp-mode
;; ;;   'company-elisp)
;; ;; (set-company-backend! 'ruby-mode
;; ;;   'company-lsp)

;; ;; ;; (set-company-backend! 'haskell-mode 'company-lsp)
;; ;; ;; (set-company-backend! 'ruby-mode
;; ;; ;;   'company-elisp)

;; (after! haskell-mode
;;   (require 'lsp-ui )
;;   (require 'lsp-haskell)
;;   (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;;   (add-hook 'haskell-mode-hook #'lsp-haskell-enable)
;;   (add-hook 'haskell-mode-hook 'flycheck-mode))


;; (def-package! nand2tetris
;;   :load-path "~/dev/nand2tetris"
;;   :defer t
;;   :config
;;                                         ;(add-to-list 'company-backends 'company-nand2tetris)
;;   (set-company-backend! 'nand2tetris-mode
;;     'company-nand2tetris)
;;   )

;; ;; (add-hook 'java-mode-hook  'lsp-java-enable)

;; ;; (def-package! lsp-ruby
;; ;;   :init
;; ;;   (add-hook 'ruby-mode-hook #'lsp-ruby-enable)
;; ;;   :config
;; ;;   (setq lsp-hover-text-function 'lsp--text-document-signature-help)
;; ;;   )



;; ;; (def-package! lsp-python
;; ;;   :after lsp-mode
;; ;;   :config
;; ;;   (add-hook 'python-mode-hook #'lsp-python-enable)
;; ;;   )


;; ;; (advice-add 'eldoc-display-message-p :override 'my/eldoc-display-message-p)

;; ;; (set-company-backend! 'c++-mode
;; ;;      'company-lsp)
;; ;; (def-package! lsp-racket
;; ;;  :config
;; ;;  :after lsp-mode
;; ;;  (add-hook 'racket-mode-hook #'lsp-racket-enable))


;; (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;; ;; (after! ccls
;; ;;       (map!
;; ;;        :map c++-mode-map
;; ;;        :leader
;;                                         ;        :desc "Include header and format buffer" :nv "ih" (lambda! (my/cpp-auto-include))) )


(def-package! sml-mode
  :defer t
  :config
  (require 'company-sml)
  (add-hook 'company-sml 'company-sml-setup)
  (set-company-backend! 'sml-mode
    'company-keywords)
  )

;; ;; (set-docset! 'js2-mode "JavaScript" "JQuery")
;; ;; (set-docset! 'haskell-mode "Haskell")

;; ;; (set-docset! 'c++-mode "C++" "Boost")
;; ;; (set-docset! 'css-mode "Css" "Html")
;; ;; (set-docset! 'html-mode "Html" "Css")

;; ;; (require 'exwm)
;; ;; (require 'exwm-config)
;; ;; (exwm-config-default)

;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "chromium")
;; (setq helm-dash-browser-func 'browse-url-generic)

;; (setq elfeed-show-mode-hook
;;       (lambda ()
;; 	    (set-face-attribute 'variable-pitch (selected-frame) :font (font-spec :family "Iosevka" :size 17))
;; 	    (setq fill-column 120)
;; 	    (setq elfeed-show-entry-switch #'my-show-elfeed)))

;; (defun my-show-elfeed (buffer)
;;   (with-current-buffer buffer
;;     (setq buffer-read-only nil)
;;     (goto-char (point-min))
;;     (re-search-forward "\n\n")
;;     (fill-individual-paragraphs (point) (point-max))
;;     (setq buffer-read-only t))
;;   (switch-to-buffer buffer))

;; (after! elfeed
;;   (setq elfeed-search-filter "@8-year-ago ")
;;   )
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


;; (def-package! adoc-mode
;;   :defer t
;;   :hook (adoc-mode . visual-line-mode)
;;   :preface (provide 'adoc-mode)
;;   :mode ("\\.adoc\\'"))



;; (defun org-brain-insert-resource-icon (link)
;;   "Insert an icon, based on content of org-mode LINK."
;;   (insert (format "%s "
;;                   (cond ((string-prefix-p "http" link)
;;                          (cond ((string-match "wikipedia\\.org" link)
;;                                 (all-the-icons-faicon "wikipedia-w"))
;;                                ((string-match "github\\.com" link)
;;                                 (all-the-icons-octicon "mark-github"))
;;                                ((string-match "vimeo\\.com" link)
;;                                 (all-the-icons-faicon "vimeo"))
;;                                ((string-match "youtube\\.com" link)
;;                                 (all-the-icons-faicon "youtube"))
;;                                (t
;;                                 (all-the-icons-faicon "globe"))))
;;                         ((string-prefix-p "brain:" link)
;;                          (all-the-icons-fileicon "brain"))
;;                         (t
;;                          (all-the-icons-icon-for-file link))))))

;; (add-hook 'org-brain-after-resource-button-functions #'org-brain-insert-resource-icon)

;; ;; (def-package! wakatime)

;; ;; (def-package! flycheck
;; ;;   :init (global-flycheck-mode))

;; (def-package! prog-mode
;;   :hook (prog-mode . visual-line-mode)
;;   :config
;;   (setq prog-mode-hook '()))

;; ;; (after! flycheck
;; ;;   ;; (setq flycheck-check-syntax-automatically '(save mode-enabled))
;; ;;   (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
;; ;;   (global-flycheck-mode -1)
;; ;;   )

;; ;; (after! flymake-proc
;; ;;   ;; disable flymake-proc
;; ;;   (setq-default flymake-diagnostic-functions nil)
;; ;;   )
;; ;; (defvar flymake-posframe-delay 0.5)
;; ;; (defvar flymake-posframe-buffer "*flymake-posframe*")
;; ;; (defvar-local flymake-posframe-timer nil)

;; ;; (defun flymake-posframe-hide ()
;; ;;   (require 'posframe)
;; ;;   (posframe-hide flymake-posframe-buffer))

;; ;; (defun flymake-posframe-display ()
;; ;;   (when flymake-mode
;; ;;     (flymake-posframe-hide)
;; ;;     (when-let ((diag (and flymake-mode
;; ;;                           (get-char-property (point) 'flymake-diagnostic))))
;; ;;       (posframe-show
;; ;;        flymake-posframe-buffer
;; ;;        :string (propertize (concat "➤ " (flymake--diag-text diag))
;; ;;                            'face
;; ;;                            (case (flymake--diag-type diag)
;; ;;                              (:error 'error)
;;                              (:warning 'warning)
;; ;;                              (:note 'info)))))))

;; (defun flymake-posframe-set-timer ()
;;   (when flymake-posframe-timer
;;     (cancel-timer flymake-posframe-timer))
;;   (setq flymake-posframe-timer
;;         (run-with-idle-timer flymake-posframe-delay nil #'flymake-posframe-display)))
;; (add-hook 'post-command-hook #'flymake-posframe-set-timer)
;; (add-hook! (doom-exit-buffer doom-exit-window) #'flymake-posframe-hide)

(def-package! cmake-mode
  :defer t
  :hook (cmake-mode . yas-minor-mode)
  :config
  (set-company-backend! 'cmake-mode 'company-yasnippet)
  )


;; ;; (progn
;; ;;  (setq initial-buffer-choice "~/projects/faiz/include/rider/faiz/type_traits.hpp")
;; ;;  (require 'projectile)
;; ;;  (setq +workspaces-main "faiz")
;; ;;  )


;; (def-package! doc-view
;;   :defer t
;;   :config
;;   (setq doc-view-resolution 400))

;; (def-package! pyim
;;   :demand t
;;   :custom
;;   (pyim-dcache-directory "~/tmp")
;;   :config
;;   ;; 激活 basedict 拼音词库，五笔用户请继续阅读 README
;;   (def-package! pyim-basedict
;;     :config (pyim-basedict-enable))

;;   (setq default-input-method "pyim")

;;   ;; 我使用全拼
;;   (setq pyim-default-scheme 'quanpin)

;;   ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
;;   ;; 我自己使用的中英文动态切换规则是：
;;   ;; 1. 光标只有在注释里面时，才可以输入中文。
;;   ;; 2. 光标前是汉字字符时，才能输入中文。
;;   ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
;;   (setq-default pyim-english-input-switch-functions
;;                 '(pyim-probe-dynamic-english
;;                   pyim-probe-isearch-mode
;;                   pyim-probe-program-mode
;;                   pyim-probe-org-structure-template))

;;   (setq-default pyim-punctuation-half-width-functions
;;                 '(pyim-probe-punctuation-line-beginning
;;                   pyim-probe-punctuation-after-punctuation))

;;   ;; 开启拼音搜索功能
;;   (pyim-isearch-mode 1)

;;   ;; 使用 pupup-el 来绘制选词框, 如果用 emacs26, 建议设置
;;   ;; 为 'posframe, 速度很快并且菜单不会变形，不过需要用户
;;   ;; 手动安装 posframe 包。
;;   (setq pyim-page-tooltip 'popup)

;;   ;; 选词框显示5个候选词
;;   (setq pyim-page-length 5)

;;   :bind
;;   (("M-j" . pyim-convert-code-at-point) ;与 pyim-probe-dynamic-english 配合
;;    ("C-;" . pyim-delete-word-from-personal-buffer)))

;; (require 'pyim)

;; (require 'org-ref)

(setq reftex-default-bibliography '("~/bibliography/references.bib"))

(setq org-ref-bibliography-notes "~/bibliography/notes.org"
      org-ref-default-bibliography '("~/bibliography/references.bib")
      org-ref-pdf-directory "~/bibliography/bibtex-pdfs/")



(setq org-latex-pdf-process
      '(
        "rm -fr %b.out  %b.bbl %b.log %b.aux %b.blg %b.toc auto texput.log"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "rm -fr %b.out %b.bbl %b.log %b.aux %b.blg %b.toc auto texput.log"
        ))
;; 设置默认后端为 `xelatex'
(setq org-latex-compiler "xelatex")




;; (def-package! helm
;;   :custom
;;   (helm-M-x-fuzzy-match 1)
;;   (helm-file-cache-fuzzy-match 1))

(def-package! pyim
  :custom
  (pyim-page-length 9)
  (pyim-page-tooltip 'posframe)
  (pyim-punctuation-translate-p '(no yes auto))
  :config
  (setq pyim-punctuation-translate-p '(auto yes no))   ;中文使用全角标点，英文使用半角标点。
  )

;; (defun rx/add-catch2 (file)
;;   "insert catch2 header file"
;;   (interactive)
;;   (find-file file)
;;   (goto-line 1)
;;   (setq p (re-search-forward "\#include" nil t 1))
;;   (if p
;;       (progn
;;         (goto-char p)
;;         (end-of-line)
;;         (open-line 1)
;;         (forward-line 1)
;;         (insert "#include <catch2/catch.hpp>")
;;         )
;;     (insert "#include <catch2/catch.hpp>")
;;     )
;;   (open-line 1)  (save-buffer 1)
;;   )


;; (defun rx/my-dired-do-stats (&optional arg)
;;   "Do stats for the marked files."
;;   (interactive "P")
;;   (dolist (file  (dired-get-marked-files nil arg))
;;     (rx/add-catch2 file)))


;; (setq rx/delete-by-moving-to-trash t)

;; ;; (after! evil-matchit-c
;; ;;      (add-to-list 'evilmi-c-extract-keyword-howtos '("^<[ \t]*\\([a-z]+\\)\\( .*\\| *\\)>$" 1)))

;; (defun rx/insert-nondirectory-nonextension-file-name-at-point ()
;;   "e.g., /usr/share/ha.cpp => ha"
;;    (interactive)
;;    (insert (file-name-nondirectory (file-name-sans-extension  buffer-file-name)))
;;    )

;;     (setq-default c-basic-offset 4)
;; (setq c-syntactic-indentation nil)


;; (after! python
;;   (add-hook! python-mode #'lsp)
;;   )

;; ;; (defun forward-to-word (arg)
;; ;;   "Move forward until encountering the beginning of a word.
;; ;; With argument, do this that many times."
;; ;;   (interactive "^p")
;; ;;   (or (re-search-forward (if (> arg 0) "\\W\\b" "\\b\\W") nil t arg)
;; ;;       (goto-char (if (> arg 0) (point-max) (point-min)))))


;; (define-key evil-normal-state-map (kbd "C-a") #'forward-to-word)
;; (define-key evil-normal-state-map (kbd "C-i") #'backward-to-word)


;; ;; (with-eval-after-load 'lsp-mode
;;   ;; (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
;;   ;; (require 'lsp-rust)

;; ;; (with-eval-after-load 'lsp-mode
;;   ;; (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
;;   ;; (require 'lsp-rust))

;; (def-package! rust-mode
;;   :defer t
;;   :bind (("C-c TAB" . rust-format-buffer))
;;   :hook
;;   (rust-mode . lsp)
;;   (prog-mode . electric-pair-mode)
;;   :config
;;   (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
;;   (def-package! racer
;;     :defer t)
;;   (def-package! flycheck
;;     )
;;   )

;; (def-package! cargo
;;   :hook (rust-mode . cargo-minor-mode))

;; (def-package! flycheck-rust
;;   :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; ;; (defun +lookup*add-jump-marker (&optional marker)
;; ;;   (when (bound-and-true-p evil-mode)
;; ;;     (evil-set-jump marker)))
;; ;; (advice-add #'xref-push-marker-stack :after #'+lookup*add-jump-marker)

;; (require 'edit-server)
;;   (edit-server-start)

(def-package! tramp
  :config
  (setq tramp-default-method "ssh")
  )
(require 'ob-C)

;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((gnuplot . t)
;;    ;; (C .t)
;;    (ipython . t)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (ipython . t)
   (ledger . t)
   (latex . t)
   (clojure .t)
   ;; (html .t)
   (shell .t)
   ))

(def-package! hl-todo
  :config
  :init
  (global-hl-todo-mode)
  (setq hl-todo-keyword-faces
        `(("TODO"  . ,(face-foreground 'warning))
          ("FIXME" . ,(face-foreground 'error))
          ("XXX" . ,(face-foreground 'warning))
          ("NOTE"  . ,(face-foreground 'success))))

  ;; Use a more primitive todo-keyword detection method in major modes that
  ;; don't use/have a valid syntax table entry for comments.
  (add-hook!
    (pug-mode haml-mode)
    #'+hl-todo|use-face-detection))

(after! yasnippet
  (setq yas-triggers-in-field t))

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
(setq global-visual-line-mode t)

(electric-pair-mode)

(require 'dired)
(defun s60 ()
  (interactive)
  (dired "/ssh:deepin@192.168.1.60:/"))
(defun s210 ()
  (interactive)
  (dired "/ssh:deepin@192.168.1.210:/"))

(defun s223 ()
  (interactive)
  (dired "/ssh:deepin@10.2.3.223:/"))

(defun s25 ()
  (interactive)
  (dired "/ssh:deepin@120.219.11.25:/"))

;; (after! magit-todos
;; (setq magit-todos-depth 2))

(require 'aweshell)
(defun t223 ()
  (interactive)
  (let ((default-directory "/ssh:deepin@10.2.3.223:"))
    (shell)))

(require 'hydra)

(bind-key "C-c o c" 'hydra-org-clock/body)
;; (bind-key "C-c w" 'hydra-org-clock/body)
(defhydra hydra-org-clock (:color blue :hint nil)
  "
^Clock:^ ^In/out^     ^Edit^   ^Summary^    | ^Timers:^ ^Run^           ^Insert
-^-^-----^-^----------^-^------^-^----------|--^-^------^-^-------------^------
(_?_)    _i_n         _e_dit   _g_oto entry | (_z_)     _r_elative      ti_m_e
 ^ ^     _c_ontinue   _q_uit   _d_isplay    |  ^ ^      cou_n_tdown     i_t_em
 ^ ^     _o_ut        ^ ^      _r_eport     |  ^ ^      _p_ause toggle
 ^ ^     ^ ^          ^ ^      ^ ^          |  ^ ^      _s_top
"
  ("i" org-clock-in)
  ("c" org-clock-in-last)
  ("o" org-clock-out)

  ("e" org-clock-modify-effort-estimate)
  ("q" org-clock-cancel)

  ("g" org-clock-goto)
  ("d" org-clock-display)
  ("r" org-clock-report)
  ("?" (org-info "Clocking commands"))

  ("r" org-timer-start)
  ("n" org-timer-set-timer)
  ("p" org-timer-pause-or-continue)
  ("s" org-timer-stop)

  ("m" org-timer)
  ("t" org-timer-item)
  ("z" (org-info "Timers")))


;; Hydra for org agenda (graciously taken from Spacemacs)
(defhydra hydra-org-agenda (:pre (setq which-key-inhibit t)
                                 :post (setq which-key-inhibit nil)
                                 :hint none)
  "
Org agenda (_q_uit)

^Clock^      ^Visit entry^              ^Date^             ^Other^
^-----^----  ^-----------^------------  ^----^-----------  ^-----^---------
_ci_ in      _SPC_ in other window      _ds_ schedule      _gr_ reload
_co_ out     _TAB_ & go to location     _dd_ set deadline  _._  go to today
_cq_ cancel  _RET_ & del other windows  _dt_ timestamp     _gd_ go to date
_cj_ jump    _o_   link                 _+_  do later      ^^
^^           ^^                         _-_  do earlier    ^^
^^           ^^                         ^^                 ^^
^View^          ^Filter^                 ^Headline^         ^Toggle mode^
^----^--------  ^------^---------------  ^--------^-------  ^-----------^----
_vd_ day        _ft_ by tag              _ht_ set status    _tf_ follow
_vw_ week       _fr_ refine by tag       _hk_ kill          _tl_ log
_vt_ fortnight  _fc_ by category         _hr_ refile        _ta_ archive trees
_vm_ month      _fh_ by top headline     _hA_ archive       _tA_ archive files
_vy_ year       _fx_ by regexp           _h:_ set tags      _tr_ clock report
_vn_ next span  _fd_ delete all filters  _hp_ set priority  _td_ diaries
_vp_ prev span  ^^                       ^^                 ^^
_vr_ reset      ^^                       ^^                 ^^
^^              ^^                       ^^                 ^^
"
  ;; Entry
  ("hA" org-agenda-archive-default)
  ("hk" org-agenda-kill)
  ("hp" org-agenda-priority)
  ("hr" org-agenda-refile)
  ("h:" org-agenda-set-tags)
  ("ht" org-agenda-todo)
  ;; Visit entry
  ("o"   link-hint-open-link :exit t)
  ("<tab>" org-agenda-goto :exit t)
  ("TAB" org-agenda-goto :exit t)
  ("SPC" org-agenda-show-and-scroll-up)
  ("RET" org-agenda-switch-to :exit t)
  ;; Date
  ("dt" org-agenda-date-prompt)
  ("dd" org-agenda-deadline)
  ("+" org-agenda-do-date-later)
  ("-" org-agenda-do-date-earlier)
  ("ds" org-agenda-schedule)
  ;; View
  ("vd" org-agenda-day-view)
  ("vw" org-agenda-week-view)
  ("vt" org-agenda-fortnight-view)
  ("vm" org-agenda-month-view)
  ("vy" org-agenda-year-view)
  ("vn" org-agenda-later)
  ("vp" org-agenda-earlier)
  ("vr" org-agenda-reset-view)
  ;; Toggle mode
  ("ta" org-agenda-archives-mode)
  ("tA" (org-agenda-archives-mode 'files))
  ("tr" org-agenda-clockreport-mode)
  ("tf" org-agenda-follow-mode)
  ("tl" org-agenda-log-mode)
  ("td" org-agenda-toggle-diary)
  ;; Filter
  ("fc" org-agenda-filter-by-category)
  ("fx" org-agenda-filter-by-regexp)
  ("ft" org-agenda-filter-by-tag)
  ("fr" org-agenda-filter-by-tag-refine)
  ("fh" org-agenda-filter-by-top-headline)
  ("fd" org-agenda-filter-remove-all)
  ;; Clock
  ("cq" org-agenda-clock-cancel)
  ("cj" org-agenda-clock-goto :exit t)
  ("ci" org-agenda-clock-in :exit t)
  ("co" org-agenda-clock-out)
  ;; Other
  ("q" nil :exit t)
  ("gd" org-agenda-goto-date)
  ("." org-agenda-goto-today)
  ("gr" org-agenda-redo))


(bind-key "C-c o a" 'hydra-org-agenda/body)

(defhydra hydra-yasnippet (:color blue :hint nil)
  "
              ^YASnippets^
--------------------------------------------
  Modes:    Load/Visit:    Actions:

 _g_lobal  _d_irectory    _i_nsert
 _m_inor   _f_ile         _t_ryout
 _e_xtra   _l_ist         _n_ew
         _a_ll
"
  ("d" yas-load-directory)
  ("e" yas-activate-extra-mode)
  ("i" yas-insert-snippet)
  ("f" yas-visit-snippet-file :color blue)
  ("n" yas-new-snippet)
  ("t" yas-tryout-snippet)
  ("l" yas-describe-tables)
  ("g" yas/global-mode)
  ("m" yas/minor-mode)
  ("a" yas-reload-all))
(bind-key "C-c y" 'hydra-yasnippet/body)

(defhydra hydra-lsp (:exit t :hint nil)
  "
 Buffer^^               Server^^                   Symbol
-------------------------------------------------------------------------------------
 [_f_] format           [_M-r_] restart            [_d_] declaration  [_i_] implementation  [_o_] documentation
 [_m_] imenu            [_S_]   shutdown           [_D_] definition   [_t_] type            [_r_] rename
 [_x_] execute action   [_M-s_] describe session   [_R_] references   [_s_] signature"
  ("d" lsp-find-declaration)
  ("D" lsp-ui-peek-find-definitions)
  ("R" lsp-ui-peek-find-references)
  ("i" lsp-ui-peek-find-implementation)
  ("t" lsp-find-type-definition)
  ("s" lsp-signature-help)
  ("o" lsp-describe-thing-at-point)
  ("r" lsp-rename)

  ("f" lsp-format-buffer)
  ("m" lsp-ui-imenu)
  ("x" lsp-execute-code-action)

  ("M-s" lsp-describe-session)
  ("M-r" lsp-restart-workspace)
  ("S" lsp-shutdown-workspace))


(bind-key "C-c l" 'hydra-lsp/body)

(use-package lsp-mode :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)

(def-package! ccls
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp)))
  :config

  (ccls-use-default-rainbow-sem-highlight)
  (setq ccls-sem-highlight-method 'overlay)
  (setq ccls-executable "~/dev/ccls/build/ccls")
  )

(def-package! erc
  :custom
  (erc-autojoin-channels-alist '(("freenode.net" "#archlinux" "#bash" "#bitcoin"
                                  "#emacs" "#gentoo" "#i3" "#latex" "#org-mode" "#python")))
  (erc-autojoin-timing 'ident)
  (erc-fill-function 'erc-fill-static)
  (erc-fill-static-center 22)
  (erc-hide-list '("JOIN" "PART" "QUIT"))
  (erc-lurker-hide-list '("JOIN" "PART" "QUIT"))
  (erc-lurker-threshold-time 43200)
  (erc-prompt-for-nickserv-password nil)
  (erc-server-reconnect-attempts 5)
  (erc-server-reconnect-timeout 3)
  (erc-track-exclude-types '("JOIN" "MODE" "NICK" "PART" "QUIT"
                             "324" "329" "332" "333" "353" "477"))
  :config
  (add-to-list 'erc-modules 'notifications)
  (add-to-list 'erc-modules 'spelling)
  (erc-services-mode 1)
  (erc-update-modules))


(require 'exwm)
(require 'exwm-config)
(exwm-config-default)


(setq exwm-workspace-number 9)





(defun fhd/exwm-input-line-mode ()
  "Set exwm window to line-mode and show mode line"
  (call-interactively #'exwm-input-grab-keyboard)
  (exwm-layout-show-mode-line))

(defun fhd/exwm-input-char-mode ()
  "Set exwm window to char-mode and hide mode line"
  (call-interactively #'exwm-input-release-keyboard)
  (exwm-layout-hide-mode-line))

(defun fhd/exwm-input-toggle-mode ()
  "Toggle between line- and char-mode"
  (interactive)
  (with-current-buffer (window-buffer)
    (when (eq major-mode 'exwm-mode)
      (if (equal (second (second mode-line-process)) "line")
          (fhd/exwm-input-char-mode)
        (fhd/exwm-input-line-mode)))))

(exwm-input-set-key (kbd "s-i") #'fhd/exwm-input-toggle-mode)

(defun fhd/toggle-exwm-input-line-mode-passthrough ()
  (interactive)
  (if exwm-input-line-mode-passthrough
    (progn
      (setq exwm-input-line-mode-passthrough nil)
      (message "App receives all the keys now (with some simulation)"))
   (progn
     (setq exwm-input-line-mode-passthrough t)
     (message "emacs receives all the keys now")))
  (force-mode-line-update))

(exwm-input-set-key (kbd "s-p") 'fhd/toggle-exwm-input-line-mode-passthrough)

(exwm-input-set-key (kbd "s-c") #'list-processes)
