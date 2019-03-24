;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Fira Code" :size 16)
      doom-big-font (font-spec :family "Fira Code" :size 20)
      display-line-numbers-type nil
      haskell-process-type 'cabal-new-repl)

;;
;; Key bindings
(map! :leader
      (:prefix "c"
        :desc "Sort lines alphabetically" :v "s" #'sort-lines)
      (:prefix "w"
        (:prefix "m"
            "m"   #'doom/window-zoom
            "s"   #'window-maximize-horizontally
            "v"   #'window-maximize-vertically)))

(after! org
  (load "~/Sync/org/orgmode.el"))

(direnv-mode)
