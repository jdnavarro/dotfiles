;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Danny Navarro"
      user-mail-address "j@dannynavarro.net"
      )

(global-emojify-mode)

;;; ui
(setq doom-font (font-spec :family "Iosevka" :size 24)
      doom-theme 'doom-dracula
      display-line-numbers-type nil)

;;; :tools magit
(setq magit-repository-directories '(("~/Devel" . 2)))

;;; :lang org
(setq org-directory "~/Sync/org/"
      org-default-notes-file "~/Sync/org/notes.org")

(after! org
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"
           "PROG(p)"
           "WAIT(w)"
           "|"
           "DONE(d)"
           "CANCEL(c)"))
        org-todo-keyword-faces
        '(("TODO" . +org-todo-project)
          ("PROG" . +org-todo-active)
          ("WAIT" . +org-todo-onhold))
        org-habit-show-habits t)
  (add-to-list 'org-modules 'org-habit))

;;; :lang javascript
;; prettier
(setq-hook! 'js2-mode-hook +format-with-lsp nil)
