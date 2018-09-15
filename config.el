;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
(load! "+bindings")
(after! doom-themes
  :init
  ;(setq doom-theme 'doom-tomorrow-day))
  (setq doom-theme 'doom-one))
(after! helm
  (setq helm-source-list
        '(
          helm-source-buffers-list
          helm-source-recentf
          helm-source-projectile-buffers-list
          helm-source-projectile-files-list
          helm-source-projectile-projects
          helm-source-kill-ring
          helm-source-locate
          helm-source-yasnippet
          )))
;; (def-package! pyim
;;   :demand t
;;   :defer 10
;;   :config
;;   ;; 激活 basedict 拼音词库
;;   (def-package! pyim-basedict
;;     :config (pyim-basedict-enable))

;;   (setq default-input-method "pyim")

;;   (require 'pyim-basedict) ; 拼音词库设置，五笔用户 *不需要* 此行设置
;;   (pyim-basedict-enable)   ; 拼音词库，五笔用户 *不需要* 此行设置
;;   (setq default-input-method "pyim")

;;   ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
;;   ;; 我自己使用的中英文动态切换规则是：
;;   ;; 1. 光标只有在注释里面时，我才可以输入中文。
;;   ;; 2. 光标前是汉字字符时，才能输入中文。
;;   ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
;;   (setq-default pyim-english-input-switch-functions
;;                 '(
;;                   pyim-probe-isearch-mode
;;                   pyim-probe-program-mode
;;                   pyim-probe-org-structure-template))

;;   (setq pyim-punctuation-translate-p '(no yes auto))   ;使用半角标点。

;;   (setq-default pyim-punctuation-half-width-functions
;;                 '(pyim-probe-punctuation-line-beginning
;;                   pyim-probe-punctuation-after-punctuation))

;;   ;; 开启拼音搜索功能
;;   (pyim-isearch-mode 1)

;;   ;; 使用 pupup-el 来绘制选词框, 如果用 emacs26, 建议设置
;;   ;; 为 'posframe, 速度很快并且菜单不会变形，不过需要用户
;;   ;; 手动安装 posframe 包。
;;   (setq pyim-page-tooltip 'posframe)

;;   ;; 选词框显示5个候选词
;;   (setq pyim-page-length 9)

;;   ;; 让 Emacs 启动时自动加载 pyim 词库
;;   (add-hook 'emacs-startup-hook
;;             #'(lambda () (pyim-restart-1 t)))
;;   :bind
;;   (("M-j" . pyim-convert-code-at-point) ;与 pyim-probe-dynamic-english 配合
;;    ("C-;" . pyim-delete-word-from-personal-buffer)))


(after! avy
  (setq avy-timeout-seconds 0.2)
  (setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?q ?w ?e ?r ?u ?i ?o ?p))
  )


(after! company
  (setq company-minimum-prefix-length 2
        company-quickhelp-delay nil
        company-show-numbers t
        company-global-modes '(not comint-mode erc-mode message-mode help-mode gud-mode)
        ))

(def-package! company-lsp
  :after company
  :defer t
  :init
  (setq company-transformers nil company-lsp-cache-candidates nil)
  )

(set-lookup-handlers! 'emacs-lisp-mode :documentation #'helpful-at-point)


(def-package! lsp-mode
  :defer t
  :init
  (setq lsp-project-blacklist '("/CC/"))
  )

(def-package! lsp-ui
  :demand t
  :defer t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq
   lsp-ui-sideline-enable nil
   lsp-ui-doc-header nil
   lsp-ui-doc-include-signature nil
   lsp-ui-doc-background (doom-color 'base4)
   lsp-ui-doc-border (doom-color 'fg)))




(after! quickrun
  (quickrun-add-command "c++/c1z"
    '((:command . "clang++")
      (:exec    . ("%c -std=c++1z %o -o %e %s"
                   "%e %a"))
      (:remove  . ("%e")))
    :default "c++"))

(after! projectile
  (setq projectile-require-project-root t)
  (setq compilation-read-command nil)  ; no prompt in projectile-compile-project
  ;; . -> Build
  (projectile-register-project-type 'cmake '("CMakeLists.txt")
                                    :configure "cmake %s"
                                    :compile "cmake --build Debug"
                                    :test "ctest")
  )

                                        ;(require 'aweshell)
(def-package! aweshell
  :defer 5
  )




(setq doom-font (font-spec :family "Iosevka" :size 16))
(setq doom-big-font (font-spec :family "Iosevka" :size 25))

                                        ;(setq +doom-dashboard-banner-file "~/pictures/zxy.png")

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-clang-tidy-setup))


                                        ;(defun name-of-recursive-function (n)
                                        ;  "documentation..."
                                        ;  (if n > 0
                                        ;      (workspace/new)
                                        ;      (name-of-recursive-function
                                        ;       (- n 1))))


                                        ;(defun name-of-recursive-function (fun n)
                                        ;  (when (> n 0)
                                        ;    (funcall fun)
                                        ;    (name-of-recursive-function
                                        ;     fun (- n 1))))


                                        ;(run-with-idle-timer
                                        ; 0.1 nil
                                        ; #'(lambda ()
                                        ;     (name-of-recursive-function '+workspace/new 8)))

(require 'persp-mode)
(add-hook! 'persp-mode-hook
  (save-window-excursion
    (delete-other-windows)
    (switch-to-buffer (doom-fallback-buffer))
    (require 'persp-mode)
    (let ((wconf (funcall persp-window-state-get-function (selected-frame))))
      (dotimes (i 9)
        (let ((persp (persp-add-new (format "#%d" (1+ i)))))
          (setf (persp-window-conf persp) wconf))))))
                                        ;(add-hook 'emacs-startup-hook #'(lambda ()(+workspace/switch-to '0)))

                                        ;(add-hook 'emacs-startup-hook
                                        ;            #'(lambda () (pyim-restart-1 t)))


                                        ;(require 'lsp-ui)
                                        ;(require 'lsp-haskell)

                                        ;(add-hook 'lsp-mode-hook 'lsp-ui-mode)
                                        ;(add-hook 'haskell-mode-hook #'lsp-haskell-enable)
(def-package! eglot
  :init
  (add-hook 'haskell-mode-hook 'eglot-ensure)
  (add-hook 'ruby-mode-hook 'eglot-ensure)
  (add-hook 'python-mode-hook 'eglot-ensure)
  (add-hook 'kotlin-mode-hook 'eglot-ensure))
;(add-hook 'haskell-mode-hook 'flycheck-mode)
;(add-to-list 'company-backends 'company-ghc)
(add-to-list 'company-backends 'company-nand2tetris)

;(set-company-backend! 'haskell-mode
;  'company-ghc)
(set-company-backend! 'emacs-lisp-mode
  'company-elisp)
(set-company-backend! 'nand2tetris-mode
  'company-nand2tetris)

(set-company-backend! 'c++-mode
  'company-lsp)
;; (set-popup-rule! "^*eshell*" :side 'right :size 80)
;; (set-popup-rule! "^*eww*" :side 'right :size 80)
;; (set-popup-rule! "^*Custom*" :side 'right :size 80)
;; (set-popup-rule! "^ag*" :side 'right :size 80)
;; (set-popup-rule! "^*info*" :ignore 1)

(set-docset! 'js2-mode "JavaScript" "JQuery")

(set-docset! 'c++-mode "C++" "Boost")
(set-docset! 'css-mode "Css" "Html")
(set-docset! 'html-mode "Html" "Css")



;; (require 'netease-music)
;; (setq netease-music-username "1_18550451650")
;; (setq netease-music-user-password "17126724")
;; (setq netease-music-user-id "75783975")
;; ; api address default is http://localhost:3000
;; (setq netease-music-api "http://localhost:3000")
