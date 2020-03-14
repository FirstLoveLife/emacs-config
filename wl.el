;;; ~/.config/doom/wl.el -*- lexical-binding: t; -*-

(setq wl-smtp-connection-type 'nil)
(setq wl-smtp-posting-port 25)
(setq wl-smtp-authenticate-type "plain")
(setq wl-smtp-posting-user "chenli@uniontech.com")
(setq wl-smtp-posting-server "smtp.263.net")
(setq wl-local-domain "uniontech.com")

;; (setq
;;  wl-smtp-connection-type 'ssl
;;  wl-smtp-posting-port 465
;;  wl-smtp-authenticate-type "plain"
;;  wl-smtp-posting-user "chenli"
;;  wl-smtp-posting-server "mail.privateemail.com"
;;  wl-local-domain "privateemail.com"
;;  wl-message-id-domain "mail.privateemail.com")

;; 更加复杂的多账号设置
(setq wl-user-mail-address-list (quote ("chenli@uniontech.com" "czxyl@firstlove.life")))

(setq wl-draft-config-alist
      '(((string-match "uniontech.com" wl-draft-parent-folder)
         (template . "uniontech"))
        ((string-match "mail.privateemail.com" wl-draft-parent-folder)
         (template . "firstlove.life"))
        ;; automatic for replies
        (reply "\\(To\\|Cc\\|Delivered-To\\): uniontech"
               (template . "uniontech"))
        (reply "\\(To\\|Cc\\|Delivered-To\\): firstlove.life"
               (template . "firstlove.life"))))

(setq wl-template-alist
      '(("uniontech"
         (wl-smtp-connection-type . 'nil)
         (wl-smtp-posting-port . 25)
         (wl-smtp-authenticate-type . "plain")
         (wl-smtp-posting-user . "chenli@uniontech.com")
         (wl-smtp-posting-server . "smtp.263.net")
         (wl-local-domain . "uniontech.com")

         )
        ("firstlove.life"
         ;; ("Fcc" . "%INBOX.Sent:\"czxyl@firstlove.life\"/clear@mail.privateemail.com")
         (wl-from . "陈力 <chenli@firstlove.com>")
         (wl-smtp-posting-user . "czxyl@firstlove.life")
         (wl-smtp-connection-type 'ssl)
         (wl-smtp-authenticate-type . "plain")
         (wl-smtp-posting-server . "mail.privateemail.com")
         (wl-local-domain . "mail.privateemail.com"))
        (wl-smtp-posting-port . 465)
        ))