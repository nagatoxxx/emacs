(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(fringe-mode '(8 . 12))

(set-face-attribute 'default nil :font "Iosevka Nerd Font" :height 180)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(defun ui/appearance--catppuccin ()
  (catppuccin-reload)
  (set-face-background 'treemacs-window-background-face
                       (catppuccin-get-color 'mantle)))

(defun ui/appearance--modus-operandi ())

(defun ui/appearance--modus-catppuccin ())

(defun ui/load-theme (theme)
  (interactive
   (list (intern (completing-read "theme: "
                                  '(catppuccin 
                                    modus-operandi)))))
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme theme :no-confirm)
  (pcase theme
    ('catppuccin (ui/appearance--catppuccin))
    ('modus-operandi (ui/appearance--modus-operandi))))

(my/leader
  "u"  '(:ignore t :which-key "interface")
  "ut" '(ui/load-theme :which-key "switch theme"))

(load-theme 'modus-operandi t)

(provide 'ui/appearance)
