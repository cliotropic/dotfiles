(setq load-path (add-to-list 'load-path "~/etc/elisp/muse"))
(setq load-path (add-to-list 'load-path "~/etc/elisp"))
(setq load-path (add-to-list 'load-path "~/etc/elisp/ljupdate"))

(load "fold-dwim")

(autoload 'folding-mode          "folding" "Folding mode" t)
(autoload 'turn-off-folding-mode "folding" "Folding mode" t)
(autoload 'turn-on-folding-mode  "folding" "Folding mode" t)

(if (load "folding" 'nomessage 'noerror)
             (folding-mode-add-find-file-hook))

(eval-after-load "outline" '(require 'foldout))


(folding-add-to-marks-list 'tex-mode                "%{"  "%}"  nil t)
(folding-add-to-marks-list 'tex-mode                "%{{{"  "%}}}"  nil t)

; outline-minor-mode
(global-set-key [M-left] 'hide-body)
(global-set-key [M-right] 'show-all)
(global-set-key [M-up] 'outline-previous-heading)
(global-set-key [M-down] 'outline-next-heading)
(global-set-key [C-M-left] 'hide-sublevels)
(global-set-key [C-M-right] 'show-children)
(global-set-key [C-M-up] 'outline-previous-visible-heading)
(global-set-key [C-M-down] 'outline-next-visible-heading)

(require 'session)
       (add-hook 'after-init-hook 'session-initialize)


(defun outline-flag-region-make-overlay (from to) ;mmc
  (let ((o (make-overlay from to)))
    (overlay-put o 'invisible 'outline)
    (overlay-put o 'isearch-open-invisible
                 'outline-isearch-open-invisible)
    o))

;; (defun outline-flag-region (from to flag) ;mmc
;;   "Hides or shows lines from FROM to TO, according to FLAG.
;; If FLAG is nil then text is shown, while if FLAG is t the text is hidden."
;;   (save-excursion
;;     (goto-char from)
;;     (end-of-line)
;;     (outline-discard-overlays (point) to 'outline)
;;     (if flag
;;         ;;
;;         (let ((beginning (point))
;;               (regexp (concat "^" (regexp-quote comment-start)))
;;               )
;;           (while (re-search-forward regexp to 't)
;;             (goto-char (match-beginning 0))
;;             (if (> (- (point) beginning) 2)
;;                 (outline-flag-region-make-overlay beginning (point)))
;;             ;(goto-char
;;             (end-of-line)
;;             (setq beginning (point)))
;;           (outline-flag-region-make-overlay beginning to)))
;;     (run-hooks 'outline-view-change-hook)))



(load "ljupdate")

;; ljupdate, an Emacs LiveJournal client
(when (require 'ljupdate nil t)
  (setq lj-cache-login-information t
        lj-default-username        "srl"
        lj-fill-function           'ignore)
  (global-set-key (kbd "C-c j c") 'lj-compose)
  (global-set-key (kbd "C-c j l") 'lj-login)
)

(load "muse-mode")
(load "muse-publish")
(load "muse-html")  ;; and so on


(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


(desktop-save-mode)
(desktop-read)
(server-start)