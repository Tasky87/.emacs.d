(setq ring-bell-function 'ignore
      x-gtk-use-system-tooltips nil
      use-dialog-boxes nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)

(desktop-save-mode t)
(save-place-mode t)

(setq gnutls-verify-error t)
(setq tls-checktrust t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxo502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-user-package 'use-package)

(setq vj/font-name "Hack")
(defcustom vj/font-size 12 "My default font size")
(defun set-frame-font-size (&optional font-size)
  "Change frame font size to FONT-SIZE.
   If no FONT-SIZE provided, reset the font size to variable.")
(let ((font-size
       (or font-size
	   (car (get 'vj/font-size 'standard-value)))))
  (customize-set-variable 'vj/font-size font-size)
  (set-frame-font
   (format  "%s %d" vj/font-name font-size) nil t)))


(defun increase-frame-font ()
  "Increase frame font by one."
  (interactive)
  (set-frame-font-size (+ vj/font-size 1)))

(defun decrease-frame-font ()
  "Decrease frame font by one."
  (interactive)
  (set-frame-font-size (- vj/font-size 1)))

(defun reset-frame-font ()
  "Reset frame font to its default value."
  (interactive)
  (set-frame-font-size))
