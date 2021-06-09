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

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
(*
 * Copyright (c) 2002, 2003 The University of Wroclaw.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *      This product includes software developed by the University of
 *      Wroclaw and its contributors.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE UNIVERSITY AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *)
open Ast

let locus () =
  let fn = Lexer.get_file_name () in
  let (l, c) = Lexer.get_line_column fn (Parsing.symbol_start()) in
        {loc_file=fn;
         loc_char=c;
         loc_line=l}

let ice () = raise Parse_error

let locate x = {l = locus (); v = x}

let name n = {n_name = n; n_binding = None}
let tc n a = Tycon (name n, a)

# 90 "parser.ml"
let yytransl_const = [|
  261 (* KW_FN *);
  262 (* KW_VAL *);
  263 (* KW_LET *);
  264 (* KW_IN *);
  265 (* KW_END *);
  266 (* KW_DATATYPE *);
  267 (* KW_FROM *);
  268 (* KW_CODATATYPE *);
  269 (* KW_TO *);
  270 (* KW_USE *);
  271 (* KW_EXIT *);
  272 (* KW_SHOW *);
  273 (* KW_IF *);
  274 (* KW_THEN *);
  275 (* KW_ELSE *);
  276 (* KW_SET *);
  277 (* LPAREN *);
  278 (* RPAREN *);
  279 (* DARROW *);
  280 (* ARROW *);
  281 (* COMMA *);
  282 (* EQ *);
  283 (* SEMICOLON *);
  284 (* STAR *);
  285 (* PLUS *);
  286 (* LAMBDA *);
  287 (* DOT *);
  288 (* BAR *);
  289 (* AND *);
  290 (* LBRACE *);
  291 (* RBRACE *);
    0|]

