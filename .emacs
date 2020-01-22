(setq package-archives '(("gnu"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)

; Do not display the splash screen
(setq inhibit-startup-screen t)

; 打开禁用的命令 (put '       command      'disabled nil)
; 将命令禁用 (put '      command      'disabled t)
(add-to-list 'load-path "~/Downloads/org-9.3.1/lisp")
(add-to-list 'load-path "~/Downloads/org-9.3.1/contrib/lisp" t)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cb" 'org-switchb)
(setq org-log-done t)

;;(setq org-latex-image-default-width "")

(eval-after-load "org"
  '(require 'ox-md nil t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (## auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(setq-default TeX-engine 'xelatex)


;;使用XeLaTeX编译
(require 'ox-latex)
(setq org-export-latex-listings t)
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode %b"
    "xelatex -interaction nonstopmode %b"))

(require 'org-tempo)
(put 'upcase-region 'disabled nil)


;; active Org-babel languages 需要先安装graphviz
(org-babel-do-load-languages
    'org-babel-load-languages
    '(;; other Babel languages
        (plantuml . t)))

(setq org-plantuml-jar-path
    (expand-file-name "~/emacs_config/plantuml.jar"))

;; 让bable直接执行，不需要提示
(setq org-confirm-babel-evaluate nil)


