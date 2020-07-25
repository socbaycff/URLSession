import UIKit

// struct luu cac hang so
struct APIConstant {
    static let max = 20
    static let min = 5
    // header api number : id user, host rapid api
    static let headers = [
        "x-rapidapi-host": "numbersapi.p.rapidapi.com",
        "x-rapidapi-key": "2d2d7cfabcmsh91fde64cfd21fd6p1884f2jsnb74327d61fa6"
    ]
}

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    let session = URLSession.shared
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let request: URLRequest = {
        let url = URL(string: "https://numbersapi.p.rapidapi.com/random/trivia?max=\(APIConstant.max)&fragment=true&min=\(APIConstant.min)&json=true")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // chon phuong thuc get
        request.allHTTPHeaderFields = APIConstant.headers // set header cho request
        return request
    }()
    
    
 
    
    
    @IBAction func getFactFromAPI(_ sender: Any) {
        
        let dataTask = session.dataTask(with: request , completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error.debugDescription)
            } else {
                //  let httpResponse = response as? HTTPURLResponse
                do {
                    let fact = try JSONDecoder().decode(Fact.self, from: data!) // chuyen data tra ve thanh obj
                    print(fact)
                    
                    //  chuyen ve luong main
                    DispatchQueue.main.async {
                        self.label.text = fact.description
                    }
                } catch  {
                    print("error")
                }
                
                
            }
        })
        
        dataTask.resume() // chay
    }
    
    
    @IBAction func lookup(_ sender: Any) {
        // header voi id user su dung rapid api, host name
        let headers = [
             "x-rapidapi-host": "mashape-community-urban-dictionary.p.rapidapi.com",
             "x-rapidapi-key": "2d2d7cfabcmsh91fde64cfd21fd6p1884f2jsnb74327d61fa6"
         ]
        // su dung api
        let word = "watssup"
        let url = URL(string: "https://mashape-community-urban-dictionary.p.rapidapi.com/define?term=\(word)")!
        var request = URLRequest(url: url,timeoutInterval: 10)
        request.httpMethod = "GET" // get
        request.allHTTPHeaderFields = headers // header set
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let obj = try! JSONDecoder().decode(SearchResult.self, from: data!)
            print(obj.list[0].definition)
            //  chuyen ve luong main
            DispatchQueue.main.async {
                self.label.text = obj.list[0].definition
            }
        }.resume()
    }
    
}
