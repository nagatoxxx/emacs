; ============================ ;
;          Плагины             ;
; ============================ ;
(require 'package)
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

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

; системный буфер обмена
(use-package xclip
  :ensure t
  :config
  (xclip-mode 1))

; как vim-commentary
(use-package evil-commentary
  :ensure t
  :load-path "~/.emacs.d/site-lisp/evil-commentary"
  :after evil
  :config
  (evil-commentary-mode))

(use-package flycheck
  :ensure t
  :hook (flycheck-error-list-mode . (lambda() (display-line-numbers-mode -1)))
  :init
  (global-flycheck-mode)
  (setq flycheck-indication-mode 'right-fringe)

  (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
  [ #b000000000000
    #b000000000000
    #b000000000100
    #b000000001100
    #b000000011100
    #b000000111100
    #b000001111100
    #b000011111100
    #b000011111100
    #b000001111100
    #b000000111100
    #b000000011100
    #b000000001100
    #b000000000100
    #b000000000000
    #b000000000000 ] nil 12 'center))

(use-package haskell-mode
  :ensure t)

(use-package lsp-haskell
  :ensure t
  :demand t
  :hook ((haskell-mode . lsp-deferred)
         (haskell-literate-mode . lsp-deferred))
  :config
  (setq lsp-haskell-server-path "haskell-language-server-wrapper"))

(use-package lsp-mode
  :ensure t
  :config
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-enable-snippet nil)
  (setq lsp-idle-delay 0.1)
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-prefer-capf t)
  (setq lsp-client-packages '(lsp-clangd lsp-lisp lsp-qml lsp-cmake lsp-haskell))
  (setq lsp-inlay-hint-enable t)
  (setq lsp-enable-links nil)
  (setq lsp-diagnostics-provider :flycheck)
  (setq lsp-headerline-breadcrumb-enable t)
  (setq lsp-warn-no-matched-clients nil))

(use-package catppuccin-theme
  :ensure t
  :config
  ; (setq catppuccin-flavor 'latte)
  (setq catppuccin-flavor 'mocha)
  (load-theme 'catppuccin :no-confirm)
  (catppuccin-set-color 'base "#202020" 'mocha)
  (catppuccin-set-color 'mantle "#191919" 'mocha)
  (catppuccin-set-color 'crust "#111111" 'mocha)
  (catppuccin-set-color 'surface0 "#313131" 'mocha)
  (catppuccin-set-color 'surface1 "#454545" 'mocha)
  (catppuccin-reload))

; для автодополнения
(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.0)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-align-annotations t)
  (setq company-backends '(company-capf)))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-doc-enable nil))            ;; всплывающее окно с описанием

(use-package format-all
  :ensure t
  :commands format-all-mode
  :hook (prog-mode . format-all-mode)
  :config
  (setq-default format-all-formatters
                '(("C++" (clang-format))
                  ("C" (clang-format)))))

(use-package cc-mode
  :ensure t
  :hook ((c-mode   . lsp-deferred)
         (c++-mode . lsp-deferred))
  :config
  (setq-default c-basic-offset 4)
  (setq-default indent-tabs-mode nil))

(use-package cmake-mode
    :ensure t
    :hook (cmake-mode . lsp-deferred))

(use-package qml-mode
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

(use-package treemacs
  :ensure t
  :hook ((treemacs-mode . (lambda() (display-line-numbers-mode -1))))
  :config
  (set-face-background 'treemacs-window-background-face
                       (catppuccin-get-color 'mantle))
  (setq treemacs-display-in-side-window t))

; иконки для treemacs
(use-package treemacs-nerd-icons
  :ensure t
  :after treemacs
  :config
  (treemacs-nerd-icons-config))

(use-package treemacs-evil
  :ensure t)

(use-package posframe :ensure t)

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

(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package consult
  :ensure t
  :defer t)

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

(use-package general
  :ensure t
  :config
  (general-create-definer my/leader
    :states '(normal visual)
    :prefix "SPC"))

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.2)
  (setq which-key-max-display-columns 3))

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

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)

  (projectile-register-project-type 'haskell '("*.cabal")
    :compile "cabal build"
    :test    "cabal test"
    :run     "cabal run")

  (setq compilation-read-command nil)
  )

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile))

(provide 'plugins)
