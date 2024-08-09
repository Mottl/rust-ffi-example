extern "C" {
    fn say_c();
    fn say_asm();
}

fn main() {
    unsafe {
        say_c();
        say_asm();
    }
}
