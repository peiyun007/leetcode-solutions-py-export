class Solution {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var m = left, n = right
        var shift = 0
        while m < n {
            m = m >> 1
            n = n >> 1
            shift += 1
        }
        return m << shift
    }
}