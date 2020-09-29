;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Chen Li"
      user-mail-address "chenli@uniontech.com"
      epa-file-encrypt-to user-mail-address

      ;; Line numbers are pretty slow all around. The performance boost of
      ;; disabling them outweighs the utility of always keeping them on.
      display-line-numbers-type nil

      ;; On-demand code completion. I really need it.
      company-idle-delay 0

      ;; Disable help mouse-overs for mode-line segments (i.e. :help-echo text).
      ;; They're generally unhelpful and only add confusing visual clutter.
      mode-line-default-help-echo nil
      show-help-function nil)


;;
;;; UI

;; TODO: adajust font according to display-pixels-per-inch
;; (setq doom-font (font-spec :family "Sarasa Term J" :size (if (> (x-display-pixel-width) 1600) 28 12) :weight 'semi-light))
;; (setq doom-font (font-spec :family "Sarasa Fixed CL" :size 28 :weight 'semi-light))
(setq doom-font (font-spec :family "Iosevka Term" :size 28 :weight 'semi-light))

;;; Frames/Windows
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))


;;
;;; Keybinds


;;; Modules

;;; :completion ivy
;; (add-to-list 'ivy-re-builders-alist '(counsel-projectile-find-file . ivy--regex-plus))

;;; :ui doom-dashboard
;; (remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

;;; :editor evil
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;;; :tools direnv
(setq direnv-always-show-summary nil)

;;; :tools magit
(after! magit
  (setq magit-repository-directories '(("~/projects" . 2))
        magit-save-repository-buffers nil
        ;; Don't restore the wconf after quitting magit
        magit-inhibit-save-previous-winconf t
        ;; transient-values '((magit-commit "--gpg-sign=859058B499061C01")
        ;;                    (magit-rebase "--autosquash" "--gpg-sign=859058B499061C01")
        ;;                    (magit-pull "--rebase" "--gpg-sign=859058B499061C01"))

        magit-revision-insert-related-refs 'all))
                                        ;(after! transient
                                        ;  (transient-append-suffix 'magit-log "-A"
                                        ;    '("-m" "Omit merge commits" "--no-merges"))
                                        ; (transient-append-suffix 'magit-log "-A"
                                        ;    '("-f" "Follow only the first parent commit upon seeing a merge commit" "--first-parent")) )



(after! projectile
  (add-to-list 'projectile-globally-ignored-directories ".ccls-cache")
  (projectile-register-project-type 'cmake '("CMakeLists.txt")
                                    :configure "cmake %s"
                                    :compile "cmake --build Debug"
                                    :test "ctest")

  )

(setq tramp-inline-compress-start-size nil)
(setq tramp-copy-size-limit nil)

(after! lsp-mode
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-tramp-connection "ccls")
    :major-modes '(c++-mode)
    :remote? t
    ))
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-tramp-connection "ccls")
    :major-modes '(c-mode)
    :remote? t
    ))
  )

(modify-syntax-entry ?_ "w")

(after! wl
  (setq wl-mime-save-directory "/home/firstlove/projects/org/mime/")
  (setq shimbun-rss-hash-group-path-alist
        '(("xkcd" "https://xkcd.com/rss.xml")
          ("acgpiping" "http://www.acgpiping.net/feed/")
          ("interrupt-memfault" "https://interrupt.memfault.com/blog/feed.xml")
          ("moonlight" "http://feed.williamlong.info/")))
  )

(setq shell-file-name "/usr/bin/bash")

(use-package! nov
  :defer t
  :mode ("\\.epub\\'" . nov-mode)
  )
(use-package! shr-tag-pre-highlight
  :after shr
  :config
  (add-to-list 'shr-external-rendering-functions
               '(pre . shr-tag-pre-highlight))
  (when (version< emacs-version "26")
    (with-eval-after-load 'eww
      (advice-add 'eww-display-html :around
                  'eww-display-html--override-shr-external-rendering-functions))))


(set-frame-parameter nil 'alpha 85)

;; (add-to-list 'magic-mode-alist '("#include.*\\.h\s" . c++-mode))

(remove-hook! (prog-mode text-mode conf-mode special-mode) #'hl-line-mode)

(after! mediawiki
  (setq mediawiki-site-default "jungong")
  (setq mediawiki-site-alist '("jungong" "http://10.2.10.220:8081/index.php/" "Chenli" "17126724" nil "首页")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eaf-find-alternate-file-in-dired t t)
 '(safe-local-variable-values '((projectile-project-compilation-cmd . "./bindeb-pkg.sh"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(remove-hook! (prog-mode text-mode conf-mode special-mode) #'hl-line-mode)
(put 'magit-clean 'disabled nil)

(after! lsp-haskell
  (setq lsp-haskell-process-path-hie "haskell-language-server-wrapper")
  ;; Comment/uncomment this line to see interactions between lsp client/server.
  ;;(setq lsp-log-io t)
  )
