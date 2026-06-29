; ============================ ;
;          Настройки           ;
; ============================ ;
(setq-default scroll-conservatively 100000) ; избегать перепрыгивания при скролле
(setq-default scroll-margin 5)              ; основная настройка "буфера" у краёв
(setq-default scroll-preserve-screen-position t) ; сохранять позицию курсора на экране
(setq-default inhibit-startup-message t) ; убрать начальное окно
(setq-default truncate-lines t) ; выключить перенос строк
(setq-default indent-tabs-mode nil) ; пробелы вместо табов
(setq-default tab-width 4) ; таб = 4 пробела
(setq-default make-backup-files nil) ; не создавать ~-файлы
(setq-default auto-save-default nil) ; отключить авто-сохранение в .#файлы
(setq-default header-line-format nil) ; отключаем хедер
(setq-default evil-scroll-down-boundary 5)
(setq-default evil-scroll-up-boundary 5)
(setq native-comp-async-report-warnings-errors nil)
(prefer-coding-system 'utf-8) ; кодировка

; ============================ ;
;        хуки и режимы         ;
; ============================ ;
(add-hook 'prog-mode-hook #'display-line-numbers-mode) ; нумерация строк 
(add-hook 'prog-mode-hook #'hs-minor-mode) ; folding

(setenv "PATH" (concat (getenv "HOME") "/.cargo/bin:"
                       (getenv "HOME") "/.ghcup/bin:"
                       (getenv "PATH")))
(add-to-list 'exec-path (concat (getenv "HOME") "/.cargo/bin"))
(add-to-list 'exec-path (concat (getenv "HOME") "/.ghcup/bin"))

(provide 'core)
