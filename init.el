;;; init.el -*- lexical-binding: t; -*-

;; (browse-url "https://raw.githubusercontent.com/doomemacs/doomemacs/refs/heads/master/static/init.example.el")

(doom! :completion
       (corfu +icons +orderless)
       (vertico +icons)

       :ui
       (doom +tabs)
       doom-dashboard
       hl-todo
       indent-guides
       modeline
       modus
       ophints
       (popup +defaults)
       smooth-scroll
       (vc-gutter +pretty)
       vi-tilde-fringe
       (workspaces +tabs)

       :editor
       (evil +everywhere)
       file-templates
       fold
       format
       multiple-cursors
       rotate-text
       snippets

       :emacs
       (dired +dirvish +icons)
       eww
       tramp
       undo
       vc

       :term
       eshell

       :checkers
       syntax
       spell

       :tools
       debugger
       direnv
       docker
       editorconfig
       (eval +overlay)
       (lookup +docsets +dictionary)
       llm
       (lsp +eglot)
       (magit +forge)
       pdf
       tree-sitter

       :os
       (:if (featurep :system 'macos) macos)
       tty

       :lang
       (clojure +lsp +tree-sitter)
       data
       emacs-lisp
       (graphql +lsp +tree-sitter)
       (json +lsp +tree-sitter)
       (java +lsp +tree-sitter)
       (javascript +lsp +tree-sitter)
       (kotlin +lsp +tree-sitter)
       (markdown +tree-sitter)
       (nix +lsp +tree-sitter)
       org
       (python +lsp +tree-sitter)
       (ruby +lsp +rails +tree-sitter)
       (rust +lsp +tree-sitter)
       (sh +fish +lsp)
       (swift +lsp +tree-sitter)
       (yaml +lsp +tree-sitter)
       (zig +lsp +tree-sitter)

       :email
       ;;(mu4e +org +gmail)

       :app
       ;;emms
       everywhere
       (rss +org +youtube)

       :config
       (default +bindings +smartparens))
