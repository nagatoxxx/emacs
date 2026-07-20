(add-to-list 'load-path (expand-file-name "lang" (file-name-directory load-file-name)) t)

(require 'lang/common)

(require 'lang/cc)
(require 'lang/cmake)
(require 'lang/qml)
(require 'lang/haskell)
(require 'lang/latex)

(provide 'lang)
