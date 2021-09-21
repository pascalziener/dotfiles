;; PZI Emacs Config
;; Build with the help of Emacs From Scratch series by System Crafters
;; https://www.youtube.com/playlist?list=PLEoMzSkcN8oPH1au7H6B7bBJ4ZO7BXjSZ
;;
;; ...and inspired by several other sources

;; * General Configuration


;; Use Ivy for completions
(use-package ivy
    :diminish ;(ivy-mode . "")
;;  :bind (("C-s" . swiper)
;;	 :map ivy-minibuffer-map
;;	 ("TAB" . ivy-alt-done)
;;	 ("C-l" . ivy-alt-done)
;;	 ("C-j" . ivy-next-line)
;;	 ("C-k" . ivy-previous-line)
;;	 :map ivy-switch-buffer-map
;;	 ("C-k" . ivy-previous-line)
;;	 ("C-l" . ivy-done)
;;	 ("C-d" . ivy-switch-buffer-kill)
;;	 :map ivy-reverse-i-search-map
;;	 ("C-k" . ivy-previous-line)
;;	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t  ; Add recent files and bookmarks to the ivy-switch-buffer
	ivy-count-format "%d/%d " ; Displays the current and total number in the collection in the prompt
	ivy-wrap t)) ;ivy-next-line and ivy-previous-line will cycle past the last and the first candidates respectively. 

;; Use Counsel to override basic Emacs commands 
(use-package counsel
  :bind
  (("M-x"   . counsel-M-x)
   ("C-s"   . swiper)
   ("C-x C-f" . counsel-find-file))
  :config
  (setq ivy-initial-inputs-alist nil)) ; Don't start searches with ^

;; Use ivy-rich to add some information to ivy buffers
;; https://github.com/Yevgnen/ivy-rich
(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))





;; Disable line numbers for some modes
;;(dolist (mode '(org-mode-hook
;;                term-mode-hook
;;                shell-mode-hook
;;                treemacs-mode-hook
;;                eshell-mode-hook))
;;;  (add-hook mode (lambda () (display-line-numbers-mode 0))))





;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; all-the-icons is required for doom-modeline to show beautiful icons
(use-package all-the-icons)

;; first time you need to run
;; M-x all-the-icons-install-font
;; On Windows 10 it is necessary to install the fonts manually afterwards
;; https://www.hackercitizen.com/emacs-for-windows-10-install-all-the-icons/
;; https://github.com/domtronn/all-the-icons.el

;; Use doom-modeline for a more minimal experience
;; https://github.com/seagle0128/doom-modeline
(use-package doom-modeline
  :init
  (doom-modeline-mode 1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; which-key
;; https://github.com/justbur/emacs-which-key
(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5))

;; ** Font
;; *** Set the font
(set-face-attribute 'default nil :font "Fira Code Retina" :height 110)

;; ** Theme
;; *** Set a theme
;;(load-theme 'wombat)

;; Doom Themes
;; https://github.com/hlissner/emacs-doom-themes
(use-package doom-themes
  :config
  (load-theme 'doom-city-lights t)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) org-mode's native fontification
  (doom-themes-org-config))

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialze use-package on non-linux platforms
;; https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t) ; install packages automatically if not already present on the system

;; Disable startup message
(setq inhibit-startup-message t)
(scroll-bar-mode -1)   ; Disable visible scrollbar
(tool-bar-mode -1)     ; Disable the toolba
(tooltip-mode -1)      ; Disable tooltips
(set-fringe-mode 10)   ; Give some breathing room
;; Keep the menu enabled for now
;;(menu-bar-mode -1)     ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

;; Enable line numbers globally
(global-display-line-numbers-mode t)

;; Add current column to the modeline
(column-number-mode)

(cua-mode t)

(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)))

(setq org-confirm-babel-evaluate nil)

;; This is need as of Org 9.2
(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src sh"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
;;(add-to-list 'org-structure-template-alist '("sc" . "src scheme"))
;;(add-to-list 'org-structure-template-alist '("ts" . "src typescript"))
;;(add-to-list 'org-structure-template-alist '("py" . "src python"))
;;(add-to-list 'org-structure-template-alist '("go" . "src go"))
;;(add-to-list 'org-structure-template-alist '("yaml" . "src yaml"))
;;(add-to-list 'org-structure-template-alist '("json" . "src json"))
