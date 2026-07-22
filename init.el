(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'package)
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(require 'core)
(require 'editing)
(require 'ui)
(require 'lang)
(require 'workspace)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil)
 '(package-vc-selected-packages
   '((treesit-fold :vc-backend Git :url "https://github.com/emacs-tree-sitter/treesit-fold")))
 '(safe-local-variable-values
   '((eval c-set-offset 'innamespace 0)
     (c-syntactic-indentation))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-hl-change ((t (:background "#e5c07b"))))
 '(diff-hl-delete ((t (:background "#e06c75"))))
 '(diff-hl-insert ((t (:background "#98c379"))))
 '(flycheck-error ((t (:underline (:style wave :color "#e06c75")))))
 '(flycheck-info ((t (:underline (:style wave :color "#61afef")))))
 '(flycheck-posframe-error-face ((t (:foreground "#e06c75"))))
 '(flycheck-posframe-warning-face ((t (:foreground "#e5c07b"))))
 '(flycheck-warning ((t (:underline (:style wave :color "#e5c07b"))))))
