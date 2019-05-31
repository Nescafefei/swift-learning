//
//  MyViewController.swift
//  swiftPro
//
//  Created by diyidan on 2019/5/23.
//  Copyright © 2019 fei. All rights reserved.
//

import UIKit


class MyViewController: UITableViewController {

    var dataArr = [[MyCellModel]]()
    var concernsArr = [MyConcern]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.globaBackgroundColor()
        tableView.rowHeight = 44
        tableView.separatorStyle = .none
        
        /*
         系统写法
        tableView.register(UINib(nibName: String(describing: MyOtherCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MyOtherCell.self))
        tableView.register(UINib(nibName: String(describing: MyConcernCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MyConcernCell.self))
        */
        /**
         扩展写法
         */
        tableView.ym_registerCell(cell: MyOtherCell.self)
        tableView.ym_registerCell(cell: MyConcernCell.self)
        
        NetworkTools.loadMyCellData { (sections) in
            
            let string = "{\"text\":\"我的关注\",\"grey_text\":\"\"}"
            let myConcern = MyCellModel.deserialize(from: string)
            var tempArr = [MyCellModel]()
            tempArr.append(myConcern!)
            self.dataArr.append(tempArr)
            self.dataArr += sections
            self.tableView.reloadData()
            
            /// 获取我的关注数据
            NetworkTools.loadMyConcern(complete: { (tempArr) in
                self.concernsArr = tempArr
                let indexSet = IndexSet(integer: 0)
                self.tableView.reloadSections(indexSet, with: .automatic)
                
            })
        }
    }
    
    

    
}

extension MyViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArr.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr[section].count
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 10))
        view.backgroundColor = UIColor(r: 247, g: 248, b: 249)
        return view
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 0 : 10
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0{
            return (concernsArr.count <= 1 ? 40 : 114)
        }
        return 40
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            /** l扩展写法*/
            let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as MyConcernCell
            
            let model = self.dataArr[indexPath.section][indexPath.row]
            cell.mycellModel = model
     
            if concernsArr.count <= 1{
                cell.collectionView.isHidden = true
            }
            if concernsArr.count == 1 {
                cell.concernModel = concernsArr[0]
            }
            if concernsArr.count > 1{
                cell.myConcernsArr = concernsArr
            }

            return cell
        }
        
        let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as MyOtherCell
        let model = self.dataArr[indexPath.section][indexPath.row]
        cell.titleLab?.text = model.text
        cell.subTitleLab.text = model.grey_text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
