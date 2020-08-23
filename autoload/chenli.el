;;; ~/.config/doom/autoload/chenli.el -*- lexical-binding: t; -*-

;;;###autoload
(defun chunyang-toggle-frame-transparency ()
  (interactive)
  (if (equal (frame-parameter nil 'alpha) 85)
      (set-frame-parameter nil 'alpha 100)
    (set-frame-parameter nil 'alpha 85)))

;;;###autoload
(defun my-c++-mode-check-buffers ()
  "Conditionally enable `rjsx-mode' based on file contents."
  (save-excursion
    (goto-char (point-min))
    (when (and (re-search-forward "^#include" nil t) (eq (count-lines (point-min) (point-max)) 1))
      (c++-mode))))
