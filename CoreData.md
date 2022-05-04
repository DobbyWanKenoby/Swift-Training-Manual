# CoreData

[К оглавлению](./README.md)

## Содержание
- [Описание](#desc)
- [Интеграция CoreData в проект](#integration)
- [Получение данных](#getdata)
- [Удаление данных](#deldata)

## <a id="desc"></a>Описание
**CoreData** - нативный фреймворк, предназначенный для хранения данных. Фреймоврк изначально доступный для использования в проектах и импортируется с помощью команды:

`import CoreData`

## <a id="integration"></a>Интеграция CoreData в проект

Для использования CoreData в проекте необходимо настроить соответстввующее окружение. Для этого необходимо выполнить два шага:

1. Добавить файл с моделью данных, после чего настроить модель.
2. Реализовать интерфейс доступа к контексту.

### Создание модели данных

Для создания модели данных вы можете использовать один из следующих методов:

1. При создании проекта отметить галочку `use CoreData`.
2. В составе проекта создать новый файл типа `Data Model`.

В результате в `Project Navigator` отобразится файл `AppName.xcdatamodeld`, где `AppName` соответствует имени проекта.

### Создание интерфейса для доступа к контексту

Для доступа к контексту вы можете использовать один из следующих методов:

1. При создании проекта отметить галочку `use CoreData`, в результате чего в классе `AppDelegate` появится свойство `persistanceContainer`.
2. Реализовать доступ к Persistance Container самостоятельно в произвольном месте проекта с помощью кода:

```swift
let persistanceContainer = NSPersistentContainer(name: "AppName")
persistanceContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
    if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
    }
})
```
После этого вы сможете получить доступ к контексту через свойство `viewContext`:

```swift
persistanceContainer.viewContext
```

### Контекст

Все операции с CoreData производятся с помощью контекста. В приложении одновременно может существовать произвольное количество контекстов, но обычно вам должно хватить одного.

```swift
let context = persistanceContainer.viewContext
```

## <a id="getdata"></a>Получение данных

Для получения данных используются значения следующих типов:

- `NSFetchRequest` - описывает критерии поиска значений в хранилище.


##### Загрузка всех значений определенного типа

```swift
// Формируем запрос на загрузку данных
// Будут загружены все записи с именем EntityName
let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "EntityName")
do {
	let entities = try context.fetch(fetchRequest)
	// теперь в entities содержатся полученные из хранилища элементы
	// типа EntityName 
	// мы можем необходимым образом обработать их    
} catch {
    fatalError("Error message: \(error)")
}
```

## <a id="deldata"></a>Удаление данных

Для удаления данных используются следующие типы данных:

- `NSBatchDeleteRequest` - описывает запрос для пакетного удаления данных без необходимости их загрузки из хранилища.

##### Удаление всех записей

```swift
// будут удалены все записи типа EntityItem
let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EntityItem")
let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
do {
    try context.execute(batchDeleteRequest)
    try context.save()
} catch {
    fatalError("Error message: \(error)")
}
```

##### Удаление записей и получение их количества
```swift
let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EntityItem")
let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
// указываем тип возвращаемого значения
// в данном случае - это количество удаленных записей
batchDeleteRequest.resultType = .resultTypeCount
do {
    let result = try context.execute(batchDeleteRequest) as! NSBatchDeleteResult
    try context.save()
    // выводим на консоль количество удаленных записей
    print(result.result ?? 0)
} catch {
    fatalError("Error message: \(error)")
}
```

##### Удаление определенных записей

```swift
let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EntityItem")
// будут удалены записи, у которых в поле id содержится значение 3
fetchRequest.predicate = NSPredicate(format: "id = %@", 3)
let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
do {
    try context.execute(batchDeleteRequest)
    try context.save()
} catch {
    fatalError("Error message: \(error)")
}
```
