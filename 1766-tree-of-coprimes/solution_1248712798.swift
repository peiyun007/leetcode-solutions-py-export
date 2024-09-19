class Solution {
    func getCoprimes(_ nums: [Int], _ edges: [[Int]]) -> [Int] {
        let n = nums.count
        var g = Array(repeating: [Int](), count: n)
        for e in edges {
            g[e[0]].append(e[1])
            g[e[1]].append(e[0])
        }
        var depths = Array(repeating: -1, count: n)
        var ans = Array(repeating: -1, count: n)
        var temp = Array(repeating: [Int](), count: 51)
        var gcds = Array(repeating: [Int](), count: 51)
        for i in 1...50 {
            for j in 1...50 {
                if gcd(i, j) == 1 {
                    gcds[i].append(j)
                }
            }
        }
        dfs(0, 0)
        return ans

        func dfs(_ x: Int, _ depth: Int) {
            depths[x] = depth
            for val in gcds[nums[x]] {
                if temp[val].isEmpty {
                    continue
                }
                let las = temp[val].last ?? 0
                if ans[x] == -1 || depths[las] >= depths[ans[x]] {
                    ans[x] = las
                }
            }
            temp[nums[x]].append(x)
            for y in g[x] {
                if depths[y] == -1 {
                    dfs(y, depth+1)
                }
            }
            temp[nums[x]].removeLast()
        }
    }

    func gcd(_ x0: Int, _ y0: Int) -> Int {
        var x = x0, y = y0
        while y != 0 {
            (x, y) = (y, x % y)
        }
        return x
    }
}