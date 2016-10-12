;; ~/.emacs.d/personal/lang/python-cfg.el

;;;;;;;;;;;;
;; Python ;;
;;;;;;;;;;;;

;; use with elpy
(use-package elpy :ensure t)

(elpy-enable)
(elpy-use-ipython)
(setq elpy-rpc-backend "jedi")
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")

;; set hook for setting highlight indentation color
(add-hook 'python-mode-hook (highlight-indentation-mode 0))

;; setup Emacs IPython Notebook (EIN)
(use-package ein :ensure t)
