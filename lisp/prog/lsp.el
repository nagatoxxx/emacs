(use-package lsp-mode
  :ensure t
  :config
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-enable-snippet nil)
  (setq lsp-idle-delay 0.1)
  (setq read-process-output-max (* 1024 1024))
(setq lsp-client-packages '(lsp-clangd lsp-lisp lsp-qml lsp-cmake lsp-haskell))
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

(use-package haskell-mode
  :ensure t)

(use-package lsp-haskell
  :ensure t
  :demand t
  :hook ((haskell-mode . lsp-deferred)
         (haskell-literate-mode . lsp-deferred))
  :config
  (setq lsp-haskell-server-path "haskell-language-server-wrapper"))

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

(provide 'prog/lsp)
