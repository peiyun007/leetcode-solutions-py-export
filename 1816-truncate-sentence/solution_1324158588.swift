class Solution {
    func truncateSentence(_ s: String, _ k: Int) -> String {
        var ans = [Character]()
        var cnt = 0
        for ch in s {
            if ch == " " {
                cnt += 1
            }
            if cnt == k {
                break
            }
            ans.append(ch)
        }
        return String(ans)
    }
}