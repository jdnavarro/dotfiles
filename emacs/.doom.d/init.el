;;; init.el -*- lexical-binding: t; -*-

(doom! :input
       :completion
       company
       (ivy +prescient +childframe)

       :ui
       doom
       doom-dashboard
       doom-quit
       hl-todo
       minimap
       modeline
       nav-flash
       ophints
       (popup +defaults)
       treemacs
       tabs
       vc-gutter
       vi-tilde-fringe
       workspaces
       zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       (format +onsave)
       lispy
       multiple-cursors
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
       spell
       grammar

       :tools
       debugger
       direnv
       editorconfig
       (eval +overlay)
       lookup
       (lsp +peek)
       (magit +forge)
       pdf
       taskrunner
       terraform

       :os
       tty

       :lang
       data
       emacs-lisp
       (haskell +ghcide)
       json
       (javascript +lsp)
       markdown
       (org +pretty +roam)
       racket
       rest
       (rust +lsp)
       (sh +fish)
       scheme
       ;; svelte supported with lsp
       (web +html +css +lsp)
       yaml

       :config
       (default +bindings +smartparens))

(setq doom-localleader-key "<menu>"
      doom-localleader-alt-key "M-<menu>")
