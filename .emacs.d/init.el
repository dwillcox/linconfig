(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("12bacee81d067acf07dec4c867be541a04744a6ac6a39636de25a2c77e9b573c" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'misterioso)

(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

(put 'downcase-region 'disabled nil)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

; wind move -- use shift + arrows to change windows
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
