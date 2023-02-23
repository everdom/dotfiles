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
;; (setq doom-theme 'modus-operandi)
;; (setq doom-theme 'doom-solarized-light)
;; TUI dark theme, GUI light theme
(if (equal window-system nil)
	(setq doom-theme 'doom-solarized-dark)
(setq doom-theme 'doom-solarized-light))
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


(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;; (package-initialize) ;; You might already have this line

;; proxy settings(uncomment when required)
(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
     ("http" . "127.0.0.1:7890")
     ("https" . "127.0.0.1:7890")))

;; Set window maximized when boot
;; (pushnew! initial-frame-alist '(width . 200) '(height . 55))
(add-hook 'window-setup-hook #'toggle-frame-maximized)
;; (add-hook 'window-setup-hook #'toggle-frame-fullscreen)

;; Set which key delay
(require 'which-key)
(setq which-key-idle-delay 0.1)
(setq which-key-idle-secondary-delay 0.1)

;; font setting
;; (setq doom-font (font-spec :family "Sarasa Mono SC Nerd" :size 16.0))
(setq doom-font (font-spec :family "Sarasa Mono SC Nerd" :size 16)
      doom-serif-font (font-spec :family "Sarasa Mono SC Nerd")
      doom-variable-pitch-font (font-spec :family "Sarasa Mono SC Nerd")
      doom-unicode-font (font-spec :family "Sarasa Mono SC Nerd"))
      ;; doom-big-font (font-spec :family "Sarasa Mono SC Nerd" :size 24))
(defun set-fonts ()
  (interactive)
  (set-face-attribute 'default nil :font (font-spec :family "Sarasa Mono SC Nerd" :size 16))
  (set-fontset-font t 'unicode (font-spec :family "Apple Color Emoji" :size 14) nil 'prepend)
  (set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "Sarasa Mono SC Nerd" :size 16) nil 'prepend)
  )
(add-hook! 'window-setup-hook :append 'set-fonts) ;;言
;; (setq line-spacing 1.1)
;; or if you want to set it globaly
(setq-default line-spacing 0.1)

;; Netease cloud music
;; (add-to-list 'load-path "~/.emacs.d/.local/straight/build-28.2/netease-cloud-music.el")

;; (require 'netease-cloud-music)
;; (require 'netease-cloud-music-ui)       ;If you want to use the default TUI, you should add this line in your configuration.
;; (require 'netease-cloud-music-comment)  ;If you want comment feature

;; EAF config
(use-package! eaf
  ;; 设定只有手动调用以下命令后，eaf才会加载
  :commands (eaf-open eaf-open-bookmark eaf-open-browser eaf-open-browser-with-history)
  :init
  ;; 设定emacs中打开链接默认使用eaf打开
  (setq browse-url-browser-function 'eaf-open-browser)
  (defalias 'browse-web #'eaf-open-browser)
  ;; 定义了一个用于开启eaf debug模式的函数
  (defun +eaf-enable-debug ()
    (interactive)
      (setq eaf-enable-debug t))
  :custom
  ;; 设定eaf代理
  (eaf-proxy-type "socks5")
  (eaf-proxy-host "127.0.0.1")
  (eaf-proxy-port "7890")
  :config
  ;; 下面的require都是引入你已经安装的eaf扩展
  ;; (require 'eaf-demo)
  (require 'eaf-file-sender)
  (require 'eaf-music-player)
  (require 'eaf-2048)
  (require 'eaf-camera)
  (require 'eaf-terminal)
  (require 'eaf-image-viewer)
  ;; (require 'eaf-vue-demo)
  (require 'eaf-pdf-viewer)
  (require 'eaf-browser)
  (require 'eaf-vue-mindmap)
  (require 'eaf-markdown-previewer)
  (require 'eaf-file-browser)
  (require 'eaf-file-manager)
  (require 'eaf-mindmap)
  (require 'eaf-video-player)
  (require 'eaf-org-previewer)
  (require 'eaf-airshare)
  (require 'eaf-jupyter)
  (require 'eaf-netease-cloud-music)
  (require 'eaf-git)
  (require 'eaf-system-monitor)
  (require 'eaf-evil)
  ;; 使得在eaf buffer下能正常使用evil的keymap
  (define-key key-translation-map (kbd "SPC")
    (lambda (prompt)
      (if (derived-mode-p 'eaf-mode)
          (pcase eaf--buffer-app-name
            ("browser" (if  (string= (eaf-call-sync "call_function" eaf--buffer-id "is_focus") "True")
                           (kbd "SPC")
                         (kbd eaf-evil-leader-key)))
            ("pdf-viewer" (kbd eaf-evil-leader-key))
            ("image-viewer" (kbd eaf-evil-leader-key))
            (_  (kbd "SPC")))
        (kbd "SPC"))))
  ;; 设定eaf默认搜索引擎
  (setq eaf-browser-default-search-engine "google")
  ;; 设定eaf开启广告屏蔽器
  (setq eaf-browser-enable-adblocker t)
  ;; 设定eaf浏览器的缩放
  (setq eaf-browser-default-zoom 1.2)
  ;; 修复鼠标乱跑的问题，让她一直放在左下角
  (setq mouse-avoidance-banish-position '((frame-or-window . frame)
                                          (side . right)
                                          (side-pos . 100)
                                          (top-or-bottom . bottom)
                                          (top-or-bottom-pos . -100)))
  (mouse-avoidance-mode 'banish))

;; org-modern settings
;; Minimal UI
(package-initialize)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; (modus-themes-load-operandi)

;; Choose some fonts
 ;; (set-face-attribute 'default nil :family "Iosevka Nerd Font Mono")
;; (set-face-attribute 'default nil :family "Sarasa Mono SC Nerd")
;; (set-face-attribute 'org-modern-symbol nil :family "Sarasa Mono SC Nerd")
;; (set-face-attribute 'variable-pitch nil :family "Iosevka Aile")
;; (set-face-attribute 'org-modern-symbol nil :family "Iosevka")

;; Add frame borders and window dividers
;; (modify-all-frames-parameters
;;  '((right-divider-width . 10)
;;    (internal-border-width . 10)))
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
 "⭠ now ─────────────────────────────────────────────────")

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

(map! (:prefix "SPC"
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
                               "~/Documents/todos/"
                               ))

;; rime settings
(use-package! rime
  :config
  (setq rime-show-candidate 'posframe)
  (setq rime-disable-predicates
        '(rime-predicate-evil-mode-p
          rime-predicate-after-alphabet-char-p
          rime-predicate-prog-in-code-p))
  (setq rime-inline-ascii-trigger 'shift-l)
  (setq mode-line-mule-info '((:eval (rime-lighter))))
  (setq rime-posframe-properties
        (list :font "Sarasa Mono SC Nerd"
              :internal-border-width 10))
  :custom
  (rime-librime-root (expand-file-name "librime/dist" user-emacs-directory))
  (rime-emacs-module-header-root  "/usr/local/Cellar/emacs/28.2/include")
  (default-input-method "rime")
  :bind
  (:map rime-mode-map
        ("C-`" . 'rime-send-keybinding))
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
(map! "C-\\" 'evil-toggle-input-method)


;; LSP settings
(after! lsp-mode
  (map! :leader
        :desc "Diagnostics" "c-" #'lsp-ui-flycheck-list
        :desc "Imenu" "c," #'lsp-ui-imenu)
  (setq lsp-headerline-breadcrumb-enable-diagnostics nil
        lsp-headerline-breadcrumb-enable t
        ;;用以解决在wsl2 windows terminal中rust项目移动光标导致重复显示行的问题。
        lsp-lens-enable nil
        lsp-ui-sideline-show-code-actions nil
        lsp-ui-imenu--custom-mode-line-format ""
        lsp-enable-file-watchers nil
        ;;用于开启rust类型推断
        ;; lsp-rust-analyzer-server-display-inlay-hints t
        +lsp-company-backends
          (if (modulep! :editor snippets)
              '(:separate company-capf company-yasnippet :with company-tabnine)
            'company-capf)))
        ;; +lsp-company-backends '(company-capf company-yasnippet
        ;;                                      :with company-tabnine
        ;;                                      :separate)))

;; Completion settings
(after! company
  (map! :i "<tab>" #'company-indent-or-complete-common)
  (map! :map company-active-map "<tab>" #'company-complete-common)
  ;; 打字卡顿或者提示卡顿可将数值提高到0.250,emacs >= 28，开启native-comp可将此值修改为0.000
  (setq company-idle-delay 0.000
        company-minimum-prefix-length 1
        company-show-quick-access t))

(use-package! company-tabnine
  :defer 1
  :custom
  (company-tabnine-max-num-results 9)
  :init
  (defun company//sort-by-tabnine (candidates)
    (if (or (functionp company-backend)
            (not (and (listp company-backend) (memq 'company-tabnine company-backend))))
        candidates
      (let ((candidates-table (make-hash-table :test #'equal))
            candidates-1
            candidates-2)
        (dolist (candidate candidates)
          (if (eq (get-text-property 0 'company-backend candidate)
                  'company-tabnine)
              (unless (gethash candidate candidates-table)
                (push candidate candidates-2))
            (push candidate candidates-1)
            (puthash candidate t candidates-table)))
        (setq candidates-1 (nreverse candidates-1))
        (setq candidates-2 (nreverse candidates-2))
        (nconc (seq-take candidates-1 2)
               (seq-take candidates-2 2)
               (seq-drop candidates-1 2)
               (seq-drop candidates-2 2)))))

  (defun lsp-after-open-tabnine ()
    "Hook to attach to `lsp-after-open'."
    (setq-local company-tabnine-max-num-results 3)
    (add-to-list 'company-transformers 'company//sort-by-tabnine t)
    (add-to-list 'company-backends '(company-capf company-yasnippet :with company-tabnine :separate)))
  (defun company-tabnine-toggle (&optional enable)
    "Enable/Disable TabNine. If ENABLE is non-nil, definitely enable it."
    (interactive)
    (if (or enable (not (memq 'company-tabnine company-backends)))
        (progn
          (add-hook 'lsp-after-open-hook #'lsp-after-open-tabnine)
          (add-to-list 'company-backends #'company-tabnine)
          (when (bound-and-true-p lsp-mode) (lsp-after-open-tabnine))
          (message "TabNine enabled."))
      (setq company-backends (delete 'company-tabnine company-backends))
      (setq company-backends (delete '(company-capf company-yasnippet :with company-tabnine :separate) company-backends))
      (remove-hook 'lsp-after-open-hook #'lsp-after-open-tabnine)
      (company-tabnine-kill-process)
      (message "TabNine disabled.")))
  :hook
  (kill-emacs . company-tabnine-kill-process)
  :config
  (company-tabnine-toggle t))
