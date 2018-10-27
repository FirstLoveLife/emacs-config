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

     :inv "M-n" #'lsp-ui-peek-jump-forward
     :inv "M-p" #'lsp-ui-peek-jump-backward
     :inv "M-[" #'lsp-ui-peek-find-definitions
     :inv "M-]" #'lsp-ui-peek-find-implementation

                                            ;:map c++-mode-map
                                            ;  :leader
                                            ;  :desc "Include header and format buffer" :nv "ih" (lambda! (my/cpp-auto-include))
     )

    (map!
     ;; localleader
     :m ","    nil

     ;; (:map prog-mode-map
     ;;   :nevi "C-M-f" #'lispy-down
     ;;   :nevi "C-M-b" #'lispy-up
     ;;   :nevi "C-M-u" #'lispy-left
     ;;   :nevi "C-M-n" #'lispy-right
     ;;   :nevi "M-r" #'lispy-raise
     ;;   :nevi "C-)" #'lispy-forward-slurp-sexp
     ;;   :nevi "C-<right>" #'lispy-forward-slurp-sexp
     ;;   :nevi "C-}" #'lispy-forward-barf-sexp
     ;;   :nevi "C-<left>" #'lispy-forward-barf-sexp
     ;;   :nevi "C-(" #'lispy-backward-slurp-sexp
     ;;   :nevi "C-M-<left>" #'lispy-backward-slurp-sexp
     ;;   :nevi "C-{" #'lispy-backward-barf-sexp

     ;;   :nevi "C-M-<right>" #'lispy-backward-barf-sexp

     ;;   :nevi "M-<up>"  #'lispy-splice-sexp-killing-backward
     ;;   :nevi "M-<down>"  #'lispy-splice-sexp-killing-forward

     ;;   :nevi "M-S"       #'lispy-split
     ;;   :nevi "M-J"       #'lispy-join

     ;;   :nevi "C-M-f"     #'lispy-forward
     ;;   :nevi "C-M-b"     #'lispy-backward


     ;;   :nevi "C-k"       #'lispy-kill
     ;;   :nevi "C-j"       #'lispy-newline-and-indent
     ;;   )
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

    (map!
     :after ccls
     :localleader
     :n ";" (λ! (+my/avy-document-symbol t) (+my/find-references))

     ;; $ccls/inheritance
     :n "b1" (λ! (ccls/base 1))
     :n "b3" (λ! (ccls/base 3))
     :n "d1" (λ! (ccls/derived 1))
     :n "d3" (λ! (ccls/derived 3))
     :n "ihb" #'ccls-inheritance-hierarchy        ; base hierarchy
     :n "ihd" (λ! (ccls-inheritance-hierarchy t)) ; derived hierarchy

     ;; $ccls/call
     :n "cr" #'ccls/caller
     :n "ce" #'ccls/callee
     ;; caller hierarchy
     :n "chr" #'ccls-call-hierarchy
     ;; callee hierarchy
     :n "che" (λ! (ccls-call-hierarchy t))

     :n "ra" #'ccls/references-address
     :n "rnc" #'ccls/references-not-call
     :n "pf" #'ccls-preprocess-file
     :n "rl" #'ccls-reload
     :n "rm" #'ccls/references-macro
     :n "rr" #'ccls/references-read
     :n "rw" #'ccls/references-write

     ;; $ccls/member
     :n "m2" (λ! (ccls/member 2))      ; 2 (Type) => nested classes/namespace members
     :n "m3" (λ! (ccls/member 3))      ; 3 (Func) => member functions
     :n "m0" (λ! (ccls/member 0))      ; other => member variables
     :n "mh" #'ccls-member-hierarchy

     :n "L" #'ccls-code-lens-mode
     ;; https://github.com/maskray/ccls/blob/master/src/messages/ccls_vars.cc#L15
     :n "v3" (λ! (ccls/vars 3))              ; field or local variable
     :n "v1" (λ! (ccls/vars 1))              ; field
     :n "v7" (λ! (ccls/vars 7)))

(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map (read-kbd-macro evil-toggle-key) 'evil-normal-state)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
