(require 'package)
; list the packages you want
(setq package-list '(cider
                     clojure-mode
                     markdown-mode
                     exec-path-from-shell
                     smartparens
                     flx-ido
                     projectile
                     rainbow-delimiters
                     magit
                     git-gutter
                     gist
                     solarized-theme
                     zenburn-theme
                     blank-mode
                     anaconda-mode
                     flymake-python-pyflakes
                     python-environment
                     jedi
                     org
                     org-redmine))

; things to try
; flash sexp-eval: https://github.com/samaaron/nrepl-eval-sexp-fu
; M-x ido:         https://github.com/nonsequitur/smex

; list the repositories containing them
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;; Always ALWAYS use UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

;; Automatically save buffers before compiling
;(setq compilation-ask-about-save nil)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

; General UI stuff
(global-linum-mode t)
(global-hl-line-mode t)
;(setq default-tab-width 2)
;(setq inhibit-startup-message t)
;(setq visible-bell 'top-bottom)
;(setq x-underline-at-descent-line t)
;(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;(unless (display-graphic-p) (menu-bar-mode -1))
;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
;(setq mouse-wheel-progressive-speed nil)
;(setq mouse-wheel-follow-mouse 't)
;(setq scroll-step 1)

(load-theme 'solarized-light t)
;(load-theme 'solarized-dark t)
(set-default-font "Source-Code-Pro")

(require 'exec-path-from-shell)
(setq exec-path-from-shell-arguments
      (delete "-i" exec-path-from-shell-arguments))
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching 0)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(require 'recentf)
(recentf-mode 1)

(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

;
(require 'rainbow-delimiters nil)
(rainbow-delimiters-mode 1)

(require 'icomplete)

(smartparens-global-mode t)
; https://github.com/Fuco1/smartparens/wiki/Example-configuration

(require 'git-gutter)
(global-git-gutter-mode t)

;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; )

(require 'blank-mode)

(defun my-other-delete-trailing-blank-lines ()
  "Deletes all blank lines at the end of the file, even the last one"
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-max))
      (delete-blank-lines)
      (let ((trailnewlines (abs (skip-chars-backward "\n\t"))))
        (if (> trailnewlines 0)
          (progn
            (delete-char trailnewlines)))))))

; remove trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; rainbow delimiters!
(global-rainbow-delimiters-mode)
;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

; python stuff
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)

(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

(add-hook 'python-mode-hook 'jedi:setup)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Documents/orgmode/daniel.org" "~/Documents/orgmode/retresco.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; org mode stuff
(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(define-key input-decode-map "\e[1;2A" [S-up])
(define-key input-decode-map "\e[1;10A" [S-M-up])
(define-key input-decode-map "\e[1;10B" [S-M-down])
(define-key input-decode-map "\e[1;10C" [S-M-right])
(define-key input-decode-map "\e[1;10D" [S-M-left])

(require 'org-redmine)
(setq org-redmine-uri "https://redmine.rtrsupport.de")
(setq org-redmine-auth-api-key "42bc8baa5772ae8a9640540e9523a532bb390b8c")

(setq-default indent-tabs-mode nil)
