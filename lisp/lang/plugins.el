(use-package lsp-mode
  :ensure t
  :config
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-enable-snippet nil)
  (setq lsp-idle-delay 0.1)
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-client-packages '(lsp-lisp))
  (setq lsp-inlay-hint-enable t)
  (setq lsp-enable-links nil)
  (setq lsp-diagnostics-provider :flycheck)
  (setq lsp-headerline-breadcrumb-enable t)
  (setq lsp-warn-no-matched-clients nil))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-doc-enable nil))            ;; всплывающее окно с описанием

(defun my/context-menu-lsp-items (menu click)
  (when (bound-and-true-p lsp-mode)
    (define-key menu [find-def]
      `(menu-item "Find definition" lsp-find-definition
                  :enable (thing-at-point 'symbol)))
    (define-key menu [find-refs]
      `(menu-item "Find references" lsp-ui-peek-find-references
                  :enable (thing-at-point 'symbol)))
    (define-key menu [describe]
      `(menu-item "Describe" lsp-describe-thing-at-point
                  :enable (thing-at-point 'symbol))))
  menu)

(setq context-menu-functions '(my/context-menu-lsp-items))

(use-package format-all
  :ensure t
  :commands format-all-mode
  :hook (prog-mode . format-all-mode))

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

(provide 'lang/plugins)
