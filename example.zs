let a : int = 5;
let b : float = 5.0;
let c : bool = true;

// char is essentially 8 bit integer
let d : char = 'a';

let e : []char = "hello";
let f : ?[]char = "world";

let g = 5; // type can be infered

// type annotations are not required here
fn fact (n : int) int {
    if (n == 0) {
        return 1;
    } else {
        return n * fact(n - 1);
    }
}

out = fact(5);
@print(out);
