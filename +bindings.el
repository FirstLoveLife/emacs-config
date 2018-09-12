(map!
 ;; localleader
 :m ","    nil
 :nm "f" #'avy-goto-char-2)


(evil-define-key
  'normal
  netease-music-mode-map
  (kbd "RET")
  'netease-music-jump-into)
(evil-define-key
  'normal
  netease-music-mode-map
  (kbd "l")
  'netease-music-i-like-it)
(evil-define-key
  'normal
  netease-music-mode-map
  (kbd "n")
  'netease-music-play-next)
(evil-define-key
  'normal
  netease-music-mode-map
  (kbd "p")
  'netease-music-toggle)
(evil-define-key
  'normal
  netease-music-mode-map
  (kbd "q")
  'quit-window)
