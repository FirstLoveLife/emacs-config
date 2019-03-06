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
  ;; (setq doom-theme 'doom-Iosvkem)
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
  (global-company-mode)
  (setq company-minimum-prefix-length 2
        company-quickhelp-delay nil
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
  ;; (setq lsp-enable-snippet nil)
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


;; (def-package! sml-mode
;;   :defer t
;;   :config
;;   (require 'company-sml)
;;   (add-hook 'company-sml 'company-sml-setup)
;;   (set-company-backend! 'sml-mode
;;     'company-keywords)
;;   )

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


(def-package! adoc-mode
  :defer t
  :hook (adoc-mode . visual-line-mode)
  :preface (provide 'adoc-mode)
  :mode ("\\.adoc\\'"))



(defun org-brain-insert-resource-icon (link)
  "Insert an icon, based on content of org-mode LINK."
  (insert (format "%s "
                  (cond ((string-prefix-p "http" link)
                         (cond ((string-match "wikipedia\\.org" link)
                                (all-the-icons-faicon "wikipedia-w"))
                               ((string-match "github\\.com" link)
                                (all-the-icons-octicon "mark-github"))
                               ((string-match "vimeo\\.com" link)
                                (all-the-icons-faicon "vimeo"))
                               ((string-match "youtube\\.com" link)
                                (all-the-icons-faicon "youtube"))
                               (t
                                (all-the-icons-faicon "globe"))))
                        ((string-prefix-p "brain:" link)
                         (all-the-icons-fileicon "brain"))
                        (t
                         (all-the-icons-icon-for-file link))))))

(add-hook 'org-brain-after-resource-button-functions #'org-brain-insert-resource-icon)

;; (def-package! wakatime)

;; (def-package! flycheck
;;   :init (global-flycheck-mode))

(def-package! prog-mode
  :hook (prog-mode . visual-line-mode)
  :config
  (setq prog-mode-hook '()))

;; (after! flycheck
;;   ;; (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
;;   (global-flycheck-mode -1)
;;   )

;; (after! flymake-proc
;;   ;; disable flymake-proc
;;   (setq-default flymake-diagnostic-functions nil)
;;   )
;; (defvar flymake-posframe-delay 0.5)
;; (defvar flymake-posframe-buffer "*flymake-posframe*")
;; (defvar-local flymake-posframe-timer nil)

;; (defun flymake-posframe-hide ()
;;   (require 'posframe)
;;   (posframe-hide flymake-posframe-buffer))

;; (defun flymake-posframe-display ()
;;   (when flymake-mode
;;     (flymake-posframe-hide)
;;     (when-let ((diag (and flymake-mode
;;                           (get-char-property (point) 'flymake-diagnostic))))
;;       (posframe-show
;;        flymake-posframe-buffer
;;        :string (propertize (concat "➤ " (flymake--diag-text diag))
;;                            'face
;;                            (case (flymake--diag-type diag)
;;                              (:error 'error)
;;                              (:warning 'warning)
;;                              (:note 'info)))))))

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


;; (progn
;;  (setq initial-buffer-choice "~/projects/faiz/include/rider/faiz/type_traits.hpp")
;;  (require 'projectile)
;;  (setq +workspaces-main "faiz")
;;  )


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




(def-package! helm
  :custom
  (helm-M-x-fuzzy-match 1)
  (helm-file-cache-fuzzy-match 1))

(def-package! pyim
  :custom
  (pyim-page-length 9)
  (pyim-page-tooltip 'posframe)
  (pyim-punctuation-translate-p '(no yes auto))

  )

(defun rx/add-catch2 (file)
  "insert catch2 header file"
  (interactive)
  (find-file file)
  (goto-line 1)
  (setq p (re-search-forward "\#include" nil t 1))
  (if p
      (progn
        (goto-char p)
        (end-of-line)
        (open-line 1)
        (forward-line 1)
        (insert "#include <catch2/catch.hpp>")
        )
    (insert "#include <catch2/catch.hpp>")
    )
  (open-line 1)  (save-buffer 1)
  )


(defun rx/my-dired-do-stats (&optional arg)
  "Do stats for the marked files."
  (interactive "P")
  (dolist (file  (dired-get-marked-files nil arg))
    (rx/add-catch2 file)))


(setq rx/delete-by-moving-to-trash t)

;; (after! evil-matchit-c
;;      (add-to-list 'evilmi-c-extract-keyword-howtos '("^<[ \t]*\\([a-z]+\\)\\( .*\\| *\\)>$" 1)))

(defun rx/insert-nondirectory-nonextension-file-name-at-point ()
  "e.g., /usr/share/ha.cpp => ha"
   (interactive)
   (insert (file-name-nondirectory (file-name-sans-extension  buffer-file-name)))
   )

    (setq-default c-basic-offset 4)
(setq c-syntactic-indentation nil)


(after! python
  (add-hook! python-mode #'lsp)
  )

;; (defun forward-to-word (arg)
;;   "Move forward until encountering the beginning of a word.
;; With argument, do this that many times."
;;   (interactive "^p")
;;   (or (re-search-forward (if (> arg 0) "\\W\\b" "\\b\\W") nil t arg)
;;       (goto-char (if (> arg 0) (point-max) (point-min)))))


(define-key evil-normal-state-map (kbd "C-a") #'forward-to-word)
(define-key evil-normal-state-map (kbd "C-i") #'backward-to-word)


;; (with-eval-after-load 'lsp-mode
  ;; (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
  ;; (require 'lsp-rust)

;; (with-eval-after-load 'lsp-mode
  ;; (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
  ;; (require 'lsp-rust))

(def-package! rust-mode
  :defer t
  :bind (("C-c TAB" . rust-format-buffer))
  :hook
  (rust-mode . lsp)
  (prog-mode . electric-pair-mode)
  :config
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (def-package! racer
    :defer t)
  (def-package! flycheck
    )
  )

(def-package! cargo
  :hook (rust-mode . cargo-minor-mode))

(def-package! flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; (defun +lookup*add-jump-marker (&optional marker)
;;   (when (bound-and-true-p evil-mode)
;;     (evil-set-jump marker)))
;; (advice-add #'xref-push-marker-stack :after #'+lookup*add-jump-marker)

(require 'edit-server)
  (edit-server-start)

(def-package! tramp
  :config
      (setq tramp-default-method "ssh")
)
