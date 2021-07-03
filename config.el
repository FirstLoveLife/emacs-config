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

        magit-revision-insert-related-refs 'nil
        ;; magit-revision-insert-related-refs 'all
        ))
                                        ;(after! transient
                                        ;  (transient-append-suffix 'magit-log "-A"
                                        ;    '("-m" "Omit merge commits" "--no-merges"))
                                        ; (transient-append-suffix 'magit-log "-A"
                                        ;    '("-f" "Follow only the first parent commit upon seeing a merge commit" "--first-parent")) )



(after! projectile
  (add-to-list 'projectile-globally-ignored-directories "build/")
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
  (setq lsp-enable-semantic-highlighting 't)
  )

(modify-syntax-entry ?_ "w")



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


;; (set-frame-parameter nil 'alpha 85)

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

(after! counsel
  (setq counsel-find-file-ignore-regexp "\\(?:^[#.]\\)\\|\\(?:[#~]$\\)\\|\\(?:^Icon?\\)\\|\\.*\\.o\\|\\.*\\.a\\|\\.*\\.builtin"))


(setq doom-theme 'doom-outrun-electric)
(with-eval-after-load 'em-term
  (add-to-list 'eshell-visual-commands "watch"))

(setq circe-network-options
      '(("Freenode"
         :tls t
         :nick "firstlove"
         :sasl-username "firstlove"
         :channels ("#emacs-circe")
         )))

;; (setq socks-noproxy '("127.0.0.1"))
;; (setq socks-server '("Default server" "127.0.0.1" 1089 5))
;; (setq url-gateway-method 'socks)

;; (eval-after-load "elmo-vars"
;;   '(progn
;;      (add-to-list 'elmo-network-stream-type-alist
;; 		  '("!!socks" socks-ssl socks socks-ssl-open-network-stream))
;;      (defun socks-ssl-open-network-stream (name buffer host service)
;;        (let ((process (socks-open-network-stream name buffer host service)))
;; 	 (gnutls-negotiate :process process :hostname host)
;;          process))))


(setq +lookup-open-url-fn #'eww)
(setq org-mime-library 'semi)

(after! org
                                        ;  (wl)
  (require 'wl)
  (wl-init)
  (add-to-list 'org-modules 'ol-wl)
  )
;; (after! wl
;;     (add-to-list 'org-modules 'ol-wl)
;;   )

(defalias '=wanderlust #'wl)

(use-package! wl
  :defer t
  :init
  (setq wl-demo nil
        wl-stay-folder-window t
        wl-init-file (expand-file-name "wl.el" doom-private-dir)
        wl-folders-file (expand-file-name "folders.wl" doom-private-dir))
  (setq wl-smtp-connection-type 'nil)
  (setq wl-smtp-posting-port 25)
  (setq wl-smtp-authenticate-type "plain")
  (setq wl-smtp-posting-user "chenli@uniontech.com")
  (setq wl-smtp-posting-server "smtp.263.net")
  (setq wl-local-domain "uniontech.com")
  :config

  ;; (setq wl-mime-charset 'gbk)

  (setq wl-subscribed-mailing-list
        '("wl@ml.gentei.org"
          "apel-ja@m17n.org"
          "libc-alpha@sourceware.org"
          "linux-alpha@vger.kernel.org"
          "linux-media@vger.kernel.org"
          "linux-mm@kvack.org"
          "linux-fsdevel@vger.kernel.org"
          "linux-kernel@vger.kernel.org"
          "linux-rtc@vger.kernel.org"
          "backports@vger.kernel.org"
          "linux-x11@vger.kernel.org"
          "linux-apps@vger.kernel.org"
          "linux-assembly@vger.kernel.org"
          "io-uring@vger.kernel.org"
          "linux-arch@vger.kernel.org"
          "kernel-testers@vger.kernel.org"
          "git-commits-head@vger.kernel.org"
          "linux-api@vger.kernel.org"
          "ceph-devel@vger.kernel.org"
          "linux-admin@vger.kernel.org"
          "kernel-packagers@vger.kernel.org"
          "dwarves@vger.kernel.org"
          "linux-gcc@vger.kernel.org"
          "linux-console@vger.kernel.org"
          "linux-c-programming@vger.kernel.org"
          "linux-gpio@vger.kernel.org"
          "linux-bluetooth@vger.kernel.org"
          "linux-efi@vger.kernel.org"
          "linux-doc@vger.kernel.org"
          "linux-kbuild@vger.kernel.org"
          "bpf@vger.kernel.org"
          "linux-btrace@vger.kernel.org"
          "linux-block@vger.kernel.org"
          "linux-fbdev@vger.kernel.org"
          "cgroups@vger.kernel.org"
          "linux-config@vger.kernel.org"
          "devicetree-spec@vger.kernel.org"
          "kernel-janitors@vger.kernel.org"
          "linux-hotplug@vger.kernel.org"
          "linux-kernel-announce@vger.kernel.org"
          "linux-kselftest@vger.kernel.org"
          "linux-kernel@vger.kernel.org"
          "linux-i2c@vger.kernel.org"
          "linux-laptop@vger.kernel.org"
          "linux-modules@vger.kernel.org"
          "linux-man@vger.kernel.org"
          "devicetree@vger.kernel.org"
          "linux-new-lists@vger.kernel.org"
          "linux-newbie@vger.kernel.org"
          "linux-next@vger.kernel.org"
          "linux-numa@vger.kernel.org"
          "linux-perf-users@vger.kernel.org"
          "linux-security-module@vger.kernel.org"
          "linux-pci@vger.kernel.org"
          "linux-serial@vger.kernel.org"
          "linux-sound@vger.kernel.org"
          "linux-standards@vger.kernel.org"
          "linux-trace-devel@vger.kernel.org"
          "linux-trace-users@vger.kernel.org"
          "live-patching@vger.kernel.org"
          "netdev@vger.kernel.org"
          "linux-smp@vger.kernel.org"
          "rcu@vger.kernel.org"
          "perfbook@vger.kernel.org"
          "selinux@vger.kernel.org"
          "trinity@vger.kernel.org"
          "util-linux@vger.kernel.org"
          "workflows@vger.kernel.org"
          "ltp@lists.linux.it"
          "emacs-mime-ja@m17n.org"))
  (setq wl-summary-indent-length-limit 300)
  (setq wl-summary-width 300)

  (setq wl-message-ignored-field-list
        '(".")
        wl-message-visible-field-list
        '("^\\(To\\|Cc\\):"
          "^Subject:"
          "^\\(From\\|Reply-To\\):"
          "^\\(Posted\\|Date\\):"
          "^Organization:"
          "^X-\\(Face\\(-[0-9]+\\)?\\|Weather\\|Fortune\\|Now-Playing\\):")
        wl-message-sort-field-list
        (append wl-message-sort-field-list
                '("^Reply-To" "^Posted" "^Date" "^Organization")))

  (defun user/wanderlust-set-user (user/mail
                                   user/inbox user/imap
                                   user/smtp-connection-type
                                   user/smtp-server
                                   user/smtp-port
                                   user/smtp-auth-type)
    "Configure Wanderlust to use \"FULLNAME\" <USERNAME@USER/MAIL.com>."
    (lambda (fullname username)
      (let* (
             (folder-template (format "\"%s@%s\"/%s" username user/mail user/imap))
             (email-address (concat username "@" user/mail))
             (email-inbox (concat user/inbox folder-template)))

        (add-to-list 'wl-user-mail-address-list email-address)

        (add-to-list 'wl-template-alist
                     `(,email-address
                       (wl-from . ,(concat fullname "<" email-address ">"))
                       ("From" . wl-from)
                       (wl-smtp-connection-type . ,user/smtp-connection-type)
                       (wl-smtp-posting-port . ,user/smtp-port)
                       (wl-smtp-authenticate-type . ,user/smtp-auth-type)
                       (wl-smtp-posting-user . ,email-address)
                       (wl-smtp-posting-server . ,user/smtp-server)
                       (wl-local-domain . ,user/mail)
                       (wl-default-folder . ,email-inbox)
                       ))
        ;; XXX: add check list here will cause auth fail somehow.
        (add-to-list 'wl-biff-check-folder-list email-inbox)
        (add-to-list 'wl-auto-check-folder-name email-inbox)))
    )

  ;; this is the only thing what end users need to do!

                                        ;these settings is required by aliyun's smtp, but it seems ok after once successing one time.

  (setq wl-mime-save-directory "/home/firstlove/projects/org/mime/")
  (setq shimbun-rss-hash-group-path-alist
        '(("xkcd" "https://xkcd.com/rss.xml")
          ("acgpiping" "http://www.acgpiping.net/feed/")
          ("interrupt-memfault" "https://interrupt.memfault.com/blog/feed.xml")
          ("moonlight" "http://feed.williamlong.info/")
          ("lwn" "https://lwn.net/headlines/rss")
          ("linuxjournal" "https://www.linuxjournal.com/node/feed")
          ("ffwll" "https://blog.ffwll.ch/feed.xml")
          ("biscuitos" "https://biscuitos.github.io/feed.xml")
          ("planet-kernel" "https://planet.kernel.org/rss10.xml")
          ))
  (setq wl-refile-rule-alist
        '(
          ("From"
           ("it@uniontech\\.com" . ".IT")
           ("Majordomo@vger\\.kernel\\.org" . ".archive")
           ;; (".*@uniontech\\.com" . ".colleague")
           ("*@deepin\\.com" . ".deepin")
           ("^PMS" . ".pms"))
          (("To" "Cc")
           ("chenli@uniontech\\.com" . ".ToOrCcMe")
           ("git-commits-head@vger\\.kernel\\.org" . ".git-commits-head")
           )
          (("Subject" "From" "To" "Cc")
           ("\\([a-zA-Z-]+\\)-owner@vger\\.kernel\\.org" . ".\\1")
           ("openssh-unix-dev" . ".openssh")
           ("libc-\\([a-zA-Z-]+\\)@sourceware\\.org" . ".libc-\\1" )
           ("emacs-\\([a-zA-Z-]+\\)@gnu\\.org" . ".emacs-\\1" )
           ("\\([a-zA-Z-]+\\)@lists.freedesktop.org" . ".\\1")
           ("ltp" . ".ltp")
           ("linux-mm@kvack\\.org" . ".linux-mm")
           ("^gitlab" . ".gitlab")
           )

          ))

  (setq user/wanderlust-set-yandex-user (user/wanderlust-set-user "yandex.com" "%[YANDEX]/Inbox:" "clean@imap.yandex.com:993!" ''ssl "smtp.yandex.com" 465 "plain"))
  (setq user/wanderlust-set-uniontech-user (user/wanderlust-set-user "uniontech.com" "%[WORK]/INBOX:" "clear@imap.263.net:143" ''nil "smtp.263.net" 25 "plain"))
  (setq user/wanderlust-set-foxmail-user (user/wanderlust-set-user "foxmail.com" "%[FOXMAIL]/Inbox:" "login@imap.qq.com:993!" ''ssl "smtp.qq.com" 465 "plain"))
  (setq user/wanderlust-set-privatemail-user (user/wanderlust-set-user "firstlove.life" "%[firstlove]/INBOX:" "clear@mail.privateemail.com:993!" ''ssl "mail.privateemail.com" 465 "plain"))
  (setq user/wanderlust-set-outlook-user (user/wanderlust-set-user "outlook.com" "%[OUTLOOK]/INBOX:" "clear@outlook.office365.com:993!" ''starttls "smtp.office365.com" 587 "login"))
  (setq user/wanderlust-set-126-user (user/wanderlust-set-user "126.com" "%[126]/Inbox:" "clear@imap.126.com!" ''starttls "smtp.126.com" 465 "clear"))
  (setq user/wanderlust-set-163-user (user/wanderlust-set-user "163.com" "%[163]/Inbox:" "clear@imap.163.com!" ''starttls "smtp.163.com" 465 "clear"))
  (setq user/wanderlust-set-yeah-user (user/wanderlust-set-user "yeah.net" "%[yeah]/Inbox:" "clear@imap.yeah.net:993!" ''starttls "smtp.yeah.net" 465 "clear"))
  (setq user/wanderlust-set-aliyun-user (user/wanderlust-set-user "aliyun.com" "%[ali]/Inbox:" "clear@imap.aliyun.com:993!" ''ssl "smtp.aliyun.com" 465 "login"))
  (setq user/wanderlust-set-ntu-user (user/wanderlust-set-user "hgxy.ntu.edu.cn" "%[ntu]/Inbox:" "clear@imap.exmail.qq.com:993!" ''ssl "smtp.exmail.qq.com" 465 "login"))
  (setq user/wanderlust-set-sina-user (user/wanderlust-set-user "sina.com" "%[sina]/Inbox:" "clear@imap.sina.com:993!" ''ssl "smtp.sina.com" 465 "login"))
  (setq user/wanderlust-set-gmail-user (user/wanderlust-set-user "gmail.com" "%[gmail]/Inbox:" "clear@imap.sina.com:993!" ''ssl "smtp.sina.com" 465 "login"))
  (setq user/wanderlust-set-yahoo-user (user/wanderlust-set-user "yahoo.com" "%[yahoo]/Inbox:" "clear@imap.mail.yahoo.com:993!" ''ssl "smtp.mail.yahoo.com" 465 "login"))
  (setq user/wanderlust-set-sohu-user (user/wanderlust-set-user "sohu.com" "%[sohu]/Inbox:" "clear@imap.sohu.com:43!" ''ssl "smtp.sohu.com" 25 "clear"))


  (funcall user/wanderlust-set-uniontech-user "Chen Li" "chenli")
  (funcall user/wanderlust-set-yandex-user "Chen Li" "firstlovelife")
  (funcall user/wanderlust-set-foxmail-user "Chen Li " "firstlovelife")
  (funcall user/wanderlust-set-privatemail-user "Chen Li " "czxyl")
  (funcall user/wanderlust-set-outlook-user "Chen Li" "chenli.firstlove")
  (funcall user/wanderlust-set-163-user "Chen Li" "18550451650")
  (funcall user/wanderlust-set-126-user "Chen Li" "firstlovelife")
  (funcall user/wanderlust-set-yeah-user "Chen Li" "firstlovelife")
  (funcall user/wanderlust-set-aliyun-user "Chen Li" "firstlovelife")
  (funcall user/wanderlust-set-ntu-user "Chen Li" "1508032018")
  (funcall user/wanderlust-set-sina-user "Chen Li" "firstlovelife")
  (funcall user/wanderlust-set-sohu-user "Chen Li" "firstlovelife")
  (funcall user/wanderlust-set-yahoo-user "Chen Li" "chenli.firstlove")

  (setq wl-summary-auto-refile-skip-marks nil)

  (setq elmo-imap4-default-authenticate-type 'clear)
  ;; (setq
  ;;  ssl-certificate-verification-policy 1
  ;;  ssl-program-name "gnutls-cli"
  ;;  ssl-program-arguments '("-p" service host))

  )


(set-docsets! 'asm-mode "arm64")
(set-docsets! 'cc-mode "arm64")
(after! cc-mode
  (set-docsets! 'cc-mode "arm64" "GLEXT" "OpenGL2" "OpenGL3" "OpenGL4" "OpenGL_GLSL")
  )
(after! ccls
  (setq ccls-sem-highlight-method 'overlay)
  (setq ccls-executable "/home/firstlove/projects/github/ccls/build/ccls")
  (ccls-use-default-rainbow-sem-highlight)
  )
(use-package! shr-tag-pre-highlight
  :after shr eww
  :config
  (add-to-list 'shr-external-rendering-functions
               '(pre . shr-tag-pre-highlight))
  (when (version< emacs-version "26")
    (with-eval-after-load 'eww
      (advice-add 'eww-display-html :around
                  'eww-display-html--override-shr-external-rendering-functions))))

(require 'shr-tag-pre-highlight)


(use-package! shrface
  :defer t
  :config
  (shrface-basic)
  (shrface-trial)
  (shrface-default-keybindings) ; setup default keybindings
  (setq shrface-href-versatile t))

(use-package! eww
  :defer t
  :init
  (add-hook 'eww-after-render-hook #'shrface-mode)
  :config
  ;; (require 'shrface)
  (map! :after shrface
        :map eww-mode-map
        :n "TAB" #'shrface-outline-cycle
        :n [tab] #'shrface-outline-cycle
        :n "S-<tab>" #'shrface-outline-cycle-buffer
        :n "C-t" #'shrface-toggle-bullets
        :n "C-j" #'shrface-next-headline
        :n "C-k" #'shrface-previous-headline
        :n "M-l" #'shrface-links-counsel
        :n "M-h" #'shrface-headline-counsel
        ))
(use-package! nov
  :defer t
  :init
  (add-hook 'nov-mode-hook #'shrface-mode)
  :config
  (require 'shrface)
  (setq nov-shr-rendering-functions '((img . nov-render-img) (title . nov-render-title)))
  (setq nov-shr-rendering-functions (append nov-shr-rendering-functions shr-external-rendering-functions))
  (require 'shrface)
  (map! :after shrface
        :map nov-mode-map
        :n "TAB" #'shrface-outline-cycle
        :n [tab] #'shrface-outline-cycle
        :n "S-<tab>" #'shrface-outline-cycle-buffer
        :n "C-t" #'shrface-toggle-bullets
        :n "C-j" #'shrface-next-headline
        :n "C-k" #'shrface-previous-headline
        :n "M-l" #'shrface-links-counsel
        :n "M-h" #'shrface-headline-counsel
        )
  )

;; (with-eval-after-load 'nov
;;   (define-key nov-mode-map (kbd "<tab>") 'shrface-outline-cycle)
;;   (define-key nov-mode-map (kbd "S-<tab>") 'shrface-outline-cycle-buffer)
;;   (define-key nov-mode-map (kbd "C-t") 'shrface-toggle-bullets)
;;   (define-key nov-mode-map (kbd "C-j") 'shrface-next-headline)
;;   (define-key nov-mode-map (kbd "C-k") 'shrface-previous-headline)
;;   (define-key nov-mode-map (kbd "M-l") 'shrface-links-counsel) ; or 'shrface-links-helm
;;   (define-key nov-mode-map (kbd "M-h") 'shrface-headline-counsel)) ; or 'shrface-headline-helm
;; (with-eval-after-load 'eww
;;   (define-key eww-mode-map (kbd "<tab>") 'shrface-outline-cycle)
;;   (define-key eww-mode-map (kbd "S-<tab>") 'shrface-outline-cycle-buffer)
;;   (define-key eww-mode-map (kbd "C-t") 'shrface-toggle-bullets)
;;   (define-key eww-mode-map (kbd "C-j") 'shrface-next-headline)
;;   (define-key eww-mode-map (kbd "C-k") 'shrface-previous-headline)
;;   (define-key eww-mode-map (kbd "M-l") 'shrface-links-counsel) ; or 'shrface-links-helm
;;   (define-key eww-mode-map (kbd "M-h") 'shrface-headline-counsel)) ; or 'shrface-headline-helm


(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
