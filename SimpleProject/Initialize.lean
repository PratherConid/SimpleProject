@[builtin_init]
def builtin_init_test1 : IO Unit := IO.println "builtin_init_test1"

@[init]
def init_test2 : IO Unit := IO.println "init_test_2"

builtin_initialize builtinit_test3 : Unit ← IO.println "builtinit_test3"