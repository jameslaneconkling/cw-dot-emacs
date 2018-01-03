;; ~/.emacs.d/personal/lang/go-cfg.el

;; set my $GOPATH
(setenv "GOPATH" "/home/c/code/go")

;; note: in order for go-autocomplete to work properly, we need to
;; have the `gocode' binary installed in our $GOPATH/bin.
;;
;; go get github.com/nsf/gocode
;; go get golang.org/x/tools/cmd/goimports
;; go get github.com/rogpeppe/godef
;; go get github.com/golang/lint
;; go get code.google.com/p/go.tools/cmd/guru

(use-package go-mode :ensure t)
(use-package go-autocomplete :ensure t)
(use-package go-eldoc :ensure t)
(use-package go-rename :ensure t)
(use-package golint :ensure t)
(use-package gotest :ensure t)
(use-package go-playground :ensure t)

;; set go-playground basedir to GOPATH
(setq go-playground-basedir (concat
                             (getenv "GOPATH")
                             "/src/snippets"))

;; go guru:
;; this is part of go-mode, but is not installed by elpa for some reason.
;; https://docs.google.com/document/d/1_Y9xCEMj5S-7rv2ooHpZNH15JgRT5iM742gJkw5LtmQ/edit
(require 'go-guru)

;; automatically run gofmt on save
(defun go-mode-setup ()
  (go-eldoc-setup)
  ;; setup go guru identifier highlighting
  (go-guru-hl-identifier-mode)
  ;; bind go-rename
  (local-set-key (kbd "C-c C-r") 'go-rename)
  ;; use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ;; run gofmt on every save
  (add-hook 'before-save-hook 'gofmt-before-save)
  ;; godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  ;; godef-at-point key binding
  (local-set-key (kbd "M-RET") 'godoc-at-point)
  ;; Customize compile command
  (set (make-local-variable 'compile-command)
       "go install -v && go test ./... -v")
  (local-set-key (kbd "C-c C-t") 'compile)
  ;; set local go-playground bindings
  (local-set-key (kbd "C-c C-p") 'go-playground))
(add-hook 'go-mode-hook 'go-mode-setup)



;; this will allow for autocomplete when searching godocs
;; source: http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))
