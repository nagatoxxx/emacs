(context-menu-mode 1)

(add-hook 'prog-mode-hook
  (lambda () (remove-hook 'context-menu-functions #'prog-context-menu t)))

(provide 'ui/context-menu)
