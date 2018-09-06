(setq python-environment-virtualenv (list "/usr/local/bin/virtualenv" "--system-site-packages" "--quiet"))

(load-file "~/.emacs.d/site-lisp/jedi-starter.el")

;;(add-to-list 'package-archives
;;             '("elpy" . "http://jorgenschaefer.github.io/packages/") t)

(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "flake8")


(elpy-enable)

;; Font size
;;(define-key global-map (kbd "M-s +") 'zoom-in)
;;(define-key global-map (kbd "M-s -") 'zoom-out)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; So good!
(global-set-key (kbd "C-c g") 'magit-status)


;;(add-to-list 'load-path "/path/to/dash-at-point")
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

;; jroth on 4.8.2011
;; Undo/redo window configuration with C-c <left>/<right>
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; jroth 5.8.2014 Another gem from Howard Abraham's blog here
;; http://howardabrams.com/projects/dot-files/emacs.html#sec-2-3
(when (window-system)
  (set-frame-font "Source Code Pro")
  (set-face-attribute 'default nil :font "Source Code Pro" :height 140)
  (set-face-font 'default "Source Code Pro"))

;; jroth 8.19.2016 Trying out ox-rst.el for translation of org-mode syntax
;; to restructuredText
;;(require 'ox-rst)

;; jroth 3.19.2018 Following added from Mike Zamansky video watching
;;
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; jroth Packages from here down added as a result of watching the
;; great 'Using Emacs' YouTube series by Mike Zamansky
(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Org-mode stuff
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Ace-window mode
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

;; (use-package counsel
;;   :ensure t
;;   :bind
;;   (("M-y" . counsel-yank-pop)
;;    :map ivy-minibuffer-map
;;    ("M-y" . ivy-next-line)))

;; (use-package ivy
;;   :ensure t
;;   :diminish (ivy-mode)
;;   :bind (("C-x b" . ivy-switch-buffer))
;;   :config
;;   (ivy-mode 1)
;;   (setq ivy-use-virtual-buffers t)
;;   (setq ivy-count-format "%d/%d ")
;;   (setq ivy-display-style 'fancy))

;; (use-package swiper
;;   :ensure t
;;   :config
;;   (progn
;;     (ivy-mode 1)
;;     (setq ivy-use-virtual-buffers t)
;;     (setq enable-recursive-minibuffers t)
;;     (global-set-key "\C-s" 'swiper)
;;     (global-set-key (kbd "C-c C-r") 'ivy-resume)
;;     (global-set-key (kbd "<f6>") 'ivy-resume)
;;     (global-set-key (kbd "M-x") 'counsel-M-x)
;;     (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;     (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;;     (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;;     (global-set-key (kbd "<f1> l") 'counsel-find-library)
;;     (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;     (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;;     (global-set-key (kbd "C-c g") 'counsel-git)
;;     (global-set-key (kbd "C-c j") 'counsel-git-grep)
;;     (global-set-key (kbd "C-c k") 'counsel-ag)
;;     (global-set-key (kbd "C-x l") 'counsel-locate)
;;     (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;;     (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
;;     ))

;; (use-package swiper
;;   :ensure t
;;   :bind (("C-s" . swiper)
;; 	 ("C-r" . swiper)
;; 	 ("C-c C-r" . ivy-resume)
;; 	 ("M-x" . counsel-M-x)
;; 	 ("C-x C-f" . counsel-find-file))
;;   :config
;;   (progn
;;     (ivy-mode 1)
;;     (setq ivy-use-virtual-buffers t)
;;     (setq ivy-display-style 'fancy)
;;     (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
;;     ))
