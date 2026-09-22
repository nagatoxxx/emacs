(savehist-mode 1)
                 
(setq enable-recursive-minibuffers t
      read-extended-command-predicate #'command-completion-default-include-p
      minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

(use-package eglot
  :ensure nil
  :general
  (my-leader :keymaps 'eglot-mode-map
    "rr" '(eglot-rename :wk "rename"))
  :config
  (add-to-list 'eglot-ignored-server-capabilities
           :documentOnTypeFormattingProvider))

(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)                     
  :init
  (vertico-mode 1))
 
(use-package vertico-directory
  :ensure nil                           ; входит в пакет vertico
  :after vertico
  :bind (:map vertico-map
              ("RET"   . vertico-directory-enter)
              ("DEL"   . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word)))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode 1))

(use-package consult
  :ensure t
  :general
  (my-leader
    "cb" '(consult-buffer   :wk "buffers")
    "ci" '(consult-imenu    :wk "imenu")
    "cf" '(consult-find     :wk "find file")    ; если установлен fd: consult-fd
    "cg" '(consult-ripgrep  :wk "grep")
    "cl" '(consult-line     :wk "search in buffer")
    "ct" '(consult-theme    :wk "theme"))
  :init
  (setq xref-show-xrefs-function       #'consult-xref
        xref-show-definitions-function #'consult-xref)
  :config
  (dolist (re '("\\`\\*Messages\\*\\'" "\\`\\*Warnings\\*\\'"
                "\\`\\*Compile-Log\\*\\'" "\\`\\*Flycheck"
                "\\`\\*EGLOT" "\\`\\*eldoc"))
    (add-to-list 'consult-buffer-filter re t))
  ; (consult-customize
  ;  consult-theme :preview-key '(:debounce 0.2 any)
  ;  consult-ripgrep consult-find consult-xref
  ;  :preview-key '(:debounce 0.4 any))
  (setq consult-narrow-key "<"))

(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :custom
  (company-backends '(company-capf))
  (company-minimum-prefix-length 2)
  (company-idle-delay 0.1)              
  (company-selection-wrap-around t)
  (company-tooltip-align-annotations t)
  :config
  (define-key company-active-map (kbd "TAB")   nil)
  (define-key company-active-map (kbd "<tab>") nil))

(use-package flymake
  :ensure nil
  :hook (prog-mode . flymake-mode)
  :general
  (my-leader
    "dd" '(consult-flymake                 :wk "jump to diagnostic")
    "dl" '(flymake-show-buffer-diagnostics :wk "buffer diagnostics")
    "dL" '(flymake-show-project-diagnostics :wk "project diagnostics"))
  :custom
  (flymake-show-diagnostics-at-end-of-line nil)
  (flymake-fringe-indicator-position nil)
  (flymake-no-changes-timeout 0.5))

(add-to-list 'load-path (expand-file-name "lang" (file-name-directory load-file-name)))

(require 'lang/my-haskell)
(require 'lang/my-cmake)
(require 'lang/my-qml)
(require 'lang/my-cc)

(provide 'my-prog)
