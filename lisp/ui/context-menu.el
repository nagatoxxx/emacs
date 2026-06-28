(defun my/context-menu-items (menu click)
  (define-key menu [toggle-notes]
    (list 'menu-item "Notes" #'my/toggle-notes))
  (define-key menu [toggle-term]
    (list 'menu-item "Terminal" #'my/toggle-vterm))
  (define-key menu [separator-my] menu-bar-separator)
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

(setq context-menu-functions '(my/context-menu-items))
(context-menu-mode 1)

(add-hook 'prog-mode-hook
  (lambda () (remove-hook 'context-menu-functions #'prog-context-menu t)))

(defmacro my/make-button (label action)
  `(propertize ,label
               'face '(:box t :weight bold)
               'mouse-face 'highlight
               'local-map (let ((map (make-sparse-keymap)))
                            (define-key map [header-line mouse-1] ,action)
                            map)))

(provide 'ui/context-menu)
