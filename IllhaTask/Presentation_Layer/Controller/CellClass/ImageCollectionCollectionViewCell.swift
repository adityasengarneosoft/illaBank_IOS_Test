//
//  ImageCollectionCollectionViewCell.swift
//  IllhaTask
//
//  Created by A1502 on 26/04/22.
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
        DispatchQueue.global(qos: .background).async {
            do{
                let data = try Data.init(contentsOf: URL.init(string:getImageUrl)!)
                DispatchQueue.main.async {
                    let image: UIImage? = UIImage(data: data)
                    self.slideshow.image = image
                }
            }
            catch let errorLog {
                debugPrint(errorLog.localizedDescription)
            }
        }
        //        let getImageUrl = objDashboard?.imagePath
        //        ?? ""
        //        let fileUrl = URL(string: getImageUrl)
        //        ImageLoader.downloadImage(url: fileUrl!, completion: {
        //            (
        //                getimageViee,nil
        //            ) in
        //            DispatchQueue.main.async {
        //                self.slideshow.image = getimageViee
        //            }
        //        })
    }
    
}
