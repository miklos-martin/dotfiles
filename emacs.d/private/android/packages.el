;;; packages.el --- android layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Martin Miklós <martin.miklos@mikbook>
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
;; added to `android-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `android/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `android/pre-init-PACKAGE' and/or
;;   `android/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:
(defconst android-packages
  '(android-mode))

(defun android/init-android-mode ()
  (use-package android-mode
    :defer t
    :init
    (progn
      (custom-set-variables '(android-mode-builder 'gradle)))))

;;; packages.el ends here
