;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; (browse-url "https://raw.githubusercontent.com/doomemacs/doomemacs/refs/heads/master/static/config.example.el")
(load! "user" doom-user-dir)

(setq doom-font (font-spec :family "JetBrains Mono" :size 13 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "iA Writer Quattro V" :size 13)
      doom-big-font (font-spec :family "JetBrains Mono" :size 26 :weight 'regular)
      doom-symbol-font (font-spec :family "Symbols Nerd Font Mono")
      doom-serif-font (font-spec :family "IBM Plex Serif")
      doom-theme 'modus-operandi
      display-line-numbers-type t
      projectile-project-search-path '(("~/Code" . 2)))

(setq shell-file-name (executable-find "bash"))

(after! writeroom-mode
  (add-hook! 'writeroom-mode-hook :append
    (defun +zen-toggle-line-numbers-h ()
      "Disable line numbers while in `+zen-mixed-pitch-modes'."
      (when (apply #'derived-mode-p +zen-mixed-pitch-modes)
        (if writeroom-mode
            (setq +zen--old-display-line-numbers display-line-numbers
                  display-line-numbers nil)
          (when (local-variable-p '+zen--old-display-line-numbers)
            (setq display-line-numbers +zen--old-display-line-numbers)))))))

(after! evil-collection
  (setq evil-collection-magit-want-horizontal-movement t))

(after! transient
  (setq transient-values '((magit-rebase "--autosquash" "--autostash")
                           (magit-pull "--rebase" "--autostash")
                           (magit-push "--force-with-lease"))))

(set-formatter! 'nix-fmt '("nix" "fmt") :modes '(nix-mode nix-ts-mode))
