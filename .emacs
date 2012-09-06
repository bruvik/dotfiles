;;-----------------------------------------------------------
;set load-path
;;-----------------------------------------------------------
(setq load-path (cons "/usr/share/emacs/site-lisp/" load-path))
(setq load-path (cons "/usr/share/emacs/site-lisp/psgml" load-path))
(setq load-path (cons "/usr/share/emacs/21.3/lisp/" load-path))
;;(setq load-path (cons "/sw/share/emacs/21.2/lisp/" load-path))
(setq load-path (cons "~/src/lisp" load-path))
(setq load-path (cons "~/src/emacs/lisp" load-path))
(setq load-path (cons "/local/share/emacs/" load-path))


(if (and (= emacs-major-version 21) (= emacs-minor-version 2))
    (setq load-path (cons "/usr/share/emacs/21.2/lisp" load-path))) 

;;-----------------------------------------------------------
;;cfengine
;;-----------------------------------------------------------

(autoload 'cfengine-mode "cfengine" "" t nil)

;; (add-hook 'cfengine-mode-hook 'turn-on-font-lock)

 ; detect file type by name (cf.*)
(setq auto-mode-alist (append '(("cf\\." . cfengine-mode))
                               auto-mode-alist))

;PO mode stuff
(setq auto-mode-alist
	(cons '("\\.pox?\\'" . po-mode) auto-mode-alist))
(autoload 'po-mode "po-mode")

;------------------------------------------------------------------------
;; Backspace in terminal mode
;------------------------------------------------------------------------
; From http://www.mssl.ucl.ac.uk/www_computing/buns/emacs.html
(if (eq window-system 'nil)
    ;; Make the bloody backspace key work properly
    (define-key global-map "\C-h" 'backward-delete-char)
  ;; Make sure backspace works in searches, too
  (setq dearch-delete-char (string-to-char "\C-h"))
)

;; Gnus can use the BDB to mark authors in the Summary Buffer who have
;; records in the BBDB with a user-defined mark character.
;;
;; (Info-goto-node "(bbdb)Gnus Summary Buffer")
;;(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(setq bbdb-north-american-phone-numbers-p nil)
(setq bbdb-dwim-net-address-allow-redundancy t)
(setq bbdb-complete-name-allow-cycling t)
(setq bbdb-user-mail-names 
      (regexp-opt '("abruvik@student.matnat.uio.no"
		    "a.s.bruvik@usit.uio.no"
		    "abruvik@ifi.uio.no")))

(setq bbdb/gnus-summary-known-poster-mark "B")
;; øke score for kjente postere
(setq gnus-score-find-score-files-function
           '(gnus-score-find-bnews bbdb/gnus-score))
(setq bbdb/gnus-score-default 10)
;; Wheater to allow cycling of email addresses when calling
;; `bbdb-complete-name' on a completed address in a composition buffer.
;; THIS CURRENTLY DOES NOT WORK FOR GNU EMACS!
;;
;; (Info-goto-node "(bbdb)Customization Parameters")

(setq bbdb-complete-name-allow-cycling t)
;;
;; If `bbdb-new-nets-always-primary' is `t', then when the Insidious Big
;; Brother Database adds a new address to a record, it will always add it
;; to the front of the list of addresses, making it the primary address.
;; If this is `nil', then you will be asked.  If this is the symbol
;; `never' (really if it is not `t' and not `nil') then new network
;; addresses will always be added to the end of the list.
;;
;; (Info-goto-node "(bbdb)Customization Parameters")

(setq bbdb-always-add-addresses 'never
      bbdb-new-nets-always-primary 'never)

(setq bbdb-quiet-about-name-mismatches t)
;;-----------------------------------------------------------
;set-keys
;;-----------------------------------------------------------
(global-set-key [f12] 'calendar)
(global-set-key [f4] 'gnus)
(global-set-key [f1] 'info)
(global-set-key [f2] 'man)
(global-set-key [f3] 'bbdb)
(global-set-key [f7] 'follow-delete-other-windows-and-split) 
(global-set-key [(f5)] (lambda () (interactive) 
			 (manual-entry (current-word))))
(global-set-key [end]    'end-of-buffer)
(global-set-key [home]   'beginning-of-buffer)
(global-set-key "\C-s" 'isearch-forward-regexp)   ; want regex search
(global-set-key "\C-r" 'isearch-backward-regexp)  ; and backwards too
(global-set-key (kbd "C-c q") 'auto-fill-mode)    ; quickly turn on autofill

;;-----------------------------------------------------------
; calendar:
;;-----------------------------------------------------------
;; (require 'calendar)
;; (display-time)
;; (add-hook 'diary-hook 'appt-make-list)
;; (diary 0)
;; ;include diary in calendar-print-out
;; (setq cal-tex-diary 0)
;; (setq cal-tex-which-days '(1 2 3 4 5 6 0))
;; (setq cal-tex-24 t)
;; (setq calendar-week-start-day 1)
;; ; 24h clock
;; (setq display-time-24hr-format t 
;;       display-time-day-and-date t)

;; saveplace:
(require 'saveplace)
(setq-default save-place t)

;; desktop-save mode (fortsette der man slapp)
;; (if (not (< emacs-major-version 21))
;;     (progn 
;;       (load "desktop" nil t)
;;       (add-hook 'after-init-hook 'desktop-read)
;;       (defun desktop-save-force nil
;; 	(desktop-save (expand-file-name "~/")))
;;       (add-hook 'after-init-hook 'desktop-save-force t)
;;       ))

; Diverse: 
(setq display-time-24hr-format  t
      display-time-day-and-date t
      initial-major-mode 'text-mode
      mouse-yank-at-point t
      minibuffer-max-depth nil
      undo-limit        90000
      undo-strong-limit 100000
      query-replace-highlight t
      search-highlight t
      transient-mark-mode t
)


;;-----------------------------------------------------------
;;nxml-mode
;;-----------------------------------------------------------
;; (load "~/src/lisp/nxml/rng-auto.el")
;; (add-to-list 'auto-mode-alist
;; 	     (cons 
;; 	      (concat "\\." 
;; 		      (regexp-opt '
;; 		       ("xml" "xsd" "sch" "rng" "xslt" "svg" "rss") t) "\\'")
;; 	      'nxml-mode))
;;-----------------------------------------------------------
; emacs21 stuff:
;;-----------------------------------------------------------
(if (> emacs-major-version 20)
    (progn
      ;; skru av irriterende ting i emacs21
      (setq cursor-in-non-selected-windows nil)
      (blink-cursor-mode 0)
      (tooltip-mode 0)
      (tool-bar-mode 0)
      (setq gnus-treat-display-smileys nil)

      ;;recent-files-mode
      (require 'recentf)
      (recentf-mode 1)

      ;; auto compression:
      (auto-compression-mode 1)

      '(mouse-wheel-mode t nil (mwheel))
      

      )
  )

;;-----------------------------------------------------------
; font-lock mode
;;-----------------------------------------------------------
(global-font-lock-mode t)

;;-----------------------------------------------------------
;; use cperl-mode for perl:
;;-----------------------------------------------------------
(load-library "cperl-mode")
(add-to-list 'auto-mode-alist '("\.[Pp][LlMm][Cc]?$" . cperl-mode))
(while (let ((orig (rassoc 'perl-mode auto-mode-alist)))
	 (if orig (setcdr orig 'cperl-mode))))
(while (let ((orig (rassoc 'perl-mode interpreter-mode-alist)))
	 (if orig (setcdr orig 'cperl-mode))))
(dolist (interpreter '("perl" "perl5" "miniperl" "pugs"))
  (unless (assoc interpreter interpreter-mode-alist)
    (add-to-list 'interpreter-mode-alist (cons interpreter 'cperl-mode))))

(global-set-key "\M-p" 'cperl-perldoc) ; alt-p

;;-----------------------------------------------------------
; sml-mode:
;;-----------------------------------------------------------

(autoload 'sml-mode "sml-mode" "Major mode for editing SML." t)

(setq auto-mode-alist
      (append '(("\\.sml$" . sml-mode) 
                ("\\.sig$" . sml-mode) 
                ("\\.ML$"  . sml-mode)) auto-mode-alist))
(setq sml-mode-info "/local/hacks/info/sml-mode")
(add-hook 'sml-load-hook '(lambda () (require 'sml-font)))

;;-----------------------------------------------------------
; prolog-mode:
;;-----------------------------------------------------------

;; (autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
;; (autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
;; (autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
;; (setq prolog-system 'sicstus)
;; (setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
;; 				("\\.m$" . mercury-mode))
;; 			      auto-mode-alist))



;open prolog in its own frame:
(add-hook 'prolog-mode-hook '(lambda () 
			       '(defun prolog-goto-prolog-process-buffer ()
  "Switch to the prolog process buffer and go to its end. "
  (switch-to-buffer-other-frame "*prolog*")
  (goto-char (point-max))
)))

(defun prolog-goto-prolog-process-buffer ()
  "Switch to the prolog process buffer and go to its end. "
  (switch-to-buffer-other-frame "*prolog*")
  (goto-char (point-max))
)

;;-----------------------------------------------------------
; text-mode
;;-----------------------------------------------------------

(add-hook 'text-mode-hook 'turn-on-auto-fill)
;;-----------------------------------------------------------
; latex-mode
;;-----------------------------------------------------------

(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)		 
;;-----------------------------------------------------------
; maude-mode:
;;-----------------------------------------------------------
(require 'ansi-color) ;for emacs20
(autoload 'maude-mode "maude-mode" "Major mode for editing Maude programs." t)
(setq auto-mode-alist (append '(("\\.maude$" . maude-mode)) auto-mode-alist))
(add-hook 'maude-running-mode-hook 
	  'lambda () (ansi-color-for-comint-mode-on))
;;-----------------------------------------------------------
; rst-mode
;;-----------------------------------------------------------
(require 'rst)

(setq auto-mode-alist
      (append '(("\\.txt$" . rst-mode)
                ("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))

;;-----------------------------------------------------------
; input-method:
;;-----------------------------------------------------------
;; (set-input-method 'norwegian-alt-postfix)
;; (setq default-input-method 'norwegian-alt-postfix)
;; (toggle-input-method)

;;-----------------------------------------------------------
;; eudc (emacs unified directory client)
;;-----------------------------------------------------------
;(require 'eudc)
;(eval-after-load
;    "message"
;;   '(define-key message-mode-map [(control ?c) (tab)] 'eudc-expand-inline))
;; (eval-after-load
;;     "sendmail"
;;   '(define-key mail-mode-map [(control ?c) (tab)] 'eudc-expand-inline))

;;-----------------------------------------------------------
;; automagiske ting
;;-----------------------------------------------------------
(require 'gnus)
(if (> emacs-major-version 20)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(LaTeX-mode-hook (quote (LaTeX-math-mode outline-minor-mode TeX-fold-mode)))
 '(TeX-output-view-style (quote (("^dvi$" ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$") "%(o?)dvips -t landscape %d -o && gv %f") ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f") ("^dvi$" ("^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$" "^landscape$") "%(o?)xdvi %dS -paper a4r -s 0 %d") ("^dvi$" "^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$" "%(o?)xdvi %dS -paper a4 %d") ("^dvi$" ("^a5\\(?:comb\\|paper\\)$" "^landscape$") "%(o?)xdvi %dS -paper a5r -s 0 %d") ("^dvi$" "^a5\\(?:comb\\|paper\\)$" "%(o?)xdvi %dS -paper a5 %d") ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d") ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d") ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d") ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d") ("^dvi$" "." "%(o?)xdvi %dS %d") ("^pdf$" "." "open -a preview %o") ("^html?$" "." "netscape %o"))))
 '(canlock-password "d03335fb19b7e53436c0076fe055f0502fa3d738")
 '(case-fold-search t)
 '(current-language-environment "English")
 '(mm-text-html-renderer (quote lynx))
 '(ps-default-bg "white")
 '(ps-default-fg "black")
 '(ps-print-color-p nil)
 '(ps-printer-name "")
 '(show-paren-mode t nil (paren))
 '(tex-dvi-view-command "open -a preview")
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))))

;; linux-ting
(if (string= window-system "x")
    (progn
      (prefer-coding-system 'utf-8)
      (setq browse-url-browser-function (quote browse-url-generic))))

;; ifi-ting
(if (string-match ".*ifi.uio.no" system-name)
    (progn
      (setq ps-lpr-command "print")
      (setq ps-lpr-switches (quote ("-expert")))
      (setq ps-printer-name nil)
      (setq printer-name "parken")))

;;mac-ting:
(if (or (string= system-type "apple-macosx") (string= system-type "darwin"))
    (progn
      (set-input-mode
       (car (current-input-mode))
       (nth 1 (current-input-mode))
       0
       7)
      ;; tre-knapps mus emulering
      ; (setq mac-emulate-three-button-mouse nil)

      ;; command-meta
      ;; emacs-load-path:

      ;;-----------------------------------------------------------
      ;; auctex tex-mode (fungerer kun i emacs21
      ;;-----------------------------------------------------------
      ;; (require 'tex-site)
      ;; (setq tex-dvi-view-command "xdvi")
      (setq TeX-parse-self t) ; enable parse on load
      (setq TeX-auto-save t) ; enable parse on save
      (setq TeX-PDF-mode t) ; PDF-mode as default
  
      ;; (add-hook 'TeX-mode-hook (lambda () 'outline-minor-mode))
      ;; osx-browser
      (setq browse-url-browser-function (quote browse-url-default-macosx-browser))
      ))

(if (or (string= system-type "apple-macosx") (string= system-type "darwin"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit default :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "apple" :family "inconsolata"))))
 '(cperl-array-face ((t (:foreground "darkgrey" :weight bold))))
 '(cperl-hash-face ((t (:foreground "Red" :slant italic :weight bold))))))


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(LaTeX-mode-hook (quote (LaTeX-math-mode outline-minor-mode TeX-fold-mode)) t)
 '(TeX-output-view-style (quote (("^dvi$" ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$") "%(o?)dvips -t landscape %d -o && gv %f") ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f") ("^dvi$" ("^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$" "^landscape$") "%(o?)xdvi %dS -paper a4r -s 0 %d") ("^dvi$" "^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$" "%(o?)xdvi %dS -paper a4 %d") ("^dvi$" ("^a5\\(?:comb\\|paper\\)$" "^landscape$") "%(o?)xdvi %dS -paper a5r -s 0 %d") ("^dvi$" "^a5\\(?:comb\\|paper\\)$" "%(o?)xdvi %dS -paper a5 %d") ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d") ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d") ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d") ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d") ("^dvi$" "." "%(o?)xdvi %dS %d") ("^pdf$" "." "open -a preview %o") ("^html?$" "." "netscape %o"))))
 '(browse-url-generic-program "/local/bin/firefox")
 '(canlock-password "d03335fb19b7e53436c0076fe055f0502fa3d738")
 '(case-fold-search t)
 '(cperl-electric-keywords t)
 '(cperl-electric-linefeed t)
 '(cperl-electric-parens t)
 '(cperl-lazy-help-time 3)
 '(cperl-pod-here-fontify t)
 '(current-language-environment "English")
 '(frame-background-mode nil)
 '(gnus-demon-handlers (quote ((my-check-mail 60 0))))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(ldap-host-parameters-alist (quote (("ldap.uio.no" base "cn=people,dc=uio,dc=no "))))
 '(mm-text-html-renderer (quote lynx))
 '(mouse-wheel-mode t nil (mwheel))
 '(nnmail-expiry-wait (quote immediate))
 '(ns-alternate-modifier (quote none))
 '(ns-command-modifier (quote meta))
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(pgg-cache-passphrase nil)
 '(pgg-default-keyserver-address "pgp.mit.edu")
 '(pgg-default-user-id "a.s.bruvik@usit.uio.no")
 '(pgg-query-keyserver nil)
 '(ps-default-bg "white")
 '(ps-default-fg "black")
 '(ps-print-color-p nil)
 '(ps-printer-name "")
 '(recentf-max-menu-items 20)
 '(recentf-max-saved-items 30)
 '(show-paren-mode t nil (paren))
 '(tex-dvi-view-command "open -a preview")
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil))

; ldap

(require 'ldap)
(require 'eudc)

(setq eudc-default-return-attributes nil
      eudc-strict-return-matches nil)

(setq ldap-ldapsearch-args (quote ("-tt" "-LLL" "-x")))
(setq eudc-inline-query-format '((name)
                                 (firstname)
                                 (firstname name)
                                 (email)
                                 ))

(setq ldap-host-parameters-alist
      (quote (("ldap.uio.no" base "dc=uio,dc=no"))))


(eudc-set-server "ldap.uio.no" 'ldap t)
(setq eudc-server-hotlist '(("ldap.uio.no" . ldap)))
(setq eudc-inline-expansion-servers 'hotlist)

;; (defun enz-eudc-expand-inline()
;;   (interactive)
;;   (move-end-of-line 1)
;;   (insert "*")
;;   (unless (condition-case nil
;;               (eudc-expand-inline)
;;             (error nil))
;;     (backward-delete-char-untabify 1))
;;   )

;; Adds some hooks

(eval-after-load "message"
  '(define-key message-mode-map (kbd "TAB") 'eudc-expand-inline))
(eval-after-load "sendmail"
  '(define-key mail-mode-map (kbd "TAB") 'eudc-expand-inline))
(eval-after-load "post"
  '(define-key post-mode-map (kbd "TAB") 'eudc-expand-inline))
