;; ~/.emacs.d/personal/lang/python-cfg.el

;;;;;;;;;;;;
;; Python ;;
;;;;;;;;;;;;

;; use with elpy
;; python installation requirements:
;; jedi: autocomplete, static analysis tool
;; rope: refactor
;; flake8: syntax checker
;; autopep8: auto PEP8 formatting
;; importmagic: auto imports
(use-package elpy :ensure t)

(elpy-enable)
(elpy-use-ipython)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")

;; set hook for setting highlight indentation color
(add-hook 'python-mode-hook (highlight-indentation-mode 1))

;; setup Emacs IPython Notebook (EIN)
;; see details here: http://millejoh.github.io/emacs-ipython-notebook/
(use-package ein :ensure t)
(require 'ein-loaddefs)
(require 'ein-notebook)
(require 'ein-subpackages)
(setq request-backend 'url-retrieve)

(with-eval-after-load "ein"
  (defun advice:ein:notebooklist-open (&rest args)
    (call-interactively 'ein:force-ipython-version-check)
    'before)
  (advice-add 'ein:notebooklist-open :before 'advice:ein:notebooklist-open))
