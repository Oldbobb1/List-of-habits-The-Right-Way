import Foundation
import JTAppleCalendar


extension ListVC: JTACMonthViewDelegate {
     
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        guard let cell = cell as? CustomCalendarCell else { return }
        cell.configureCell(state: cellState, date: date)
    }
    
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCalendarCell", for: indexPath) as! CustomCalendarCell
        cell.configureCell(state: cellState, date: date)
        return cell
    }
    
    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState) {
        guard let validCell = cell as? CustomCalendarCell else { return }
        validCell.select()
    }
  
    
    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState) {
        guard let validCell = cell as? CustomCalendarCell else { return }
        validCell.deselect()
    }

    
    func calendar(_ calendar: JTACMonthView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        if let date = visibleDates.monthDates.first?.date {
           updateMonthLabel(for: date)
        }
    }
}


extension ListVC: JTACMonthViewDataSource {
    
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        let startDate = Date() // Начало с текущего месяца
        let endDate = listView.formatter.date(from: "2100 12 31")!

        let parameters = ConfigurationParameters(
            startDate: startDate,
            endDate: endDate,
            numberOfRows: 1, // Отображаем все 6 строк для полного месяца
            calendar: Calendar.current,
            generateInDates: .forFirstMonthOnly, // Включаем дополнительные даты для начала месяца .forAllMonths,
            generateOutDates: .off, // Включаем даты до конца сетки месяца .tillEndOfGrid
            firstDayOfWeek: .monday,
            hasStrictBoundaries: true // Строгие границы для календаря
        )
        return parameters
    }
}
