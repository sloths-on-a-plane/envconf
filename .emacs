;; package repos
(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(setq my-packages
      '(magit
        clojure-mode
	fill-column-indicator
	pretty-mode
        cider
	undo-tree
	helm
	paredit
	projectile
	helm-projectile
	badwolf-theme))

;; install missing packages
(defun install-missing-packages ()
  (interactive)
  (let ((not-installed (remove-if 'package-installed-p my-packages)))
    (when (and not-installed
               (y-or-n-p
                (format "There are %d packages to be installed. Install? "
                        (length not-installed))))
      (package-refresh-contents)
      (dolist (package my-packages)
        (when (not (package-installed-p package))
          (package-install package))))))

(install-missing-packages)

;; basic env config
(setq global-auto-revert-non-file-buffers t)
(show-paren-mode 1)
(line-number-mode 1)
(display-time-mode 0)
(scroll-bar-mode nil)
(tool-bar-mode -1)
(setq fci-rule-width 1)
(setq fci-rule-color "brightblack")
(load-theme 'badwolf t)
(helm-mode 1)
(projectile-global-mode)
(global-undo-tree-mode)

;; tab are forbidden. trailing spaces as well
(add-hook 'write-file-functions 'delete-trailing-whitespace)

;; setup cider
(add-hook 'clojure-mode-hook 'pretty-mode)
(add-hook 'clojure-mode-hook 'fci-mode)
(add-hook 'clojure-mode-hook 'linum-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
;(add-hook 'clojure-mode-hook 'projectile-mode)
;(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(setq linum-format "%4d \u2502 ")
(setq-default fill-column 80)

(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(add-hook 'clojure-nrepl-mode-hook 'ac-nrepl-setup)

;; window toggling
(global-set-key (kbd "C-x p") 'previous-multiframe-window)

;; set active window title bar
(set-face-attribute  'mode-line
                 nil
                 :foreground "gray80"
                 :background "#FF2C4B"
                 :box '(:line-width 1 :style released-button))
(set-face-attribute  'mode-line-inactive
                 nil
                 :foreground "gray0"
                 :background "gray90"
                 :box '(:line-width 1 :style released-button))
(put 'erase-buffer 'disabled nil)

;; magit
(setq magit-last-seen-setup-instructions "1.4.0")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
