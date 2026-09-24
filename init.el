;;; -*- lexical-binding: t; -*-
(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(add-to-list 'load-path (locate-user-emacs-file "lisp"))
(add-to-list 'load-path (locate-user-emacs-file "site-lisp"))

(require 'my-core)
(require 'my-ui)
(require 'my-edit)
(require 'my-evil)
(require 'my-vc)
(require 'my-prog)
(require 'my-workspace)
(require 'my-keys)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)
