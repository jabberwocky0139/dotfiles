;;; package --- Summary
;;; Commentary:

;;; Code:











;;;;;; Basic Configration ;;;;;;

;;; load-pathの設定
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/elpa/")


;;; list-packageの設定
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;; package-installを動かすときは以下のコメントアウトを外す
(package-refresh-contents)


;;; package-install
(package-install 'undo-tree)
(package-install 'bury-successful-compilation)
(package-install 'helm)
(package-install 'color-theme-solarized)
(package-install 'solarized-theme)
(package-install 'elpy)
(package-install 'jedi)
(package-install 'company-jedi)
(package-install 'anaconda-mode)
(package-install 'company-quickhelp)
(package-install 'py-yapf)
(package-install 'flycheck)
(package-install 'open-junk-file)
(package-install 'lispxmp)
(package-install 'loop)
(package-install 'markdown-mode)
(package-install 'multi-term)
;; (package-install 'elscreen)
(package-install 'dbus)
(package-install 'magit)
(package-install 'haskell-mode)
(package-install 'dashboard)
(package-install 'powerline)
(package-install 'tabbar)

;;; ウィンドウサイズ
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
	(current-width (window-width))
	(current-height (window-height))
	(dx (if (= (nth 0 (window-edges)) 0) 1
	      -1))
	(dy (if (= (nth 1 (window-edges)) 0) 1
	      -1))
	c)
    (catch 'end-flag
      (while t
	(message "size[%dx%d]"
		 (window-width) (window-height))
	(setq c (read-char))
	(cond ((= c ?\C-f)
	       (enlarge-window-horizontally dx))
	      ((= c ?\C-b)
	       (shrink-window-horizontally dx))
	      ((= c ?\C-n)
	       (enlarge-window dy))
	      ((= c ?\C-p)
	       (shrink-window dy))
	      ;; otherwise
	      (t
	       (message "Quit")
	       (throw 'end-flag t)))))))

(global-set-key "\C-c\C-y" 'window-resizer)


;;; elscreen
;; プレフィクスキーはC-z
;; (setq elscreen-prefix-key (kbd "C-z"))
;; (elscreen-start)
;; ;; タブの先頭に[X]を表示しない
;; (setq elscreen-tab-display-kill-screen nil)
;; ;; header-lineの先頭に[<->]を表示しない
;; (setq elscreen-tab-display-control nil)
;; ;; バッファ名・モード名からタブに表示させる内容を決定する(デフォルト設定)
;; (setq elscreen-buffer-to-nickname-alist
;;       '(("^dired-mode$" .
;;          (lambda ()
;;            (format "Dired(%s)" dired-directory)))
;;         ("^Info-mode$" .
;;          (lambda ()
;;            (format "Info(%s)" (file-name-nondirectory Info-current-file))))
;;         ("^mew-draft-mode$" .
;;          (lambda ()
;;            (format "Mew(%s)" (buffer-name (current-buffer)))))
;;         ("^mew-" . "Mew")
;;         ("^irchat-" . "IRChat")
;;         ("^liece-" . "Liece")
;;         ("^lookup-" . "Lookup")))
;; (setq elscreen-mode-to-nickname-alist
;;       '(("[Ss]hell" . "shell")
;;         ("compilation" . "compile")
;;         ("-telnet" . "telnet")
;;         ("dict" . "OnlineDict")
;;         ("*WL:Message*" . "Wanderlust")))


;; スタート時のスプラッシュ非表示
(setq inhibit-startup-message t)
;;; ツールバーを非表示
(tool-bar-mode -1)
;;; メニューバーを非表示
(menu-bar-mode -1)
;;; スクロールバーを非表示
(scroll-bar-mode -1)
;;; C-hをバックスペースに
(keyboard-translate ?\C-h ?\C-?)
;;; C-c tで折り返し
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)
;;; C-tでウィンドウ切り替え
(global-set-key (kbd "C-t") 'other-window)
;;; バックアップファイルを作らない
(setq backup-inhibited t)
;;; 行数表示
(global-linum-mode t)
;;; リージョンの強調表示
(setq transient-mark-mode t)
;;; 検索(C-s)で大文字小文字を区別しない
(setq completion-ignore-case t)
;;; 指定の行数に飛ぶ
(global-set-key "\C-x:" 'goto-line)
;;; 対応する括弧をハイライト
(show-paren-mode 1)
;;; 現在行をハイライト
(global-hl-line-mode t)
;;; alt-1でmake
(global-set-key "\M-1" 'compile)
;;; C-c rでreplace-string
(global-set-key "\C-cr" 'replace-string)
;;; 5行進む/戻る
(define-key global-map (kbd "M-n") (kbd "C-u 5 C-n"))
(define-key global-map (kbd "M-p") (kbd "C-u 5 C-p"))
;;; リージョン内の置換
(setq transient-mark-mode t)

;;; tree-undo
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;;; マウスホイールの設定
;; マウスホイールでのスクロール速度の設定
(setq mouse-wheel-scroll-amount '(3 ((shift) . 10) ((control) . nil)))
;; マウスホイールでのスクロールの加速をするかどうか
(setq mouse-wheel-progressive-speed nil)

;;; ewwの検索エンジン設定
(setq eww-search-prefix "http://www.google.co.jp/search?q=")

;;; make中にオートスクロール
(setq compilation-scroll-output t)
;;; *compilation*バッファを自動で閉じる
(bury-successful-compilation t)

;;; フォント設定
(set-face-attribute 'default nil
		    :family "ゆたぽん（コーディング）Backsl"
		    :height 130)

;; 透明度を変更するコマンド M-x set-alpha
;; http://qiita.com/marcy@github/items/ba0d018a03381a964f2
(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(90))))
;; 初期値
(set-frame-parameter nil 'alpha 92)


;; 起動画面をdashboardで変更
(require 'dashboard)
;; Set the title
(setq dashboard-banner-logo-title "Is Emacs my heartthrob?")
;; Set the banner
(setq dashboard-startup-banner "/home/jabberwocky/.emacs.d/Toro/Toro.png")
(dashboard-setup-startup-hook)
(setq dashboard-items '((recents  . 20)))

;;;;;; Basic Configration End ;;;;;;











;;;;;; Helm Configration ;;;;;;


(require 'helm-config)
(helm-mode 1)
;; 自動補完を無効
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-ff-auto-update-initial-value nil)
 '(package-selected-packages
   (quote
    (tabbar powerline dashboard haskell-mode solarized-theme color-theme-solarized helm undo-tree company-jedi jedi magit dbus elscreen multi-term markdown-mode loop lispxmp open-junk-file flycheck py-yapf company-quickhelp anaconda-mode elpy async bury-successful-compilation)))
 '(search-web-default-browser (quote eww-browse-url))
 '(search-web-in-emacs-browser (quote eww-browse-url)))
;; ミニバッファでC-hをバックスペースに割り当て
(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;; Emulate `kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))

;; キーバインド
(define-key global-map (kbd "C-x b")   'helm-mini)
(define-key global-map (kbd "C-x C-b") 'helm-for-files)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)


;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-select-action) ; make TAB work in terminal
;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

;;(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 35)
(helm-autoresize-mode t)

;; optional fuzzy matching for helm-M-x
(setq helm-M-x-fuzzy-match t) 
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

;; semantic-mode
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode t)
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
(global-set-key (kbd "C-c h o") 'helm-occur)


;;; helm-surfraw
(setq helm-surfraw-default-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

(global-set-key (kbd "C-c h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h g") 'helm-google-suggest)

;;;;;; Helm Configration End ;;;;;;











;;;;;; Theme Configration ;;;;;;

;;; solarized-color-scheme
;; これらはload-themeの前に配置すること
;; fringeを背景から目立たせる
(setq solarized-distinct-fringe-background t)

;; mode-lineを目立たせる(Fig3)
(setq solarized-high-contrast-mode-line t)

;; bold度を減らす
(setq solarized-use-less-bold t)

;; italicを増やす
(setq solarized-use-more-italic t)

;; インジケータの色を減らす (git-gutter, flycheckなど)
(setq solarized-emphasize-indicators nil)

;; orgの見出し行の文字の大きさを変えない
(setq solarized-scale-org-headlines nil)

;(load-theme 'solarized-light t)
(load-theme 'solarized-dark t)


;; powerline設定
(require 'powerline)
(defconst color1 "#4682b4")
(defconst color2 "salmon")


(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background color1
		    :bold t
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :foreground "gray23"
                    :background color2
		    :bold t
		    :box nil
                    :inherit 'mode-line)

(set-face-attribute 'powerline-active2 nil
                    :foreground "white smoke"
                    :background "gray20"
		    :bold t
		    :box nil
                    :inherit 'mode-line)

(set-face-attribute 'mode-line-inactive nil
                    :foreground "#fff"
                    :background color1
		    :bold t
                    :box nil)

(set-face-attribute 'powerline-inactive1 nil
                    :foreground "gray23"
                    :background color2
		    :bold t
		    :box nil
                    :inherit 'mode-line)

(set-face-attribute 'powerline-inactive2 nil
                    :foreground "white smoke"
                    :background "gray20"
		    :bold t
		    :box nil
                    :inherit 'mode-line)

(setq ns-use-srgb-colorspace nil)
(powerline-center-theme)

;;;;;; Theme Configration End ;;;;;;











;;;;;; Coding Configration ;;;;;;

;;; Elpy を有効化
(elpy-enable)
;;; 使用する Anaconda の環境を設定
(defvar venv-default "~/.pyenv/versions/anaconda3-4.1.1")
;;; デフォルト環境を有効化
(pyvenv-activate venv-default)
(setq python-shell-completion-native-enable nil)
;;; REPL 環境に IPython を使う
(elpy-use-ipython)
;;; 自動補完のバックエンドとして Rope か Jedi を選択
(setq elpy-rpc-backend "jedi")
(setq python-shell-prompt-detect-failure-warning nil)

;;; anaconda-mode
(add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'elpy-mode)


;;; company-mode
(require 'company)
;;(global-company-mode +1) ; 全バッファで有効にする
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'latex-mode-hook 'company-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)
(add-hook 'haskell-mode-hook 'company-mode)

(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 2) ; デフォルトは4
;; (setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
(company-quickhelp-mode +1)


;; ;;; Pysh/Cython
;; (setq auto-mode-alist
;;       (cons (cons "\\.pyx$" 'python-mode) auto-mode-alist))
;; (setq auto-mode-alist
;;       (cons (cons "\\.pysh$" 'python-mode) auto-mode-alist))


;;; Emacs-Lisp-mode
;C-c C-v でM-x eval-buffer
(add-hook 'emacs-lisp-mode-hook '(lambda()
				   (define-key emacs-lisp-mode-map (kbd "C-c v") 'eval-buffer)))

;;; org-mode
(setq org-agenda-files '("/home/jabberwocky/Dropbox/就活/JobHunt.org"
			 "/home/jabberwocky/Dropbox/College/emacs/org/todo.org"))
(global-set-key (kbd "C-c a") 'org-agenda)


;;; コードの折りたたみ
(add-hook 'c++-mode-hook
	  '(lambda ()
	     (hs-minor-mode 1)))
(add-hook 'c-mode-hook
	  '(lambda ()
	     (hs-minor-mode 1)))
(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     (hs-minor-mode 1)))
(add-hook 'lisp-mode-hook
	  '(lambda ()
	     (hs-minor-mode 1)))
(add-hook 'haskell-mode-hook
	  '(lambda ()
	     (hs-minor-mode 1)))
;; (define-key global-map (kbd "C-c \\") 'hs-toggle-hiding)
(defun hs-enable-and-toggle ()
  (interactive)
  (hs-minor-mode 1)
  (hs-toggle-hiding))
(defun hs-enable-and-hideshow-all (&optional arg)
  "Hide all blocks. If prefix argument is given, show all blocks."
  (interactive "P")
  (hs-minor-mode 1)
  (if arg
      (hs-show-all)
      (hs-hide-all)))
(global-set-key (kbd "C-c \\") 'hs-enable-and-toggle)
(global-set-key (kbd "C-c _") 'hs-enable-and-hideshow-all)


;; ;;; quickrun
;; (require 'quickrun)
;; (require 'popwin)
;; ;; 結果の出力バッファと元のバッファを行き来したい場合は
;; ;; ':stick t'の設定をするとよいでしょう
;; (push '("*quickrun*") popwin:special-display-config)
;; ;; よく使うならキーを割り当てるとよいでしょう
;; (global-set-key [f5]'quickrun)
;; (global-set-key [f4]'quickrun-shell)


;;;; py-yapf
(require 'py-yapf)
;;(add-hook 'python-mode-hook 'py-yapf-enable-on-save)
(global-set-key [f6] 'py-yapf-buffer)


;;; flycheck
(when (require 'flycheck nil t)
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (add-hook 'anaconda-mode-hook 'flycheck-mode))

(require 'flycheck)
;;; flycheck-hook
;;(global-flycheck-mode)
(add-hook 'anaconda-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'emacs-lisp-mode-hook 'flycheck-mode)
(add-hook 'haskell-mode-hook 'flycheck-mode)
(define-key global-map (kbd "\C-cn") 'flycheck-next-error)
(define-key global-map (kbd "\C-cp") 'flycheck-previous-error)
(define-key global-map (kbd "\C-cd") 'flycheck-list-errors)


;; (install-elisp-from-emacswiki "open-junk-file.el")
(require 'open-junk-file)
(setq open-junk-file-format "~/Documents/junk/%Y%m%d_%H%M%S.el")


;; (install-elisp-from-emacswiki "lispxmp.el")
(require 'lispxmp)
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)


;;; loop.el
(require 'loop)


;;; markdown-mode
(require 'markdown-mode)
(define-key markdown-mode-map (kbd "M-n") (kbd "C-u 5 C-n"))
(define-key markdown-mode-map (kbd "M-p") (kbd "C-u 5 C-p"))


;;; scala-mode2
;;(require 'scala-mode2)
;;(add-to-list 'auto-mode-alist '("\.sbt$" . scala-mode))


;;;;;; Coding Configration End ;;;;;;











;; ;;;;;; Other Tools' Configration ;;;;;;

;;; Multi-term
(require 'multi-term)
(setq multi-term-program shell-file-name)
(add-hook 'term-mode-hook '(lambda ()
			     (define-key term-raw-map "\C-y" 'term-paste)
			     (define-key term-raw-map "\C-t" 'other-window)
			     (define-key term-raw-map "\C-h" 'term-send-backspace)
			     (define-key term-raw-map (kbd "C-n") 'term-send-down)
			     (define-key term-raw-map (kbd "C-p") 'term-send-up)))
;; C-c m で multi-term を起動する
(global-set-key (kbd "C-c m") 'multi-term)


;;; calfw
(require 'calfw)
(require 'calfw-org)
;(setq cfw:org-agenda-schedule-args '(:timestamp))
(setq cfw:org-agenda-schedule-args nil)
(setq cfw:org-overwrite-default-keybinding t)
(global-set-key (kbd "C-c c") 'cfw:open-org-calendar)


;;; Evinceとの連携
;; backward search
(require 'dbus)
(defun un-urlify (fname-or-url)
  "A trivial function that replaces a prefix of file:/// with just /."
  (if (string= (substring fname-or-url 0 8) "file:///")
      (substring fname-or-url 7)
    fname-or-url))
(defun evince-inverse-search (file linecol &rest ignored)
  (let* ((fname (decode-coding-string (url-unhex-string (un-urlify file)) 'utf-8))
         (buf (find-file fname))
         (line (car linecol))
         (col (cadr linecol)))
    (if (null buf)
        (message "[Synctex]: %s is not opened..." fname)
      (switch-to-buffer buf)
      (goto-line (car linecol))
      (unless (= col -1)
        (move-to-column col)))))
(dbus-register-signal
 :session nil "/org/gnome/evince/Window/0"
 "org.gnome.evince.Window" "SyncSource"
 'evince-inverse-search)

;;; magit
(require 'magit)

;; tabbar
(require 'tabbar)
(tabbar-mode 1)

;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode -1)

;; グループ化しない
(setq tabbar-buffer-groups-function nil)

;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; タブの長さ
(setq tabbar-separator '(2.2))

;; キーに割り当てる
(global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)
(global-set-key (kbd "<C-iso-lefttab>") 'tabbar-backward-tab)
;; (global-set-key (kbd "<M-right>") 'tabbar-forward-tab)
;; (global-set-key (kbd "<M-left>") 'tabbar-backward-tab)

;; 外観変更
(set-face-attribute
 'tabbar-default nil
 :family "MeiryoKe_Gothic"
 :family "ゆたココ" 
 ;;:background "#34495E"
 ;;:foreground "#EEEEEE"
 :foreground "#fff"
 :height 0.95
 )
(set-face-attribute
 'tabbar-unselected nil
 :background "#34495E"
 ;;:foreground "#EEEEEE"
 :foreground "#fff"
 :box nil
)
(set-face-attribute
 'tabbar-modified nil
 ;;:background "#E67E22"
 :background color2
 ;;:foreground "#EEEEEE"
 ;;:foreground "#fff"
 :foreground "gray23"
 :box nil
)
(set-face-attribute
 'tabbar-selected nil
 ;;:background "steel blue"
 :background color1
 ;;:foreground "#EEEEEE"
 :foreground "#fff"
 :box nil)
(set-face-attribute
 'tabbar-button nil
 :box nil)
(set-face-attribute
 'tabbar-separator nil
 :height 2.0)

;; タブに表示させるバッファの設定
(defvar my-tabbar-displayed-buffers
  '("*vc-")
  "*Regexps matches buffer names always included tabs.")

(defun my-tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or an asterisk.
The current buffer and buffers matches `my-tabbar-displayed-buffers'
are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my-tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)


;; Ctrl-Tab, Ctrl-Shift-Tab でタブを切り替える
(dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
  (autoload func "tabbar" "Tabs at the top of buffers and easy control-tab navigation"))
(defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
  `(defun ,name (arg)
     (interactive "P")
     ,do-always
     (if (equal nil arg)
         ,on-no-prefix
       ,on-prefix)))
(defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
(defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
;;(global-set-key (kbd "C-<tab>") 'shk-tabbar-next)
;;(global-set-key (kbd "<C-S-tab>") 'shk-tabbar-prev)


;;;;;; Other Tools' Configration End ;;;;;;











(provide 'init)
;;;

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

