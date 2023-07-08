-- Refer to build/ir/SimpleProject.c for the compiled ir

def hello := "world"

-- Nullary functions have an initialization function directly associated with it
def foo_nat_1 := 2

-- Non-nullary functions have no initialization function directly associated with them
-- Adding `noline` prevents lean compiler from inlining this function
@[noinline] def foo_nat_2 (x : Nat) := 2 * x

-- As we can see in the compiled C++ code, in the
-- initialization function ```_init_l_foo__nat__3___closed__1```
-- (called by ```_init_l_foo__nat__3```) for `foo_nat_3`, `foo_nat_2` is not inlined
def foo_nat_3 := foo_nat_2 foo_nat_1

def no_init_foo4 : IO Unit := IO.println "nifoo4_prints_123"

-- Constants of type ```IO Unit``` can be registered as ```builtin_init```
-- This causes the IO action to be executed in the initialization function:
--   ```res = l_builtin__init__foo4(lean_io_mk_world());```
@[builtin_init]
def builtin_init_foo4 : IO Unit := IO.println "bifoo4_prints_123"

@[init]
def init_foo4 : IO Unit := IO.println "ifoo4_prints_123"