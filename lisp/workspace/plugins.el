(use-package treemacs
  :ensure t
  :hook ((treemacs-mode . (lambda() (display-line-numbers-mode -1))))
  :config
  ; (set-face-background 'treemacs-window-background-face
  ;                      (catppuccin-get-color 'mantle))
  (setq treemacs-display-in-side-window t))

(use-package consult
  :ensure t
  :defer t
  :config
  (setq consult-buffer-filter
      '("\\` "
        "\\*Messages\\*"
        "\\*Warnings\\*"
        "\\*Compile-Log\\*"
        "\\*lsp-log\\*"
        "\\*flycheck\\*"
        ))
  )

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)
        completion-category-overrides
        '((file (styles basic partial-completion)))))

(use-package magit
  :ensure t
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq ediff-split-window-function 'split-window-horizontally))

(use-package vterm 
  :ensure t
  :hook ((vterm-mode . (lambda() (display-line-numbers-mode -1)))))

(use-package popper
  :ensure t
  :init
  (setq popper-window-height 15)
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "\\*Warnings\\*"
          "\\*Compile-Log\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          ;; Компиляция
          compilation-mode
          ;; Терминал
          eshell-mode
          vterm-mode
          ;; Справка
          help-mode
          ;; Диагностика
          flymake-diagnostics-buffer-mode
          "\\*Flycheck errors\\*"
          ;; Grep/поиск
          "\\*grep\\*"
          "\\*rg\\*"
          "\\*occur\\*"
          ;; LSP
          "\\*lsp-help\\*"
          "\\*xref\\*"))
  (setq popper-display-control t)
  (popper-mode +1)
  (popper-echo-mode +1))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)

  (projectile-register-project-type 'haskell '("*.cabal")
    :compile "cabal build"
    :test    "cabal test"
    :run     "cabal run")

  (setq compilation-read-command nil))

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile))

(use-package diff-hl
  :ensure t
  :after posframe
  :config
  (setq diff-hl-show-hunk-function #'diff-hl-show-hunk-posframe
        diff-hl-show-hunk-posframe-show-header-line t
        diff-hl-show-hunk-posframe-internal-border-width 1

        diff-hl-show-hunk-posframe-internal-border-color    "#454545"
        diff-hl-show-hunk-posframe-parameters               '((left-fringe  . 0)
                                                              (right-fringe . 0)))

  (custom-set-faces
    '(diff-hl-insert ((t (:background "#98c379"))))
    '(diff-hl-delete ((t (:background "#e06c75"))))
    '(diff-hl-change ((t (:background "#e5c07b")))))

  (global-diff-hl-mode 1)
  (diff-hl-flydiff-mode 1)  ; обновлять fringe без сохранения файла
)

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

(provide 'workspace/plugins)
