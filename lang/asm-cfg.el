;;;;;;;;;;;;;;
;; Assembly ;;
;;;;;;;;;;;;;;

(use-package x86-lookup
  :ensure t
  :config
  (setq x86-lookup-pdf "~/books/reference/hacking/64-ia-32-architectures-software-developer-instruction-set-reference-manual.pdf")
  (setq x86-lookup-browse-pdf-function 'x86-lookup-browse-pdf-zathura)
  (add-hook 'asm-mode-hook (lambda () (
                                       local-set-key (kbd "M-.") #'x86-lookup
                                       )))
  )
(use-package nasm-mode
  :ensure t
  :config
  (add-hook 'asm-mode-hook 'nasm-mode)
  )
