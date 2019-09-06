;;; packages.el --- mscala layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Miklos Martin <miklos.martin@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `mscala-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `mscala/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `mscala/pre-init-PACKAGE' and/or
;;   `mscala/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst mscala-packages
  '(
;; The list of Lisp packages required by the mscala layer.

;; Each entry is either:

;; 1. A symbol, which is interpreted as a package to be installed, or

;; 2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
;;     name of the package to be installed or loaded, and KEYS are
;;     any number of keyword-value-pairs.

;;     The following keys are accepted:

;;     - :excluded (t or nil): Prevent the package from being loaded
;;       if value is non-nil

;;     - :location: Specify a custom installation location.
;;       The following values are legal:

;;       - The symbol `elpa' (default) means PACKAGE will be
;;         installed using the Emacs package manager.

;;       - The symbol `local' directs Spacemacs to load the file at
;;         `./local/PACKAGE/PACKAGE.el'

;;       - A list beginning with the symbol `recipe' is a melpa
;;         recipe.  See: https://github.com/milkypostman/melpa#recipe-format

    scala-mode
    sbt-mode
    flycheck
    lsp-ui
    lsp-mode
    company-lsp
))


(defun mscala/init-scala-mode()
  (use-package scala-mode
    :ensure t
    :defer t
    :mode "\\.s\\(cala\\|bt\\)$"))

(defun mscala/init-sbt-mode()
  (use-package sbt-mode
    :ensure t
    :defer t
    :commands sbt-start sbt-command
    :config
    ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
    ;; allows using SPACE when in the minibuffer
    (substitute-key-definition
     'minibuffer-complete-word
     'self-insert-command
     minibuffer-local-completion-map)))

(defun mscala/init-flycheck()
  (use-package flycheck
    :ensure t
    :defer t
    :init (global-flycheck-mode)))

(defun mscala/init-company-lsp()
  (use-package company-lsp
    :ensure t
    :defer t))

(defun mscala/init-lsp-mode()
  (use-package lsp-mode
    :ensure t
    :defer t
    :hook (scala-mode . lsp)
    :commands lsp
    :config (setq lsp-prefer-flymake nil))


  (spacemacs/declare-prefix-for-mode 'scala-mode "mg" "goto")
  (spacemacs/declare-prefix-for-mode 'scala-mode "mf" "format")
  (spacemacs/declare-prefix-for-mode 'scala-mode "mt" "toggle")

  (spacemacs/set-leader-keys-for-major-mode 'scala-mode
    "gg"     'lsp-find-definition
    "gw"     'xref-find-definitions-other-window
    "gr"     'lsp-find-references
    "gs"     'lsp-ui-find-workspace-symbol

    "fb"     'lsp-format-buffer

    "ts"     'lsp-ui-sideline-toggle-symbols-info
    "td"     'lsp-ui-doc-mode
    ))

(defun mscala/init-lsp-ui()
  (use-package lsp-ui
    :ensure t
    :defer t))


;;; packages.el ends here
