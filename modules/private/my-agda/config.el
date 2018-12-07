(def-package! agda-input
  :defer 5
  :load-path
  "~/.doom.d/modules/private/my-agda/"
  :config
  (setq-default default-input-method "Agda"))

(def-package! agda2-mode
  ;; This declaration depends on the load-path established by agda-input.
  :mode "\\.agda\\'"
  :load-path
  "~/.doom.d/modules/private/my-agda/"
  :bind (:map agda2-mode-map
              ("C-c C-i" . agda2-insert-helper-function))
  :preface
  (defun agda2-insert-helper-function (&optional prefix)
    (interactive "P")
    (let ((func-def (with-current-buffer "*Agda information*"
                      (buffer-string))))
      (save-excursion
        (forward-paragraph)
        (let ((name (car (split-string func-def " "))))
          (insert "  where\n    " func-def "    " name " x = ?\n"))))))
