const checker = @import("checker.zig");

const Prog = []const Stmt;

const Stmt = union(enum) {
    func: *const struct {
        name: []const u8,
        args: []const struct { name: []const u8, type: ?Type },
        ret: ?Type,
        body: Stmt,
    },
    @"if": *const struct {
        cond: Expr,
        body: Stmt,
        @"else": ?Stmt,
    },
    @"while": *const struct {
        cond: Expr,
        body: Stmt,
    },
    block: []const Stmt,

    let: *const struct {
        name: []const u8,
        type: ?Type,
        value: Expr,
    },
    ret: ?*const Expr,
    @"break": void,
    @"continue": void,
};

const Expr = struct {
    expr: union(enum) {
        call: *const struct {
            func: Expr,
            args: []const Expr,
        },
        op: *const struct {
            op: Op,
            lhs: Expr,
            rhs: Expr,
        },
        name: []const u8,
        lit: Lit,
    },
    type: checker.Type,
};

const Type = union(enum) {
    array: []const Type,
    option: *const Type,
    func: *const struct {
        args: []const Type,
        ret: Type,
    },

    void: void,
    int: void,
    float: void,
    boolean: void,
    char: void,
};

const Lit = union(enum) {
    boolean: bool,
    char: u21,
    int: i128,
    float: f64,
    string: []const u8,
};

const Op = enum {
    add,
    sub,
    mul,
    div,
    mod,

    eq,
    neq,
    lt,
    lte,
    gt,
    gte,

    land,
    lor,
};
