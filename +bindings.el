;;; private/my/+bindings.el -*- lexical-binding: t; -*-


(require 'persp-mode)
(map!

 ;; localleader
 :m ","    nil
 :nm "f" #'avy-goto-char-2
 :i "M-1"(lambda! (+workspace/switch-to 0))
 :i "M-2"(lambda! (+workspace/switch-to 1))
 :i "M-3"(lambda! (+workspace/switch-to 2))
 :i "M-4"(lambda! (+workspace/switch-to 3))
 :i "M-5"(lambda! (+workspace/switch-to 4))
 :i "M-6"(lambda! (+workspace/switch-to 5))
 :i "M-7"(lambda! (+workspace/switch-to 6))
 :i "M-8"(lambda! (+workspace/switch-to 7))
 :i "M-9"(lambda! (+workspace/switch-to 8)))
