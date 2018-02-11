;;;;;;;;;;;;;;;;;;;
;; markdown mode ;;
;;;;;;;;;;;;;;;;;;;

(use-package markdown-mode :ensure t)

(add-hook 'markdown-mode-hook 'toggle-truncate-lines)
