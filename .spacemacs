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

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; better-defaults
     neotree
     yaml
     emacs-lisp
     git
     markdown
     org
     mscala
     java
     html
     javascript
     php
     restclient
     haskell
     csv
     sql
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control

     (typescript :variables
                 typescript-fmt-on-save t)

     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(sql-indent doom-themes)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory 'emacs-version
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-nord
                         doom-one
                         zenburn
                         spacemacs-dark
                         spacemacs-light
                         solarized-dark)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(vim-powerline)

   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Monaco for powerline"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
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
  ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
  dotspacemacs-remap-Y-to-y$ t
  ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

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
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   dotspacemacs-enable-server t

   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (spacemacs|use-package-add-hook org
    :pre-init
    (package-initialize)
    )
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place you code here."
  ;; (require 'neotree)
  ;; (global-set-key [f8] 'neotree-toggle)
  ;; (setq neo-theme 'nerd)

  (setq backup-directory-alist `(("." . "~/.emacs-saves")))
  (setq  create-lockfiles nil)

  (require 'ansi-color)
  (defun colorize-compilation-buffer ()
    (toggle-read-only)
    (ansi-color-apply-on-region compilation-filter-start (point))
    (toggle-read-only))
  (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

  (global-company-mode)

  (setq helm-buffers-fuzzy-matching t)

  (add-hook 'before-make-frame-hook
            #'(lambda ()
                (add-to-list 'default-frame-alist '(height . 50))
                (add-to-list 'default-frame-alist '(width  . 200))))

  (load-library "find-lisp")
  (setq org-agenda-files
        (find-lisp-find-files "~/.org" "\.org$"))

  (setq php-executable "/usr/local/bin/php")
  (add-hook 'php-mode-hook 'php-enable-psr2-coding-style)
  (add-to-list 'auto-mode-alist '("\\.php$'" . phpunit-mode))

  (defun php-cs-fixer ()
    (interactive)
    (setq filename (buffer-file-name (current-buffer)))
    (call-process "php-cs-fixer" nil nil nil "fix" filename )
    (revert-buffer t t)
    )

  (define-key evil-insert-state-map (kbd "M-s-¶") 'php-cs-fixer)
  (define-key evil-normal-state-map (kbd "M-s-¶") 'php-cs-fixer)
  (define-key evil-visual-state-map (kbd "M-s-¶") 'php-cs-fixer)

  (add-hook 'phpunit-mode-hook
    (lambda ()
      (define-key evil-normal-state-map (kbd "C-S-r") 'phpunit-current-test)
      (define-key evil-normal-state-map (kbd "C-S-c") 'phpunit-current-class)
      (define-key evil-normal-state-map (kbd "C-S-f") 'phpunit-current-project)
      (define-key evil-insert-state-map (kbd "C-S-r") 'phpunit-current-test)
      (define-key evil-insert-state-map (kbd "C-S-c") 'phpunit-current-class)
      (define-key evil-insert-state-map (kbd "C-S-f") 'phpunit-current-project)))

  (add-hook 'js2-mode-hook
    (lambda ()
      (define-key evil-normal-state-map (kbd "C-S-c") 'compile)
      (define-key evil-insert-state-map (kbd "C-S-c") 'compile)
      (setq compilation-read-command nil)
      (set (make-local-variable 'compile-command)
           (concat "node " (buffer-file-name)))))

  (add-hook 'shell-script-mode-hook
            (lambda ()
              (define-key evil-normal-state-map (kbd "C-S-c") 'compile)
              (define-key evil-insert-state-map (kbd "C-S-c") 'compile)
              (setq compilation-read-command nil)
              (set (make-local-variable 'compile-command)
                   (concat "shellcheck " (buffer-file-name)))))


  (define-key evil-insert-state-map (kbd "s-r") 'replace-string)
  (define-key evil-normal-state-map (kbd "s-r") 'replace-string)
  (define-key evil-visual-state-map (kbd "s-r") 'replace-string)

  (setq powerline-image-apple-rgb t)

  (setq mac-option-key-is-meta t)
  (setq mac-right-option-modifier nil)

  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)

  (setq js2-strict-missing-semi-warning nil)

  (defun disable-new-line () (set (make-local-variable 'require-final-newline) nil))
  (add-hook 'snippet-mode-hook 'disable-new-line)

  (define-key evil-insert-state-map (kbd "C-SPC") 'hippie-expand)


  (defun replace-last-capital () (interactive)
    (save-excursion
      (let ((char (upcase (read-from-minibuffer "Char to replace: "))))
        (setq case-fold-search nil)
        (when (search-backward char nil 't)
          (replace-match (downcase char) t))

        (setq case-fold-search t))))

  (define-key evil-insert-state-map (kbd "s-e") 'replace-last-capital)
  (define-key evil-normal-state-map (kbd "s-e") 'replace-last-capital)
  (define-key evil-visual-state-map (kbd "s-e") 'replace-last-capital)

  (global-set-key [C-mouse-4] 'text-scale-increase)
  (global-set-key [C-mouse-5] 'text-scale-decrease)

  (setq term-default-bg-color nil)

  (defun setup-term-mode ()
    (evil-local-set-key 'insert (kbd "C-c") (lambda () (interactive) (term-send-raw-string "\C-c")))
    (evil-local-set-key 'insert (kbd "C-d") (lambda () (interactive) (term-send-raw-string "\C-d"))))

  (add-hook 'term-mode-hook 'setup-term-mode)

  (eval-after-load "sql"
    '(load-library "sql-indent"))

  (setq tide-format-options '(:indentSize 2 :tabSize 2))
  (setq typescript-indent-level 2)

  (defun kill-minibuffer ()
    (interactive)
    (when (windowp (active-minibuffer-window))
      (evil-ex-search-exit)))

  (add-hook 'mouse-leave-buffer-hook #'kill-minibuffer)
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(android-mode-builder (quote gradle))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(evil-want-Y-yank-to-eol t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(org-agenda-files
   (quote
    ("/Users/mmartin/.org/anda/ricsimemo.org" "/Users/mmartin/.org/anda/15.demo.org" "/Users/mmartin/.org/anda/riskmemo.org" "/Users/mmartin/.org/anda/12.demo.org" "/Users/mmartin/.org/anda/17.grooming.org" "/Users/mmartin/.org/anda/18.demo.org" "/Users/mmartin/.org/anda/infixretro.org" "/Users/mmartin/.org/anda/SPS.org" "/Users/mmartin/.org/anda/docs.org" "/Users/mmartin/.org/anda/20.grooming.org" "/Users/mmartin/.org/anda/11.planning.org" "/Users/mmartin/.org/anda/10.implement.org" "/Users/mmartin/.org/anda/17.demo.org" "/Users/mmartin/.org/anda/10.planning.org" "/Users/mmartin/.org/anda/10.demo.org" "/Users/mmartin/.org/2018/smartcontent.flippers.org" "/Users/mmartin/.org/2018/wizz.org" "/Users/mmartin/.org/2018/01/01.08.org" "/Users/mmartin/.org/2018/01/01.09.org" "/Users/mmartin/.org/2018/01/01.23.org" "/Users/mmartin/.org/2018/01/01.22.org" "/Users/mmartin/.org/2018/01/01.19.org" "/Users/mmartin/.org/2018/01/01.31.org" "/Users/mmartin/.org/2018/01/01.24.org" "/Users/mmartin/.org/2018/01/01.18.org" "/Users/mmartin/.org/2018/01/01.15.org" "/Users/mmartin/.org/2018/01/01.23.retro.org" "/Users/mmartin/.org/2018/01/01.16.org" "/Users/mmartin/.org/2018/01/01.02.org" "/Users/mmartin/.org/2018/01/01.17.org" "/Users/mmartin/.org/2018/01/01.12.org" "/Users/mmartin/.org/2018/01/01.10.org" "/Users/mmartin/.org/2018/01/01.11.org" "/Users/mmartin/.org/2018/01/01.30.retro.org" "/Users/mmartin/.org/2018/appraisal.robi.org" "/Users/mmartin/.org/2018/02/02.01.org" "/Users/mmartin/.org/2018/02/failsafe.monitoring.org" "/Users/mmartin/.org/2018/02/02.20.retro.org" "/Users/mmartin/.org/2018/02/02.17.oncall.org" "/Users/mmartin/.org/2018/02/02.13.retro.org" "/Users/mmartin/.org/2018/02/02.26.org" "/Users/mmartin/.org/2018/02/02.19.org" "/Users/mmartin/.org/2018/02/02.27.retro.org" "/Users/mmartin/.org/2018/02/02.21.org" "/Users/mmartin/.org/2018/02/02.09.org" "/Users/mmartin/.org/2018/02/02.08.org" "/Users/mmartin/.org/2018/02/02.06.retro.org" "/Users/mmartin/.org/2018/02/02.22.org" "/Users/mmartin/.org/2018/02/02.23.org" "/Users/mmartin/.org/2018/03/03.23.org" "/Users/mmartin/.org/2018/03/03.22.org" "/Users/mmartin/.org/2018/03/03.20.org" "/Users/mmartin/.org/2018/03/03.21.org" "/Users/mmartin/.org/2018/03/03.13.retro.org" "/Users/mmartin/.org/2018/03/03.20.retro.org" "/Users/mmartin/.org/2018/03/03.06.retro.org" "/Users/mmartin/.org/2017/06/06.01.org" "/Users/mmartin/.org/2017/01/01.26.org" "/Users/mmartin/.org/2017/01/01.27.org" "/Users/mmartin/.org/2017/01/01.02.org" "/Users/mmartin/.org/2017/01/01.03.org" "/Users/mmartin/.org/2017/01/01.04.org" "/Users/mmartin/.org/2017/01/01.05.org" "/Users/mmartin/.org/2017/08/08.29.org" "/Users/mmartin/.org/2017/08/08.28.org" "/Users/mmartin/.org/2017/08/08.30.org" "/Users/mmartin/.org/2017/09/09.06.org" "/Users/mmartin/.org/2017/09/09.07.org" "/Users/mmartin/.org/2017/lambdaworld/flight.org" "/Users/mmartin/.org/2017/02/02.28.org" "/Users/mmartin/.org/2017/02/02.27.org" "/Users/mmartin/.org/2017/02/02.26.org" "/Users/mmartin/.org/2017/02/02.25.org" "/Users/mmartin/.org/2017/02/02.21.org" "/Users/mmartin/.org/2017/02/02.20.org" "/Users/mmartin/.org/2017/02/02.22.org" "/Users/mmartin/.org/2017/04/04.19.org" "/Users/mmartin/.org/2017/04/04.25.org" "/Users/mmartin/.org/2017/04/04.24.org" "/Users/mmartin/.org/2017/04/04.18.org" "/Users/mmartin/.org/2017/04/04.26.org" "/Users/mmartin/.org/2017/04/04.20.org" "/Users/mmartin/.org/2017/04/04.21.org" "/Users/mmartin/.org/todo.org" "/Users/mmartin/.org/emarsys/templateservice/process.org" "/Users/mmartin/.org/emarsys/templateservice/template.schema.org" "/Users/mmartin/.org/emarsys/bootcamp.demo.org" "/Users/mmartin/.org/emarsys/starterkit.org" "/Users/mmartin/.org/emarsys/mrd/1.planning.org" "/Users/mmartin/.org/lambdas/lambdas.org")))
 '(package-selected-packages
   (quote
    (go-guru go-eldoc company-go go-mode org-category-capture ghub let-alist org-mime rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby tide typescript-mode ob-elixir flycheck-mix flycheck-credo alchemist elixir-mode org-projectile org-present org-pomodoro alert log4e gntp org-download htmlize gnuplot winum restclient-helm ob-restclient fuzzy company-restclient know-your-http-well elm-mode csv-mode erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks nginx-mode hide-comnt sql-indent php-refactor-mode uuidgen toc-org powerline pug-mode org org-plus-contrib org-bullets ob-http markdown-mode livid-mode skewer-mode simple-httpd link-hint json-snatcher json-reformat js2-mode intero flycheck hlint-refactor parent-mode projectile helm-hoogle request haml-mode gitignore-mode git-link flx eyebrowse evil-visual-mark-mode evil-unimpaired magit magit-popup git-commit with-editor smartparens iedit evil-ediff anzu evil goto-chg undo-tree eshell-z sbt-mode scala-mode dumb-jump f diminish web-completion-data dash-functional tern pos-tip company-ghci ghc haskell-mode company-emacs-eclim eclim company column-enforce-mode clojure-snippets hydra inflections edn multiple-cursors paredit s peg eval-sexp-fu highlight cider seq spinner queue pkg-info clojure-mode epl bind-map bind-key yasnippet packed dash helm avy helm-core async auto-complete popup package-build android-mode restclient ac-php xpm php-mode php+-mode zenburn-theme yaml-mode xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe use-package tagedit spacemacs-theme spaceline solarized-theme smooth-scrolling smeargle slim-mode shm shell-pop scss-mode sass-mode restart-emacs rainbow-delimiters quelpa popwin phpunit phpcbf php-extras php-auto-yasnippets persp-mode pcre2el paradox page-break-lines orgit open-junk-file noflet neotree multi-term move-text monokai-theme mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme less-css-mode json-mode js2-refactor js-doc jade-mode info+ indent-guide ido-vertical-mode hungry-delete hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md ggtags flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eshell-prompt-extras esh-help ensime emmet-mode emacs-eclim elisp-slime-nav drupal-mode define-word company-web company-tern company-statistics company-quickhelp company-ghc company-cabal coffee-mode cmm-mode clj-refactor clean-aindent-mode cider-eval-sexp-fu buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background-mode nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#DCDCCC" :background "#3F3F3F"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(term ((t (:inherit default)))))
