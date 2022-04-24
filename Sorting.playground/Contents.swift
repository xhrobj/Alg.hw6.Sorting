import Foundation

var array = Array(-10...10)
array.shuffle()

print("неотсортированный массив:", array, "\n")
print("bubble:", Sorting.buble(array))
print("insertion:", Sorting.insertion(array))
print("shell:", Sorting.shell(array))

print("\n👾👾👾👾👾👾👾👾👾\n")

var i = 100
while i <= 10_000 {
    var array = Array(0...i)
    array.shuffle()
    
    print("\n----", i, " элементов ----")
    
    var timestamp = Date()
    Sorting.buble(array)
    print("bubble:   ", Date().timeIntervalSince(timestamp))
    
    timestamp = Date()
    Sorting.insertion(array)
    print("insertion:", Date().timeIntervalSince(timestamp))
    
    timestamp = Date()
    Sorting.shell(array)
    print("shell:    ", Date().timeIntervalSince(timestamp))
    
    i *= 10
}
