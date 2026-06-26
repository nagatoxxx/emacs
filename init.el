(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'ui)
(require 'plugins)
(require 'core)
(require 'editing)
(require 'keybindings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(treesit-auto diff-hl treemacs-evil treemacs-nerd-icons treemacs nerd-icons vim-tab-bar format-all lsp-ui company catppuccin-theme lsp-mode flycheck xclip evil-surround evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-hl-change ((t (:background "#e5c07b"))))
 '(diff-hl-delete ((t (:background "#e06c75"))))
 '(diff-hl-insert ((t (:background "#98c379")))))
