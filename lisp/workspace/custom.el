(defun my/context-menu-workspace-items (menu click)
  (define-key menu [toggle-notes]
    (list 'menu-item "Notes" #'my/toggle-notes))
  (define-key menu [toggle-term]
    (list 'menu-item "Terminal" #'my/toggle-vterm))
  (define-key menu [separator-my] menu-bar-separator)
  menu)

(add-to-list 'context-menu-functions #'my/context-menu-workspace-items)

(defun my/toggle-notes ()
  (interactive)
  (let* ((file "~/.notes.org")
         (buf (find-file-noselect file))
         (win (get-buffer-window buf)))
    (if win
        (delete-window win)
      (display-buffer-in-side-window
       buf
       '((side . right)
         (window-width . 0.3))))))

(defun my/toggle-vterm ()
  (interactive)
  (let ((buf (get-buffer "*vterm*")))
    (if buf
        (popper-toggle)
      (progn
        (vterm)
        (popper-toggle-type)))))

(provide 'workspace/custom)
