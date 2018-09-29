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
 :i "M-9"(lambda! (+workspace/switch-to 8)))
(after! c++-mode
 (map!
    :map c++-mode-map
    :leader
    (:desc "insert" :prefix "i"
      (:when (featurep! :completion helm)
        :desc "From kill-ring"        :nv "y" #'helm-show-kill-ring)
      (:when (featurep! :completion ivy)
        :desc "From kill-ring"        :nv "y" #'counsel-yank-pop
        :desc "From evil registers"   :nv "r" #'counsel-evil-registers)
      :desc "From snippet"          :nv "s" #'yas-insert-snippet
      :desc "Include header and format buffer" :nv "h" (lambda! (my/cpp-auto-include)))) )
