//
//  ImageTableViewController.swift
//  ImageReviewer
//
//  Created by 劉洧熏 on 2017/4/7.
//  Copyright © 2017年 伍智瑋. All rights reserved.
//

import UIKit

class ImageTableViewController: UITableViewController {

    let cellID = "ImageTableViewCell"

    override func viewDidLoad() {

        super.viewDidLoad()
        setUpView()

    }

    func setUpView() {

        let imageCell = UINib.init(nibName: cellID, bundle: nil)

        self.tableView.register(imageCell, forCellReuseIdentifier: cellID)

        setBarButtonItem()

    }

    func setBarButtonItem() {

        let leftBarButton = UIBarButtonItem.init(title: "My Journals", style: .plain, target: nil, action: nil)

        leftBarButton.isEnabled = false

        let font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightSemibold)

        print(font)

        leftBarButton.setTitleTextAttributes([

            NSFontAttributeName: font,
            NSForegroundColorAttributeName: UIColor(red: 67/255, green: 87/255, blue: 97/255, alpha: 1.0)

            ],
                                         for: .normal)

        navigationItem.leftBarButtonItem = leftBarButton

        let image = #imageLiteral(resourceName: "icon_plus").withRenderingMode(.alwaysTemplate)

        let rightBarButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(pushImageDetailController))

        rightBarButton.tintColor = UIColor(red: 237/255, green: 96/255, blue: 81/255, alpha: 1.0)

        navigationItem.rightBarButtonItem = rightBarButton
    }

    func pushImageDetailController() {

        let storyboard = UIStoryboard(name: "ImagePicker", bundle: nil)

        guard let controller = storyboard.instantiateViewController(withIdentifier: ImageDetailViewController.identidier) as? ImageDetailViewController else { return }

        self.present(controller, animated: true, completion: nil)

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 5

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? ImageTableViewCell else { return UITableViewCell(style: .default, reuseIdentifier: "Cell") }

        cell.userImage.image = #imageLiteral(resourceName: "flower")

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 212

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
