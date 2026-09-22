(use-package qml-mode
  :ensure t
  :hook (qml-mode . eglot-ensure))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `(qml-mode . ,(eglot-alternatives
                                 '("qmlls"
                                   "qmlls6"
                                   "/usr/lib/qt6/bin/qmlls"
                                   "/usr/lib64/qt6/bin/qmlls")))))

(provide 'lang/my-qml)
