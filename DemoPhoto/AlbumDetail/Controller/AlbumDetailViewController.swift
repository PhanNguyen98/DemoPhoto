//
//  AlbumDetailViewController.swift
//  DemoPhoto
//
//  Created by PhanDinhNguyen on 11/20/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import UIKit
import Photos

class AlbumDetailViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var collection: PHAssetCollection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "AlbumDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AlbumDetailCollectionViewCell")
    }
}

extension AlbumDetailViewController: UICollectionViewDelegate{
    
}

extension AlbumDetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PHAsset.fetchAssets(in: collection!, options: nil).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"AlbumDetailCollectionViewCell" , for: indexPath) as! AlbumDetailCollectionViewCell
        let allAssetforAlbum = PhotoManager.share.allAssetByAlbum(collection: collection!)
        cell.photoView.image = PhotoManager.share.getImageForAsset(asset: allAssetforAlbum[indexPath.row])
        return cell
    }
    
    
}
