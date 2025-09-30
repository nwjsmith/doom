;;; ui/modus/config.el -*- lexical-binding: t; -*-

(use-package! modus-themes
 :init
 ;; TODO these should be bound to `doom-themes-enable-bold'/`doom-themes-enable-italic'
 (setq modus-themes-bold-constructs t
       modus-themes-italic-constructs t))

;; TODO update Modus themes' docs for Doom Emacs
(custom-theme-set-faces! modus-themes-items
  `(solaire-default-face :inherit default :background ,(modus-themes-get-color-value 'bg-dim) :foreground ,(modus-themes-get-color-value 'fg-dim))
  `(solaire-line-number-face :inherit solaire-default-face :foreground ,(modus-themes-get-color-value 'fg-dim))
  `(solaire-hl-line-face :background ,(modus-themes-get-color-value 'bg-active))
  `(solaire-org-hide-face :background ,(modus-themes-get-color-value 'bg-dim) :foreground ,(modus-themes-get-color-value 'bg-dim))
  `(diff-hl-insert :foreground ,(modus-themes-get-color-value 'bg-added-fringe))
  `(diff-hl-delete :foreground ,(modus-themes-get-color-value 'bg-removed-fringe)))
