import UIKit


extension BackupСopyVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0,1:
            return 1
        default:
            return 0
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BackupCell
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            return cell
        case 1:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! BackupCell1
            cell1.selectionStyle = .none
            cell1.backgroundColor = .clear
//            cell1.view = self
            return cell1
            
        default:
            return UITableViewCell()
        }
    }
}
 
extension BackupСopyVC: UITableViewDelegate { }
