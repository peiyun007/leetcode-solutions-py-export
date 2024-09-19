class Solution {
    func getSum(_ a0: Int, _ b0: Int) -> Int {
        var a = a0, b = b0
        while b != 0 {
            let carry = (a & b) << 1
            a = a ^ b
            b = carry
        }
        return a
    }
}