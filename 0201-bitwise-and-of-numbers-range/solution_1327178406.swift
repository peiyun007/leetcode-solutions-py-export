class Solution {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var ans = right
        for i in left..<right {
            ans &= i
        }
        return ans
    }
}