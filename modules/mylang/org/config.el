;;; mylang/org/config.el -*- lexical-binding: t; -*-

(after! org-protocol
  (add-to-list 'org-capture-templates
               '("w" "org-protocol" entry (file "~/projects/org/refile.org")
                 "* TODO Review %a\n%U\n%:initial\n" :immediate-finish t)
               ;; '("j" "Journal" entry
               ;;   (file+olp+datetree (journal-file-today))
               ;;  "* %U %?\n%i\n%a" :prepend t)
               )
  (setq org-protocol-default-template-key "w")
  )

(after! deft
  (setq deft-directory (expand-file-name "deft/" org-directory)))



(add-to-list 'org-modules 'org-protocol t)

;;; :lang org
(setq org-directory "~/projects/org/"
      org-archive-location (concat org-directory "archive/%s::")
      org-ellipsis " ▼ "
      ;; org-bullets-bullet-list '("☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷" "☷" "☷" "☷")
      )

(after! org-journal
  (add-to-list 'org-agenda-files org-journal-dir)
  (setq org-agenda-file-regexp "\\`\\\([^.].*\\.org\\\|[0-9]\\\{8\\\}\\\(\\.gpg\\\)?\\\)\\'")
  (setq org-journal-enable-agenda-integration t)
  )

;(map!
; (
;  :map general-override-mode-map
;  :prefix uos/leader
;  (
;   (:prefix ("n" . "notes")
;     (:prefix ("c" . "en/decrypt")
;       :n      "e" #'org-encrypt-entry
;       :n "d" #'org-decrypt-entry)))))

(after! org
  (pushnew! org-capture-templates
               '("j" "Journal" entry
                 (file+olp+datetree get-journal-file-today)
                 "* %U %?\n%i\n%a" :prepend t))

  (setf (alist-get 'file org-link-frame-setup) #'uos/org-open-other-workspace)
  )
