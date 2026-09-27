(defconst my-mode-line-separator (propertize "   " 'face 'shadow))

(defun my-mode-line--join (&rest segments)
  (mapconcat #'identity
             (seq-remove #'string-empty-p
                         (mapcar (lambda (s) (string-trim (or s ""))) segments))
             my-mode-line-separator))

(defun my-mode-line-buffer ()
  (concat
   (propertize (buffer-name)
               'face (if (and buffer-file-name (buffer-modified-p))
                         '(:inherit mode-line-buffer-id :slant italic)
                       'mode-line-buffer-id))
   (when (buffer-narrowed-p) (propertize " [narrow]" 'face 'shadow))))

(defun my-mode-line-vc ()
  (when vc-mode
    (concat (nerd-icons-devicon "nf-dev-git_branch") " "
            (replace-regexp-in-string "\\` *Git[-:@!?]" "" vc-mode))))

(defun my-mode-line-diagnostics ()
  (when (bound-and-true-p flymake-mode)
    (let ((errors 0) (warnings 0))
      (dolist (diag (flymake-diagnostics))
        (pcase (get (flymake-diagnostic-type diag) 'flymake-category)
          ('flymake-error   (setq errors (1+ errors)))
          ('flymake-warning (setq warnings (1+ warnings)))))
      (concat
       (when (> errors 0)
         (format " %s %d" (nerd-icons-mdicon "nf-md-close_box" :face 'error) errors))
       (when (> warnings 0)
         (format " %s %d" (nerd-icons-mdicon "nf-md-alert_box" :face 'warning) warnings))))))

(defun my-mode-line-lsp ()
  (when-let* (((bound-and-true-p eglot--managed-mode))
              (server (eglot-current-server)))
    (format 
            " %s"
            (propertize (or (plist-get (eglot--server-info server) :name) "LSP")
                        'face 'bold))))

(defun my-mode-line-mode ()
  (format-mode-line mode-name))

(defun my-mode-line-size ()
  (format-mode-line "%I"))

(setq-default mode-line-format
              '(" "
                (:eval (my-mode-line--join (my-mode-line-size)
                                           (my-mode-line-buffer)
                                           (my-mode-line-vc)))
                mode-line-format-right-align
                (:eval (when (mode-line-window-selected-p)
                         (my-mode-line--join 
                                             (my-mode-line-mode)
                                             (my-mode-line-diagnostics)
                                             (my-mode-line-lsp)
                                             )))
                " "))

(defun my-mode-line-padding (&rest _)
  (dolist (face '(mode-line mode-line-active mode-line-inactive))
    (set-face-attribute face nil
                        :box `(:line-width 3 :color ,(face-background face nil t)))))

(add-hook 'enable-theme-functions #'my-mode-line-padding)
(my-mode-line-padding)

(provide 'ui/my-modeline)
