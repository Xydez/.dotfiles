; extends

; SQLx macro injections
; Adapted from
;   https://banisaeid.com/posts/rust-highlight-sql/
(macro_invocation
  (scoped_identifier
    path: (identifier) @path (#eq? @path "sqlx")
    name: (identifier) @name (#any-of? @name "query" "query_as" "query_scalar")
  )

  (token_tree
    [(string_literal) (raw_string_literal)] @injection.content
    (#offset! @injection.content 1 0 0 0)
  ; (#offset! @injection.content 1 0 -1 0)
  ; (#offset! @injection.content 0 1 0 -1)
  )

  (#set! injection.language "sql")
)
