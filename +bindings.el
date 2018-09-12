(require 'netease-music)
(map!
 ;; localleader
 :m ","    nil
:nm "f" #'avy-goto-char-2

 (:map netease-music-mode-map
   :n "RET" #'netease-music-jump-into
   :n "l" #'netease-music-i-like-it
   :n "n" #'netease-music-play-next
   :n "p" #'netease-music-toggle
   :n "q" #'quit-window
   ))
