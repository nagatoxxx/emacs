(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(add-to-list 'load-path (locate-user-emacs-file "lisp"))
(add-to-list 'load-path (locate-user-emacs-file "site-lisp"))

(require 'my-edit)
(require 'my-evil)
(require 'my-ui)
(require 'my-vc)
(require 'my-prog)
(require 'my-workspace)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e0fbe5caa6e602975e59cdd381c9773a670a864dd7bb7bf2345414856148098b"
     default))
 '(package-selected-packages nil)
 '(package-vc-selected-packages
   '((treesit-fold :url
                   "https://github.com/emacs-tree-sitter/treesit-fold")))
 '(warning-suppress-log-types '((treesit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
