;;; package --- Summary
;;; Commentary:

;;; Code:
;;; load-pathの設定
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/elpa/")

;; ウィンドウサイズ
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

;; ツールバーを非表示
(tool-bar-mode -1)

;; メニューバーを非表示
(menu-bar-mode -1)

;; スクロールバーを非表示
(scroll-bar-mode -1)

;; C-hをバックスペースに
(keyboard-translate ?\C-h ?\C-?)

;; C-c tで折り返し
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)

;; C-tでウィンドウ切り替え
(global-set-key (kbd "C-t") 'other-window)

;; バックアップファイルを作らない
(setq backup-inhibited t)

;; 行数表示
(global-linum-mode t)

;; リージョンの強調表示
(setq transient-mark-mode t)

;; 検索(C-s)で大文字小文字を区別しない
(setq completion-ignore-case t)

;; 指定の行数に飛ぶ
(global-set-key "\C-x:" 'goto-line)

;; 対応する括弧をハイライト
(show-paren-mode 1)

;; 現在行をハイライト
(global-hl-line-mode t)

;;alt-1でmake
(global-set-key "\M-1" 'compile)

;;C-c rでreplace-string
(global-set-key "\C-cr" 'replace-string)

;;C-[でMarkset
;;(global-set-key (kbd ""), 'set-mark-command)

;;リージョン内の置換
(setq transient-mark-mode t)

;;;; tree-undo
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))


;;;; 5行進む/戻る
(define-key global-map (kbd "M-n") (kbd "C-u 5 C-n"))
(define-key global-map (kbd "M-p") (kbd "C-u 5 C-p"))

;; マウスホイールの設定
;; ;; マウスホイールでのスクロール速度の設定
(setq mouse-wheel-scroll-amount '(3 ((shift) . 10) ((control) . nil)))
;; ;; マウスホイールでのスクロールの加速をするかどうか
(setq mouse-wheel-progressive-speed nil)

;; ewwの検索エンジン設定
(setq eww-search-prefix "http://www.google.co.jp/search?q=")

;; list-packageの設定 
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;make中にオートスクロール
(setq compilation-scroll-output t)
;;*compilation*バッファを自動で閉じる
(bury-successful-compilation t)

;; フォント設定
(set-face-attribute 'default nil
		    :family "ゆたぽん（コーディング）Backsl"
		    :height 135)

;;Pysh/Cython
(setq auto-mode-alist
      (cons (cons "\\.pyx$" 'python-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons (cons "\\.pysh$" 'python-mode) auto-mode-alist))

;; Emacs-Lisp-mode
;C-c C-v でM-x eval-buffer
(add-hook 'emacs-lisp-mode-hook '(lambda()
				   (define-key emacs-lisp-mode-map (kbd "C-c v") 'eval-buffer)))


;; Evinceとの連携
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


;; Multi-term
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


;;solarized-color-scheme
;;; これらはload-themeの前に配置すること
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


;; helm
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
    (markdown-mode undo-tree solarized-theme quickrun py-yapf py-autopep8 popwin open-junk-file multi-term loop lispxmp jedi helm flycheck elscreen company-quickhelp bury-successful-compilation)))
 '(search-web-default-browser (quote eww-browse-url))
 '(search-web-in-emacs-browser (quote eww-browse-url)))
;; ミニバッファでC-hをバックスペースに割り当て
(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;; For find-file etc.
;; (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;; For helm-find-files etc.
;; (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
;; (define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)

;; Emulate `kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))

;; キーバインド
(define-key global-map (kbd "C-x b")   'helm-buffers-list)
(define-key global-map (kbd "C-x C-b") 'helm-for-files)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)


;;;; scala-mode2
;;(require 'scala-mode2)
;;(add-to-list 'auto-mode-alist '("\.sbt$" . scala-mode))

;; org-mode
(setq org-agenda-files '("/home/jabberwocky/Dropbox/就活/JobHunt.org"
			 "/home/jabberwocky/Dropbox/College/emacs/org/todo.org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;;calfw
(require 'calfw)
(require 'calfw-org)
;(setq cfw:org-agenda-schedule-args '(:timestamp))
(setq cfw:org-agenda-schedule-args nil)
(setq cfw:org-overwrite-default-keybinding t)
(global-set-key (kbd "C-c c") 'cfw:open-org-calendar)

;; elscreen
;;; プレフィクスキーはC-z
(setq elscreen-prefix-key (kbd "C-z"))
(elscreen-start)
;;; タブの先頭に[X]を表示しない
(setq elscreen-tab-display-kill-screen nil)
;;; header-lineの先頭に[<->]を表示しない
(setq elscreen-tab-display-control nil)
;;; バッファ名・モード名からタブに表示させる内容を決定する(デフォルト設定)
(setq elscreen-buffer-to-nickname-alist
      '(("^dired-mode$" .
         (lambda ()
           (format "Dired(%s)" dired-directory)))
        ("^Info-mode$" .
         (lambda ()
           (format "Info(%s)" (file-name-nondirectory Info-current-file))))
        ("^mew-draft-mode$" .
         (lambda ()
           (format "Mew(%s)" (buffer-name (current-buffer)))))
        ("^mew-" . "Mew")
        ("^irchat-" . "IRChat")
        ("^liece-" . "Liece")
        ("^lookup-" . "Lookup")))
(setq elscreen-mode-to-nickname-alist
      '(("[Ss]hell" . "shell")
        ("compilation" . "compile")
        ("-telnet" . "telnet")
        ("dict" . "OnlineDict")
        ("*WL:Message*" . "Wanderlust")))


;; company-mode
(require 'company)

;;(global-company-mode +1) ; 全バッファで有効にする
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'latex-mode-hook 'company-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)

;;(set-face-attribute 'company-tooltip nil
;;                    :foreground "black" :background "lightgrey")
;;(set-face-attribute 'company-tooltip-common nil
;;                    :foreground "black" :background "lightgrey")
;;(set-face-attribute 'company-tooltip-common-selection nil
;;                    :foreground "white" :background "steelblue")
;;(set-face-attribute 'company-tooltip-selection nil
;;                    :foreground "black" :background "steelblue")
;;(set-face-attribute 'company-preview-common nil
;;                    :background nil :foreground "lightgrey" :underline t)
;;(set-face-attribute 'company-scrollbar-fg nil
;;                    :background "orange")
;;(set-face-attribute 'company-scrollbar-bg nil
;;                    :background "gray40") ; 色合いの設定

;;(global-set-key (kbd "C-M-i") 'company-complete)
;;
;;;; C-n, C-pで補完候補を次/前の候補を選択
;;(define-key company-active-map (kbd "M-n") 'company-select-next)
;;(define-key company-active-map (kbd "M-p") 'company-select-previous)
;;(define-key company-search-map (kbd "M-n") 'company-select-next)
;;(define-key company-search-map (kbd "M-p") 'company-select-previous)
;;
;;;; C-sで絞り込む
;;(define-key company-active-map (kbd "C-s") 'company-filter-candidates)
;;
;;;; TABで候補を設定
;;(define-key company-active-map (kbd "C-i") 'company-complete-selection)
;;
;;;; 各種メジャーモードでも C-M-iで company-modeの補完を使う
;;(define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)

(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 2) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
(company-quickhelp-mode +1)

;; company-jedi
(require 'jedi-core)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)
(add-hook 'python-mode-hook 'jedi:setup)
(add-to-list 'company-backends 'company-jedi)

;; jedi
;(add-hook 'python-mode-hook 'jedi:setup)
;(setq jedi:setup-keys t)
;(require 'jedi)
;(setq jedi:complete-on-dot t)                 ; optional

;; 透明度を変更するコマンド M-x set-alpha
;; http://qiita.com/marcy@github/items/ba0d018a03381a964f2
(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(90))))
;; 初期値
(set-frame-parameter nil 'alpha 92)

;; コードの折りたたみ
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
;(define-key global-map (kbd "C-c \\") 'hs-toggle-hiding)

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

;; quickrun
(require 'quickrun)
(require 'popwin)
;; 結果の出力バッファと元のバッファを行き来したい場合は
;; ':stick t'の設定をするとよいでしょう
(push '("*quickrun*") popwin:special-display-config)

;; よく使うならキーを割り当てるとよいでしょう
(global-set-key [f5]'quickrun)
(global-set-key [f4]'quickrun-shell)

;; 標準をPython3へ
;;(quickrun-add-command "python"
;;              '((:command . "python3.5"))
;;              :override t)

;;;; py-yapf
(require 'py-yapf)
;;(add-hook 'python-mode-hook 'py-yapf-enable-on-save)
(global-set-key [f6] 'py-yapf-buffer)

;;;; autopep8
;;(require 'py-autopep8)
;;;; バッファ全体のコード整形
;;(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map [f6] 'py-autopep8)))
					

;; flycheck
(require 'flycheck)

;;;; flycheck-hook
;;(global-flycheck-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'emacs-lisp-mode-hook 'flycheck-mode)

(define-key global-map (kbd "\C-cn") 'flycheck-next-error)
(define-key global-map (kbd "\C-cp") 'flycheck-previous-error)
(define-key global-map (kbd "\C-cd") 'flycheck-list-errors)



;; よく使うならキーを割り当てるとよいでしょう
(global-set-key [f5]'quickrun)
(global-set-key [f4]'quickrun-shell)

;; 標準をPython3へ
;(quickrun-add-command "python"
;              '((:command . "python3.5"))
;              :override t)

;; py-yapf
(require 'py-yapf)
;(add-hook 'python-mode-hook 'py-yapf-enable-on-save)
(global-set-key [f6] 'py-yapf-buffer)

;; flycheck
(require 'flycheck)

;; hook
;(global-flycheck-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'emacs-lisp-mode-hook 'flycheck-mode)

(define-key global-map (kbd "\C-cn") 'flycheck-next-error)
(define-key global-map (kbd "\C-cp") 'flycheck-previous-error)
(define-key global-map (kbd "\C-cd") 'flycheck-list-errors)

;;;; sense-region
;;(require 'sense-region)
;;(sense-region-on)

;; (install-elisp-from-emacswiki "open-junk-file.el")
(require 'open-junk-file)
(setq open-junk-file-format "~/Documents/junk/%Y%m%d_%H%M%S.el")
  
;; (install-elisp-from-emacswiki "lispxmp.el")
(require 'lispxmp)
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)

;;; loop.el
(require 'loop)

(provide 'init)
;;;

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
