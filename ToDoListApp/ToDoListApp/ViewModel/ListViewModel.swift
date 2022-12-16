
import Foundation

class ListViewModel {
    
    var array = [ToDoMessage]()
    
    let coreDataHelper = CoreDataHelper()
    
    func fetchData () {
        array = coreDataHelper.fetchData() ?? [ToDoMessage]()
    }
    
    func saveData (message:String) {
        coreDataHelper.saveData(message: message)
    }
    
    func deleteData (index:Int) {
        coreDataHelper.deleteData(index: index )
    }
    
    func changeData (index: Int, message: String) {
        coreDataHelper.changeData(index: index, message: message)
    }

}
