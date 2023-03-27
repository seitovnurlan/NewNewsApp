//
//  StartViewController.swift
//  NewNewsApp
//
//  Created by Nurlan Seitov on 27/3/23.
//
import Foundation
import UIKit
import SnapKit
import Kingfisher

class StartViewController: UIViewController {
    
    private let cellID = "cell"
    
    private let tableView = UITableView()
    
    private var news: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        config()
        setupConstraints()
        initData()
        
        
        
    }
    private func setupConstraints() {
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
           // make.leading.trailing.top.bottom.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(65)
            make.leading.trailing.bottom.equalToSuperview()
            
        }
        
    }
    
    private func config() {
        
        view.backgroundColor = .white
        title = "Some news"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: cellID)
    }
    
    private func initData() {
        news.append(News(matter: "Сулайман-Тоону курчаган курулуштардын чыры", info: " Сулайман-Тоонун коргоого алынган аймагында жыл сайын жаңы имараттар пайда болууда. ЮНЕСКОнун талаптары буфердик аймакка жаңы курулуш курууга тыюу салбайт, бирок анын бийиктигине чек коёт. Тагыраагы анын жайгашкан жерине карап, курулган имарат 4-5 кабаттан ашпоого тийиш.Аны көзөмөлгө алуу Маданият министрлигине жүктөлүп, куруучулар андан атайын уруксат алуусу керек.Бирок айрымдары бийик имараттарды куруп алып, эми соттошуп жатат.Бул өз кезегинде \"Сулайман-Тоонун\" эл аралык уюмдун дүйнөлүк мурастар тизмесинен чыгып калуу коркунучун жаратууда.", imageInfo: "sulaiman"))
        news.append(News(matter: "Google өзүнүн жасалма интеллектидеги чат-ботун чыгарды. Ал 18 жаштан өткөндөр үчүн", info: "Техникалык гигант АКШ менен Улуу Британиядагы өзүнүн колдонуучулары үчүн Bard деп аталган жасалма интеллектидеги чат-ботун чыгарды. Бирок аны айрым бир колдонуучулар жана 18 жаштан жогорку курактагыларга гана иштете алат.Ал өзүнүн ChatGPT атаандашына караганда Интернеттен жаңы маалыматтарды алып тура алат. Ал эми ChatGPT'тын маалымат базасы 2021-жыл менен чектелген. Ошондой эле Google it кнопкасы менен издөө жүргүзө алат. Ал ошондой эле фактыларды алган булактарын да көрсөтөт, мисалы Википедияны.", imageInfo: "google"))
        news.append(News(matter: "Мугалим да миллиондоп каржылап коё алат. Эжейлердин эмгеги эл таразасында", info: "Белгилүү кинорежиссер Руслан Акун тарткан Агай теле сериалы агартуу тармагы, мугалимдин орду, жаратмандыгы деген теманы дагы бир жолу козгоду. Айрымдар кези келсе эми алдыңкы эжейлердин эмгегин тасмага тартыш керек деп жатат. Тасманын баш каарманы болгон айтылуу агартуучу Гапыр Мадаминовдун эмгегинин үзүрү эле миллондогон сомду үнөмдөп, андан көбүн жаштарга инвестиция кылып койгонун жаңы министр Каныбек Иманалиев парламент трибунасында туруп айтты.", imageInfo: "teacher"))
        news.append(News(matter: "Алтын, күмүш эле эмес, тагдырдын сыноосун жеңген спортчу айымдар?", info: " Кыргызстандык спортчулар көзү азиз аялдар категориясындагы паратриатлон боюнча дүйнөлүк кубокто алтын жана күмүш медаль утту.3-4-март күндөрү Бириккен Араб Эмираттарынын Абу-Даби шаарында өткөн эл аралык мелдеште Кыргыз Азиздер федерациясынын негиздөөчүсү Гүлназ Жүзбаева алтын медаль алса, Айтунук Жоомарт кызы күмүш медаль тагынды.Би-Би-Си паратриатлончулар машыккан залга барды.", imageInfo: "sport"))
        news.append(News(matter: "Астронавттын тамагы: “Атаганат, космос бекетинде тим эле даамдуу, ысык пицца жегиң келет да!...", info: "2023-жылы 15-мартта НАСА агенттиги 2025-жылы Айга бара турган астронавттар үчүн жасалган жаңы муундагы атайын кийимдин (скафандр) жаңы түрүнүн бет ачаарын өткөрдү. Ушул окуяга байланыштуу космостук саякаттын катышуучуларынын турмуш тиричиликтик чоо-жайына кызыгуулар ого бетер арткандай болду. Америкалык космостук саякатчылар кийген скафандр түрү 1981-жылдан бери толугу менен кайра долбоорлоно элек болчу.", imageInfo: "nasa"))
        news.append(News(matter: "Укмуш кооз гүлдүн соолуганы мени катуу ойго салчу... Короосун гүлзар кылган Илхомбек?", info: " Өзгөндүк ишкер жазды чакырып, жайнаган, бажырайган гүлдөрүн белендеди. Ызгарлуу кыштан кийин жазды күткөндөргө бул ого бетер эргүү тартуулап тургандай. Ал Голландияга чейин барып, гүлдүн сырын үйрөнүүгө белсенүүдө. Би-Би-Си камеранын көзүн ишкердин гүлзарын көздөй бурду...Менин атым Илхомбек Салиев, Оштун Өзгөн шаарында гүл дүкөн иштетем. Гүл бизнесте жыйырма жылдан бери жүрөм, ата кесипти аркалап жүрөм. Алар мага үйрөткөн, башында биз букет жасап, сатат элек. Алар көз жоосун алып канчалык кооз болбосун бат эле соолуп калганы мени көп ойлондурат эле.", imageInfo: "ilhom"))
        
    }
}

extension StartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! CustomCell
        
        cell.initUI(theme: news[indexPath.row].matter, infoTheme: news[indexPath.row].imageInfo, image: news[indexPath.row].imageInfo)
        
        cell.imageCustom.layer.cornerRadius = 20
        cell.imageCustom.layer.borderWidth = 1
        cell.imageCustom.layer.borderColor = UIColor.gray.cgColor
        cell.imageCustom.clipsToBounds = true
        cell.labelCustom.textColor = .black
       // cell.labelCustom.font = UIFont.TextStyle.largeTitle
        cell.labelCustomText.textColor = .black
        
        cell.labelCustom?.text = news[indexPath.row].matter
        cell.labelCustomText?.text = news[indexPath.row].info
        cell.imageCustom?.image = UIImage(named: news[indexPath.row].imageInfo)
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
        secondVC.name = news[indexPath.row].matter
        secondVC.infoName = news[indexPath.row].info
        secondVC.imageName = news[indexPath.row].imageInfo
    }
}



struct News {
    var matter: String
    var info: String
    var imageInfo: String
}
