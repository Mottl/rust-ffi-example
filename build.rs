fn main() {
    #[cfg(target_os = "macos")]
    let say_asm = "src/say_asm_macos.s";
    #[cfg(target_os = "linux")]
    let say_asm = "src/say_asm_linux.s";

    println!("cargo::rerun-if-changed=src/say_c.c");
    println!("cargo::rerun-if-changed=src/{say_asm}");
    cc::Build::new().file("src/say_c.c").compile("say_c");
    cc::Build::new().file(say_asm).compile("say_asm");
}
