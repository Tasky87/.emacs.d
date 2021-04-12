(setq ring-bell-function 'ignore
      x-gtk-use-system-tooltips nil
      use-dialog-box nil)
(setq mous-wheel-scroll-amount '(1)
      mouse-wheel-progressive-speed nil
      scroll-conservatively 101)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
(show-paren-mode)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq confirm-kill-processes nil)

(desktop-save-mode t)
(save-place-mode t)

(setq gnutls-verify-error t)
(setq tls-checktrust t)

;; Straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Use package
(straight-use-package 'use-package)

(setq font-name "Hack")
(defcustom font-size 13 "My default font size")
(defun set-frame-font-size (&optional font-size)
  "Change frame font size to FONT-SIZE.
   If no FONT-SIZE provided, reset the font size to variable."
(let ((font-size
       (or font-size
	   (car (get 'font-size 'standard-value)))))
  (customize-set-variable 'font-size font-size)
  (set-frame-font
   (format  "%s %d" font-name font-size) nil t)))

(defun increase-frame-font ()
  "Increase frame font by one."
  (interactive)
  (set-frame-font-size (+ font-size 1)))

(defun decrease-frame-font ()
  "Decrease frame font by one."
  (interactive)
  (set-frame-font-size (- font-size 1)))

(defun reset-frame-font ()
  "Reset frame font to its default value."
  (interactive)
  (set-frame-font-size))

(add-hook 'after-init-hook 'reset-frame-font)

(load (concat (expand-file-name use-emacs-directory) "config/lol.el"))


