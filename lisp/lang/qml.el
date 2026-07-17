(use-package qml-mode
  :ensure t
  :hook (qml-mode . lsp-deferred))

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-client-packages 'lsp-qml))

(provide 'lang/qml)
