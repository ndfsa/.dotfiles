;; The default is 800 kilobytes. Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Include package manager
(load-file "~/.config/emacs/package-manager.el")

(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox-dark-medium t))

;; Set font face
(set-face-attribute 'default nil
  :font "JetBrains Mono"
  :height 120
  :weight 'medium)

(use-package evil
  :init
  (evil-mode)
  :custom
  (evil-want-keybinding nil)
  (evil-want-C-u-scroll t)
  (evil-want-C-i-jump t)
  (evil-undo-system 'undo-redo))

(use-package evil-collection
  :after evil
  :config (evil-collection-init))

(use-package vertico
  :custom
  (vertico-scroll-margin 0)
  (vertico-count 20)
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package savehist :init (savehist-mode))
(use-package marginalia :init (marginalia-mode))
(use-package consult
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  (advice-add #'register-preview :override #'consult-register-window)
  (setq register-preview-delay 0.5)
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  :config
  (consult-customize
    consult-theme :preview-key '(:debounce 0.2 any)
    consult-ripgrep consult-git-grep consult-grep consult-man
    consult-bookmark consult-recent-file consult-xref
    consult--source-bookmark consult--source-file-register
    consult--source-recent-file consult--source-project-recent-file
    :preview-key '(:debounce 0.4 any))

  (setq consult-narrow-key "<"))

(use-package emacs
  :ensure nil
  :custom
  (scroll-bar-mode nil)
  (tool-bar-mode nil)
  (tooltip-mode nil)
  (menu-bar-mode nil)
  (electric-indent-mode nil)
  (make-backup-files nil)
  (auto-save-default nil)

  (set-fringe-mode 10)
  (inhibit-startup-message t)
  (global-auto-revert-mode t)
  (electric-pair-mode t)
  (scroll-margin 5)
  (scroll-step 1)
  (frame-resize-pixelwise t)
  (global-display-line-numbers-mode t)
  (mouse-wheel-progressive-speed nil)
  (scroll-conservatively 10)
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)

  (straight-use-package-by-default t)

  (current-language-environment "UTF-8")
  
  :init
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  :hook
  (minibuffer-setup . cursor-intangible-mode)

  :bind
  (( [escape] . keyboard-escape-quit)))

(setq gc-cons-threshold (* 2 1000 1000))
(setq read-process-output-max (* 1024 1024))
