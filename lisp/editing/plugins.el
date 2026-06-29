; vim-like
(use-package evil
  :ensure t
  :init (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-surround
  :ensure t
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init)
  (evil-collection-vertico-setup))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . evil-org-mode)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package evil-lion
  :ensure t
  :after evil
  :config
  (evil-lion-mode))

; как vim-commentary
(use-package evil-commentary
  :ensure t
  :load-path "~/.emacs.d/site-lisp/evil-commentary"
  :after evil
  :config
  (evil-commentary-mode))

(use-package treemacs-evil
  :ensure t)

; для биндов
(use-package general
  :ensure t
  :config
  (general-create-definer my/leader
    :states '(normal visual)
    :prefix "SPC"))

; системный буфер обмена
(use-package xclip
  :ensure t
  :config
  (xclip-mode 1))

(provide 'editing/plugins)
