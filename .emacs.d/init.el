;; PZI Emacs Config
;; Build with the help of Emacs From Scratch series by System Crafters
;; https://www.youtube.com/playlist?list=PLEoMzSkcN8oPH1au7H6B7bBJ4ZO7BXjSZ
;;
;; ...and inspired by several other sources

;; * General Configuration
;; ** Package Management

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


;; ** User Interface
;; Clean up Emacs' user interface, make it more minimal.

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

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; ** Font
;; *** Set the font
(set-face-attribute 'default nil :font "Fira Code Retina" :height 110)

;; ** Theme
;; *** Set a theme
;;(load-theme 'tango-dark)
(load-theme 'wombat)


