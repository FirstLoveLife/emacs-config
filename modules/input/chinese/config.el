;;; input/chinese/config.el -*- lexical-binding: t; -*-

(use-package! rime
  :config
  ;(liberime-try-select-schema "luna_pinyin_simp")
  (setq default-input-method "rime")
  (setq rime-show-candidate 'posframe)
   (setq rime-user-data-dir "~/projects/org/rime")
   (setq rime-posframe-properties
         (list :font "sarasa ui sc"
               :internal-border-width 10))
  (setq rime-posframe-style 'horizontal)
  )

;(use-package! sis
  ;; :hook
  ;; enable the /follow context/ and /inline region/ mode for specific buffers
  ;; (((text-mode prog-mode) . sis-context-mode)
  ;;  ((text-mode prog-mode) . sis-inline-mode))

;  :config
  ;; For MacOS
;  (sis-ism-lazyman-config "1" "2" 'fcitx5)

  ;; enable the /cursor color/ mode
;  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
;  (sis-global-respect-mode t)
  ;; enable the /context/ mode for all buffers
;  (sis-global-context-mode t)
  ;; enable the /inline english/ mode for all buffers
;  (sis-global-inline-mode t)
  ;)


;; (use-package! pyim
;;   ;; :quelpa (pyim :fetcher github :repo "merrickluo/pyim")
;;   :init
;;   (setq pyim-title "R")
;;   :config
;;   ;; (use-package pyim-basedict
;;   ;;   :config
;;   ;;   (pyim-basedict-enable))
;;   (global-set-key (kbd "M-j") 'pyim-convert-string-at-point)
;;   (setq pyim-dcache-auto-update nil)
;;   (setq default-input-method "pyim")
;;   ;; 我使用全拼
;;   (setq pyim-default-scheme 'rime)
;;   (setq pyim-page-tooltip 'child-frame)

;;   ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
;;   ;; 我自己使用的中英文动态切换规则是：
;;   ;; 1. 光标只有在注释里面时，才可以输入中文。
;;   ;; 2. 光标前是汉字字符时，才能输入中文。
;;   ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
;;   (setq-default pyim-english-input-switch-functions
;; 		        '(pyim-probe-dynamic-english
;; 		          pyim-probe-isearch-mode
;; 		          pyim-probe-program-mode
;;                   pyim-probe-evil-normal-mode
;; 		          pyim-probe-org-structure-template))

;;   (setq-default pyim-punctuation-half-width-functions
;; 		        '(pyim-probe-punctuation-line-beginning
;; 		          pyim-probe-punctuation-after-punctuation)))
