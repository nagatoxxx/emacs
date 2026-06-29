(add-to-list 'load-path (expand-file-name "prog" (file-name-directory load-file-name)))

(require 'prog/tools)
(require 'prog/lsp) ; languages support

(provide 'prog)
