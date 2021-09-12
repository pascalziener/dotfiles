;; PZI Emacs Config
;; Build with the help of Emacs From Scratch series by System Crafters
;; https://www.youtube.com/playlist?list=PLEoMzSkcN8oPH1au7H6B7bBJ4ZO7BXjSZ
;;
;; ...and inspired by several other sources

;; * General Configuration
;; ** User Interface
;; Clean up Emacs' user interface, make it more minimal.

;; Disable startup message
(setq inhibit-startup-message t)

(scroll-bar-mode -1)   ; Disable visible scrollbar
(tool-bar-mode -1)     ; Disable the toolbar
(tooltip-mode -1)      ; Disable tooltips
(set-fringe-mode 10)   ; Give some breathing room
;; Keep the menu enabled for now
;;(menu-bar-mode -1)     ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)
