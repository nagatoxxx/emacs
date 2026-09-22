(use-package general
  :ensure t
  :demand t
  :config
  (general-create-definer my-leader
    :states '(normal visual motion insert emacs)
    :keymaps 'override
    :prefix "SPC"
    :non-normal-prefix "M-SPC"))

(use-package evil
  :ensure t
  :demand t
  :custom
  (evil-want-keybinding nil)        
  (evil-want-C-u-scroll t)
  (evil-want-Y-yank-to-eol t)       
  (evil-undo-system 'undo-redo)     
  (evil-search-module 'evil-search) 
  (evil-symbol-word-search t)       
  (evil-split-window-below t)
  (evil-vsplit-window-right t)
  (evil-respect-visual-line-mode t)
  :config
  (evil-mode 1))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (setq evil-collection-mode-list (remq 'org evil-collection-mode-list))
  (evil-collection-init)) 


(use-package evil-surround
  :ensure t
  :after evil
  :config (global-evil-surround-mode 1))
 
(use-package evil-commentary
  :ensure t
  :after evil
  :config (evil-commentary-mode 1))

(use-package evil-lion
  :ensure t
  :after evil
  :config (evil-lion-mode 1))
 
(use-package evil-matchit
  :ensure t
  :after evil
  :config (global-evil-matchit-mode 1))

(use-package evil-org
  :ensure t
  :hook (org-mode . evil-org-mode)
  :config
  (evil-org-set-key-theme '(navigation insert textobjects additional calendar)))

(use-package treemacs-evil
  :ensure t
  :after (treemacs evil))
 
(use-package avy
  :after evil
  :custom
  (avy-keys (string-to-list "asdghklqwertyuiopzxcvbnmfj;")) ; алфавит vim-easymotion
  (avy-background t)
  (avy-all-windows nil)
  :config
  (my-leader "w" '(evil-avy-goto-word-0 :wk "go to word")))

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-defun  'disabled nil)

(defun my-narrow-dwim ()
  (interactive)
  (cond ((buffer-narrowed-p) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end))
         (evil-normal-state))
        (t (narrow-to-defun))))

(evil-define-command my-narrow-ex (beg end)
  (interactive "<r>")
  (narrow-to-region beg end))

(evil-ex-define-cmd "nar[row]" #'my-narrow-ex)

(my-leader
  "n"  '(:ignore t :wk "narrow")
  "nn" '(my-narrow-dwim     :wk "narrow / widen")
  "nf" '(narrow-to-defun    :wk "narrow to function")
  "nw" '(widen              :wk "widen"))

(provide 'my-evil)
