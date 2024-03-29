;;;;;;;;;;;;;;;;
;; navigation ;;
;;;;;;;;;;;;;;;;

;; helm
(use-package helm :ensure t)
(use-package helm-ag :ensure t) ;; must make sure `ag` is installed
(use-package helm-projectile :ensure t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-unset-key (kbd "C-c p h"))
(global-set-key (kbd "C-x p") 'helm-projectile) ;; find files in projectile project
(global-set-key (kbd "C-x P") 'helm-projectile-switch-project) ;; switch projectile projects

;; helm-ag
(global-set-key (kbd "C-c C-f") 'helm-do-ag-project-root) ;; ag text search current project

;; dired
(eval-after-load "dired-aux"
  '(add-to-list 'dired-compress-file-suffixes 
                '("\\.zip\\'" ".zip" "unzip")))

;; set pageup/pagedown to goto next buffers
(global-set-key (kbd "<next>") 'next-buffer)
(global-set-key (kbd "<prior>") 'previous-buffer)

;; projectile everywhere!
(projectile-global-mode)

;; ido

;; ido-mode allows you to more easily navigate choices. For example,
;; when you want to switch buffers, ido presents you with a list
;; of buffers in the the mini-buffer. As you start to type a buffer's
;; name, ido will narrow down the list of buffers to match the text
;; you've typed in
;; http://www.emacswiki.org/emacs/InteractivelyDoThings

(use-package ido-completing-read+ :ensure t)
(ido-mode t)

;; This allows partial matches, e.g. "tl" will match "Tyrion Lannister"
(setq ido-enable-flex-matching t)

;; Turn this behavior off because it's annoying
(setq ido-use-filename-at-point nil)

;; Don't try to match file across all "work" directories; only match files
;; in the current directory displayed in the minibuffer
(setq ido-auto-merge-work-directories-length -1)

;; Includes buffer names of recently open files, even if they're not
;; open now
(setq ido-use-virtual-buffers t)

;; This enables ido in all contexts where it could be useful, not just
;; for selecting buffer and file names
(ido-ubiquitous-mode 1)

;; all-the-icons
;; installs a complete set of icons to be used within neotree
(use-package all-the-icons :ensure t)

;; neotree
;; allows you to view the source tree of a project
;; in order to get the icons to work properly, the fonts from this dir
;; must be installed on your system:
;; https://github.com/jaypei/emacs-neotree
(use-package neotree :ensure t)
(global-set-key [f8] 'neotree-project-dir-toggle)
(setq neo-show-hidden-files t)
(setq neo-window-fixed-size nil)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(defun neotree-project-dir-toggle ()
  "Open NeoTree using the project root, using find-file-in-project,
or the current buffer directory."
  (interactive)
  (let ((project-dir
         (ignore-errors
           ;;; Pick one: projectile or find-file-in-project
                                        ; (projectile-project-root)
           (ffip-project-root)
           ))
        (file-name (buffer-file-name))
        (neo-smart-open t))
    (if (and (fboundp 'neo-global--window-exists-p)
             (neo-global--window-exists-p))
        (neotree-hide)
      (progn
        (neotree-show)
        (if project-dir
            (neotree-dir project-dir))
        (if file-name
            (neotree-find file-name))))))
