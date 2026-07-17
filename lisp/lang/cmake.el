(use-package cmake-mode
  :ensure t
  :hook (cmake-mode . lsp-deferred))

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-client-packages 'lsp-cmake))

(provide 'lang/cmake)
