(tooltip-mode -1) 

(use-package nerd-icons
  :ensure t)

(use-package ef-themes
  :ensure t)

(use-package vim-tab-bar
  :ensure t
  :custom
  (tab-bar-show 1)  :hook (after-init . vim-tab-bar-mode))

(use-package which-key
  :ensure nil
  :custom
  (which-key-idle-delay 0.2)
  (which-key-max-display-columns 3)
  :config
  (which-key-mode 1))

(defun my-mode-line-diagnostics ()
  "Число ошибок и предупреждений flymake с иконками."
  (when (bound-and-true-p flymake-mode)
    (let ((errors 0) (warnings 0))
      (dolist (diag (flymake-diagnostics))
        (pcase (get (flymake-diagnostic-type diag) 'flymake-category)
          ('flymake-error   (setq errors (1+ errors)))
          ('flymake-warning (setq warnings (1+ warnings)))))
      (concat
       (when (> errors 0)
         (format " %s %d" (nerd-icons-codicon "nf-cod-error" :face 'error) errors))
       (when (> warnings 0)
         (format " %s %d" (nerd-icons-codicon "nf-cod-warning" :face 'warning) warnings))))))

(setq-default mode-line-format
              '(" "
                (:eval (or (nerd-icons-icon-for-mode major-mode) ""))
                " "
                "%*"
                " "
                mode-line-buffer-identification
                (vc-mode vc-mode)
                "%n"
                mode-line-format-right-align
                (:eval (or (my-mode-line-diagnostics) ""))
                "  %l:%c "))

(load-theme 'ef-day :no-confirm)

(provide 'my-ui)
