(setq inhibit-startup-message t)
(setq custom-file "~/.emacs.custom")
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)

(global-display-line-numbers-mode 1)
(column-number-mode 1)
(global-hl-line-mode 1)
(ido-mode 1)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(load-theme 'gruber-darker t)
(set-face-attribute 'default nil
  :font "FiraCode Nerd Font Mono"
  :height 130)

;; package repos
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require 'evil)
(use-package evil
  :bind (("<escape>" . keyboard-escape-quit)))
(evil-mode 1)
