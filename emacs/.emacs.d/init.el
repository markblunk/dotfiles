;;; package --- initialization file.
;;; Commentary:
;; Set up the package archives and use the file emacs.org to generate the
;; corresponding emacs.el file

;;; Code:
(when (< emacs-major-version 29)
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package))

(org-babel-load-file "~/.emacs.d/emacs.org")
;;; init.el ends here
