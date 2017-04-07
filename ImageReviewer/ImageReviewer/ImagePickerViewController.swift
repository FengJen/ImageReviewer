import UIKit

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var ImageButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
        
        addSaveButton()
        addCloseButton()
    }
    
    func pickImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
       
    }
    
    func addSaveButton() {
        view.addSubview(ImageButton)
        var isEditing = false
        if isEditing {
        ImageButton.setTitle("Change", for: .normal)
        } else if !isEditing {
          ImageButton.setTitle("Save", for: .normal)
        }
        ImageButton.backgroundColor = UIColor(red: 237/255, green: 96/255, blue: 81/255, alpha: 1)
        ImageButton.tintColor = UIColor.white
        let font = UIFont.systemFont(ofSize: 20)
        ImageButton.titleLabel?.font = font
        
        ImageButton.layer.cornerRadius = 20
        ImageButton.layer.shadowColor = UIColor(red: 247/255, green: 174/255, blue: 163/255, alpha: 1).cgColor
        ImageButton.layer.shadowOffset = CGSize.zero
        ImageButton.layer.shadowRadius = 5
        ImageButton.layer.shadowOpacity = 1.0
        ImageButton.layer.shouldRasterize = true
        
    }
    
    func addCloseButton() {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            imageView.frame = CGRect(x: 0, y: 0, width: pickedImage.size.width, height: pickedImage.size.height)
            imageView.image = pickedImage
            imageView.contentMode = .scaleAspectFit
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
