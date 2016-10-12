;; ~/.emacs.d/personal/config.el

;;;;;;;;;
;; env ;;
;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/personal/env")
(load "package-cfg.el")
(load "editing-cfg.el")
(load "navigation-cfg.el")
(load "shell-cfg.el")
(load "ui-cfg.el")

;;;;;;;;;;;
;; langs ;;
;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/personal/lang")
(load "go-cfg.el")
(load "clojure-cfg.el")
(load "javascript-cfg.el")
(load "markdown-cfg.el")
(load "elisp-cfg.el")
(load "python-cfg.el")

;;;;;;;;;;;;;
;; program ;;
;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/personal/program")
(load "magit-cfg.el")
(load "notmuch-cfg.el")
