(defun my/lsp-diagnostics ()
  (when (bound-and-true-p flycheck-mode)
    (let ((counts (flycheck-count-errors flycheck-current-errors))
          (num-errors 0)
          (num-warnings 0))

      (dolist (item counts)
        (let ((level (car item))
              (count (cdr item)))
          (if (eq level 'error)
              (setq num-errors (+ num-errors count))
            (setq num-warnings (+ num-warnings count)))))

      (concat
       (when (> num-errors 0)
         (format " %s %s"
                 (nerd-icons-codicon "nf-cod-error" :face 'error)
                 num-errors))
       (when (> num-warnings 0)
         (format " %s %s"
                 (nerd-icons-codicon "nf-cod-warning" :face 'warning)
                 num-warnings))))))

(defun simple-mode-line-render (left right)
  (let* ((available-width (- (window-width) (length left) 2)))
    (format (format " %%s %%%ds " available-width) left right)))

(setq-default mode-line-format
  '((:eval (simple-mode-line-render
             (format-mode-line
               (concat
                 (propertize (nerd-icons-icon-for-mode major-mode)
                             'face (list :height 1.0 'mode-line))
                 " "
                 (format-mode-line
                   mode-line-buffer-identification)
                 (format-mode-line vc-mode)))
             (format-mode-line
               (concat
                 (or (my/lsp-diagnostics) "")
                 " "
                 "%l:%c"
                 ))))))

(provide 'ui/modeline)
