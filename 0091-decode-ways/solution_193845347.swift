class Solution {
    func numDecodings(_ s: String) -> Int {
        var mem = Array(repeating: -1, count: s.count + 1)
        return helper_dp(Array(s), s.count, &mem)
    }
    
    func helper_dp(_ chars: [Character], _ k: Int, _ mem: inout [Int]) -> Int {
        if k == 0 {
            return 1
        }
        let start = chars.count - k
        if chars[start] == "0" {
            return 0
        }
        if mem[k] != -1 {
            return mem[k]
        }
        var res = helper_dp(chars, k - 1, &mem)
        if k >= 2 && Int(String(chars[start..<start+2]))! <= 26 {
            res += helper_dp(chars, k - 2, &mem)
        }
        mem[k] = res
        return res
    }
}