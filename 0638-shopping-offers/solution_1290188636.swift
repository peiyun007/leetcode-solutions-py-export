class Solution {
    func shoppingOffers(_ price: [Int], _ special: [[Int]], _ needs: [Int]) -> Int {
        let n = price.count
        var filterSpecical = [[Int]]()
        for i in 0..<special.count {
            let x = special[i]
            var sum = 0
            for i in 0..<n {
                sum += x[i] * price[i]
            }
            if x[n] < sum {
                filterSpecical.append(x)
            }
        }
        var memo = [[Int]: Int]()
        return dfs(needs)

        func dfs(_ curNeeds: [Int]) -> Int {
            if let val = memo[curNeeds] {
                return val
            }
            var ans = 0
            for i in 0..<n {
                ans += (price[i] * curNeeds[i])
            }
            for sp in filterSpecical {
                var nxtNeeds = [Int]()
                let pr = sp[n]
                for i in 0..<n {
                    if sp[i] > curNeeds[i] {
                        break
                    }
                    nxtNeeds.append(curNeeds[i] - sp[i])
                }
                if nxtNeeds.count == n {
                    ans = min(ans, dfs(nxtNeeds) + pr)
                }
            }
            memo[curNeeds] = ans
            return ans
        }
    }
}