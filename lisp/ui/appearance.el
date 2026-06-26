(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(fringe-mode '(8 . 12))

(set-face-attribute 'default nil :font "Iosevka Nerd Font" :height 180)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(provide 'ui/appearance)
