class Solution {
    func avoidFlood(_ rains: [Int]) -> [Int] {
        let n = rains.count
        var ans = Array(repeating: 1, count: n)  // 默认值为1而不是0
        var mp = [Int: Int]()
        var st = [Int]()
        for i in 0..<n {
            if rains[i] == 0 {
                st.append(i)
            } else {
                ans[i] = -1
                if let x = mp[rains[i]] {
                    let idx = bsearch(st, x)
                    if idx == st.count {
                        return []
                    }
                    let it = st[idx]
                    ans[it] = rains[i]
                    st.remove(at: idx)
                }
                mp[rains[i]] = i
            }
        }
        return ans
    }

    func bsearch(_ arr: [Int], _ target: Int) -> Int {
        var l = 0, r = arr.count
        while l < r {
            let mid = l + (r-l) / 2
            if arr[mid] > target {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return l
    }
}