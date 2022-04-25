import Foundation

var array = Array(-10...10)
array.shuffle()

print("неотсортированный массив:", array, "\n")
print("bubble:                  ", Sorting.buble(array))
print("insertion:               ", Sorting.insertion(array))
print("shell:                   ", Sorting.shell(array))

print("selection:               ", Sorting.selection(array))
print("heap:                    ", Sorting.heap(array))

print("\n", "👾👾👾👾👾👾👾👾👾", "\n")

var array1 = ["Mikhail", "Marina", "Barry", "Dexter", "Anna", "Nikita", "Vasilisa"]
array1.shuffle()

print("неотсортированный массив:", array1, "\n")
print("bubble:                  ", Sorting.buble(array1))
print("insertion:               ", Sorting.insertion(array1))
print("shell:                   ", Sorting.shell(array1))

print("selection:               ", Sorting.selection(array1))
print("heap:                    ", Sorting.heap(array1))

print("\n", "👾👾👾👾👾👾👾👾👾", "\n")

var i = 100
while i <= 10_000 {
    var array = Array(0...i)
    array.shuffle()

    print("\n----", i, "элементов ----")

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

print("\n", "👾👾👾👾👾👾👾👾👾", "\n")

i = 100
while i <= 1_000_000 {
    var array = Array(0...i)
    array.shuffle()

    print("\n----", i, "элементов ----")

    var timestamp = Date()
    Sorting.heap(array)
    print("heap:     ", Date().timeIntervalSince(timestamp))
    
    if i > 10_000 {
        print("selection: -")
    } else {
        timestamp = Date()
        Sorting.selection(array)
        print("selection:", Date().timeIntervalSince(timestamp))
    }

    i *= 10
}
