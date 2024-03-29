;;;;;;;;;;;;;
;; editing ;;
;;;;;;;;;;;;;

;; pair completion
(electric-pair-mode 1)
(setq electric-pair-pairs '((?\" . ?\")(?\{ . ?\}))) ;; include {} and "" as pairs

;; tabbing
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq-default js-indent-level 2)

(fset 'indent-riffle [tab down])
(define-key global-map "\C-z" 'indent-riffle)

;; code-folding
;; (hs-minor-mode t) ;;<- won't work by default in fundamental mode
;; (global-set-key (kbd "C-c <up>") 'hs-show-block)
;; (global-set-key (kbd "C-c <down>") 'hs-hide-block)
;; (global-set-key (kbd "C-c C-<up>") 'hs-show-all)
;; (global-set-key (kbd "C-c C-<down>") 'hs-hide-all)

;; multiple cursors
(use-package multiple-cursors :ensure t)
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; autocomplete
(use-package auto-complete :ensure t)
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.c/ac-dict")
(ac-config-default)

;; fixme mode
(use-package fixme-mode :ensure t)

(use-package company :ensure t)
(add-hook 'after-init-hook 'global-company-mode)

;; snippets
(use-package yasnippet :ensure t)
(require 'yasnippet)
(defun ac-yasnippet-mode-setup ()
  "Append yasnippets as a source to ac-sources."
  (setq ac-sources (append '(ac-source-yasnippet) ac-sources)))
(add-hook 'auto-complete-mode-hook 'ac-yasnippet-mode-setup)

;; syntax-checking
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
;; set warning color
;; (cw|2.5.2017) actually this is p distracting, maybe softer
;; colors in the future...
;; (set-face-attribute 'flycheck-warning nil
;;                     :foreground "yellow"
;;                     :background "red")

;; regexp-builder tweaks
(use-package re-builder :ensure t)
(require 're-builder)
(setq reb-re-syntax 'string)

;; rainbow-mode for highlighting hexidecimal/rgb color strings with their color.
(use-package rainbow-mode :ensure t)
(add-hook 'js-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'web-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'css-mode-hook (lambda () (rainbow-mode 1)))

;; tern
;; for javascript development (move to javascript-cfg.el?)
(use-package tern :ensure t)
(use-package tern-auto-complete :ensure t)
(use-package company-tern :ensure t)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-hook 'web-mode-hook (lambda () (tern-mode t)))

(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))

