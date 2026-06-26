; ============================ ;
;          keybindings         ;
; ============================ ;

(with-eval-after-load 'company
  (define-key company-active-map (kbd "TAB") nil)
  (define-key company-active-map (kbd "<tab>") nil))

(with-eval-after-load 'evil                                                                    
  (define-key evil-normal-state-map (kbd "<mouse-3>") #'context-menu-open)                     
  (define-key evil-visual-state-map (kbd "<mouse-3>") #'context-menu-open)                     
  (define-key evil-insert-state-map (kbd "<mouse-3>") #'context-menu-open)                     
  (define-key evil-motion-state-map (kbd "<mouse-3>") #'context-menu-open))                    

(my/leader
  ; custom
  "m"  '(:ignore t :which-key "my")
  "mn" '(my/toggle-notes :which-key "toggle notes")
  "mt" '(my/toggle-vterm :which-key "toggle vterm")

  ; popper
  "p"  '(:ignore t :which-key "popper")
  "pt" '(popper-toggle :which-key "toggle popup")
  "pc" '(popper-cycle :which-key "cycle popup")

  ; git
  "g"  '(:ignore t :which-key "git")
  "gs" '(magit-status :which-key "show status")
  "gh" '(diff-hl-show-hunk :which-key "show hunk diff")

  ; lsp
  "l"   '(:ignore t :which-key "lsp")
  "lr"  '(lsp-rename :which-key "rename symbol")
  "lf"  '(:ignore t :which-key "find")
  "lfd" '(lsp-find-definition :which-key "symbol definition")
  "lfr" '(lsp-find-references :which-key "symbol references")

  ; diag
  "d"  '(:ignore t :which-key "diagnostics")
  "dl" '(flycheck-list-errors :which-key "list errors")
  "dn" '(flycheck-next-error :which-key "go to next error")
  "dp" '(flycheck-previous-error :which-key "go to prev error")

  ; windows
  "|" '(split-window-right :which-key "split window right")
  "-" '(split-window-right :which-key "split window below")
  "q" '(delete-window :which-key "kill window")

  ; consult
  "c"  '(:ignore t :which-key "consult")
  "cb" '(consult-buffer :which-key "show buffers")
  "ci" '(consult-imenu :which-key "show imenu")
  "cf" '(consult-find :which-key "find file")
  "cg" '(consult-ripgrep :which-key "grep")

  ; treemacs
  "t"  '(:ignore t :which-key "treemacs")
  "tt" '(treemacs :which-key "toggle files tree")

  ; navigation
  "w" '(evil-avy-goto-word-0 :which-key "go to word")
  )

(provide 'keybindings)
