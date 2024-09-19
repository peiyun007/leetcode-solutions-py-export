class Solution {
    func isValidSerialization(_ preorder: String) -> Bool {
        var stack = [String]()
        for str in preorder.split(separator: ",") {
            stack.append(String(str))
            while stack.count >= 3 && stack[stack.count-1] == "#" && stack[stack.count-2] == "#" && stack[stack.count-3] != "#" {
                stack.removeLast()
                stack.removeLast()
                stack.removeLast()
                stack.append("#")
            }
        }
        return stack.count == 1 && stack[0] == "#"
    }
}