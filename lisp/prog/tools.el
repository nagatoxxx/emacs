(use-package format-all
  :ensure t
  :commands format-all-mode
  :hook (prog-mode . format-all-mode)
  :config
  (setq-default format-all-formatters
                '(("C++" (clang-format))
                  ("C" (clang-format)))))

(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

; autocomplete
(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.0)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-align-annotations t)
  (setq company-backends '(company-capf)))

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

(provide 'prog/tools)
