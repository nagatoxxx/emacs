;;; -*- lexical-binding: t; -*-
(defun my-cc-setup ()
  (setq c-basic-offset 4)
  (c-set-offset 'innamespace 0)
  (c-set-offset 'access-label -4))

(use-package cc-mode
  :ensure nil
  :hook (((c-mode c++-mode) . eglot-ensure)
         ((c-mode c++-mode) . my-cc-setup)))

(provide 'lang/my-cc)
