(use-package magit
  :ensure t
  :general
  (my-leader
    "gs" '(magit-status         :wk "status")
    "gg" '(magit-dispatch       :wk "dispatch")
    "gl" '(magit-log-buffer-file :wk "log for file")
    "gb" '(magit-blame-addition :wk "blame"))
  :custom
  (magit-diff-refine-hunk 'all)
  (magit-save-repository-buffers 'dontask))

(use-package diff-hl
  :demand t
  :ensure t
  :general
  (my-leader
    "gh" '(diff-hl-show-hunk   :wk "show hunk")
    "gS" '(diff-hl-stage-dwim  :wk "stage hunk")
    "gR" '(diff-hl-revert-hunk :wk "revert hunk"))
  (:states 'normal :keymaps 'diff-hl-mode-map
   "]c" #'diff-hl-next-hunk
   "[c" #'diff-hl-previous-hunk)
  :hook (
         (magit-pre-refresh  . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh)
         (dired-mode         . diff-hl-dired-mode))
  :custom
  (diff-hl-draw-borders nil)             ; сплошные полосы без рамки
  :config
  (global-diff-hl-mode 1)
  (diff-hl-flydiff-mode 1)               ; обновлять полосы до сохранения файла
  )

(provide 'my-vc)
