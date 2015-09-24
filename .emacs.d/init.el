(setq completion-ignore-case t)

;;ウィンドウサイズ
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
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))
(global-set-key "\C-c\C-y" 'window-resizer)



;;行番号表示
(global-linum-mode t)

;;load-pathの設定
(add-to-list 'load-path "/home/jabberwocky/.emacs.d/site-lisp")

;;行折り返し設定
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)

;;ctrl-hでバックスペース
(keyboard-translate ?\C-h ?\C-?)

;;alt-1でmake
(global-set-key "\M-1" 'compile)

;;リージョン内の置換
(setq transient-mark-mode t)

;;プロキシ設定
(setq url-proxy-services '(("http" . "www-proxy.mse.waseda.ac.jp:8080")))
(setq eww-search-prefix "http://www.google.co.jp/search?q=")

;;list-packages設定
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;auto-complete
(require 'auto-complete-config)

;;auto-complete-latex
(require 'auto-complete-latex)

;;pdf-tools
(require 'pdf-tools)
(require 'pdf-annot) 
(require 'pdf-history) 
(require 'pdf-info) 
(require 'pdf-isearch) 
(require 'pdf-links) 
(require 'pdf-misc) 
(require 'pdf-occur) 
(require 'pdf-outline) 
(require 'pdf-sync) 
(require 'tablist-filter)
(require 'tablist)
(add-to-list 'auto-mode-alist (cons "\\.pdf$" 'pdf-view-mode))

(require 'linum)
(global-linum-mode)
(defcustom linum-disabled-modes-list '(doc-view-mode pdf-view-mode)
  "* List of modes disabled when global linum mode is on"
  :type '(repeat (sexp :tag "Major mode"))
  :tag " Major modes where linum is disabled: "
  :group 'linum
  )
(defcustom linum-disable-starred-buffers 't
  "* Disable buffers that have stars in them like *Gnu Emacs*"
  :type 'boolean
  :group 'linum)
(defun linum-on ()
  "* When linum is running globally, disable line number in modes defined in `linum-disabled-modes-list'. Changed by linum-off. Also turns off numbering in starred modes like *scratch*"
  (unless (or (minibufferp) (member major-mode linum-disabled-modes-list)
          (and linum-disable-starred-buffers (string-match "*" (buffer-name)))
          )
    (linum-mode 1)))
(provide 'setup-linum)

(add-hook 'pdf-view-mode-hook
  (lambda ()
    (pdf-misc-size-indication-minor-mode)
    (pdf-links-minor-mode)
    (pdf-isearch-minor-mode)
    (pdf-sync-minor-mode)
    (auto-revert-mode)
  )
  )

;;make中にオートスクロール
(setq compilation-scroll-output t)

;;make拡張
(bury-successful-compilation 1)

;;;; コンパイルに成功したら*compilation*バッファを閉じる
;;; 指定したバッファに警告の文字列があるか
(defun my-compilation-warning-bufferp (buf)
  (save-current-buffer
	(set-buffer buf)
	(save-excursion
	  (goto-char (point-min))
	  (if (or (search-forward "warning:" nil t)
			  (search-forward "警告:" nil t)) t nil))))
;;; バッファに"abnormally"や警告メッセージがなければウィンドウを閉じる
(defun my-close-compilation-buffer-if-succeeded (buf str)
  (cond ((string-match "abnormally" str)
		 (message "Error!"))
		((if (my-compilation-warning-bufferp buf)
			 (message "Warning!")))
		(t
		 (delete-window (get-buffer-window buf))
		 (message "Succeeded"))))
;;; compile終了時の実行関数に追加する
(if compilation-finish-functions
  (append compilation-finish-functions
		  '(my-close-compilation-buffer-if-succeeded))
  (setq compilation-finish-functions
		'(my-close-compilation-buffer-if-succeeded)))


;;フォント設定
(ac-config-default)
(add-hook 'python-mode-hook
                   '(lambda ()
                        (setq indent-tabs-mode nil)
                        (setq indent-level 4)
                        (setq python-indent 4)
                        (setq tab-width 4)))

(set-face-attribute 'default nil
;;                   :family "Ricty Diminished Discord"
                   :family "ゆたぽん（コーディング）Backsl"                    
                   :height 135)
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec:family "ゆたぽん（コーディング）Backsl"))


;;YaTex
;; run yatex mode when open .tex file
;;(setq auto-mode-alist
;;(cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
;;(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;; yatex load path
;;(setq load-path (cons (expand-file-name
;;"/opt/emacs/share/emacs/site-lisp/yatex")
;;load-path))
;; use utf-8 on yatex mode
;;(setq YaTeX-kanji-code 4)

;;coding rule
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(global-font-lock-mode 1)
(setq-default indent-tabs-mode nil)
(add-hook 'c-mode-common-hook
    (function
        (lambda()
            (setq truncate-lines t)
            (setq tab-width 4))))

;; 行ハイライト
;;(when window-system (global-hl-line-mode +1))


;; 対応するカッコを強調表示
(show-paren-mode t)
(setq show-paren-style 'mixed)

;===============
; jedi (package.elの設定より下に書く)
;===============
(require 'epc)
(require 'auto-complete-config)
(require 'python)

;;;;; PYTHONPATH上のソースコードがauto-completeの補完対象になる ;;;;;
(setenv "PYTHONPATH" "/usr/local/lib/python2.7/site-packages")
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; clang-auto-complete
(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)

;;バッファのタブ表示
;;(when (require 'tabbar nil t)
;;  (tabbar-mode))

;;helm
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/helm")
;;(require 'helm-config)
;;(helm-mode 1)

;; For find-file etc.
;;(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;; For helm-find-files etc.
;;(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

;;(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
;;  "Execute command only if CANDIDATE exists"
;;  (when (file-exists-p candidate)
;;    ad-do-it))

;;オートセーブ無効
(setq make-backup-files nil)
(setq auto-save-default nil)

;;ホイールの加速を抑える
;; ;; マウスホイールでのスクロール速度の設定
(setq mouse-wheel-scroll-amount '(3 ((shift) . 10) ((control) . nil)))
;; ;; マウスホイールでのスクロールの加速をするかどうか
(setq mouse-wheel-progressive-speed nil)

;;webkit
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/webkit/")
;;(require 'epc)
;;(load "webkit.el")

