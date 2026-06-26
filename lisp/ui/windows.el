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

(provide 'ui/windows)
