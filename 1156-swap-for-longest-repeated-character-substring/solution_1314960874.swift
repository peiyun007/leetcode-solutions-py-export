class Solution {
    func maxRepOpt1(_ text: String) -> Int {
        let arr = Array(text)
        let n = arr.count
        var cnt = [Character: Int]()
        for i in 0..<n {
            cnt[arr[i], default: 0] += 1
        }
        var i = 0, res = 0
        while i < n {
            var j = i
            while j < n && arr[j] == arr[i] {
                j += 1
            }
            var curCnt = j-i
            if j-i < cnt[arr[i], default: 0] {
                curCnt += 1
            }
            res = max(res, curCnt)
            var k = j+1
            while k < n && arr[k] == arr[i] {
                k += 1
            }
            res = max(res, min(k-i, cnt[arr[i], default: 0]))
            i = j
        }
        return res
    }
}