(defun my/yas--try-expanding-auto-snippets ()
  (when (bound-and-true-p yas-minor-mode)
      (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
        (yas-expand))))

(use-package latex
  :ensure auctex
  :hook ((LaTeX-mode . TeX-PDF-mode)
         (LaTeX-mode . (lambda () (setq TeX-command-default "LatexMk")))
         (LaTeX-mode . (lambda () (setq TeX-engine 'luatex)))
         (LaTeX-mode . (lambda () (setq electric-indent-inhibit t)))
         (LaTeX-mode . (lambda () (setq LaTeX-indent-level 4
                                        LaTeX-item-indent 0
                                        TeX-brace-indent-level 4)))
         (post-self-insert . my/yas--try-expanding-auto-snippets))
  :config
  (setq TeX-source-correlate-start-server t
        TeX-save-query nil
        TeX-parse-self t
        TeX-auto-save t
        TeX-output-dir "build"
        yas-triggers-in-field t))

(use-package auctex-latexmk
  :ensure t
  :after latex
  :config
  (auctex-latexmk-setup)
  (setq auctex-latexmk-inherit-TeX-PDF-mode t))

(use-package pdf-tools
  :ensure t
  :config 
  (pdf-tools-install)
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-buffer))
  (add-hook 'pdf-view-mode-hook
          (lambda () (display-line-numbers-mode -1)))
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))

(use-package company-auctex
  :ensure t
  :hook ((LaTeX-mode . company-mode)
         (LaTeX-mode . company-auctex-init)))

(use-package cdlatex
  :ensure t
  :hook (LaTeX-mode . turn-on-cdlatex)
  :bind (:map cdlatex-mode-map
              ("<tab>" . cdlatex-tab)))

(use-package cdlatex
  :hook ((cdlatex-tab . yas-expand)
         (cdlatex-tab . cdlatex-in-yas-field))
  :config
  (defun cdlatex-in-yas-field ()
    (when-let* ((_ (overlayp yas--active-field-overlay))
                (end (overlay-end yas--active-field-overlay)))
      (if (>= (point) end)
          (let ((s (thing-at-point 'sexp)))
            (unless (and s (assoc (substring-no-properties s)
                                   cdlatex-command-alist-comb))
              (yas-next-field-or-maybe-expand)
              t))
        (let (cdlatex-tab-hook minp)
          (setq minp
                (min (save-excursion (cdlatex-tab) (point))
                     (overlay-end yas--active-field-overlay)))
          (goto-char minp) t))))

  (defun yas-next-field-or-cdlatex ()
    "Jump to the next Yas field correctly with cdlatex active."
    (interactive)
    (if (or (bound-and-true-p cdlatex-mode)
            (bound-and-true-p org-cdlatex-mode))
        (cdlatex-tab)
      (yas-next-field-or-maybe-expand)))

  (define-key yas-keymap (kbd "<tab>") #'yas-next-field-or-cdlatex)
  (define-key yas-keymap (kbd "TAB") #'yas-next-field-or-cdlatex))

; keybindings
(my/leader
  "p" '(:ignore t :which-key "LaTeX")
  "pc" '(TeX-command-run-all :which-key "compile")
  "pv" '(TeX-view :which-key "view pdf"))

; hooks
(add-hook 'LaTeX-mode-hook #'flycheck-mode)
(add-hook 'LaTeX-mode-hook #'yas-minor-mode)

(provide 'lang/latex)
