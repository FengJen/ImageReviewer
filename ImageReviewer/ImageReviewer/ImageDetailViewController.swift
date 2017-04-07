import UIKit

class ImageDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    static let identidier = "ImageDetailViewController"

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var imageButton: UIButton!

    @IBOutlet weak var cancelButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        setImageView()

        addSaveButton()

        setCancelButton()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {

        return UIStatusBarStyle.lightContent
    }

    func pickImage() {

        let imagePicker = UIImagePickerController()

        imagePicker.delegate = self

        imagePicker.allowsEditing = true

        imagePicker.sourceType = .photoLibrary

        present(imagePicker, animated: true, completion: nil)
    }

    func addSaveButton() {

        view.addSubview(imageButton)

        imageButton.backgroundColor = UIColor(red: 237/255, green: 96/255, blue: 81/255, alpha: 1)

        imageButton.tintColor = UIColor.white

        let font = UIFont.systemFont(ofSize: 20)

        imageButton.titleLabel?.font = font

        imageButton.layer.cornerRadius = 20

        imageButton.layer.shadowColor = UIColor(red: 247/255, green: 174/255, blue: 163/255, alpha: 1).cgColor

        imageButton.layer.shadowOffset = CGSize.zero

        imageButton.layer.shadowRadius = 5

        imageButton.layer.shadowOpacity = 1.0

        imageButton.layer.shouldRasterize = true
    }

    func setImageView() {

        let tap = UITapGestureRecognizer(target: self, action: #selector(pickImage))

        imageView.addGestureRecognizer(tap)

        imageView.isUserInteractionEnabled = true

        let image = #imageLiteral(resourceName: "icon_photo").withRenderingMode(.alwaysTemplate)

        imageView.image = image

        imageView.tintColor = UIColor.white

        imageView.contentMode = .center
    }

    func setCancelButton() {

        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }

    func cancel() {

        dismiss(animated: true, completion: nil)
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
