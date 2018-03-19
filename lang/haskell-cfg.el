;;;;;;;;;;;;;
;; Haskell ;;
;;;;;;;;;;;;;


(use-package haskell-mode :ensure t)
;; (require 'tidal)
(use-package tidal :ensure t)
(setq tidal-interpreter "/usr/bin/stack")
(setq tidal-interpreter-arguments (list "ghci" "--ghci-options" "-XOverloadedStrings"))
