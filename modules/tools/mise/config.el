;;; tools/mise/config.el -*- lexical-binding: t; -*-

(use-package! mise
  :hook (doom-first-file . global-mise-mode)
  :config
  (set-debug-variable! 'mise-debug)

  (add-hook 'doom-after-reload-hook #'mise-reload))
