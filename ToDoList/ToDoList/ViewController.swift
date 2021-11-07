//
//  ViewController.swift
//  ToDoList
//
//  Created by 전현정 on 2021/11/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func tabEditButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func tabAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: "할 일을 입력해주세요.", preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            self?.tableView.reloadData() 
        })
        let cancleButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(registerButton)
        alert.addAction(cancleButton)
        alert.addTextField(configurationHandler: {textField in
            textField.placeholder = "할 일을 입력해주세요"
        })
        self.present(alert, animated: true, completion: nil)
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        return cell
    }
}
