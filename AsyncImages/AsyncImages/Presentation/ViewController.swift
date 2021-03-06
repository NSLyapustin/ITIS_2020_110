//
//  ViewController.swift
//  AsyncImages
//
//  Created by Teacher on 09.11.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let imageLoader = ImageLoader()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ImageCell else {
            fatalError("Can't dequeue cell")
        }
        let image = Image(name: "\(indexPath.row % 7 + 1)")
        cell.imageNameLabel.text = image.name
        imageLoader.loadImage(image: image) { image in
            cell.customImageView.image = image
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
}

