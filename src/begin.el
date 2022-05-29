(defun hello-world (name)
  "Say hello to user whose name is NAME."
  (message "Hello, %s" name))

(hello-world "Emacser")

(setq foo "I'm foo")
(message foo)

; defvar 与 setq 所不同的是，如果变量在声明之前，这个变量已经有一个值的话，
; 用 defvar 声明的变量值不会改变成声明的那个值。另一个区别是 defvar 可以
; 为变量提供文档字符串，当变量是在文件中定义的话，C-h v 后能给出变量定义
; 的位置。

(defvar foo "Did I have a value?"  "A demo variable") foo

(defvar bar "I'm bar"
  "A demo variable named \"bar\"")
bar

; let, 声明局部变量
(defun circle-area (radix)
  (let ((pi 3.1415))
    (setq area (* pi radix radix))
    (message "直径为%.2f的圆面积是 %.2f" radix area)))
(circle-area 3)

; let*, let* 和 let 的使用形式完全相同，唯一的区别是在 let* 声明中就能使用前面声明的变量
(defun circle-area (radix)
  (let* ((pi 3.1415)
         (area (* pi radix radix)))
  (message "直径为%.2f的圆面积是%.2f" radix area)))
(circle-area 3)

;; lambda 表达式
(setq foo (lambda (name)
            (message "Hello, %s!" name)))
(funcall foo "Emacser")

(funcall (lambda (name)
           (message "Hello, %s!" name)) "Emacser")

;; 顺序执行

(progn
  (setq foo 3)
  (message "Square of %d is %d" foo (* foo foo)))

;; MARK: 条件判断(if, cond)
(defun my-max (a b)
  (if (> a b)
      a b))
(my-max 3 4)

(defun fib (n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (t (+ (fib (- n 1))
              (fib (- n 2))))))
(fib 10)

;; 循环 while
(defun factorial (n)
  (let ((res 1))
    (while (> n 1)
      (setq res (* res n)
            n (- n 1)))
    res))
(factorial 10)

;; 逻辑运算(and or)
;; or 常用于设置默认值
(defun hello-world (&optional name)
  (or name (setq name "Emacser"))
  (message "Hello, %s" name))
(hello-world)
(hello-world "Ye")

;; and 用于参数检查
(defun square-number-p (n)
  (and (>= n 0)
       (= (/ n (sqrt n)) (sqrt n))))
(square-number-p -1)
(square-number-p 25)

;; (defun NAME ARGLIST [DOCSTRING] BODY...)
;; (defvar SYMBOL &optional INITVALUE DOCSTRING)
;; (setq SYM VAL SYM VAL...)
;; (let VARLIST BODY...)
;; (let* VARLIST BODY...)
;; (lambda ARGS [DOCSTRING] [INTERACTIVE] BODY)
;; (progn BODY ...)
;; (if COND THEN ELSE...)
;; (cond CLAUSES...)
;; (when COND BODY...)
;; (unless COND BODY ...)
;; (or CONDITIONS ...)
;; (and CONDITIONS ...)
;; (not OBJECT)
