(use-package cmake-mode
  :mode "\\(?:CMakeLists\\.txt\\|\\.cmake\\)\\'"
  :config
  (add-hook 'cmake-mode-hook
    (defun setup-neocmakelsp ()
      (require 'eglot)
      (add-to-list 'eglot-server-programs `((cmake-mode) . ("neocmakelsp" "stdio")))
      (eglot-ensure))))

(provide 'lang/my-cmake)
