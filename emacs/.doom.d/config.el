;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Source Code Pro" :size 20)
      doom-big-font (font-spec :family "Source Code Pro" :size 26)
      display-line-numbers-type nil
      org-log-done 'time
      evil-escape-excluded-states '(normal emacs motion)
      show-trailing-whitespace t
      )

;;
;; Key bindings
(map! :leader
      (:prefix "c"
        :desc "Sort lines alphabetically" :v "s" #'sort-lines)
      (:prefix "w"
        "F" #'make-frame))

(after! projectile
   (projectile-register-project-type
      'bazel '("WORKSPACE")
      :compile "bazel build //..."
      :test "bazel test //..."))

(after! org
  (load "~/Sync/org/orgmode.el"))

(direnv-mode)
