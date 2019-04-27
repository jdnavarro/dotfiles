;;; doom.d/autoload/config.el -*- lexical-binding: t; -*-

;;;###autoload
(defun ediff-private-init-and-emacs-init ()
  "ediff the private `init.el' with the emacs `init.example.el'."
  (interactive)
  (ediff-files (concat doom-private-dir "init.el")
               (concat doom-emacs-dir "init.example.el")))
