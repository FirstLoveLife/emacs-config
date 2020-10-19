;;; ~/.config/doom/wl.el -*- lexical-binding: t; -*-

(setq wl-smtp-connection-type 'nil)
(setq wl-smtp-posting-port 25)
(setq wl-smtp-authenticate-type "plain")
(setq wl-smtp-posting-user "chenli@uniontech.com")
(setq wl-smtp-posting-server "smtp.263.net")
(setq wl-local-domain "uniontech.com")

(setq wl-subscribed-mailing-list
      '("wl@ml.gentei.org"
        "apel-ja@m17n.org"
        "libc-alpha@sourceware.org"
        "linux-alpha@vger.kernel.org"
        "linux-media@vger.kernel.org"
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

(setq wl-refile-rule-alist
      '(("x-ml-name"
         ("^Wanderlust" . ".wl")
         ("^Elisp" . ".elisp"))
        ;; (("To" "Cc")
        ;;  ("\\([a-z]+\\)@gohome\\.org" . "+\\1"))
        ;; ("From"
        ;;  ("me@gohome\\.org" . ("To" ("you@gohome\\.org" .
        ;;                              "+from-me-to-you"))))
        (("To")
         ("chenli@uniontech\\.com" . ".ToMe")
         ("git-commits-head@vger\\.kernel\\.org" . ".git-commits-head"))
        (("Cc")
         ("chenli@uniontech\\.com" . ".CcMe")
         ("libc-\\([a-zA-z]+\\)@sourceware\\.org" . "%[WORK]\\/\\.gnu-libc\\/.\\1" )
         )
        (("Subject" "To")
         ("\\([a-zA-Z-]+\\)-owner@vger\\.kernel\\.org" . ".\\1")
         ("openssh-unix-dev" . ".openssh")
         ("libc-\\([a-zA-z]+\\)@sourceware\\.org" . "%[WORK]\\/\\.gnu-libc\\/.\\1")
         )
        ( ("From")
          ("it@uniontech.com" . ".IT")
          ("PMS" . "+PMS")
          ("Majordomo@vger\\.kernel\\.org" . ".archive")
          (".*@uniontech.com" . ".colleague")
          ("*@deepin.com" . ".deepin")
          )
        ))

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
      ;; (add-to-list 'wl-biff-check-folder-list email-inbox)
      (add-to-list 'wl-auto-check-folder-name email-inbox)))
  )
(setq user/wanderlust-set-yandex-user (user/wanderlust-set-user "yandex.com" "%[YANDEX]/Inbox" "clean@imap.yandex.com:993!" ''ssl "smtp.yandex.com" 465 "cram-md5"))
(setq user/wanderlust-set-uniontech-user (user/wanderlust-set-user "uniontech.com" "%[WORK]/INBOX" "clear@imap.263.net:143" ''nil "smtp.263.net" 25 "cram-md5"))
(setq user/wanderlust-set-foxmail-user (user/wanderlust-set-user "foxmail.com" "%[FOXMAIL]/Inbox" "login@imap.qq.com:993!" ''ssl "smtp.qq.com" 465 "cram-md5"))
(setq user/wanderlust-set-privatemail-user (user/wanderlust-set-user "firstlove.life" "%[shit]/INBOX" "clear@mail.privateemail.com:993!" ''ssl "mail.privateemail.com" 465 "cram-md5"))

(funcall user/wanderlust-set-uniontech-user "Chen Li" "chenli")
(funcall user/wanderlust-set-yandex-user "Chen Li" "firstlovelife")
(funcall user/wanderlust-set-foxmail-user "Chen Li " "firstlovelife")
(funcall user/wanderlust-set-privatemail-user "Chen Li " "czxyl")

(setq wl-summary-auto-refile-skip-marks nil)
