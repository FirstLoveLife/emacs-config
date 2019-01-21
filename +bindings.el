    ;;; private/my/+bindings.el -*- lexical-binding: t; -*-
;; (map!
;;  :ien "C-x w" #'elfeed
;;  )

(map!
 :inve "C-M-f" #'font-lock-mode
 )
(map! :after company
      :i "C-c C-f" #'company-files)

;; (map! :after org
;;       :nmvie "M-[" #'org-ref-insert-link)

;; (map! :after org-ref
;;       :nmvie "C-M-[" #'doi-insert-bibtex
;;       :nmvie "M-[" #'crossref-add-bibtex-entry)

(map!
      :nmvie "C-n" #'switch-to-next-buffer
      :nmvie "C-p" #'switch-to-prev-buffer)

(map! :after org-brain
 :leader
 :inv "ob" #'org-brain-visualize)

(map! :after lsp-ui
      :inv "M-n" #'lsp-ui-peek-jump-forward
      :inv "M-p" #'lsp-ui-peek-jump-backward
      :inv "M-[" #'lsp-ui-peek-find-definitions
      :inv "M-]" #'lsp-ui-peek-find-implementation
      )
(map! :after flymake
      :nmvie "C-c ! n" #'flymake-goto-next-error)
(map! :after avy
     :nm "f" #'avy-goto-char-2
      )
(map! :after helm-projectile
      :ine "C-M-r" #'helm-projectile-rg)


(map! :after persp-mode
      :nmvie "C-;" #'+workspace/switch-to
      :nmvie "C-x b" #'+helm/workspace-buffer-list
      :nmvie "M-1"(lambda! (+workspace/switch-to 0))
      :nmvie "M-2"(lambda! (+workspace/switch-to 1))
      :nmvie "M-3"(lambda! (+workspace/switch-to 2))
      :nmvie "M-4"(lambda! (+workspace/switch-to 3))
      :nmvie "M-5"(lambda! (+workspace/switch-to 4))
      :nmvie "M-6"(lambda! (+workspace/switch-to 5))
      :nmvie "M-7"(lambda! (+workspace/switch-to 6))
      :nmvie "M-8"(lambda! (+workspace/switch-to 7))
      :nmvie "M-9"(lambda! (+workspace/switch-to 8))
 )

;; (map! :after cc-mode
;;       :map c++-mode-map
;;       :leader
;;       :nv "ih" #'my/cpp-auto-include)
(map!
 :after lsp-mode
 :inve "C-M-l" #'lsp
 )

(map!
 :after ccls
 :localleader
 ;; $ccls/inheritance
 :desc "direct bases"  :n "b" (λ! (ccls/base 1))
 :desc "base 3" :n "B" (λ! (ccls/base 3))
 :desc "direct derived" :n "d" (λ! (ccls/derived 1))
 :desc "derived 3" :n "D" (λ! (ccls/derived 3))

 (:desc "references" :prefix "r"
   :desc "macro expansions" :n "m" #'ccls/references-macro
   :desc "read" :n "r" #'ccls/references-read
   :desc "write" :n "w" #'ccls/references-write
   :desc "Call bit (e.g. where functions are taken addresses)" :n "n" #'ccls/references-not-call)

 :desc "base" :n "i" #'ccls-inheritance-hierarchy
 :desc "derived" :n "I" (λ! (ccls-inheritance-hierarchy t))


 ;; $ccls/call
 :desc "caller" :n "c" #'ccls/caller
 :desc "callee":n "C" #'ccls/callee
 ;; caller hierarchy
 :desc "caller hierarchy" :n "e" #'ccls-call-hierarchy
 ;; callee hierarchy
 :desc "callee hierarchy" :n "E" (λ! (ccls-call-hierarchy t))

 ;; $ccls/member
 :desc "nested classes/namespace members" :n "s" (λ! (ccls/member 2))
 :desc "member functions / functions in a namespace" :n "f" (λ! (ccls/member 3))
 :desc "member variables" :n "m" (λ! (ccls/member 0))
 :desc "hierarchy" :n "M" #'ccls-member-hierarchy

 :desc "code-lens" :n "L" #'ccls-code-lens-mode
 :n "t" #'lsp-goto-type-definition
 ;; https://github.com/maskray/ccls/blob/master/src/messages/ccls_vars.cc#L15
 :desc "field or local variable" :n "v" (λ! (ccls/vars 3))
 :desc "field" :n "V" (λ! (ccls/vars 1))
 :desc "any" :n "C-v" (λ! (ccls/vars 7))
 )

(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map (read-kbd-macro evil-toggle-key) 'evil-normal-state)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
