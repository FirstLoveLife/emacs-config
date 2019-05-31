;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("sel%" "**  $2\\{\\{c1::$1%\\}\\}\n*** Q\n$2 {{c1::${1:答案}%}}\n*** A\n$1%\n$3%\n$4%\n$5%\n" "select%" t nil nil "/home/firstlove/.doom.d/snippets/org-mode/select%" nil nil)
                       ("sel" "**  $2\\{\\{c1::$1\\}\\}\n*** Q\n$2 {{c1::${1:答案}}}\n*** A\n$1\n$3\n$4\n$5\n" "select" t nil nil "/home/firstlove/.doom.d/snippets/org-mode/select" nil nil)
                       ("jd-wa" "** $1\n:PROPERTIES:\n:ANKI_DECK: water\n:ANKI_NOTE_TYPE: Basic\n:END:\n*** Front\n$1\n*** Back\n$2" "jianda" nil nil nil "/home/firstlove/.doom.d/snippets/org-mode/jianda-wa" nil nil)
                       ("jd" "* $1\n:PROPERTIES:\n:ANKI_DECK: gufei\n:ANKI_NOTE_TYPE: Basic\n:END:\n** Front\n$1\n** Back\n$2" "jianda" nil nil nil "/home/firstlove/.doom.d/snippets/org-mode/gufei" nil nil)
                       ("clo-w" "** $1{{c1::$2}}$3\n:PROPERTIES:\n:ANKI_DECK: water\n:ANKI_NOTE_TYPE: Cloze\n:END:\n*** Text\n$1{{c1::$2}}$3\n*** Extra\n" "cloze-water" t nil nil "/home/firstlove/.doom.d/snippets/org-mode/cloze-w" nil nil)
                       ("clo-b" "** $1{{c1::$2}}$3\n:PROPERTIES:\n:ANKI_DECK: biog\n:ANKI_NOTE_TYPE: Cloze\n:END:\n*** Text\n$1{{c1::$2}}$3\n*** Extra\n" "cloze-biog" t nil nil "/home/firstlove/.doom.d/snippets/org-mode/cloze-b" nil nil)
                       ("clo-w" "** $1{{c1::$2}}\n:PROPERTIES:\n:ANKI_DECK: water\n:ANKI_NOTE_TYPE: Cloze\n:END:\n*** Text\n$1{{c1::$2}}\n*** Extra\n" "cloze-water" t nil nil "/home/firstlove/.doom.d/snippets/org-mode/cloze" nil nil)
                       ("<2" "** ${1:front}\n:PROPERTIES:\n:ANKI_DECK: 刑法\n:ANKI_NOTE_TYPE: Basic\n:END:\n*** Front\n$1\n*** Back\n${}" "<2" nil nil nil "/home/firstlove/.doom.d/snippets/org-mode/<2" nil nil)))


;;; Do not edit! File generated at Sat May 25 09:45:50 2019
