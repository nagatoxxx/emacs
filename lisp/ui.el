(add-to-list 'load-path (expand-file-name "ui" (file-name-directory load-file-name)))

(require 'ui/appearance)
(require 'ui/modeline)
(require 'ui/windows)
(require 'ui/context-menu)

(provide 'ui)
