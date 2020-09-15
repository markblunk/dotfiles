;;; init --- initialization script for emails
;;; Commentary:
;; Set up the package archives, download use-package, and use the file
;; emacs.org to generate the corresponding emacs.el file

;;; Code:

(require 'package)

(setq package-enable-at-startup nil
      package-archives '(("org"   .  "https://orgmode.org/elpa/")
                         ("gnu"   .  "https://elpa.gnu.org/packages/")
                         ("melpa" .  "https://melpa.org/packages/")))

(when (< emacs-major-version 27)
  (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(org-babel-load-file "~/.emacs.d/emacs.org")
;;; init.el ends here
