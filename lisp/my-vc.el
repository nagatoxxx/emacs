;;; -*- lexical-binding: t; -*-
(use-package magit
  :ensure t
  :defer t
  :custom
  (magit-diff-refine-hunk 'all)
  (magit-save-repository-buffers 'dontask))

(use-package diff-hl
  :demand t
  :ensure t
  :defer t
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
