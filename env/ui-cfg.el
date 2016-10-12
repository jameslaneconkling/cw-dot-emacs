;;;;;;;;
;; ui ;;
;;;;;;;;

;; transpose-windows
(use-package transpose-frame :ensure t)
(require 'transpose-frame)

;; line numbering
(global-linum-mode)
(column-number-mode)
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
 x-select-enable-clipboard t

 ;; I'm actually not sure what this does but it's recommended?
 x-select-enable-primary t

 ;; Save clipboard strings into kill ring before replacing them.
 ;; When one selects something in another program to paste it into Emacs,
 ;; but kills something in Emacs before actually pasting it,
 ;; this selection is gone unless this variable is non-nil
 save-interprogram-paste-before-kill t

 ;; Shows all options when running apropos. For more info,
 ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
 apropos-do-all t

 ;; Mouse yank commands yank at point instead of at click.
 mouse-yank-at-point t)

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; theme
(use-package dracula-theme
  :init (progn (load-theme 'dracula t))
  :ensure t)


;;;;;;;;;;;;;;;;;;;
;; Dracula Theme ;;
;;;;;;;;;;;;;;;;;;;

;; manually reset background, linum, and lin, highlight indent-face 
(add-to-list 'default-frame-alist '(background-color . "#262626"))
(set-face-background 'linum "#262626")
(set-face-background 'hl-line "#3e4446")
(set-face-background 'mode-line "#875faf")
(set-face-background 'modeline-inactive "#5f5f87")