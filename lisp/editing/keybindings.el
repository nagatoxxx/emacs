(with-eval-after-load 'evil                                                                    
  (define-key evil-normal-state-map (kbd "<mouse-3>") #'context-menu-open)                     
  (define-key evil-visual-state-map (kbd "<mouse-3>") #'context-menu-open)                     
  (define-key evil-insert-state-map (kbd "<mouse-3>") #'context-menu-open)                     
  (define-key evil-motion-state-map (kbd "<mouse-3>") #'context-menu-open))                    

(provide 'editing/keybindings)
