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

;;;###autoload
(defun x11-yank-image-at-point-as-image ()
  "Yank the image at point to the X11 clipboard as image/png."
  (interactive)
  (let ((image (get-text-property (point) 'display)))
    (if (eq (car image) 'image)
        (let ((data (plist-get (cdr image) ':data))
              (file (plist-get (cdr image) ':file)))
          (cond (data
                 (with-temp-buffer
                   (insert data)
                   (call-shell-region
                    (point-min) (point-max)
                    "xclip -i -selection clipboard -t image/png")))
                (file
                 (if (file-exists-p file)
                     (start-process
                      "xclip-proc" nil "xclip"
                      "-i" "-selection" "clipboard" "-t" "image/png"
                      "-quiet" (file-truename file))))
                (t
                 (message "The image seems to be malformed."))))
      (message "Point is not at an image."))))

