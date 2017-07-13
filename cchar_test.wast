(module
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (import "env" "memoryBase" (global $memoryBase i32))
 (import "env" "_print" (func $_print (param i32)))
 (import "env" "memory" (memory $0 256))
 (import "env" "table" (table 0 anyfunc))
 (import "env" "tableBase" (global $tableBase i32))
 (global $STACKTOP (mut i32) (i32.const 0))
 (global $STACK_MAX (mut i32) (i32.const 0))
 (data (get_global $memoryBase) "Hello_Before\00Hello_After")
 (export "__post_instantiate" (func $__post_instantiate))
 (export "runPostSets" (func $runPostSets))
 (export "_enterFunc" (func $_enterFunc))
 (func $_enterFunc
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (set_local $1
   (get_global $STACKTOP)
  )
  (set_global $STACKTOP
   (i32.add
    (get_global $STACKTOP)
    (i32.const 32)
   )
  )
  ;; main.c:5
  (call $_print
   (get_global $memoryBase)
  )
  (set_local $3
   (i32.add
    (tee_local $0
     (tee_local $2
      (get_local $1)
     )
    )
    (i32.const 30)
   )
  )
  ;; main.c:6
  (loop $do-in
   (i32.store8
    (get_local $0)
    (i32.const 0)
   )
   (br_if $do-in
    (i32.lt_s
     (tee_local $0
      (i32.add
       (get_local $0)
       (i32.const 1)
      )
     )
     (get_local $3)
    )
   )
  )
  ;; main.c:7
  (call $_print
   (get_local $2)
  )
  ;; main.c:8
  (call $_print
   (i32.add
    (get_global $memoryBase)
    (i32.const 13)
   )
  )
  (set_global $STACKTOP
   (get_local $1)
  )
 )
 (func $runPostSets
  (nop)
 )
 (func $__post_instantiate
  (set_global $STACKTOP
   (i32.add
    (get_global $memoryBase)
    (i32.const 32)
   )
  )
  (set_global $STACK_MAX
   (i32.add
    (get_global $STACKTOP)
    (i32.const 5242880)
   )
  )
  (call $runPostSets)
 )
)
