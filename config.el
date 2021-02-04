;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 36 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Use Spacemacs-style "SPC-SPC" for M-x
(map! :leader
      :desc "Open M-x like spacemacs" "SPC" #'counsel-M-x)

(map! :leader
      :desc "Run a shell command" ":" #'shell-command)

;; Python repl shortcuts
(map! :leader
      :desc "Send python statement" "mss" #'python-shell-send-statement)

(map! :leader
      :desc "Send python region" "msr" #'python-shell-send-region)

(map! :leader
      :desc "Send python function" "msf" #'python-shell-send-defun)

(map! :leader
      :desc "Send python file" "msF" #'python-shell-send-defun)

;; Break lines at 80 chars
(add-hook 'text-mode-hook #'auto-fill-mode)
(setq-default fill-column 80)
(add-hook 'prog-mode-hook #'auto-fill-mode)

;; Reduce python crashes
;; There are bunch of bugs that make python freeze in emacs
;; This seems to get rid of them
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")

;;(add-hook 'inferior-python-mode-hook
;;          (lambda ()
;;            (setq company-mode nil))

;; show python/jupyter plots inline
(setq ein:output-area-inlined-images t)
(after! ein
  (setq ein:slice-image nil))

(after! mu4e
  ;; mu4e email settings
  (setq mu4e-root-maildir "~/.mail"
        mu4e-attachment-dir "~/Downloads"
        mu4e-sent-folder "/Sent"
        mu4e-drafts-folder "/Drafts"
        mu4e-trash-folder "/Trash"
        mu4e-refile-folder "/Archive")

  (setq user-full-name "Tom Harned"
        user-mail-address "thomas.harned@protonmail.com")

  ;; Get mail
  (setq mu4e-get-mail-command "mbsync protonmail"
        mu4e-change-filenames-when-moving t   ; needed for mbsync
        mu4e-update-interval 120)             ; update every 2 minutes

  ;; Send mail
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-auth-credentials "~/.authinfo.gpg"
        smtpmail-smtp-server "127.0.0.1"
        smtpmail-stream-type 'starttls
        smtpmail-smtp-service 1025
        )
  (add-to-list 'gnutls-trustfiles (expand-file-name "~/.config/protonmail/bridge/cert.pem"))
  (setq mu4e-html2text-command "html2text -utf8 -width 72")
  )
;; Set venv
;; assumes venv is in .virtualenvs
;;

(defun setvenv (venv)
  ;; the "s" means it's taking a string
  (interactive "s")
  (setq path
        (concat
         "~/.virtualenvs/"
         venv
         "/"))
  (pyvenv-activate path))




;; Run crontab using a emacs buffer as editor instead of launching the
;; system editor
(defun crontab-e ()
  "Run `crontab -e' in a emacs buffer."
  (interactive)
  (with-editor-async-shell-command "crontab -e"))

(defun sh-send-line-or-region (&optional step)
  (interactive ())
  (let ((proc (get-process "shell"))
        pbuf min max command)
    (unless proc
      (let ((currbuff (current-buffer)))
        (shell)
        (switch-to-buffer currbuff)
        (setq proc (get-process "shell"))))
    (setq pbuff (process-buffer proc))
    (if (use-region-p)
        (setq min (region-beginning)
              max (region-end))
      (setq min (point-at-bol)
            max (point-at-eol)))
    (setq command (concat (buffer-substring min max) "\n"))
    (with-current-buffer pbuff
      (goto-char (process-mark proc))
      (insert command)
      (move-marker (process-mark proc) (point)))
       ;;pop-to-buffer does not work with save-current-buffer -- bug?
    (process-send-string  proc command)
    (display-buffer (process-buffer proc) t)
    (when step
      (goto-char max)
      (next-line))))


(defun sh-send-line-or-region-and-step ()
  (interactive)
  (sh-send-line-or-region t))
(defun sh-switch-to-process-buffer ()
  (interactive)
  (pop-to-buffer (process-buffer (get-process "shell")) t))

;;(define-key sh-mode-map [(control ?j)] 'sh-send-line-or-region-and-step)
;;(define-key sh-mode-map [(control ?c) (control ?z)] 'sh-switch-to-process-buffer)

;; SAME function as above, but for vterm instead of shell
(defun vt-send-line-or-region (&optional step)
  (interactive ())
  (let ((proc (get-process "vterm"))
        pbuf min max command)
    (unless proc
      (let ((currbuff (current-buffer)))
        (vterm)
        (switch-to-buffer currbuff)
        (setq proc (get-process "vterm"))
        ))
    (setq pbuff (process-buffer proc))
    (if (use-region-p)
        (setq min (region-beginning)
              max (region-end))
      (setq min (point-at-bol)
            max (point-at-eol)))
    (setq command (concat (buffer-substring min max) "\n"))
    (with-current-buffer pbuff
      (read-only-mode -1)
      (goto-char (process-mark proc))
      (insert command)
      (move-marker (process-mark proc) (point))
      ) ;;pop-to-buffer does not work with save-current-buffer -- bug?
    (process-send-string  proc command)
    (display-buffer (process-buffer proc) t)
    (when step
      (goto-char max)
      (next-line))
    ))

(defun vt-send-line-or-region-and-step ()
  (interactive)
  (vt-send-line-or-region t))
(defun vt-switch-to-process-buffer ()
  (interactive)
  (pop-to-buffer (process-buffer (get-process "vterm")) t))

;;TODO: figure out how these work for the shell version
;;and then assign keys
;;(define-key vt-mode-map [(control ?j)] 'sh-send-line-or-region-and-step)
;;(define-key sh-mode-map [(control ?c) (control ?z)] 'sh-switch-to-process-buffer)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
