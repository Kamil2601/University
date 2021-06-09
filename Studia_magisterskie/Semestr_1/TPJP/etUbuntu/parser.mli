type token =
  | LOWER_ID of (string)
  | UPPER_ID of (string)
  | TYVAR of (string)
  | STRING of (string)
  | KW_FN
  | KW_VAL
  | KW_LET
  | KW_IN
  | KW_END
  | KW_DATATYPE
  | KW_FROM
  | KW_CODATATYPE
  | KW_TO
  | KW_USE
  | KW_EXIT
  | KW_SHOW
  | KW_IF
  | KW_THEN
  | KW_ELSE
  | KW_SET
  | LPAREN
  | RPAREN
  | DARROW
  | ARROW
  | COMMA
  | EQ
  | SEMICOLON
  | STAR
  | PLUS
  | LAMBDA
  | DOT
  | BAR
  | AND
  | LBRACE
  | RBRACE

val decl :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.decl
