(with-eval-after-load 'company
  (define-key company-active-map (kbd "TAB") nil)
  (define-key company-active-map (kbd "<tab>") nil))

(my/leader
  ; git
  "g"  '(:ignore t :which-key "git")
  "gs" '(magit-status :which-key "show status")
  "gh" '(diff-hl-show-hunk :which-key "show hunk diff")

  ; consult
  "c"  '(:ignore t :which-key "consult")
  "cb" '(consult-buffer :which-key "show buffers")
  "ci" '(consult-imenu :which-key "show imenu")
  "cf" '(consult-find :which-key "find file")
  "cg" '(consult-ripgrep :which-key "grep")

  ; treemacs
  "t"  '(:ignore t :which-key "treemacs")
  "tt" '(treemacs :which-key "toggle files tree")

  ; custom
  "m"  '(:ignore t :which-key "my")
  "mn" '(my/toggle-notes :which-key "toggle notes")
  "mt" '(my/toggle-vterm :which-key "toggle vterm")

  ; popper
  ; "p"  '(:ignore t :which-key "popper")
  ; "pt" '(popper-toggle :which-key "toggle popup")

  ; windows
  "|" '(split-window-right :which-key "split window right")
  "-" '(split-window-below :which-key "split window below")
  "q" '(delete-window :which-key "kill window")

  ; navigation
  "w" '(evil-avy-goto-word-0 :which-key "go to word"))

(provide 'workspace/keybindings)
