;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Danny Navarro"
      user-mail-address "j@dannynavarro.net")

;;; ui
(setq doom-font (font-spec :family "Iosevka Fixed" :size 24)
      doom-theme 'modus-operandi
      display-line-numbers-type nil)

;;; :tools magit
(setq magit-repository-directories '(("~/dev" . 2)))

;;; :lang org
(setq org-directory "~/sync/org/"
      org-default-notes-file "~/sync/org/notes.org")

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
(setq lsp-clients-typescript-server-args '("--stdio" "--tsserver-log-file" "/dev/stderr"))
;;; :lang rust
(add-hook! rustic-mode
  (setq
   lsp-signature-render-documentation nil
   lsp-headerline-breadcrumb-enable t
   lsp-rust-analyzer-proc-macro-enable t
   fill-column 100
   lsp-treemacs-errors-position-params '((side . right)))
  (set-popup-rules!
    '(("\\*rustic-.*\\*" :side right :width 100)
      ("\\*cargo-.*\\*" :side right :width 100)
      ("\\*doom:.*\\*" :side right :width 80)
      ("\\*lsp-help\\*" :side right :width 80)
      ("\\*LSP\\ Error\\ List\\*" :side right :width 80 :quit t)
      ("\\*Flycheck\\ errors\\*" :side right :width 80)))

  (lsp-treemacs-sync-mode 1)
  (treemacs-follow-mode))

(setq vterm-shell "/usr/bin/fish")

;;(map!  :nv "l" #'evilnc-comment-operator
;;       (:after evil-easymotion
;;        :m "k" evilem-map
;;        (:map evilem-map
;;         "<up>" #'evil-avy-goto-word-1-above
;;         "<down>" #'evil-avy-goto-word-1-below))
;;       (:when (featurep! :editor multiple-cursors)
;;        :prefix "h"
;;        :nv "d" #'evil-mc-make-and-goto-next-match
;;        :nv "D" #'evil-mc-make-and-goto-prev-match
;;        :nv "j" #'evil-mc-make-cursor-move-next-line
;;        :nv "k" #'evil-mc-make-cursor-move-prev-line
;;        :nv "m" #'evil-mc-make-all-cursors
;;        :nv "n" #'evil-mc-make-and-goto-next-cursor
;;        :nv "N" #'evil-mc-make-and-goto-last-cursor
;;        :nv "p" #'evil-mc-make-and-goto-prev-cursor
;;        :nv "P" #'evil-mc-make-and-goto-first-cursor
;;        :nv "q" #'evil-mc-undo-all-cursors
;;        :nv "t" #'+multiple-cursors/evil-mc-toggle-cursors
;;        :nv "u" #'+multiple-cursors/evil-mc-undo-cursor
;;        :nv "z" #'+multiple-cursors/evil-mc-toggle-cursor-here
;;        :v  "I" #'evil-mc-make-cursor-in-visual-selection-beg
;;        :v  "A" #'evil-mc-make-cursor-in-visual-selection-end))
;;
;;(setq avy-keys '(?y ?i ?e ?a ?. ?d ?s ?t ?b))
