//
//  PhotoManager.swift
//  DemoPhoto
//
//  Created by PhanDinhNguyen on 11/20/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import Foundation
import Photos

class PhotoManager {
    static let share = PhotoManager()
    
    func fetchAllAblum() -> [PHAssetCollection] {
        //. get all alum : album system, album user create, smart ablum
        var datasource: [PHAssetCollection] = []

        let albumUserLibrary = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: nil)//  PHFetchResult<PHAssetCollection>
        albumUserLibrary.enumerateObjects { (collection, _, _) in
            datasource.append(collection)
        }
        let albumUserCreate = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .smartAlbumUserLibrary, options: nil)
        albumUserCreate.enumerateObjects{(collection, _, _) in
            datasource.append(collection)
        }
        let smartAlbum = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .any, options: nil)
        smartAlbum.enumerateObjects{(collection, _, _) in
            datasource.append(collection)
        }
        return datasource
    }
    
    
    func allAssetByAlbum(collection : PHAssetCollection) -> [PHAsset] {
        // get all photo of album
        var allPhoto = [PHAsset]()
        let allPhotoOfAlbum = PHAsset.fetchAssets(in: collection, options: nil) //PHFetchResult<PHAsset>
        allPhotoOfAlbum.enumerateObjects { (photo, _, _) in
            allPhoto.append(photo)
        }
        return allPhoto
    }
    
    func getImageForAsset(asset : PHAsset) -> UIImage {
        //get Image from Asset
        var resultImg = UIImage()
        PHImageManager.default().requestImage(for: asset, targetSize: CGSize.init(width: 100, height: 100), contentMode: PHImageContentMode.aspectFill, options: nil, resultHandler: {(result, info) -> Void in resultImg = result!})
        return resultImg
    }

}
