//
//  PsotingTableViewCell1.swift
//  IllhaTask
//
//  Created by A1502 on 26/04/22.
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
        DispatchQueue.global(qos: .background).async {
            do{
                let data = try Data.init(contentsOf: URL.init(string:(objDashboard?.imageUser!)!)!)
                DispatchQueue.main.async {
                    let image: UIImage? = UIImage(data: data)
                    self.imgUser.image = image
                }
            }
            catch let errorLog {
                debugPrint(errorLog.localizedDescription)
            }
        }
    }
}
