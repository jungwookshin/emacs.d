;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; highlight current line
(global-hl-line-mode)
(set-default 'cursor-type 'hbar)

;; For GUI emacs, deactivate menu and tool bars
;; (menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; Display line number left
(global-display-line-numbers-mode)

(set-face-attribute 'default nil :font "Monaco-18" )

;; Don't know what this mode does exactly
;;(ido-mode)

;;(column-number-mode)

(show-paren-mode)

;;(winner-mode)

(windmove-default-keybindings)

(add-to-list 'exec-path "/usr/local/bin")

;;(ac-config-default)

(package-initialize)
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "235fefd1566948a6205fa5beb7f1eb6da59227d44fa586d3a5e556b140716284" default))
 '(markdown-command "/usr/local/bin/multimarkdown")
 '(package-selected-packages
   '(eglot exwm org-roam-ui org-babel-eval-in-repl dap-mode realgud-lldb tramp-theme markdown-preview-eww treemacs-icons-dired spaceline-all-the-icons treemacs-all-the-icons all-the-icons-ivy-rich ox-latex-subfigure org-edit-latex all-the-icons-ibuffer all-the-icons-gnus all-the-icons-ivy all-the-icons-dired company-shell company-math company-ctags company-bibtex company-c-headers sr-speedbar ewal-doom-themes doom-modeline org-roam-server helm-bibtexkey helm-bibtex org-roam-bibtex org-roam markdown-mode julia-shell julia-repl julia-mode virtualenv elpy ssh cuda-mode multiple-cursors ag auto-complete-clang switch-window ac-clang wanderlust evil magit company-irony irony company avy eyebrowse swiper nimbus-theme projectile ivy))
 '(speedbar-verbosity-level 0)
 '(sr-speedbar-right-side nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'doom-one t)

(ivy-mode 1)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;;(use-package elpy
;;  :ensure t
;;  :init
;;  (elpy-enable))

(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(projectile-mode +1)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "C-M-z") 'switch-window)

(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq tramp-default-method "ssh")
(setq-default indent-tabs-mode nil) ;;tab to space?

;; Org-roam
;;(add-to-list 'exec-path "/usr/bin/sqlite3")
;;(setq org-roam-directory "~/db/Library.org-roam")
;;(add-hook 'after-init-hook 'org-roam-mode)
;; 
;; (org-roam-db-location (expand-file-name (concat "org-roam." hr/hostname ".db") org-roam-directory))

;;(use-package doom-themes
;;    :ensure t
;;    :config
;;    (load-theme 'doom-one))

;;
(require 'doom-modeline)
(doom-modeline-mode 1)

;; GDB setup
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

(setq gdb-command-name "/usr/local/bin/gdb")

(put 'upcase-region 'disabled nil)

(global-set-key (kbd "<f3>") 'compile)
(global-set-key (kbd "<f4>") 'recompile)
;;(define-key c++-mode-map (kbd "<f3>") #'compile) ;;c++-mode-map is corre t
;;(define-key c++-mode-map (kbd "<f4>") #'recompile)

(setq visible-bell 1)

;; Tramp mode set up
(require 'tramp)
(setq tramp-default-method "ssh")

;;(package-install 'julia-mode)
;;(require 'julia-mode)

;;https://www.emacswiki.org/emacs/ExecPath
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match
that used by the user's shell.

This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
			              "[ \t\n]*$" "" (shell-command-to-string
					          "$SHELL --login -c 'echo $PATH'"
						      ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

;; Babel mode -- start
;; from http://doc.norang.ca/org-mode.html#playingwithditaa

;; JWS: following two lines are commented out
;;(setq org-ditaa-jar-path "~/git/org-mode/contrib/scripts/ditaa.jar")
(setq org-plantuml-jar-path "~/.emacs.d/extra/plantuml.jar")

;; python
(setq python-shell-interpreter "/usr/local/bin/python3")

(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)

; Make babel results blocks lowercase
(setq org-babel-results-keyword "results")

(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
         (ditaa . t)
         (R . t)
         (python . t)
         (ruby . t)
         (gnuplot . t)
         (clojure . t)
         (shell . t)
;;         (ledger . t)
         (org . t)
         (julia . t)
         (plantuml . t)
         (latex . t))))

; Do not prompt to confirm evaluation
; This may be dangerous - make sure you understand the consequences
; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

; Use fundamental mode when editing plantuml blocks with C-c '
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))
;; Babel mode -- end

;; Environment modules
  ;; load and init emacs lisp modules if not already loaded...
(if (and (getenv "MODULESHOME")
         (file-directory-p (getenv "MODULESHOME"))
         (not (fboundp 'module)))
    (progn
      (if (load-file (concat (getenv "MODULESHOME") "/init/lisp"))
          (define-key global-map "\C-cm" 'Modules-module))))

(set-exec-path-from-shell-PATH)
