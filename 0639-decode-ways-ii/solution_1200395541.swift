class Solution {
    let mod = 1_0000_0000_7
    func numDecodings(_ s: String) -> Int {
        let arr = Array(s)
        var w0 = 1
        var w1 = 1
        if arr[0] == "0" {
            w1 = 0
        } else if arr[0] == "*" {
            w1 = 9
        } else {
            w1 = 1
        }
        if arr.count <= 1 {
            return w1
        }
        for i in 2...arr.count {
            var a = c(arr[i-1]) * w1
            a = a % mod
            var b = c(arr[i-2], arr[i-1]) * w0
            b = b % mod
            let w = (a + b) % mod
            w0 = w1
            w1 = w
        }
        return w1
    }

    func c(_ x: Character) -> Int {
        if x == "0" {
            return 0
        }
        if x == "*" {
            return 9
        }
        return 1
    }

    func c(_ x1: Character, _ x2: Character) -> Int {
        switch ((x1, x2)) {
        case ("*", "*"):
            return 15
        case ("1", "*"):
            return 9
        case ("2", "*"):
            return 6
        case ("1", _):
            return 1
        case ("2", let x):
            return Int(String(x))! <= 6 ? 1 : 0
        case ("*", let x):
            return Int(String(x))! <= 6 ? 2 : 1
        default:
            return 0
        }
    }
}