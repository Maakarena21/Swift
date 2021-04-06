func reverse(_ x: Int) -> Int {
    if x > Int32.max || x < Int32.min {
        return 0
    }
    var k = ""
    if x < 0 {
        k += "-"
    }
    k += String(abs(x)).reversed()
    return Int(Int32(k) ?? 0)
}
print(reverse(24343))