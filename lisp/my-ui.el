;;; -*- lexical-binding: t; -*-
(add-to-list 'load-path (expand-file-name "ui" (file-name-directory load-file-name)))

(require 'ui/my-modeline)

(tooltip-mode -1) 

(use-package nerd-icons
  :ensure t)

(use-package ef-themes
  :ensure t)

(load-theme 'ef-day :no-confirm)

(use-package vim-tab-bar
  :ensure t
  :custom
  (tab-bar-show 1)  :hook (after-init . vim-tab-bar-mode))

(use-package which-key
  :ensure nil
  :custom
  (which-key-idle-delay 0.2)
  (which-key-max-display-columns 3)
  :config
  (which-key-mode 1))

(use-package hl-todo
  :ensure t
  :config
  (global-hl-todo-mode 1))

(provide 'my-ui)
