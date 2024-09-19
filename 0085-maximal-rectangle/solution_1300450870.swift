class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        let m = matrix.count, n = matrix[0].count
        var left = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == "1" {
                    left[i][j] = j == 0 ? 1 : left[i][j-1]+1
                }
            }
        }
        var ans = 0
        for j in 0..<n {
            var up = Array(repeating: -1, count: m)
            var st = [Int]()
            for i in 0..<m {
                while !st.isEmpty && left[i][j] <= left[st[st.count-1]][j] {
                    st.removeLast()
                }
                if !st.isEmpty {
                    up[i] = st[st.count-1]
                }
                st.append(i)
            }
            var down = Array(repeating: m, count: m)
            st = [Int]()
            for i in 0..<m {
                while !st.isEmpty && left[i][j] < left[st[st.count-1]][j] {
                    let prev = st.removeLast()
                    down[prev] = i
                }
                st.append(i)
            }

            for i in 0..<m {
                ans = max(ans, ((down[i]-1) - (up[i]+1) + 1) * left[i][j])
            }
        }
        return ans
    }
}