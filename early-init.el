(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 64 1024 1024))))

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(font . "Iosevka Nerd Font-18") default-frame-alist)
(push '(left-fringe . 8)           default-frame-alist)
(push '(right-fringe . 8)          default-frame-alist)
(setq inhibit-startup-screen t
      frame-inhibit-implied-resize t)

(setenv "LSP_USE_PLISTS" "true")
