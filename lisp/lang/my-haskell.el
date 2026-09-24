(use-package haskell-mode
  :ensure t
  :hook (haskell-mode . eglot-ensure))

(let ((dir (expand-file-name "~/.ghcup/bin")))
  (add-to-list 'exec-path dir)
  (setenv "PATH" (concat dir path-separator (getenv "PATH"))))

(provide 'lang/my-haskell)
