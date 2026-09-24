;;; -*- lexical-binding: t; -*-
(defun my-open-config ()
  "open init.el"
  (interactive)
  (find-file (locate-user-emacs-file "init.el")))

(defun my-flymake-show-buffer-diagnostics ()
  "show diagnostics list"
  (interactive)
  (flymake-show-buffer-diagnostics (car (flymake-diagnostics (point)))))

(my-leader
  "SPC" '(projectile-find-file               :wk "find file in project")
  ":"   '(execute-extended-command           :wk "M-x")
  "w"   '(evil-avy-goto-word-0               :wk "jump to word")
  "|"   '(evil-window-vsplit                 :wk "split right")
  "_"   '(evil-window-split                  :wk "split below")

  ;; buffers
  "b"  '(:ignore t            :wk "buffer")
  "bb" '(consult-buffer       :wk "switch")
  "br" '(revert-buffer-quick  :wk "revert")

  ;; files
  "f"  '(:ignore t            :wk "file")
  "ff" '(find-file            :wk "find")
  "fR" '(rename-visited-file  :wk "rename")
  "fs" '(save-buffer          :wk "save")
  "fp" '(my-open-config       :wk "open config")

  ;; search
  "s"  '(:ignore t            :wk "search")
  "ss" '(consult-line         :wk "in buffer")
  "sg" '(consult-ripgrep      :wk "grep")
  "sf" '(consult-find         :wk "file by name")
  "si" '(consult-imenu        :wk "imenu")

  ;; project
  "p"  '(:ignore t                     :wk "project")
  "pp" '(projectile-switch-project     :wk "switch project")
  "pC" '(projectile-configure-project  :wk "configure")
  "pc" '(projectile-compile-project    :wk "compile")
  "pt" '(projectile-test-project       :wk "test")
  "pr" '(projectile-run-project        :wk "run")
  "pa" '(recompile                     :wk "recompile (again)")

  ;; code
  "c"  '(:ignore t :wk "code")

  ;; errors
  "e"  '(:ignore t                            :wk "errors")
  "ee" '(consult-flymake                      :wk "jump to diagnostic")
  "el" '(my-flymake-show-buffer-diagnostics   :wk "buffer diagnostics")
  "eL" '(flymake-show-project-diagnostics     :wk "project diagnostics")

  ;; git
  "g"  '(:ignore t              :wk "git")
  "gs" '(magit-status           :wk "status")
  "gg" '(magit-dispatch         :wk "dispatch")
  "gl" '(magit-log-buffer-file  :wk "log for file")
  "gb" '(magit-blame-addition   :wk "blame")
  "gh" '(diff-hl-show-hunk      :wk "show hunk")
  "gS" '(diff-hl-stage-dwim     :wk "stage hunk")
  "gR" '(diff-hl-revert-hunk    :wk "revert hunk")

  ;; open
  "o"  '(:ignore t            :wk "open")
  "ot" '(my/toggle-vterm      :wk "terminal")
  "op" '(treemacs             :wk "project tree")
  "oP" '(treemacs-find-file   :wk "reveal file in tree")

  ;; toggles
  "t"  '(:ignore t                  :wk "toggle")
  "tt" '(consult-theme              :wk "theme")
  "tl" '(display-line-numbers-mode  :wk "line numbers")
  "tw" '(visual-line-mode           :wk "word wrap")

  ;; narrowing
  "n"  '(:ignore t           :wk "narrow")
  "nn" '(my-narrow-dwim      :wk "toggle narrow")
  "nf" '(narrow-to-defun     :wk "narrow to function")
  "nw" '(widen               :wk "widen")

  "h"  '(:keymap help-map        :wk "help")

  ;; session
  "q"  '(:ignore t                  :wk "quit")
  "qq" '(evil-quit                  :wk "quit buffer")
  "qr" '(restart-emacs              :wk "restart emacs"))

(with-eval-after-load 'eglot
  (my-leader :keymaps 'eglot-mode-map
    "cd" '(xref-find-definitions        :wk "definition")
    "cD" '(eglot-find-declaration       :wk "declaration")
    "cR" '(xref-find-references         :wk "references")
    "ci" '(eglot-find-implementation    :wk "implementations")
    "ca" '(eglot-code-actions           :wk "code actions")
    "cr" '(eglot-rename                 :wk "rename")
    ))

(provide 'my-keys)
