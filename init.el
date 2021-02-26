;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(package-refresh-contents)

(setq use-package-always-defer t)
(setq inhibit-startup-message   t)   ; Don't want any startup message 
(setq x-select-enable-clipboard t)
(setq make-backup-files nil)
(setq auto-save-default nil)

;;indentation 
(setq-default tab-width 4)
(setq-default standard-indent 4)
(setq c-basic-offset tab-width)
(setq-default electric-indent-inhibit t)
(setq-default indent-tabs-mode t)
(setq backward-delete-char-untabify-method 'nil)

;;sendmail 

(setq sendmail-program "/usr/bin/msmtp"
      send-mail-function 'smtpmail-send-it
      message-sendmail-f-is-evil t
      message-sendmail-extra-arguments '("--read-envelope-from")
      message-send-mail-function 'message-send-mail-with-sendmail)

(electric-pair-mode t)

;; Enable Evil
(require 'evil)
(evil-mode 1)

(load-theme 'base16-gruvbox-dark-medium t )

;;org mode setup 
(require 'org) 
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t) 
(setq org-agenda-files (list 	"~/org/todo.org"
				"~/org/code.org" )) 

(require 'linum-relative)
;;initial screen 
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq initial-buffer-choice "~/org/todo.org")

(defun my-init-hook ()
  (split-window-right)
  (let ((org-agenda-window-setup 'other-window))
    (org-agenda nil "a")))

(add-hook 'window-setup-hook #'my-init-hook)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;;new window switches to it 

                             
(global-visual-line-mode 1) 
(global-prettify-symbols-mode t)
(global-hl-line-mode t)
(show-paren-mode 1)
(display-time-mode 1)
(tool-bar-mode -1)
(global-linum-mode 1)
(electric-indent-mode -1)
(scroll-bar-mode -1)

(defalias 'yes-or-no-p 'y-or-n-p)



(setq electric-pair-pairs '(
                            (?\{ . ?\})
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\" . ?\")
                            (?\' . ?\')
			    (?\< . ?\>) 	
                            ))
(electric-pair-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (linum-relative auctex magit base16-theme evil)))
 '(send-mail-function (quote mailclient-send-it))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 120 :width normal)))))


