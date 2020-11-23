//
//  AlbumViewController.swift
//  DemoPhoto
//
//  Created by PhanDinhNguyen on 11/20/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import UIKit
import Photos

class AlbumViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AlbumTableViewCell", bundle: nil), forCellReuseIdentifier: "AlbumTableViewCell")
    }
    

    func configureContent(for cell: AlbumTableViewCell, with item: PHAssetCollection){
        cell.countLabel.text = "\(PHAsset.fetchAssets(in: item, options: nil).count)"
        cell.titleLabel.text = item.localizedTitle
        let avatar = PhotoManager.share.allAssetByAlbum(collection: item)
        if PHAsset.fetchAssets(in: item, options: nil).count != 0 {
            cell.avartarView.image = PhotoManager.share.getImageForAsset(asset: avatar[0])
        }
    }
}

extension AlbumViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumDetailViewController = AlbumDetailViewController()
        albumDetailViewController.collection = PhotoManager.share.fetchAllAblum()[indexPath.row]
        self.navigationController?.pushViewController(albumDetailViewController, animated: true)
    }
}

extension AlbumViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return PhotoManager.share.fetchAllAblum().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell", for: indexPath) as! AlbumTableViewCell
        let item = PhotoManager.share.fetchAllAblum()[indexPath.row]
        configureContent(for: cell, with: item)
        return cell

    }
    
    
}
