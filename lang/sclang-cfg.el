;;;;;;;;;;;;
;; Sclang ;;
;;;;;;;;;;;;


(require 'sclang)

(use-package sclang-extensions
  :ensure t
  :config
  (add-hook 'sclang-mode-hook 'sclang-extension-mode))

