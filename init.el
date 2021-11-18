(require 'package)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;; Melpa stable
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; install use-package if isn't installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; (load-theme 'cyberpunk t)

;; fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)

;; AC with TAB
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; keybind for kill-buffer-and-window
(global-set-key "" (quote kill-buffer-and-window))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("20a8ec387dde11cc0190032a9f838edcc647863c824eed9c8e80a4155f8c6037" default)))
 '(package-selected-packages
   (quote
    (ace-window slime use-package cyberpunk-theme auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; for better looking
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; common lisp with slime and clisp
(setq inferior-lisp-program "clisp")
(setq auto-mode-alist (append '(("\\.lisp$" . slime-mode))
			      auto-mode-alist))

;; quickly switch windows
(global-set-key (kbd "M-p") 'ace-window)
