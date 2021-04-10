;;; input/chinese/config.el -*- lexical-binding: t; -*-

(use-package! rime
  :config
  (setq default-input-method "rime")
  (setq rime-show-candidate 'posframe)
   (setq rime-user-data-dir "~/projects/org/rime")
   ;; (setq rime-posframe-properties
   ;;       (list :font "sarasa ui sc"
   ;;             :internal-border-width 10))
  ;; (setq rime-posframe-style 'horizontal)
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
