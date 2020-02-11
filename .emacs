;; 设置国内源及权重，使得stable权重更高
(setq package-archives
      '(("gnu"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")
        ("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/")
        ("melpa-stable" . "http://mirrors.cloud.tencent.com/elpa/melpa-stable/")
	("org"   . "http://mirrors.cloud.tencent.com/elpa/org/"))
      package-archive-priorities
      '(("melpa-stable" . 10)
	("gnu" . 8)
	("org" . 5)
	("melpa". 0))
      )

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)


;; for linum-mode startup
(global-linum-mode t)


;; for visual-line-mode startup
(global-visual-line-mode t)


;; for auto-complete-mode startup
(require 'auto-complete)
(global-auto-complete-mode t)

(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))

; Do not display the splash screen
(setq inhibit-startup-screen t)


(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cb" 'org-switchb)
(setq org-log-done t)

(eval-after-load "org"
  '(require 'ox-md nil t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit cnfonts markdown-preview-mode jedi scala-mode org org-plus-contrib org-ac roguel-ike ## auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 143 :width normal)))))


;;使用XeLaTeX编译
(require 'ox-latex)
(setq org-export-latex-listings t)
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode %b"
    "xelatex -interaction nonstopmode %b"))

;; 让代码能够执行。。。比如plantuml
(add-to-list 'org-modules 'org-tempo)

;; active Org-babel languages 需要先安装graphviz
(org-babel-do-load-languages
    'org-babel-load-languages
    '(;; other Babel languages
        (plantuml . t)))

(setq org-plantuml-jar-path
    (expand-file-name "~/emacs_config/plantuml.jar"))

;; 让bable直接执行，不需要提示
(setq org-confirm-babel-evaluate nil)

;; (global-set-key (kbd "M-SPC") 'set-mark-command)
;; (provide 'key-bindings)

;; fontify code in code blocks
(setq org-src-fontify-natively t)



;; 切换成大写的那个东西
(put 'upcase-region 'disabled nil)

