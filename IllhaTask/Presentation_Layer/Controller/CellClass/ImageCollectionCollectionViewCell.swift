//
//  ImageCollectionCollectionViewCell.swift
//  IllhaTask
//
//  Created by A1502 on 24/08/21.
//

import UIKit

class ImageCollectionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var slideshow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
    }
    func prepareLayout(objDashboard:ImageHeader?) {
        let getImageUrl = objDashboard?.imagePath
        ?? ""
        let fileUrl = URL(string: getImageUrl)
        ImageLoader.downloadImage(url: fileUrl!, completion: {
            (
                getimageViee,nil
            ) in
            DispatchQueue.main.async {
                self.slideshow.image = getimageViee
            }
        })
    }
    
}
