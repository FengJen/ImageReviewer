import UIKit
import CoreData

class ImageReviewerManager {
    static let shared = ImageReviewerManager()
    
    var imageArray: [Image] = []
    
    lazy var context: NSManagedObjectContext = {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        return context
    }()
    
    
    func saveText(_ image: Image) {
        
        let imageModel = NSEntityDescription.insertNewObject(forEntityName: "ImageModel", into: context)
        imageModel.setValue(image.title, forKey: "title")
        imageModel.setValue(image.content, forKey: "content")
        imageModel.setValue(image.image, forKey: "image")
        
        do {
        try context.save()
        } catch {
            print(error)
        }
    }
    
    func fetch() {
        let request: NSFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ImageModel")
        do {
            guard let request = try context.fetch(request) as? [ImageModel] else { return }
            
            for image in request {
                let model = Image(title: image.title!, content: image.content!, image: "YA")
                imageArray.append(model)
            }
            
        } catch {
            print(error)
        }
    }
    
    
}
