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
  :custom
  (evil-collection-calendar-want-org-bindings t)
  (evil-collection-want-unimpaired-p nil)
  :config
  (evil-collection-init))

(use-package vertico
  :custom
  (vertico-scroll-margin 0)
  (vertico-count 20)
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package hotfuzz)
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

(use-package whaler
  :custom
  (setq whaler-directories-alist '("~/Documents"))
  (setq whaler-oneoff-directories-alist '("~/.dotfiles")))

(use-package which-key
  :init
  (which-key-mode t)
  :diminish
  :custom
  (which-key-side-window-location 'bottom)
  (which-key-sort-order #'which-key-key-order-alpha)
  (which-key-sort-uppercase-first nil)
  (which-key-add-column-padding 1)
  (which-key-min-display-lines 6)
  (which-key-idle-delay 0.8)
  (which-key-max-description-length 25)
  (which-key-allow-imprecise-window-fit nil))

(use-package nerd-icons
  :if (display-graphic-p))

(use-package nerd-icons-dired
  :hook (dired-mode . (lambda () (nerd-icons-dired-mode t))))

(use-package nerd-icons-ibuffer
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-popupinfo-mode t)
  (corfu-popupinfo-delay 0.5)
  (corfu-separator ?\s)
  (corfu-preselect 'prompt)
  (completion-ignore-case t)
  (tab-always-indent t)
  (corfu-preview-current t)
  :init
  (global-corfu-mode))

(use-package yasnippet-snippets
  :hook (prog-mode . yas-minor-mode))

(use-package nerd-icons-corfu
  :after corfu
  :init (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package transient)

(use-package magit
  :defer
  :commands magit-status)

(use-package diff-hl
  :hook ((dired-mode . diff-hl-dired-mode-unless-remote)
         (magit-pre-refresh . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :init (global-diff-hl-mode))

(use-package eglot
  :ensure nil
  :hook ((c-mode c++-mode csharp-mode)
	 . eglot-ensure)
  :custom
  (eglot-events-buffer-size 0)
  (eglot-autoshutdown t)
  (eglot-report-progress nil))

(use-package org
  :ensure nil
  :custom
  (org-edit-src-content-indentation 4)
  :hook
  (org-mode . org-indent-mode))

(use-package toc-org
  :commands toc-org-enable
  :hook (org-mode . toc-org-mode))

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode))

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
  (completion-styles '(hotfuzz))
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
