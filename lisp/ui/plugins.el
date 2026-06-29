(use-package catppuccin-theme
  :ensure t
  :config
  ; (setq catppuccin-flavor 'latte)
  (setq catppuccin-flavor 'mocha)
  (catppuccin-set-color 'base "#202020" 'mocha)
  (catppuccin-set-color 'mantle "#191919" 'mocha)
  (catppuccin-set-color 'crust "#111111" 'mocha)
  (catppuccin-set-color 'surface0 "#313131" 'mocha)
  (catppuccin-set-color 'surface1 "#454545" 'mocha)

  )

(use-package modus-themes
  :ensure t)

; вкладки как в виме
(use-package vim-tab-bar
  :ensure t
  :init
  (customize-set-variable 'tab-bar-show 1)
  :commands vim-tab-bar-mode
  :hook
  (after-init . vim-tab-bar-mode))

; иконки
(use-package nerd-icons
  :ensure t
  :custom
  (nerd-icons-font-family "Symbols Nerd Font Mono"))

; иконки для treemacs
(use-package treemacs-nerd-icons
  :ensure t
  :after treemacs
  :config
  (treemacs-nerd-icons-config))

(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.2)
  (setq which-key-max-display-columns 3))

(use-package posframe :ensure t)

(provide 'ui/plugins)
