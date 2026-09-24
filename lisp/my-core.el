;;; -*- lexical-binding: t; -*-
(use-package gcmh
  :ensure t
  :hook (emacs-startup . gcmh-mode))

(use-package no-littering
  :ensure t)

(setq read-process-output-max (* 1024 1024))
(setq eglot-events-buffer-config '(:size 0 :format full))
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t
      fast-but-imprecise-scrolling t
      redisplay-skip-fontification-on-input t
      inhibit-compacting-font-caches t)
(global-so-long-mode 1)

(provide 'my-core)
