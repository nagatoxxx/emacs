(add-to-list 'load-path (expand-file-name "ui" (file-name-directory load-file-name)))

(require 'ui/plugins)
(require 'ui/appearance)
(require 'ui/modeline)
(require 'ui/context-menu)

(provide 'ui)
