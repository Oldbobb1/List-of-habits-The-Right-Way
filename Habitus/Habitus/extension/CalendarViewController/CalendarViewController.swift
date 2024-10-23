import UIKit

extension CalendarViewController: UITableViewDelegate { }



extension CalendarViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Возвращаем текст заголовка для каждой секции
        switch section {
        case 2:
            return "Stats of Week"
        case 3:
            return "Stats of Month"
        case 4:
            return "Stats of Years"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30 // Высота заголовка
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1,2,3,4:
            return 1
        default:
            return 0
        }
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CalendarViewCell
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            
            return cell
        case 1:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CalendarViewCell1
            cell1.selectionStyle = .none
            cell1.backgroundColor = .clear
            return cell1
        case 2:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! CalendarViewCell2
            cell2.selectionStyle = .none
            cell2.backgroundColor = .clear
            return cell2
        case 3:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! CalendarViewCell3
            cell3.selectionStyle = .none
            cell3.backgroundColor = .clear
            return cell3
        case 4:
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "Cell4", for: indexPath) as! CalendarViewCell4
            cell4.selectionStyle = .none
            cell4.backgroundColor = .clear
            return cell4
        default:
        return UITableViewCell()
        }
    }
    
}
