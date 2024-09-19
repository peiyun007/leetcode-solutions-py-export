class Solution {
    func countPaths(_ n: Int, _ roads: [[Int]]) -> Int {
        let mod = 1_0000_0000_7
        var g = Array(repeating: [(Int, Int)](), count: n)
        var queue = Heap<(Int, Int)>(sort: <)
        var visited = Array(repeating: false, count: n)
        var dis = Array(repeating: Int.max, count: n)
        var ways = Array(repeating: 0, count: n)
        for e in roads {
            g[e[0]].append((e[2], e[1]))
            g[e[1]].append((e[2], e[0]))
        }
        queue.insert((0, 0))
        visited[0] = true
        ways[0] = 1
        dis[0] = 0
        while !queue.isEmpty {
            guard let (weight, u) = queue.remove() else { continue }
            visited[u] = true

            for (w, v) in g[u] {
                 if visited[v] {
                     continue
                 }
                if weight + w < dis[v] {
                    dis[v] = weight + w
                    ways[v] = ways[u]
                    queue.insert((dis[v], v))
                } else if weight + w == dis[v] {
                    ways[v] = (ways[v] + ways[u]) % mod
                }
            }
        }
        return ways[n-1]
    }
}




// https://github.com/raywenderlich/swift-algorithm-club/blob/master/Heap/Heap.swift
// Written for the Swift Algorithm Club by Kevin Randrup and Matthijs Hollemans

public struct Heap<T> {
  
  var nodes = [T]()
  
  private var orderCriteria: (T, T) -> Bool
  
  public init(sort: @escaping (T, T) -> Bool) { self.orderCriteria = sort }
  
  public init(array: [T], sort: @escaping (T, T) -> Bool) {
    self.orderCriteria = sort
    configureHeap(from: array)
  }
  
  private mutating func configureHeap(from array: [T]) {
    nodes = array
    for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
      shiftDown(i)
    }
  }
  
  public var isEmpty: Bool { return nodes.isEmpty }
  
  public var count: Int { return nodes.count }
  
  @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int { return (i - 1) / 2 }
  @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int { return 2 * i + 1 }
  @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int { return 2 * i + 2 }
  
  public func peek() -> T? { return nodes.first }
  
  public mutating func insert(_ value: T) {
    nodes.append(value)
    shiftUp(nodes.count - 1)
  }
  
  public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
    for value in sequence {
      insert(value)
    }
  }
  
  public mutating func replace(index i: Int, value: T) {
    guard i < nodes.count else { return }    
    remove(at: i)
    insert(value)
  }
  
  @discardableResult public mutating func remove() -> T? {
    guard !nodes.isEmpty else { return nil }
    if nodes.count == 1 {
      return nodes.removeLast()
    } else {
      let value = nodes[0]
      nodes[0] = nodes.removeLast()
      shiftDown(0)
      return value
    }
  }
  
  @discardableResult public mutating func remove(at index: Int) -> T? {
    guard index < nodes.count else { return nil }    
    let size = nodes.count - 1
    if index != size {
      nodes.swapAt(index, size)
      shiftDown(from: index, until: size)
      shiftUp(index)
    }
    return nodes.removeLast()
  }
  
  internal mutating func shiftUp(_ index: Int) {
    var childIndex = index
    let child = nodes[childIndex]
    var parentIndex = self.parentIndex(ofIndex: childIndex)    
    while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
      nodes[childIndex] = nodes[parentIndex]
      childIndex = parentIndex
      parentIndex = self.parentIndex(ofIndex: childIndex)
    }
    nodes[childIndex] = child
  }
  
  internal mutating func shiftDown(from index: Int, until endIndex: Int) {
    let leftChildIndex = self.leftChildIndex(ofIndex: index)
    let rightChildIndex = leftChildIndex + 1
    var first = index
    if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
      first = leftChildIndex
    }
    if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
      first = rightChildIndex
    }
    if first == index { return }    
    nodes.swapAt(index, first)
    shiftDown(from: first, until: endIndex)
  }
  
  internal mutating func shiftDown(_ index: Int) { shiftDown(from: index, until: nodes.count) }
  
}