(require 'cl)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(setq ido-use-virtual-buffers t
      custom-file "~/.emacs.d/custom.el"
      ido-handle-duplicate-virtual-buffers 2)

(when (not (require 'package nil t))
  (require 'package "package-23.el"))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(better-defaults clojure-mode clojure-test-mode paredit
                                      markdown-mode erc-hl-nicks ipython magit
                                      yaml-mode ghc haskell-mode window-number
                                      ghci-completion yasnippet nrepl smex
                                      diminish
                                      ;; highline buffer-move rect-mark
                                      ;; color themes
                                      color-theme-twilight
                                      color-theme-solarized
                                      twilight-theme
                                      ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; (mapc 'load (directory-files (concat user-emacs-directory user-login-name)
;;                              t "^[^#].*el$"))
(mapc 'load (directory-files (concat user-emacs-directory "russell")
                             t "^[^#].*el$"))

(setq smex-save-file (concat user-emacs-directory "smex-items"))
(smex-initialize)

(eshell)