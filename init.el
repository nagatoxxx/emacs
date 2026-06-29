(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'package)
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(require 'core)
(require 'editing)
(require 'ui)
(require 'prog)
(require 'workspace)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c4df9006b9eb32599d758800a32f3487c2cdf13826084511783b47d419024af2" default))
 '(package-selected-packages
   '(modus-themes treesit-auto diff-hl treemacs-evil treemacs-nerd-icons treemacs nerd-icons vim-tab-bar format-all lsp-ui company catppuccin-theme lsp-mode flycheck xclip evil-surround evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-hl-change ((t (:background "#e5c07b"))))
 '(diff-hl-delete ((t (:background "#e06c75"))))
 '(diff-hl-insert ((t (:background "#98c379")))))
