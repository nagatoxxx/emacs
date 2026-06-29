(add-to-list 'load-path (expand-file-name "workspace" (file-name-directory load-file-name)))

(require 'workspace/custom) ; custom commands
(require 'workspace/plugins)
(require 'workspace/keybindings)

(provide 'workspace)
