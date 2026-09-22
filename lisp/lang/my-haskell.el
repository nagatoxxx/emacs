(use-package haskell-mode
  :ensure t
  :hook (haskell-mode . eglot-ensure))

(provide 'lang/my-haskell)
