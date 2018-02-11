;;;;;;;;;;;;;;
;; org-mode ;;
;;;;;;;;;;;;;;

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-c+" 'org-priority-up)
(define-key global-map "\C-c-" 'org-priority-down)

(add-hook 'org-mode-hook 'toggle-truncate-lines)
(setq org-startup-truncated t)
(setq org-ellipsis " \u25bc")

(custom-set-faces
 '(org-link ((t (:underline nil)))) ;; no link underline
 )

;; setup todo workflow states
(setq org-todo-keywords
      '((sequece "TODO" "IN PROGRESS(!)" "|" "DONE(@)" "ABANDONED(@)")))

;; configure org agenda to use appropriate files
(setq org-agenda-files '("~/org" "~/org/projects"))

(defun org-filter-subtree-of-priority (priority)
  "filter out an org agenda subtree if it has the provided PRIORITY

PRIORITY may be ?A | ?B | ?C"
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))

;; setup custom agenda view(s)
(setq org-agenda-custom-commands
      '(("c" "gr8 agenda view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Top priority:")))
          (agenda "")
          (alltodo ""
                   ((org-agenda-skip-function
                     '(or (org-filter-subtree-of-priority ?A)
                          (org-agenda-skip-if nil '(scheduled deadline))))
                    (org-agenda-overriding-header "Backlog:")))))))
