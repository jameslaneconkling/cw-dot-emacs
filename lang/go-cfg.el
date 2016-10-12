;; ~/.emacs.d/personal/lang/go-cfg.el

(use-package go-mode :ensure t)
(use-package go-autocomplete :ensure t)
(use-package go-eldoc :ensure t)

;; automatically run gofmt on save
(defun go-mode-setup ()
  (go-eldoc-setup)
  (add-hook 'before-save-hook 'gofmt-before-save))
(add-hook 'go-mode-hook 'go-mode-setup)


