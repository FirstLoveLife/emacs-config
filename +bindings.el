    ;;; private/my/+bindings.el -*- lexical-binding: t; -*-


    (require 'persp-mode)
    (map!
     :nm "f" #'avy-goto-char-2
     :i "M-1"(lambda! (+workspace/switch-to 0))
     :i "M-2"(lambda! (+workspace/switch-to 1))
     :i "M-3"(lambda! (+workspace/switch-to 2))
     :i "M-4"(lambda! (+workspace/switch-to 3))
     :i "M-5"(lambda! (+workspace/switch-to 4))
     :i "M-6"(lambda! (+workspace/switch-to 5))
     :i "M-7"(lambda! (+workspace/switch-to 6))
     :i "M-8"(lambda! (+workspace/switch-to 7))
     :i "M-9"(lambda! (+workspace/switch-to 8))

     ;:map c++-mode-map
     ;  :leader
     ;  :desc "Include header and format buffer" :nv "ih" (lambda! (my/cpp-auto-include)) 
     )


(map! :after cc-mode
      :map c++-mode-map
      :leader
      :nv "ih" #'my/cpp-auto-include)

(map! :after lispy
      :map lispy-mode-map
      :n "<" #'lispy-slurp-or-barf-left
      :n ">" #'lispy-slurp-or-barf-right)
