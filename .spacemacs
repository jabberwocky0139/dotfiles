;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     ;; emacs-lisp
     ;; git
     ;; markdown
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     python
     c-c++
     latex
     emacs-lisp
     auto-completion
     syntax-checking
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      bury-successful-compilation
                                      multi-term
                                      jedi
                                      quickrun
                                      popwin
                                      py-yapf
                                      flycheck
                                      solarized-theme
                                      elscreen
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-dark
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (setq evil-toggle-key "")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."


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


  (global-hl-line-mode -1)
  (scroll-bar-mode -1)
  (blink-cursor-mode 1)

  ;;(require 'hl-line)
  ;;(defun global-hl-line-timer-function ()
  ;;  (global-hl-line-unhighlight-all)
  ;;  (let ((global-hl-line-mode 1))
  ;;    (global-hl-line-highlight)))
  ;;(setq global-hl-line-timer
  ;;      (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))
  ;;(cancel-timer global-hl-line-timer)


  ;; C-hをバックスペースに
  (keyboard-translate ?\C-h ?\C-?)

  ;; C-c tで折り返し
  (global-set-key (kbd "C-c t") 'toggle-truncate-lines)

  ;; C-tでウィンドウ切り替え
  (global-set-key (kbd "C-t") 'other-window)

  ;; 行数表示
  ;;(global-linum-mode t)

  ;; リージョンの強調表示
  ;;(setq transient-mark-mode t)

  ;; 検索(C-s)で大文字小文字を区別しない
  (setq completion-ignore-case t)

  ;; 指定の行数に飛ぶ
  (global-set-key "\C-x:" 'goto-line)

  ;; 対応する括弧をハイライト
  (show-paren-mode 1)

  ;;C-c rでreplace-string
  (global-set-key "\C-cr" 'replace-string)

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
  ;; これらはload-themeの前に配置すること
  ;; fringeを背景から目立たせる
  ;;(setq solarized-distinct-fringe-background t)

  ;; mode-lineを目立たせる(Fig3)
  ;;(setq solarized-high-contrast-mode-line t)

  ;; bold度を減らす
  ;;(setq solarized-use-less-bold t)

  ;; italicを増やす
  ;;(setq solarized-use-more-italic t)

  ;; インジケータの色を減らす (git-gutter, flycheckなど)
  ;;(setq solarized-emphasize-indicators nil)

  ;; orgの見出し行の文字の大きさを変えない
  ;;(setq solarized-scale-org-headlines nil)

  ;;(load-theme 'solarized-light t)
  ;;(load-theme 'solarized-dark t)

  ;; helm
  (require 'helm-config)
  (helm-mode 1)
  ;; 自動補完を無効
  ;;(custom-set-variables
  ;; ;; custom-set-variables was added by Custom.
  ;; ;; If you edit it by hand, you could mess it up, so be careful.
  ;; ;; Your init file should contain only one such instance.
  ;; ;; If there is more than one, they won't work right.
  ;; '(helm-ff-auto-update-initial-value nil)
  ;; '(search-web-default-browser (quote eww-browse-url))
  ;; '(search-web-in-emacs-browser (quote eww-browse-url))

  ;; ミニバッファでC-hをバックスペースに割り当て
  (define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

  ;; For find-file etc.
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
  ;; For helm-find-files etc.
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)

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


  ;; 透明度を変更するコマンド M-x set-alpha
  ;; http://qiita.com/marcy@github/items/ba0d018a03381a964f2
  (defun set-alpha (alpha-num)
    "set frame parameter 'alpha"
    (interactive "nAlpha: ")
    (set-frame-parameter nil 'alpha (cons alpha-num '(90))))
  ;; 初期値
  (set-frame-parameter nil 'alpha 92)


  ;; elscreen
  (elscreen-start)


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

  ;;;; py-yapf
  (require 'py-yapf)
  ;;(add-hook 'python-mode-hook 'py-yapf-enable-on-save)
  (global-set-key [f6] 'py-yapf-buffer)

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

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
