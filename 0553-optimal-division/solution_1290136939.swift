class Solution {
    func optimalDivision(_ nums: [Int]) -> String {
        let n = nums.count
        let node = dfs(0, n-1)
        return node.maxStr

        func dfs(_ i: Int, _ j: Int) -> Node {
            if i == j {
                return Node(minVal: Double(nums[i]), maxVal: Double(nums[i]), minStr: String(nums[i]), maxStr: String(nums[i]))
            }
            var node = Node()
            for k in i..<j {
                let node1 = dfs(i, k)
                let node2 = dfs(k+1, j)
                if node.maxVal < node1.maxVal / node2.minVal {
                    node.maxVal = node1.maxVal / node2.minVal
                    if j-(k+1)+1 == 1 {
                        node.maxStr = node1.maxStr + "/" + node2.minStr
                    } else {
                        node.maxStr = node1.maxStr + "/(" + node2.minStr + ")"
                    }
                }
                if node.minVal > node1.minVal / node2.maxVal {
                    node.minVal = node1.minVal / node2.maxVal
                    if j-(k+1)+1 == 1 {
                        node.minStr = node1.minStr + "/" + node2.maxStr
                    } else {
                        node.minStr = node1.minStr + "/(" + node2.maxStr + ")"
                    }
                }
            }
            return node
        }
    }
}

struct Node {
    var minVal = Double(Int.max)
    var maxVal: Double = 0
    var minStr = ""
    var maxStr = ""
}
