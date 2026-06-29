; vim-like
(setq evil-want-keybinding nil)
(use-package evil
  :ensure t
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
  :defer t
  :after org
  :hook (org-mode . evil-org-mode)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package evil-lion
  :ensure t
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

; быстрый переход по словам
(use-package avy
  :ensure t
  :config
  (setq avy-background t)
  (setq avy-all-windows nil))

  (with-eval-after-load 'avy
  (set-face-attribute 'avy-lead-face nil
                      :background (face-background 'error)
                      :foreground (face-foreground 'default)
                      :bold t)
  (set-face-attribute 'avy-background-face nil
                      :foreground (face-foreground 'shadow)))

; системный буфер обмена
(use-package xclip
  :ensure t
  :config
  (xclip-mode 1))

(provide 'editing/plugins)
