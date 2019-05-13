;;; Compiled snippets and support files for `c++-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'c++-mode
                     '(("cfoff" "// clang-format off" "turn off clang-format" nil nil nil "/home/firstlove/.doom.d/snippets/c++-mode/turn-off-clang-format" nil nil)
                       ("cfon" "// clang-format on" "turn on clang-format" nil nil nil "/home/firstlove/.doom.d/snippets/c++-mode/open-clang-format" nil nil)
                       ("test" "TEST_CASE(\"${`(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))`}\")\n{\n    $0\n}" "TEST_CASE" nil nil nil "/home/firstlove/.doom.d/snippets/c++-mode/TEST_CASE" nil nil)
                       ("trigger-key" "" "" t nil nil "/home/firstlove/.doom.d/snippets/c++-mode/+new-snippet+" nil nil)))


;;; Do not edit! File generated at Sun May 12 17:14:53 2019
