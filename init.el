;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(menu-bar-mode -1)
(tool-bar-mode -1)

(package-initialize)

(global-display-line-numbers-mode)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("235fefd1566948a6205fa5beb7f1eb6da59227d44fa586d3a5e556b140716284" default)))
 '(package-selected-packages
   (quote
    (ag wanderlust evil magit company-irony irony company avy eyebrowse swiper nimbus-theme projectile ivy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(load-theme 'nimbus t)
(ivy-mode 1)


(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(projectile-mode +1)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
