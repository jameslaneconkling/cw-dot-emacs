;; ~/.emacs.d/personal/env/on-start-cfg.el

;;;;;;;;;;;;;;
;; on-start ;;
;;;;;;;;;;;;;;

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; open todo list
(find-file "~/todo.org")
