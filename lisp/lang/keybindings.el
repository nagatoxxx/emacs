(my/leader
  ; lsp
  "l"   '(:ignore t :which-key "lsp")
  "lr"  '(lsp-rename :which-key "rename symbol")
  "lf"  '(:ignore t :which-key "find")
  "lfd" '(lsp-find-definition :which-key "symbol definition")
  "lfr" '(lsp-find-references :which-key "symbol references")
  "ld"  '(lsp-describe-thing-at-point :which-key "describe")

  ; diagnostics
  "d"  '(:ignore t :which-key "diagnostics")
  "dl" '(flycheck-list-errors :which-key "list errors")
  "dn" '(flycheck-next-error :which-key "go to next error")
  "dp" '(flycheck-previous-error :which-key "go to prev error"))

(provide 'lang/keybindings)
