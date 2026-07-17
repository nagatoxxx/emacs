(use-package cc-mode
  :ensure t
  :hook ((c-mode   . lsp-deferred)
         (c++-mode . lsp-deferred))
  :config
  (setq-default c-basic-offset 4)
  (setq-default indent-tabs-mode nil))

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-client-packages 'lsp-clangd))

(with-eval-after-load 'format-all
  (setq format-all-formatters
        (append '(("C++" (clang-format))
                  ("C" (clang-format)))
                format-all-formatters)))

(provide 'lang/cc)
