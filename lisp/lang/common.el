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

(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'character))

(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

(unless (package-installed-p 'treesit-fold)
  (package-vc-install "https://github.com/emacs-tree-sitter/treesit-fold"))

(use-package treesit-fold
  :hook (prog-mode . treesit-fold-mode)
  :config
  (global-treesit-fold-indicators-mode))

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
  :hook (flycheck-error-list-mode . (lambda () (display-line-numbers-mode -1)))
  :custom
  (flycheck-indication-mode nil)
  (flycheck-highlighting-mode 'lines)
  :init
  (global-flycheck-mode)
  :config
  (custom-set-faces
   '(flycheck-error   ((t (:underline (:style wave :color "#e06c75")))))
   '(flycheck-warning ((t (:underline (:style wave :color "#e5c07b")))))
   '(flycheck-info    ((t (:underline (:style wave :color "#61afef")))))))

(use-package flycheck-posframe
  :ensure t
  :after flycheck
  :hook (flycheck-mode . flycheck-posframe-mode)
  :custom
  (flycheck-posframe-warning-prefix "⚠ ")
  (flycheck-posframe-error-prefix "✕ ")
  (flycheck-posframe-info-prefix "ℹ ")
  (flycheck-posframe-border-width 2)
  :config
  (custom-set-faces
   '(flycheck-posframe-error-face ((t (:foreground "#e06c75"))))
   '(flycheck-posframe-warning-face ((t (:foreground "#e5c07b"))))))

(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets/"))
  (yas-reload-all))

; keybindings
(my/leader
  ; lsp
  "l"   '(:ignore t :which-key "lsp")
  "lr"  '(lsp-rename :which-key "rename symbol")
  "lf"  '(:ignore t :which-key "find")
  "lfd" '(lsp-find-definition :which-key "symbol definition")
  "lfr" '(lsp-find-references :which-key "symbol references")
  "ld"  '(lsp-describe-thing-at-point :which-key "describe")

  ; diagnostics
  "d"  '(:ignore t :which-key "diagnostics")
  "dl" '(flycheck-list-errors :which-key "list errors")
  "dn" '(flycheck-next-error :which-key "go to next error")
  "dp" '(flycheck-previous-error :which-key "go to prev error"))

(provide 'lang/common)
