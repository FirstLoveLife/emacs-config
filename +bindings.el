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

(map!
 ;; localleader
 :m ","    nil

 (:map prog-mode-map
   :nevi "C-M-f" #'lispy-down
   :nevi "C-M-b" #'lispy-up
   :nevi "C-M-u" #'lispy-left
   :nevi "C-M-n" #'lispy-right
   :nevi "M-r" #'lispy-raise
   :nevi "M-?" #'lispy-convolute
   :nevi "C-)" #'lispy-forward-slurp-sexp
   :nevi "C-<right>" #'lispy-forward-slurp-sexp
   :nevi "C-}" #'lispy-forward-barf-sexp
   :nevi "C-<left>" #'lispy-forward-barf-sexp
   :nevi "C-(" #'lispy-backward-slurp-sexp
   :nevi "C-M-<left>" #'lispy-backward-slurp-sexp
   :nevi "C-{" #'lispy-backward-barf-sexp
   :nevi "C-M-<right>" #'lispy-backward-barf-sexp

   :nevi "M-<up>"  #'lispy-splice-sexp-killing-backward
   :nevi "M-<down>"  #'lispy-splice-sexp-killing-forward

   :nevi "M-S"       #'lispy-split
   :nevi "M-J"       #'lispy-join

   :nevi "C-M-f"     #'lispy-forward
   :nevi "C-M-b"     #'lispy-backward


   :nevi "C-k"       #'lispy-kill
   :nevi "C-j"       #'lispy-newline-and-indent
   )
 )


(map! :after cc-mode
      :map c++-mode-map
      :leader
      :nv "ih" #'my/cpp-auto-include
      :nv "lfpr" #'lsp-ui-find-prev-reference
      :nv "lgi" #'lsp-goto-implementation
      :nv "lgtd" #'lsp-goto-type-definition
      :nv "lfnr" #'lsp-ui-find-next-reference
      :nv "lpfr" #'lsp-ui-peek-find-references
      :nv "lpfd" #'lsp-ui-peek-find-definitions
      :nv "lpfi" #'lsp-ui-peek-find-implementation)
