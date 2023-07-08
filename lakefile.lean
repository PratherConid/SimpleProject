import Lake
open Lake DSL

package simpleProject {
  -- add package configuration options here
}

lean_lib SimpleProject {
  -- add library configuration options here
}

@[default_target]
lean_exe simpleProject {
  root := `Main
}
