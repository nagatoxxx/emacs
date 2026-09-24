;;; -*- lexical-binding: t; -*-
(setq-default scroll-conservatively 100000) 
(setq-default scroll-margin 5)
(setq-default scroll-preserve-screen-position t) 
(setq-default truncate-lines t) 
(setq-default indent-tabs-mode nil) 
(setq-default tab-width 4) 
(setq-default make-backup-files nil) 
(setq-default auto-save-default nil) 
(setq native-comp-async-report-warnings-errors nil)
(prefer-coding-system 'utf-8)

(global-auto-revert-mode 1)
(global-hl-line-mode 1) 
(save-place-mode 1) 
(electric-pair-mode 1)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(provide 'my-edit)
