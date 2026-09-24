;;; -*- lexical-binding: t; -*-
; treemacs
(use-package treemacs
  :ensure t
  :general
  (my-leader
    "tt" '(treemacs :wk "toggle tree"))
  :custom
  (treemacs-width 35)
  (treemacs-collapse-dirs 3)
  :config
  (treemacs-follow-mode 1)  
  (treemacs-filewatch-mode 1)
  (treemacs-define-RET-action 'file-node-closed #'treemacs-visit-node-ace)
  (treemacs-define-RET-action 'file-node-open   #'treemacs-visit-node-ace)
  )

(defun my-treemacs-visit-node-new-tab ()
  (interactive)
  (let ((path (treemacs-safe-button-get (treemacs-current-button) :path)))
    (when (and path (file-regular-p path))
      (tab-bar-new-tab)
      (find-file path))))

(with-eval-after-load 'treemacs-evil
  (general-def evil-treemacs-state-map
    "s"  #'treemacs-visit-node-vertical-split
    "v"  #'treemacs-visit-node-horizontal-split
    "T"  #'my-treemacs-visit-node-new-tab))
 
(use-package treemacs-nerd-icons
  :ensure t
  :after treemacs
  :config (treemacs-nerd-icons-config))
 
(use-package treemacs-magit
  :ensure t
  :after (treemacs magit))
 
(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile))

; projectile
(use-package projectile
  :ensure t
  :custom
  (projectile-sort-order 'recently-active)
  :config
  (projectile-mode 1)

  (defun my-treemacs-projects-to-projectile (&rest _)
    "Добавить проекты из всех воркспейсов treemacs в известные проекты projectile."
    (require 'treemacs)
    (treemacs-current-workspace)          
    (dolist (ws (treemacs-workspaces))
      (dolist (project (treemacs-workspace->projects ws))
        (let ((path (treemacs-project->path project)))
          (when (file-directory-p path)
            (projectile-add-known-project (file-name-as-directory path)))))))

  (advice-add 'projectile-switch-project :before #'my-treemacs-projects-to-projectile))

; popper
(use-package popper
  :ensure t
  :bind (("C-`"   . popper-toggle)      ; show/hide last popup
         ("M-`"   . popper-cycle)       ; scroll popup buffers
         ("C-M-`" . popper-toggle-type)) ; popper toggle window
  :init
  (setq popper-window-height 15
        popper-reference-buffers
        '("\\*Messages\\*"
          "\\*Warnings\\*"
          "\\*Compile-Log\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          "\\*vterm.*\\*"
          compilation-mode
          ;; terminals
          eshell-mode
          vterm-mode
          ;; docs
          help-mode
          "\\*eldoc.*\\*"               ; eglot
          ;; diagnostics
          flymake-diagnostics-buffer-mode
          "\\*Flycheck errors\\*"
          ;; search
          "\\*grep\\*"
          "\\*rg\\*"
          "\\*occur\\*"
          "\\*xref\\*"))
  (popper-mode 1)
  (popper-echo-mode 1))

; vterm
(use-package vterm
  :ensure t
  :commands vterm
  :hook (vterm-mode . (lambda () (setq-local global-hl-line-mode nil)))
  :custom
  (vterm-always-compile-module t)
  (vterm-max-scrollback 10000)
  (vterm-kill-buffer-on-exit t))  

(defun my/toggle-vterm ()
  "show or hide terminal"
  (interactive)
  (let* ((buf (get-buffer "*vterm*"))
         (win (and buf (get-buffer-window buf))))
    (cond (win (delete-window win))
          (buf (pop-to-buffer buf))
          (t (vterm)))))           

(provide 'my-workspace)
