(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (base16-chalk-dark)))
 '(custom-safe-themes
   (quote
	("5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "921f7475c69408debd1c0fd32ca3b56b3eec55705ed51bd63e8b78b4a0d6da4f" "7509272ce8fe1a1a429814e317090bb6ec52d018c23c30df88de54cbef755d84" "b6d649c9f972b491686e7fa634535653e6222c1faca1ab71b3117854470a79ae" "f21caace402180ab3dc5157d2bb843c4daafbe64aadc362c9f4558ac17ce43a2" default)))
 '(diff-switches "-u")
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
	(markdown-mode lua-mode org2jekyll org-page ob-ipython material-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (setq inferior-lisp-program "/home/eugene/local/lisp/sbcl/install/bin/sbcl")
;; (load (expand-file-name "~/quicklisp/slime-helper.el"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://stable.melpa.org/packages/"))
(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(load-theme 'material-light)

(setq default-tab-width 4)

(put 'downcase-region 'disabled nil)

;; ob-ipython configuration
(require 'ob-ipython)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ipython . t)
   ;; other languages
   ))

;; ORG MODE configuration
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; don't prompt to confirm when evaluating code blocks
(setq org-confirm-babel-evaluate nil)

;; workaround ob-ipython issue #28
(setq python-shell-completion-native-enable nil)

;; display/update images in the buffer upon evaluation
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

;; Markdown mode for pyjournal files
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.list\\'" . markdown-mode))

;; Emacs Edit Server for the Chrome Edit with Emacs extension
(require 'edit-server)
(edit-server-start)
