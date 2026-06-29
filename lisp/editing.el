(add-to-list 'load-path (expand-file-name "editing" (file-name-directory load-file-name)))

(require 'editing/plugins)
(require 'editing/keybindings)

(global-auto-revert-mode 1) ; сразу перечитывать файл с диска
(global-hl-line-mode 1) ; подсветка текущей строки
(save-place-mode 1) ; сохранять позицию в файле между сессиями
(electric-pair-mode 1) ; autopairs

(provide 'editing)
