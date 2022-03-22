;;; init.el -*- lexical-binding: t; -*-

(doom! :input
       :completion
       company
       vertico

       :ui
       doom
       doom-dashboard
       doom-quit
       fill-column
       hl-todo
       indent-guides
       minimap
       modeline
       nav-flash
       ophints
       (popup +defaults +all)
       (treemacs +lsp)
       unicode
       vc-gutter
       vi-tilde-fringe
       (window-select +numbers)
       ;; workspaces

       :editor
       (evil +everywhere)
       ;;(meow +qwerty +override +keypad)
       file-templates
       fold
       lispy
       multiple-cursors
       ;; objed
       snippets

       :emacs
       dired
       electric
       undo
       vc

       :term
       vterm

       :checkers
       syntax
       (spell +flyspell)
       grammar

       :tools
       ansible
       debugger
       direnv
       editorconfig
       (eval +overlay)
       lookup
       (lsp +peek)
       (magit +forge)
       pdf
       rgb
       taskrunner
       terraform

       :os
       tty

       :lang
       data
       emacs-lisp
       (haskell +lsp)
       json
       (javascript +lsp)
       markdown
       nix
       (org +pretty +roam2)
       racket
       rest
       (rust +lsp)
       (sh +fish)
       scheme
       (web +html +css +lsp)
       yaml

       :config
       (default +bindings +smartparens))

;; (setq doom-localleader-key "<return>"
;;       doom-localleader-alt-key "M-<return>")
