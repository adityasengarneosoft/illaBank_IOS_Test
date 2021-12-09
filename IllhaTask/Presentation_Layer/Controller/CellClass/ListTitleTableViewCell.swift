//
//  PsotingTableViewCell1.swift
//  IllhaTask
//
//  Created by A1502 on 23/08/21.
//

import UIKit


class ListTitleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgUser.layer.cornerRadius = 10
        imgUser.layer.masksToBounds = true
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func prepareLayout(objDashboard:countryList?) {
        lblTitle.text = objDashboard?.title
        let fileUrl = URL(string: (objDashboard?.imageUser!)!)
        ImageLoader.downloadImage(url: fileUrl!, completion: {
                  (
                      getimageViee,nil
                  ) in
                  DispatchQueue.main.async {
                      self.imgUser.image = getimageViee
                  }
              })

      

    }
}
