import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
    }

    var athletes: [Athlete] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = athlete.name
        content.secondaryText = athlete.description
        cell.contentConfiguration = content
        
        return cell
    }
}