let yytransl_block = [|
  257 (* LOWER_ID *);
  258 (* UPPER_ID *);
  259 (* TYVAR *);
  260 (* STRING *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\007\000\007\000\004\000\
\004\000\008\000\008\000\009\000\009\000\005\000\005\000\011\000\
\011\000\010\000\010\000\012\000\012\000\006\000\006\000\015\000\
\015\000\014\000\014\000\016\000\016\000\016\000\017\000\017\000\
\013\000\013\000\013\000\013\000\013\000\013\000\013\000\018\000\
\003\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
\020\000\020\000\020\000\021\000\021\000\024\000\024\000\022\000\
\022\000\023\000\023\000\000\000"

let yylen = "\002\000\
\002\000\004\000\004\000\005\000\005\000\001\000\001\000\002\000\
\002\000\002\000\002\000\001\000\003\000\001\000\001\000\000\000\
\002\000\000\000\001\000\000\000\001\000\000\000\003\000\000\000\
\003\000\001\000\003\000\001\000\002\000\000\000\003\000\000\000\
\003\000\001\000\003\000\001\000\003\000\001\000\002\000\001\000\
\001\000\001\000\002\000\003\000\003\000\003\000\003\000\001\000\
\001\000\001\000\003\000\002\000\005\000\002\000\002\000\006\000\
\001\000\002\000\003\000\001\000\002\000\005\000\005\000\003\000\
\002\000\003\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\015\000\014\000\000\000\000\000\000\000\000\000\
\000\000\000\000\006\000\000\000\000\000\000\000\000\000\000\000\
\068\000\000\000\000\000\050\000\057\000\049\000\000\000\054\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\009\000\008\000\000\000\000\000\011\000\010\000\052\000\000\000\
\000\000\000\000\055\000\001\000\000\000\000\000\058\000\048\000\
\000\000\065\000\000\000\000\000\000\000\000\000\000\000\061\000\
\000\000\000\000\000\000\000\000\051\000\000\000\067\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\017\000\
\000\000\000\000\000\000\000\000\000\000\000\000\053\000\019\000\
\004\000\000\000\021\000\005\000\000\000\000\000\062\000\063\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\023\000\
\000\000\000\000\031\000\040\000\042\000\000\000\000\000\027\000\
\000\000\000\000\000\000\035\000\000\000\000\000\043\000\000\000\
\000\000\000\000\029\000\038\000\036\000\000\000\039\000\025\000\
\033\000\044\000\000\000\045\000\000\000\000\000\037\000"

let yydgoto = "\002\000\
\017\000\018\000\019\000\058\000\081\000\084\000\020\000\082\000\
\085\000\090\000\096\000\104\000\105\000\092\000\099\000\119\000\
\106\000\047\000\021\000\022\000\029\000\024\000\043\000\030\000"

let yysindex = "\024\000\
\101\255\000\000\000\000\000\000\037\255\041\255\123\255\069\255\
\074\255\051\255\000\000\008\255\016\000\182\255\227\255\082\255\
\000\000\061\255\118\255\000\000\000\000\000\000\042\255\000\000\
\064\255\072\255\098\255\108\255\106\255\047\255\109\255\109\255\
\000\000\000\000\047\255\135\255\000\000\000\000\000\000\238\255\
\105\255\006\255\000\000\000\000\016\000\016\000\000\000\000\000\
\016\000\000\000\016\000\016\000\112\255\119\255\016\000\000\000\
\109\255\124\255\125\255\016\000\000\000\016\000\000\000\016\000\
\238\255\238\255\238\255\238\255\016\000\016\000\157\255\000\000\
\102\255\116\255\174\255\238\255\195\255\206\255\000\000\000\000\
\000\000\152\255\000\000\000\000\153\255\016\000\000\000\000\000\
\150\255\131\255\158\255\137\255\011\255\255\254\152\255\000\000\
\255\254\153\255\000\000\000\000\000\000\255\254\142\255\000\000\
\076\255\048\255\131\255\000\000\137\255\067\255\000\000\255\254\
\255\254\255\254\000\000\000\000\000\000\255\254\000\000\000\000\
\000\000\000\000\044\255\000\000\144\255\104\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\161\255\000\000\000\000\000\000\000\000\
\000\000\000\000\163\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\172\255\159\255\159\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\245\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\159\255\000\000\000\000\000\000\000\000\000\000\000\000\013\000\
\165\255\036\000\167\255\171\255\000\000\000\000\000\000\000\000\
\012\255\013\255\000\000\047\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\251\254\176\255\053\255\178\255\025\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\114\255\048\000\176\255\000\000\178\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\060\255\000\000\002\255\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\015\000\243\255\000\000\000\000\250\255\000\000\
\000\000\094\000\099\000\162\255\055\000\103\000\100\000\000\000\
\000\000\000\000\237\255\195\000\184\000\192\000\175\000\000\000"

let yytablesize = 338
let yytable = "\048\000\
\100\000\101\000\108\000\046\000\046\000\034\000\042\000\038\000\
\003\000\004\000\115\000\003\000\004\000\018\000\020\000\005\000\
\048\000\035\000\059\000\102\000\048\000\026\000\046\000\046\000\
\001\000\046\000\026\000\036\000\046\000\040\000\046\000\015\000\
\103\000\046\000\046\000\046\000\062\000\023\000\022\000\030\000\
\016\000\025\000\023\000\072\000\048\000\048\000\048\000\048\000\
\048\000\116\000\117\000\048\000\027\000\028\000\033\000\048\000\
\048\000\048\000\048\000\064\000\065\000\047\000\047\000\066\000\
\049\000\067\000\068\000\112\000\118\000\071\000\031\000\113\000\
\114\000\048\000\075\000\032\000\076\000\100\000\101\000\034\000\
\047\000\047\000\042\000\077\000\078\000\034\000\047\000\044\000\
\122\000\051\000\112\000\047\000\047\000\047\000\113\000\114\000\
\102\000\052\000\053\000\112\000\093\000\003\000\004\000\113\000\
\114\000\005\000\006\000\007\000\054\000\103\000\008\000\057\000\
\009\000\055\000\010\000\011\000\012\000\013\000\003\000\004\000\
\014\000\015\000\005\000\026\000\035\000\127\000\061\000\112\000\
\027\000\028\000\016\000\113\000\114\000\080\000\013\000\003\000\
\004\000\069\000\015\000\005\000\028\000\035\000\045\000\046\000\
\070\000\028\000\028\000\016\000\083\000\073\000\074\000\013\000\
\060\000\089\000\091\000\015\000\110\000\003\000\004\000\045\000\
\094\000\005\000\095\000\035\000\016\000\079\000\123\000\124\000\
\125\000\098\000\097\000\113\000\126\000\013\000\003\000\004\000\
\111\000\015\000\005\000\060\000\035\000\045\000\003\000\004\000\
\016\000\037\000\016\000\007\000\107\000\012\000\013\000\013\000\
\086\000\002\000\015\000\003\000\004\000\003\000\045\000\005\000\
\109\000\035\000\024\000\016\000\032\000\120\000\003\000\004\000\
\121\000\041\000\005\000\013\000\035\000\056\000\050\000\015\000\
\063\000\000\000\000\000\045\000\000\000\087\000\013\000\000\000\
\016\000\000\000\015\000\003\000\004\000\000\000\045\000\005\000\
\088\000\035\000\000\000\016\000\000\000\000\000\003\000\004\000\
\000\000\000\000\005\000\013\000\035\000\049\000\049\000\015\000\
\039\000\049\000\000\000\049\000\000\000\000\000\013\000\000\000\
\016\000\000\000\015\000\000\000\000\000\049\000\045\000\000\000\
\000\000\049\000\000\000\016\000\000\000\049\000\000\000\000\000\
\003\000\004\000\049\000\000\000\005\000\059\000\035\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\059\000\059\000\
\013\000\056\000\059\000\000\000\015\000\059\000\059\000\059\000\
\000\000\000\000\056\000\056\000\064\000\016\000\056\000\000\000\
\000\000\056\000\056\000\056\000\000\000\064\000\064\000\066\000\
\000\000\064\000\000\000\000\000\000\000\064\000\064\000\000\000\
\066\000\066\000\000\000\000\000\066\000\041\000\000\000\041\000\
\066\000\066\000\041\000\041\000\041\000\000\000\000\000\041\000\
\041\000\041\000"

let yycheck = "\019\000\
\002\001\003\001\097\000\002\001\003\001\012\000\001\001\014\000\
\001\001\002\001\105\000\001\001\002\001\002\001\002\001\005\001\
\036\000\007\001\032\000\021\001\040\000\027\001\021\001\022\001\
\001\000\024\001\032\001\013\000\027\001\015\000\029\001\021\001\
\034\001\032\001\033\001\034\001\031\001\001\001\027\001\027\001\
\030\001\001\001\001\001\057\000\064\000\065\000\066\000\067\000\
\068\000\002\001\003\001\071\000\006\001\007\001\004\001\075\000\
\076\000\077\000\078\000\045\000\046\000\002\001\003\001\049\000\
\023\001\051\000\052\000\024\001\021\001\055\000\002\001\028\001\
\029\001\093\000\060\000\002\001\062\000\002\001\003\001\027\001\
\021\001\022\001\001\001\069\000\070\000\033\001\027\001\027\001\
\022\001\026\001\024\001\032\001\033\001\034\001\028\001\029\001\
\021\001\026\001\001\001\024\001\086\000\001\001\002\001\028\001\
\029\001\005\001\006\001\007\001\001\001\034\001\010\001\003\001\
\012\001\008\001\014\001\015\001\016\001\017\001\001\001\002\001\
\020\001\021\001\005\001\001\001\007\001\022\001\022\001\024\001\
\006\001\007\001\030\001\028\001\029\001\032\001\017\001\001\001\
\002\001\026\001\021\001\005\001\027\001\007\001\025\001\026\001\
\026\001\032\001\033\001\030\001\033\001\026\001\026\001\017\001\
\018\001\002\001\002\001\021\001\102\000\001\001\002\001\025\001\
\011\001\005\001\032\001\007\001\030\001\009\001\112\000\113\000\
\114\000\033\001\013\001\028\001\118\000\017\001\001\001\002\001\
\035\001\021\001\005\001\008\001\007\001\025\001\001\001\002\001\
\026\001\004\001\030\001\027\001\095\000\027\001\017\001\027\001\
\019\001\027\001\021\001\001\001\002\001\027\001\025\001\005\001\
\098\000\007\001\027\001\030\001\027\001\107\000\001\001\002\001\
\109\000\015\000\005\001\017\001\007\001\030\000\023\000\021\001\
\042\000\255\255\255\255\025\001\255\255\027\001\017\001\255\255\
\030\001\255\255\021\001\001\001\002\001\255\255\025\001\005\001\
\027\001\007\001\255\255\030\001\255\255\255\255\001\001\002\001\
\255\255\255\255\005\001\017\001\007\001\001\001\002\001\021\001\
\022\001\005\001\255\255\007\001\255\255\255\255\017\001\255\255\
\030\001\255\255\021\001\255\255\255\255\017\001\025\001\255\255\
\255\255\021\001\255\255\030\001\255\255\025\001\255\255\255\255\
\001\001\002\001\030\001\255\255\005\001\009\001\007\001\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\018\001\019\001\
\017\001\009\001\022\001\255\255\021\001\025\001\026\001\027\001\
\255\255\255\255\018\001\019\001\009\001\030\001\022\001\255\255\
\255\255\025\001\026\001\027\001\255\255\018\001\019\001\009\001\
\255\255\022\001\255\255\255\255\255\255\026\001\027\001\255\255\
\018\001\019\001\255\255\255\255\022\001\022\001\255\255\024\001\
\026\001\027\001\027\001\028\001\029\001\255\255\255\255\032\001\
\033\001\034\001"

let yynames_const = "\
  KW_FN\000\
  KW_VAL\000\
  KW_LET\000\
  KW_IN\000\
  KW_END\000\
  KW_DATATYPE\000\
  KW_FROM\000\
  KW_CODATATYPE\000\
  KW_TO\000\
  KW_USE\000\
  KW_EXIT\000\
  KW_SHOW\000\
  KW_IF\000\
  KW_THEN\000\
  KW_ELSE\000\
  KW_SET\000\
  LPAREN\000\
  RPAREN\000\
  DARROW\000\
  ARROW\000\
  COMMA\000\
  EQ\000\
  SEMICOLON\000\
  STAR\000\
  PLUS\000\
  LAMBDA\000\
  DOT\000\
  BAR\000\
  AND\000\
  LBRACE\000\
  RBRACE\000\
  "

let yynames_block = "\
  LOWER_ID\000\
  UPPER_ID\000\
  TYVAR\000\
  STRING\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'raw_decl) in
    Obj.repr(
# 81 "parser.mly"
                        ( locate _1 )
# 357 "parser.ml"
               : Ast.decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 86 "parser.mly"
        ( Value_binding (_2, _4) )
# 365 "parser.ml"
               : 'raw_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 88 "parser.mly"
        ( Value_binding (_2, _4) )
# 373 "parser.ml"
               : 'raw_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'tyvars) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'ctors) in
    Obj.repr(
# 90 "parser.mly"
        ( Type (_2, _3, _5) )
# 382 "parser.ml"
               : 'raw_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'tyvars) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'dtors) in
    Obj.repr(
# 92 "parser.mly"
        ( Cotype (_2, _3, _5) )
# 391 "parser.ml"
               : 'raw_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 94 "parser.mly"
        ( Exit_cmd )
# 397 "parser.ml"
               : 'raw_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 96 "parser.mly"
        ( Show_cmd "" )
# 403 "parser.ml"
               : 'raw_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'any_id) in
    Obj.repr(
# 98 "parser.mly"
        ( Show_cmd _2 )
# 410 "parser.ml"
               : 'raw_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 100 "parser.mly"
        ( Use_cmd _2 )
# 417 "parser.ml"
               : 'raw_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'any_id) in
    Obj.repr(
# 102 "parser.mly"
        ( Set_cmd _2 )
# 424 "parser.ml"
               : 'raw_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 104 "parser.mly"
        ( Set_cmd _2 )
# 431 "parser.ml"
               : 'raw_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 106 "parser.mly"
        ( Term _1 )
# 438 "parser.ml"
               : 'raw_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 108 "parser.mly"
        ( Eq_test (_1, _3) )
# 446 "parser.ml"
               : 'raw_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 112 "parser.mly"
                        ( _1 )
# 453 "parser.ml"
               : 'any_id))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 113 "parser.mly"
                        ( _1 )
# 460 "parser.ml"
               : 'any_id))
; (fun __caml_parser_env ->
    Obj.repr(
# 117 "parser.mly"
                                ( [] )
# 466 "parser.ml"
               : 'tyvars))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'tyvars) in
    Obj.repr(
# 118 "parser.mly"
                                ( _1 :: _2 )
# 474 "parser.ml"
               : 'tyvars))
; (fun __caml_parser_env ->
    Obj.repr(
# 121 "parser.mly"
                       (())
# 480 "parser.ml"
               : 'maybe_bar))
; (fun __caml_parser_env ->
    Obj.repr(
# 121 "parser.mly"
                                  (())
# 486 "parser.ml"
               : 'maybe_bar))
; (fun __caml_parser_env ->
    Obj.repr(
# 122 "parser.mly"
                       (())
# 492 "parser.ml"
               : 'maybe_and))
; (fun __caml_parser_env ->
    Obj.repr(
# 122 "parser.mly"
                                  (())
# 498 "parser.ml"
               : 'maybe_and))
; (fun __caml_parser_env ->
    Obj.repr(
# 125 "parser.mly"
                                ( [] )
# 504 "parser.ml"
               : 'ctors))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'maybe_bar) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'ctor) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'ctor_list) in
    Obj.repr(
# 126 "parser.mly"
                                ( _2 :: _3 )
# 513 "parser.ml"
               : 'ctors))
; (fun __caml_parser_env ->
    Obj.repr(
# 130 "parser.mly"
                                ( [] )
# 519 "parser.ml"
               : 'ctor_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'ctor) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'ctor_list) in
    Obj.repr(
# 131 "parser.mly"
                                ( _2 :: _3 )
# 527 "parser.ml"
               : 'ctor_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 135 "parser.mly"
                                ( {cd_name = _1; cd_args = []} )
# 534 "parser.ml"
               : 'ctor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'ty_list) in
    Obj.repr(
# 136 "parser.mly"
                                ( {cd_name = _1; cd_args = _3} )
# 542 "parser.ml"
               : 'ctor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'ty) in
    Obj.repr(
# 140 "parser.mly"
                        ( [_1] )
# 549 "parser.ml"
               : 'ty_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'ty) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'ty_list) in
    Obj.repr(
# 141 "parser.mly"
                        ( _1 :: _2 )
# 557 "parser.ml"
               : 'ty_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 145 "parser.mly"
                                ( [] )
# 563 "parser.ml"
               : 'dtors))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'maybe_and) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'dtor) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'dtor_list) in
    Obj.repr(
# 146 "parser.mly"
                                ( _2 :: _3 )
# 572 "parser.ml"
               : 'dtors))
; (fun __caml_parser_env ->
    Obj.repr(
# 150 "parser.mly"
                                ( [] )
# 578 "parser.ml"
               : 'dtor_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'dtor) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'dtor_list) in
    Obj.repr(
# 151 "parser.mly"
                                ( _2 :: _3 )
# 586 "parser.ml"
               : 'dtor_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 155 "parser.mly"
                                ( {cd_name = _1; cd_args = []} )
# 593 "parser.ml"
               : 'dtor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'ty_list) in
    Obj.repr(
# 156 "parser.mly"
                                ( {cd_name = _1; cd_args = _3} )
# 601 "parser.ml"
               : 'dtor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 160 "parser.mly"
                                         ( Tyvar _1 )
# 608 "parser.ml"
               : 'aty))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'ty) in
    Obj.repr(
# 161 "parser.mly"
                                         ( _2 )
# 615 "parser.ml"
               : 'aty))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 162 "parser.mly"
                                         ( tc _1 [] )
# 622 "parser.ml"
               : 'aty))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'ty_app) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'aty) in
    Obj.repr(
# 166 "parser.mly"
                    ( 
       match _1 with 
       | Tycon (n, a) -> Tycon (n, a @ [_2])
       | _ -> assert false
    )
# 634 "parser.ml"
               : 'ty_app))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 171 "parser.mly"
                                         ( tc _1 [] )
# 641 "parser.ml"
               : 'ty_app))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'ty_app) in
    Obj.repr(
# 175 "parser.mly"
                          ( _1 )
# 648 "parser.ml"
               : 'ty))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 176 "parser.mly"
                                         ( Tyvar _1 )
# 655 "parser.ml"
               : 'ty))
; (fun __caml_parser_env ->
    Obj.repr(
# 177 "parser.mly"
                                         ( tc "BOTTOM" [] )
# 661 "parser.ml"
               : 'ty))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'ty) in
    Obj.repr(
# 178 "parser.mly"
                                         ( _2 )
# 668 "parser.ml"
               : 'ty))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'ty) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'ty) in
    Obj.repr(
# 179 "parser.mly"
                                         ( tc "PAIR" [_1; _3] )
# 676 "parser.ml"
               : 'ty))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'ty) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'ty) in
    Obj.repr(
# 180 "parser.mly"
                                         ( tc "UNION" [_1; _3] )
# 684 "parser.ml"
               : 'ty))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'ty) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'ty) in
    Obj.repr(
# 181 "parser.mly"
                                         ( tc "->" [_1; _3] )
# 692 "parser.ml"
               : 'ty))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'raw_aterm) in
    Obj.repr(
# 185 "parser.mly"
                                         ( locate _1 )
# 699 "parser.ml"
               : 'aterm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'raw_term) in
    Obj.repr(
# 189 "parser.mly"
                                        ( locate _1 )
# 706 "parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'any_id) in
    Obj.repr(
# 193 "parser.mly"
                                         ( T_ref _1 )
# 713 "parser.ml"
               : 'raw_aterm))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'raw_term) in
    Obj.repr(
# 194 "parser.mly"
                                         ( _2 )
# 720 "parser.ml"
               : 'raw_aterm))
; (fun __caml_parser_env ->
    Obj.repr(
# 195 "parser.mly"
                                         ( T_ref "Unit" )
# 726 "parser.ml"
               : 'raw_aterm))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'value_binding_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'term) in
    Obj.repr(
# 197 "parser.mly"
                                         ( T_let (_2, _4) )
# 734 "parser.ml"
               : 'raw_aterm))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fn_vars) in
    Obj.repr(
# 198 "parser.mly"
                                         ( _2 )
# 741 "parser.ml"
               : 'raw_aterm))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'lambda_vars) in
    Obj.repr(
# 199 "parser.mly"
                                         ( _2 )
# 748 "parser.ml"
               : 'raw_aterm))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'term) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'term) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 201 "parser.mly"
        ( T_app (locate (T_app (locate (T_app (locate (T_ref "_BOOLit"), _2)), _4)), _6) )
# 757 "parser.ml"
               : 'raw_aterm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'raw_aterm) in
    Obj.repr(
# 205 "parser.mly"
                                            ( _1 )
# 764 "parser.ml"
               : 'raw_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'term) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'aterm) in
    Obj.repr(
# 206 "parser.mly"
                                            ( T_app (_1, _2) )
# 772 "parser.ml"
               : 'raw_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 208 "parser.mly"
        ( T_app (locate (T_app (locate (T_ref "Pair"), _1)), _3) )
# 780 "parser.ml"
               : 'raw_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'value_binding) in
    Obj.repr(
# 212 "parser.mly"
                                                ( [_1] )
# 787 "parser.ml"
               : 'value_binding_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'value_binding) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'value_binding_list) in
    Obj.repr(
# 213 "parser.mly"
                                                ( _1 :: _2 )
# 795 "parser.ml"
               : 'value_binding_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'term) in
    Obj.repr(
# 217 "parser.mly"
                                                  ( (_2, _4) )
# 803 "parser.ml"
               : 'value_binding))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'term) in
    Obj.repr(
# 218 "parser.mly"
                                                  ( (_2, _4) )
# 811 "parser.ml"
               : 'value_binding))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 222 "parser.mly"
                                ( T_abs (_1, _3) )
# 819 "parser.ml"
               : 'fn_vars))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fn_vars) in
    Obj.repr(
# 223 "parser.mly"
                                ( T_abs (_1, locate _2) )
# 827 "parser.ml"
               : 'fn_vars))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 227 "parser.mly"
                                ( T_abs (_1, _3) )
# 835 "parser.ml"
               : 'lambda_vars))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'lambda_vars) in
    Obj.repr(
# 228 "parser.mly"
                                ( T_abs (_1, locate _2) )
# 843 "parser.ml"
               : 'lambda_vars))
(* Entry decl *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let decl (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.decl)
