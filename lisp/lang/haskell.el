(use-package haskell-mode
  :ensure t)

(use-package lsp-haskell
  :ensure t
  :demand t
  :hook ((haskell-mode . lsp-deferred)
         (haskell-literate-mode . lsp-deferred))
  :config
  (setq lsp-haskell-server-path "haskell-language-server-wrapper"))

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-client-packages 'lsp-haskell))

(provide 'lang/haskell)
