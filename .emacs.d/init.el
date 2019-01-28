(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (base16-chalk-dark)))
 '(custom-safe-themes
   (quote
    ("921f7475c69408debd1c0fd32ca3b56b3eec55705ed51bd63e8b78b4a0d6da4f" "7509272ce8fe1a1a429814e317090bb6ec52d018c23c30df88de54cbef755d84" "b6d649c9f972b491686e7fa634535653e6222c1faca1ab71b3117854470a79ae" "f21caace402180ab3dc5157d2bb843c4daafbe64aadc362c9f4558ac17ce43a2" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq inferior-lisp-program "/home/eugene/local/lisp/sbcl/install/bin/sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(load-theme 'base16-chalk-dark)

(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
