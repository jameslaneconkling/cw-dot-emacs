;; ~/.emacs.d/personal/lang/tex-cfg.el

;;;;;;;;;;;;;;;;;;;;
;; Latex / AUCtex ;;
;;;;;;;;;;;;;;;;;;;;

;; LaTex Preview Pane
(use-package latex-preview-pane
  :ensure t)

;; Tex Mode
(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (add-hook 'LaTex-mode-hook 'latex-preview-pane-mode) ;; enable preview mode automatically
  (setq reftex-plug-into-AUCTeX t)
  (setq TeX-PDF-mode t)
    (setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource")))


;; ;; Adjust docview mode defaults
;; (setq doc-view-resolution 300)
;; (add-hook 'doc-view-mode-hook 'doc-view-fit-page-to-window)
