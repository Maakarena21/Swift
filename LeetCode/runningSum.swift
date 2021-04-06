//функция принимает на вход массив целых чисел, возвращает также массив целых чисел
func runningSum(_ nums: [Int]) -> [Int] {
    //сосздаем новый пустой массив
    var array: [Int] = []
    //создаем пустую переменную
    var sum = 0
    //цикл для каждого элемента массива nums
    for i in nums {
        //к сумме прибавляем текущий элемент
        sum += i
        //добавить в конец нового массива сумму
        array.append(sum)
    }
    //вернуть новый массив
    return array
}
print(runningSum([1, 4, 7, 4, 3, 9, 8]))