;;;;;;;;;;;;;
;; notmuch ;;
;;;;;;;;;;;;;

(use-package notmuch :ensure t)
(require 'notmuch)

;; (use-package notmuch-crypto-process-mime :ensure t)
;; (require 'notmuch-crypto-process-mime)
(setq notmuch-crypto-process-mime t)

;; (use-package smptmail :ensure t)
;; (use-package starttls :ensure t)

;; (require 'smtpmail)
;; (require 'starttls)

;; (setq smtpmail-starttls-credentials '(("riseup.net" 587 nil nil))
;;       smtpmail-auth-credentials (expand-file-name "~/.pw/agriseup")
;;       smtpmail-default-smtp-server "riseup.net"
;;       smtpmail-smtp-server "riseup.net"
;;       smtpmail-smtp-service 587)

;; (setq message-send-mail-function 'smtpmail-send-it)
