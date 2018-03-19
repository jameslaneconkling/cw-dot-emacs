;; ~/.emacs.d/personal/config.el

;;;;;;;;;
;; env ;;
;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/personal/env")
(load "kbd-cfg.el")
(load "package-cfg.el")
(load "editing-cfg.el")
(load "navigation-cfg.el")
(load "shell-cfg.el")
(load "ui-cfg.el")
(load "org-cfg.el")
(load "on-start-cfg.el")

;;;;;;;;;;;
;; langs ;;
;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/personal/lang")
(load "go-cfg.el")
(load "clojure-cfg.el")
(load "sclang-cfg.el")
(load "javascript-cfg.el")
(load "markdown-cfg.el")
(load "elisp-cfg.el")
(load "python-cfg.el")
(load "tex-cfg.el")
(load "forth-cfg.el")
(load "asm-cfg.el")
(load "brainfuck-cfg.el")
(load "tpp-cfg.el")
(load "haskell-cfg.el")

;;;;;;;;;;;;;
;; program ;;
;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/personal/program")
(load "magit-cfg.el")
(load "notmuch-cfg.el")
(load "matrix-cfg.el")
