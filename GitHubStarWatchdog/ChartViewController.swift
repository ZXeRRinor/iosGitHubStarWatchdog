//
//  ChartViewController.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 10.03.2021.
//
import UIKit
import Charts
import DropDown

class ChartViewController: UIViewController, ChartViewDelegate {
    var chart = BarChartView()
    var stargazers: [Stargazer] = []
    var formattedStargazers = [Int: [Stargazer]]()
    let dropDown = DropDown()
    
    @IBAction func tapChooseMenuItem(_ sender: UIButton) {
        dropDown.dataSource = formattedStargazers.keys.sorted().map {
            let monthComponents = Calendar.current.monthSymbols
            var result = monthComponents[Int($0 - 1) % 12]
            let calendar = Calendar.current
            if $0 <= 12 {
                result += " (\(calendar.component(.year, from: Date()) - 1))"
            } else {
                result += " (\(calendar.component(.year, from: Date())))"
            }
            return result
        }
        dropDown.anchorView = sender
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        dropDown.show()
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in
          guard let _ = self else { return }
          sender.setTitle(item, for: .normal)
        }
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = self.view.frame.size.height * 0.7
        chart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: height)
        chart.center = CGPoint(x: view.center.x, y: height / 2)
        view.addSubview(chart)
        customizeBarChart()
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        dateComponent.month = -12
        dateComponent.day = 1 - calendar.component(.day, from: Date())
        let startDate = calendar.date(byAdding: dateComponent, to: Date())!
        let currentYear = calendar.component(.year, from: Date())
        var dataSet = [Int: [Stargazer]]()
        stargazers.forEach {
            if $0.starredAt >= startDate {
                var index = calendar.component(.month, from: $0.starredAt)
                let year = calendar.component(.year, from: $0.starredAt)
                if year == currentYear {
                    index += 12
                }
                if dataSet[index] != nil {
                    dataSet[index]!.append($0)
                } else {
                    dataSet[index] = [$0]
                }
            }
        }
        var result: [BarChartDataEntry] = []
        dataSet.keys.forEach { i in
            if let stargazerGroup = dataSet[i] {
                result.append(BarChartDataEntry(x: Double(i), y: Double(stargazerGroup.count)))
            }
        }
        
        formattedStargazers = dataSet
        setChartEntries(result)
    }
    
    func setChartEntries(_ entries: [BarChartDataEntry]) {
        chart.setScaleEnabled(false)
//        barChart.pinchZoomEnabled = false
        
        let data = BarChartData(dataSet: BarChartDataSet(entries: entries, label: "data"))
        chart.data = data
//        chart.invalidateIntrinsicContentSize()
    }
    
    func customizeBarChart() {
        let xAxis = chart.xAxis
        xAxis.labelPosition = XAxis.LabelPosition.bottom
        xAxis.drawGridLinesEnabled = false
        xAxis.granularity = 1
        xAxis.labelCount = 13
//        xAxis.axisMinimum = start.toFloat() - 0.5
        chart.fitBars = true
        chart.highlightFullBarEnabled = false
        xAxis.valueFormatter = CustomValueFormatter()
    }
}

extension ChartViewController {
    static func build(with stargazers: [Stargazer]) -> ChartViewController {
        let sb = UIStoryboard(name: "Chart", bundle: nil)
        let controller = sb.instantiateViewController(identifier: "ChartViewController") as! ChartViewController
        controller.stargazers = stargazers
        return controller
    }
}

extension ChartViewController {
    public func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight)
    {
        
    }
    
    public func chartValueNothingSelected(_ chartView: ChartViewBase)
    {
        
    }
}

class CustomValueFormatter: AxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let monthComponents = Calendar.current.shortMonthSymbols
        return monthComponents[Int(value - 1) % 12]
    }
}
