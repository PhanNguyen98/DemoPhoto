//
//  ImgViewController.swift
//  DemoPhoto
//
//  Created by PhanDinhNguyen on 11/20/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import UIKit
import Photos

class ImgViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    open func allAssetByAlbum(collection : PHAssetCollection) -> [PHAsset] {
        // get all photo of album
        var allPhoto = [PHAsset]()
        let allPhotoOfAlbum = PHAsset.fetchAssets(in: collection, options: nil) //PHFetchResult<PHAsset>
        allPhotoOfAlbum.enumerateObjects { (photo, _, _) in
            allPhoto.append(photo)
        }
        return allPhoto
    }
    
    open func getImageForAsset(asset : PHAsset) -> UIImage {
        //PHImageRequestOptions
        // iclound
        var resultImg = UIImage()
        PHImageManager.default().requestImage(for: asset, targetSize: CGSize.init(width: 100, height: 100), contentMode: PHImageContentMode.aspectFill, options: nil, resultHandler: {(result, info) -> Void in resultImg = result!})
        return resultImg
        //        PHCachingImageManager
    }

}
