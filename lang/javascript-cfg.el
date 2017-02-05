
;;;;;;;;;;;;
;; eslint ;;
;;;;;;;;;;;;

;; disable jshint
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; find linters in node_modules as opposed to global
(defun use-js-executables-from-node-modules ()
  "Set executables of JS checkers from local node modules."
  (-when-let* ((file-name (buffer-file-name))
               (root (locate-dominating-file file-name "node_modules"))
               (module-directory (expand-file-name "node_modules" root)))
    (pcase-dolist (`(,checker . ,module) '((javascript-jshint . "jshint")
                                           (javascript-eslint . "eslint")
                                           (javascript-jscs   . "jscs")))
      (let ((package-directory (expand-file-name module module-directory))
            (executable-var (flycheck-checker-executable-variable checker)))
        (when (file-directory-p package-directory)
          (set (make-local-variable executable-var)
               (expand-file-name (concat "bin/" module ".js")
                                 package-directory)))))))
;; find eslint in node_modules upon loading flycheck
(add-hook 'flycheck-mode-hook #'use-js-executables-from-node-modules)





;;;;;;;;;;;;;;;;;;;;;
;; javascript mode ;;
;;;;;;;;;;;;;;;;;;;;;

(use-package nodejs-repl :ensure t)
(use-package js2-mode :ensure t)
(use-package jsx-mode :ensure t)
(use-package react-snippets :ensure t)
(use-package ac-js2 :ensure t)
(use-package js-comint :ensure t)
(use-package color-identifiers-mode :ensure t)

;; js2-mode for .js files
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; set js2-mode variables
(setq js-basic-indent 2)
(setq-default js2-basic-indent 2)
(setq-default js2-basic-offset 2)
(setq-default js2-auto-indent-p t)
(setq-default js2-cleanup-whitespace t)
(setq-default js2-enter-indents-newline t)
(setq-default js2-global-externs "jQuery $")
(setq-default js2-indent-on-enter-key t)
(setq-default js2-mode-indent-ignore-first-tab t)
(setq-default js2-global-externs '("module" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))

;; Place warning font around TODO and others:
(font-lock-add-keywords 'js2-mode
                        '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
                           1 font-lock-warning-face t)))

;; auto-completion
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; disable syntax checking in js2-mode
(setq-default js2-mode-show-parse-errors nil)
(setq-default js2-mode-show-strict-warnings nil)



;;;;;;;;;;;;;;
;; web mode ;;
;;;;;;;;;;;;;;

(use-package web-mode :ensure t)

;; basic configs
(defun config-web-mode ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-style-padding 1)
  (setq web-mode-script-padding 1)
  (setq web-mode-block-padding 0))
(add-hook 'web-mode-hook  'config-web-mode)

;; tag-wrapping
(defun wrap-in-html-tag (start end)
  "Wraps the selected text or the point with a tag"
  (interactive "r")
  (let (string)
    (if mark-active
        (list (setq string (buffer-substring start end))
              (delete-region start end)))
    (yas-expand-snippet (point)
                        (point)
                        (concat "<${1:p}>" string "$0</${1:$(replace-regexp-in-string \" .*\" \"\" text)}>"))))

(add-hook 'web-mode-hook
          '(lambda ()
             (local-set-key "\C-t" 'wrap-in-html-tag)))

;; use eslint with web-mode
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; react-specific configs
(require 'react-snippets)

;;works:
(add-to-list 'auto-mode-alist '("\\.js$" . js2-jsx-mode))
(add-hook 'js2-jsx-mode-hook
          (lambda ()
            (when (equal web-mode-content-type "js")
              (flycheck-select-checker 'javascript-eslint)
              (flycheck-mode)
              (yas-minor-mode)
              (message "Loaded jsx specific stuff"))))

