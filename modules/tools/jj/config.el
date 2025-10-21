;;; tools/jj/config.el -*- lexical-binding: t; -*-

(use-package! jj-mode
  :commands (jj-log jj-status jj-diff jj-show)
  :defer-incrementally (transient magit)
  :init
  (map! :leader :desc "jj log" "j j" #'jj-log)

  :config
  (setq jj-log-display-function #'switch-to-buffer)

  (defun +jj-message-buffer-p (buffer)
    (string-match-p "\\*\\(DESCRIBE_MSG\\|COMMIT_MSG\\|SQUASH_MSG\\):" (buffer-name buffer)))

  (defadvice! +jj--display-message-buffer-a (orig-fn buffer-name command finish-func &optional commit-id initial-desc)
    :around #'jj--open-message-buffer
    (cl-letf* ((pop-to-buffer-orig (symbol-function 'pop-to-buffer))
               ((symbol-function 'pop-to-buffer)
                (lambda (buffer &optional action norecord)
                  (if (+jj-message-buffer-p buffer)
                      (select-window
                       (display-buffer buffer
                                       '(display-buffer-in-side-window
                                         (side . top)
                                         (window-height . 0.35)
                                         (slot . 0))))
                    (funcall pop-to-buffer-orig buffer action norecord)))))
      (funcall orig-fn buffer-name command finish-func commit-id initial-desc)))

  (when (modulep! :editor evil +everywhere)
    (evil-set-initial-state 'jj-mode 'normal)
    (evil-make-overriding-map jj-mode-map 'normal)
    (add-hook 'jj-mode-hook #'evil-normalize-keymaps)

    (defadvice! +jj--enter-insert-state-a (&rest _)
      :after #'jj--open-message-buffer
      (when (and (bound-and-true-p evil-local-mode)
                 (+jj-message-buffer-p (current-buffer)))
        (goto-char (point-min))
        (evil-insert-state)))))
