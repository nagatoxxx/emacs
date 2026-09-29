;;; -*- lexical-binding: t; -*-
(use-package magit
  :ensure t
  :defer t
  :custom
  (magit-diff-refine-hunk 'all)
  (magit-save-repository-buffers 'dontask)
  (magit-blame-time-format "%Y-%m-%d")
  (magit-blame-styles
   '((margin
      (margin-format    . " %a  %C%f")
      (margin-width     . 32)
      (margin-face      . magit-blame-margin)
      (margin-body-face . (magit-blame-dimmed)))
     (headings
      (heading-format . "%-20a %C %s\n"))))
  )

(use-package diff-hl
  :demand t
  :ensure t
  :hook (
         (dired-mode         . diff-hl-dired-mode))
  :custom
  (diff-hl-draw-borders nil)             ; сплошные полосы без рамки
  :config
  (global-diff-hl-mode 1)
  (diff-hl-flydiff-mode 1)               ; обновлять полосы до сохранения файла
  )

(provide 'my-vc)
