;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "everdom"
      user-mail-address "everdom.g@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(require 'which-key)
(setq which-key-idle-delay 0.1)
(setq which-key-idle-secondary-delay 0.1)

;; maximized when boot
;; (toggle-frame-maximized)
(add-hook 'window-setup-hook #'toggle-frame-maximized)
;; (add-hook 'window-setup-hook 'toggle-frame-maximized t)
(add-hook 'after-make-frame-functions 'toggle-frame-maximized)

(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(setq url-proxy-service
      '(("http" . "192.168.0.65:7890")        ;; notice without protocol, do NOT add protoco
        ("https" . "192.168.0.65:7890")))

;; (setq indent-tabs-mode t)
(setq-default tab-width 4)
(setq tab-width 4)

(setq doom-font (font-spec :family "Sarasa Mono SC Nerd" :size 16)
      doom-serif-font (font-spec :family "Sarasa Mono SC Nerd")
      doom-variable-pitch-font (font-spec :family "Sarasa Mono SC Nerd")
      doom-unicode-font (font-spec :family "Sarasa Mono SC Nerd"))
      ;; doom-big-font (font-spec :family "Sarasa Mono SC Nerd" :size 24))
(defun set-fonts ()
  (interactive)
  (set-face-attribute 'default nil :font (font-spec :family "Sarasa Mono SC Nerd" :size 16))
  (set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "Sarasa Mono SC Nerd" :size 16) nil 'prepend)
  )
(add-hook! 'window-setup-hook :append 'set-fonts) ;;言

;; (setq line-spacing 1.1)
;; or if you want to set it globaly
(setq-default line-spacing 0.1)
;; Minimal UI
(package-initialize)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; (modus-themes-load-operandi)

;; Choose some fonts
;; (set-face-attribute 'default nil :family "Iosevka")
;; (set-face-attribute 'variable-pitch nil :family "Iosevka Aile")
;; (set-face-attribute 'org-modern-symbol nil :family "Iosevka")

;; Add frame borders and window dividers
;; (modify-all-frames-parameters
;;  '((right-divider-width . 40)
;;    (internal-border-width . 40)))
(dolist (face '(window-divider
                window-divider-first-pixel
                window-divider-last-pixel))
  (face-spec-reset-face face)
  (set-face-foreground face (face-attribute 'default :background)))
(set-face-background 'fringe (face-attribute 'default :background))

(setq
 ;; Edit settings
 org-auto-align-tags nil
 org-tags-column 0
 org-fold-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t

 ;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-ellipsis "…"

 ;; Agenda styling
 org-agenda-tags-column 0
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "? now ─────────────────────────────────────────────────")

(global-org-modern-mode)

;; window resize settings
(defhydra doom-window-resize-hydra (:hint nil)
  "
             _k_ increase height
_h_ decrease width    _l_ increase width
             _j_ decrease height
"
  ("h" evil-window-decrease-width)
  ("j" evil-window-increase-height)
  ("k" evil-window-decrease-height)
  ("l" evil-window-increase-width)
  ("q" nil))

(map!
    (:prefix "SPC"
      :desc "Hydra resize" :n "w SPC" #'doom-window-resize-hydra/body))

  ;; 标题栏显示文件全路径
  (setq frame-title-format
        '("%S"
          (buffer-file-name "%f"
                            (dired-directory dired-directory "%b"))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 编码设置开始 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; 文件编码设置
  ;; 编码设置:utf-8之类，所有的文件全部以utf8保存
  ;; 设置默认编码
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  ;;设置默认读入文件编码
  (prefer-coding-system 'utf-8)
  (prefer-coding-system 'gb2312)
  ;;设置写入文件编码
  (setq default-buffer-file-coding-system 'utf-8)
  ;; 如果不写下面两句，只写
  (prefer-coding-system 'utf-8)
  ;; 这一句的话，新建文件以utf-8编码，行末结束符平台相关
  (prefer-coding-system 'utf-8-dos)
  (prefer-coding-system 'utf-8-unix)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 编码设置结束 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-mode
  (global-pangu-spacing-mode 0)
  (set (make-local-variable 'pangu-spacing-real-insert-separtor) nil)

  ;; Plantuml
  (setq org-plantuml-jar-path "~/Configs/libs/plantuml.jar")
                                        ; Use fundamental mode when editing plantuml blocks with C-c '
  ;; (add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

  ;; Ditaa
  (setq org-ditaa-jar-path "~/Configs/libs/ditaa.jar")

  ;; Display inline images
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
           (octave . t)
           (python . t)
           (ruby . t)
           (gnuplot . t)
           (clojure . t)
           (sh . t)
           (ledger . t)
           (org . t)
           (plantuml . t)
           (latex . t)
           (C . t)
           (shell . t)
           (sh . t)
           )))

  ; Do not prompt to confirm evaluation
  ; This may be dangerous - make sure you understand the consequences
  ; of setting this -- see the docstring for details
  (setq org-confirm-babel-evaluate nil)
  (setq org-src-fontify-natively t)

  ;; 全局任务清单
  (setq org-agenda-files (list "~/org/todos/work.org"
                               "~/org/todos/projects.org"
                               "~/org/todos/home.org"
                               "~/org/todos/"
                               ))

;; Rime input method settings
(use-package! rime
  :config
  (setq rime-inline-ascii-trigger 'shift-l)
  (setq mode-line-mule-info '((:eval (rime-lighter))))
  (setq rime-posframe-properties
        (list :background-color "#333333"
              :foreground-color "#dcdccc"
              :font "Sarasa Mono SC Nerd"
              :internal-border-width 10))
  :custom
  (rime-user-data-dir "~/.config/fcitx/rime")
  (rime-show-candidate 'posframe)
  (default-input-method "rime")
  )

(define-key rime-active-mode-map (kbd "M-j") 'rime-inline-ascii)
(define-key rime-mode-map (kbd "M-j") 'rime-force-enable)
;; (defun rime-commit1-and-evil-normal ()
;;   "Commit the 1st item if exists, then go to evil normal state."
;;   (interactive)
;;   (rime-commit1)
;;   (evil-normal-state))
;; (define-key rime-active-mode-map (kbd "<escape>") 'rime-commit1-and-evil-normal)

(defun evil-toggle-input-method ()
  "when toggle on input method, switch to evil-insert-state if possible.
when toggle off input method, switch to evil-normal-state if current state is evil-insert-state"
  (interactive)
  (setq default-input-method "rime")
  (if (not current-input-method)
      (if (not (string= evil-state "insert"))
          (evil-insert-state))
    (if (string= evil-state "insert")
        (evil-normal-state)))
  (toggle-input-method))

(global-set-key (kbd "C-\\") 'evil-toggle-input-method)
