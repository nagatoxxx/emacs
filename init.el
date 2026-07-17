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
