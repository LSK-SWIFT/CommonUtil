//
//  CommonUtil.swift
//  PatientEscort
//
//  Created by �̼��� on 2017. 7. 25..
//  Copyright �� 2017�� �̼���. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import TextAttributes

/// ���� Ŭ������ �����ϴ� ��
class CommonUtil {
    public struct weekDate {
        
        private var _dateweek:String?
        private var _startDate:String?
        private var _endDate:String?
        
        
        var dateWeek:String{
            get{
                return _dateweek!
            }
            set{
                _dateweek = newValue
            }
        }
        var startDate:String{
            get{
                return _startDate!
            }
            set{
                _startDate = newValue
            }
        }
        var endDate:String{
            get{
                return _endDate!
            }
            set{
                _endDate = newValue
            }
        }
    }
    ///����Ʈ ���� yyyy.MM.dd a h:mm ex) 2017.04.25 ���� 2:33
    static let dateformat_1 = "yyyy.MM.dd a h:mm"
    
    ///����Ʈ ���� yyyyMMdd ex) 2017.04.25
    static let dateformat_2 = "yyyy.MM.dd"
    
    ///����Ʈ ���� HH:mm ex) 14:25
    static let dateformat_3 = "HH:mm"
    
    ///����Ʈ ���� yyyyMMddHHmmss ex) 20170425125312
    static let dateformat_4 = "yyyyMMddHHmmss"
    
    ///����Ʈ ���� yyyy-MM-dd(E) a hh:mm ex) 2017-04-25(ȭ) ���� 02:25
    static let dateformat_5 = "yyyy-MM-dd(E) a hh:mm"
    
    ///����Ʈ ���� yy-MM-dd(E) a hh:mm ex) 17-04-25(ȭ) ���� 02:25
    static let dateformat_6 = "yy-MM-dd(E) a hh:mm"
    
    ///����Ʈ ���� yy-MM-dd (E) ex) 17-04-25 (ȭ)
    static let dateformat_7 = "yy-MM-dd (E)"
    
    ///����Ʈ ���� yy-MM-dd(E) HH:mm ex) 17-04-25(ȭ) 14:55
    static let dateformat_8 = "yy-MM-dd(E) HH:mm"
    
    ///����Ʈ ���� dd(E) ex) 25(ȭ)
    static let dateformat_9 = "dd(E)"
    /// ����Ʈ ���� yyyy-MM-dd(E) ex) 2017-04-12(��)
    static let dateformat_10 = "yyyy-MM-dd(E)"
    
    static let dateformat_11 = "MM�� yyyy��"
    
    static let dateformat_12 = "yyyy-MM-dd"
    
    static let dateformat_13 = "yyyyMMddHHmmss"
    
    static let dateformat_14 = "yyyyMMdd"
    
    /**
     Date String�� format1���� format2�� �����Ͽ� String���� return
     - parameters:
     - date: ����Ʈ������ String
     - format1 : date�Ķ������ Date Format
     - format2 : date�Ķ���Ͱ� ����� Format
     - returns: format2�� �ٲ� Date String
     */
    static func dateFormatChange(date:String, format1:String, format2:String) -> String{
        let format_1:DateFormatter = DateFormatter()
        format_1.locale = Locale(identifier: "ko_KR")
        format_1.dateFormat = format1
        let format_2:DateFormatter = DateFormatter()
        format_2.locale = Locale(identifier: "ko_KR")
        format_2.dateFormat = format2
        var second = ""
        if format2 == "yyyyMMddHHmmss" {
            format_2.dateFormat = "yyyyMMddHHmm"
            
            let format_3:DateFormatter = DateFormatter()
            format_3.dateFormat = "ss"
            format_3.locale = Locale(identifier: "ko_KR")
            second = format_3.string(from: Date())
        }
        return format_2.string(from: (format_1.date(from: date))!) + second
        
    }
    
       
    /**
     Date String�� Date�� return
     - parameters:
     - date: ����Ʈ������ String
     - format : date�Ķ������ Date Format
     - returns: �ٲ� Date
     */
    static func String_To_Date(date:String, format:String) -> Date{
        let paramFormat:DateFormatter = DateFormatter()
        paramFormat.dateFormat = format
        paramFormat.locale = Locale(identifier: "ko_KR")
        let convertDate = paramFormat.date(from: date)! as Date
        
        return convertDate
    }
    
    // �ΰ��� ��¥ ���� ���� ���ϱ�
    // - parameter date: ��¥
    // - parameter anotherDay: �ٸ���¥(�ɼ��̸� �������� ���ϳ�¥)
    // - return ���� ���ڼ�
    static func getIntervalDays(date: Date?, anotherDay: Date? = nil) -> Double {
        
        var interval: Double!
        
        if anotherDay == nil {
            interval = date?.timeIntervalSinceNow
        } else {
            interval = date?.timeIntervalSince(anotherDay!)
        }
        
        let r = interval / 86400
        
        return floor(r) * -1
    }
    
    /**
     Date�� String���� ��ȯ
     
     - parameter date:   ����Ʈ
     - parameter format: ����
     
     - returns: �ٲ� ��Ʈ��
     */
    static func Date_To_String(date:Date, format:String) -> String{
        let paramFormat:DateFormatter = DateFormatter()
        paramFormat.dateFormat = format
        paramFormat.locale = Locale(identifier: "ko_KR")
        
        return paramFormat.string(from: date)
    }
    
    /**
     Date�� ��
     - parameters:
     - a : A DateString
     - b : B DateString
     - format : A�� B�� String Format
     - returns : A > B = 1, A = B = 0, A < B = -1
     */
    static func compare_Date_A_To_B(a:String, b:String, format:String) -> Int{
        let formattor:DateFormatter = DateFormatter()
        formattor.dateFormat = format
        formattor.locale = Locale(identifier: "ko_KR")
        let A:Date = formattor.date(from: a)!
        let B:Date = formattor.date(from: b)!
        switch A.compare(B) {
        case .orderedAscending:
            return 1
        case .orderedDescending:
            return -1
        default:
            return 0
        }
    }
    
    
    /**
     String�� nil���� �Ǻ�
     - parameters:
     - data : �Ǻ��� ��Ʈ��
     - returns: nil�̸� true nil�� �ƴϸ� false
     */
    static func stringIsNull(_ data:String) -> Bool{
        if (data.lowercased() == "null") || data.isEmpty || data == ""{
            return true
        }else{
            return false
        }
    }
    
    
    /// ������ġó�� ������ �÷��ִ� ȿ��
    ///
    /// - Parameters:
    ///   - image: �ø� ����
    ///   - inset: �þ �κ� ����
    /// - Returns: �þ ����
    static func imageSizeConvertor(image:UIImage, inset:UIEdgeInsets)->UIImage{
        return image.resizableImage(withCapInsets: inset)
    }
    
    
    /// UInt8�� �� ��̸� Deep Copy
    ///
    /// - Parameters:
    ///   - src: ī���� ���
    ///   - srcPos: ī���� ��
    ///   - dest: ��� ���
    ///   - destPos: ī���� ��
    ///   - length: �� ����
    static func byteArrayCopy(src:[UInt8], srcPos:Int, dest:inout[UInt8], destPos:Int, length:Int){
        let srcRange = srcPos...(srcPos + (length - 1))
        let destRange = destPos...(destPos + (length - 1))
        dest[destRange] = src[srcRange]
    }
    
    
    
    /// �̽������� url
    ///
    /// - Parameter string: �̽��������� URL���ڿ�
    /// - Returns:
    static func urlEncodingForString(string:String) -> String{
        return string.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    /// �̽������� %
    ///
    /// - Parameter string: �̽��������� URL���ڿ�
    /// - Returns:
    static func urlDecodingForString(string:String) -> String{
        let returnString = string.replacingPercentEscapes(using: String.Encoding.utf8)!
        return returnString.replacingOccurrences(of: "+", with: " ")
    }
    
    
    
    /// 16���� ����ȯ ����
    ///
    /// - Parameter hex: ���� hex��
    /// - Returns: UIColer��
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    /// Į�θ��� ����Ͽ� int������ Return
    ///
    /// - Parameters:
    ///   - step: ������
    ///   - height: Ű
    ///   - weight: ������
    /// - Returns: Į�θ�(Int)
    static func getCalories(step:Double, height:Double, weight:Double) -> Int{
        let height = height
        let weight = weight
        let distance = ((height - 100.0) * step) / 100.0
        let mpercal = (Double)(3.7103 + 0.2678 * weight + (0.0359 * (weight * 60.0 * 0.0006213) * 2.0) * weight)
        let kcal = (((distance * 1000.0) * mpercal * 0.0006213 * 10.0) / 10000.0 * 1.61).rounded()
        
        return Int(kcal)
    }
    
    /// ���� 1pt¥�� RGB(204,204,204)¥�� �Ǽ��� ����
    ///
    /// - Parameter frame: �Ǽ��� ��ġ�� ����
    /// - Returns: �Ǽ�
    static func horizonDivider(frame:CGRect) -> UIView{
        let divider = UIView()
        divider.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: 1)
        divider.backgroundColor = UIColor(red: 204/255.0, green: 204/255.0, blue: 204/255.0, alpha: 1.0)
        return divider
    }
    /**
     ���� 1pt¥�� RGB(204,204,204)¥�� �Ǽ��� ����
     
     - parameter frame: �Ǽ��� ��ġ�� ����
     
     - returns: �Ǽ�
     */
    static func verticalDivider(frame:CGRect) -> UIView{
        let divider = UIView()
        divider.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: 1, height: frame.height)
        divider.backgroundColor = UIColor(red: 204/255.0, green: 204/255.0, blue: 204/255.0, alpha: 1.0)
        return divider
    }
    
    /// ���ÿ��� Notification�� ���
    ///
    /// - Parameter data: Notification Data
    static func showNotification(data : [AnyHashable : Any]){
        
        if #available(iOS 10.0, *){
            let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 1, repeats: false)
            let noti = UNMutableNotificationContent()
            noti.title = String(describing: data[AnyHashable("title")]!)
            noti.sound = UNNotificationSound.default()
            noti.body = String(describing: data[AnyHashable("body")]!)
            let identifier = "oneNotification"
            //�˸���û ��ü
            let request = UNNotificationRequest(identifier: identifier, content: noti, trigger: trigger)
            //��Ƽ�����̼� ���Ϳ� �߰�
            UNUserNotificationCenter.current().add(request)
            
        }else {
            
        }
    }
    
    /**
     String�� ���� ����� ������
     
     - parameter string:               ��Ʈ��
     - parameter attribute:            normal������ ��Ʈ�� Attribute
     - parameter highlightedAttribute: highlighted������ ��Ʈ�� Attribute
     
     - returns:
     */
    static func sizeForString(string: NSString, attribute: NSDictionary, highlightedAttribute: NSDictionary) -> CGSize {
        let size = string.size(attributes: (attribute as! [String : Any]))
        let highlightedSize = string.size(attributes: (highlightedAttribute as! [String : Any]))
        return CGSize(
            width: ceil(max(size.width, highlightedSize.width)),
            height: ceil(max(size.height, highlightedSize.height)))
    }
    
    /**
     String�� ���� ����� ������
     
     - parameter string:               ��Ʈ��
     - parameter attribute:            normal������ ��Ʈ�� Attribute
     - parameter highlightedAttribute: highlighted������ ��Ʈ�� Attribute
     
     - returns:
     */
    static func sizeForString(string: NSString, attribute: TextAttributes, highlightedAttribute: TextAttributes) ->CGSize{
        let size = string.size(attributes: attribute.dictionary)
        let highlightedSize = string.size(attributes: highlightedAttribute.dictionary)
        return CGSize(
            width: ceil(max(size.width, highlightedSize.width)),
            height: ceil(max(size.height, highlightedSize.height)))
    }
    
    /// String�� ���� ����� ������
    ///
    /// - Parameters:
    ///   - string: ��Ʈ��
    ///   - attribute: attribute
    /// - Returns:
    static func sizeForString(string: String, attribute: TextAttributes) -> CGSize{
        let size = string.size(attributes: attribute.dictionary)
        let highlightedSize = NSString(string: string).size(attributes: attribute.dictionary)
        return CGSize(
            width: ceil(max(size.width, highlightedSize.width)),
            height: ceil(max(size.height, highlightedSize.height)))
    }
    
    /**
     ��������� ������ ��ü ������� ����(�ۼ�Ʈ ���)
     
     - parameter size:       ������Ʈ ������
     - parameter designSize: ������ ���� ������
     
     - returns:
     */
    static func sizePerDesignSize(size: CGFloat, designSize: CGFloat) -> CGFloat {
        return size / designSize
    }
    
    
    /**
     ��������� ������ ��ü ������ ��ŭ �ۼ�Ʈ ����� �����
     
     - parameter size:       ������Ʈ ������
     - parameter designSize: ������ ���� ������
     
     - returns:
     */
    static func sizePerDesignSizeToRealSize(size: CGFloat, designSize: CGFloat) -> CGFloat {
        return designSize * sizePerDesignSize(size: size, designSize: designSize)
    }
    
    static func sizePerDesignSizeToRealSizeWidth(size: CGFloat) -> CGFloat {
        return App.Size.screenWidth * sizePerDesignSize(size: size, designSize: App.Size.designScreenWidth)
    }
    
    static func sizePerDesignSizeToRealSizeHeight(size: CGFloat) -> CGFloat {
        return App.Size.screenHeight * sizePerDesignSize(size: size, designSize: App.Size.designScreenHeight)
    }
    
    /// �ȵ���̵�� �����ε� Width
    ///
    /// - Parameter size: ������
    /// - Returns: �ٲ������
    static func sizePerDesignSizeToRealSizeWidthForAndroid(size: CGFloat) -> CGFloat {
        return App.Size.screenWidth * sizePerDesignSize(size: size, designSize: App.Size.designScreenWidthForAndroid)
    }
    
    /// �ȵ���̵�� �����ε� Height
    ///
    /// - Parameter size: ������
    /// - Returns: �ٲ������
    static func sizePerDesignSizeToRealSizeHeightForAndroid(size: CGFloat) -> CGFloat {
        return App.Size.screenHeight * sizePerDesignSize(size: size, designSize: App.Size.designScreenHeightForAndroid)
    }
    
    /**
     �ؽ�Ʈ�信 �Էµ� �ؽ�Ʈ�� ���μ��� ������
     
     - parameter tv: �ؽ�Ʈ��
     
     - returns: ���μ�
     */
    static func getTextViewLineCount(tv: UITextView) -> Int{
        let layoutManager:NSLayoutManager = tv.layoutManager
        let numberOfGlyphs = layoutManager.numberOfGlyphs
        var numberOfLines = 0
        var index = 0
        var lineRange:NSRange = NSRange()
        
        while (index < numberOfGlyphs) {
            layoutManager.lineFragmentRect(forGlyphAt: index, effectiveRange: &lineRange)
            index = NSMaxRange(lineRange);
            numberOfLines = numberOfLines + 1
        }
        
        return numberOfLines
    }
    
    //�̹� �� ù ��¥ ����¥
    static func dateForToMonth() -> weekDate {
        let parseFormat:DateFormatter = DateFormatter()
        parseFormat.dateFormat = "yyyy-MM"
        parseFormat.locale = Locale(identifier: "ko_kr")
        parseFormat.timeZone = TimeZone(identifier: "KST")
        
        let calFormat:DateFormatter = DateFormatter()
        calFormat.dateFormat = "yyyyMMdd"
        calFormat.locale = Locale(identifier: "ko_kr")
        calFormat.timeZone = TimeZone(identifier: "KST")
        
        let date = parseFormat.date(from: parseFormat.string(from: Date()))
        let calendar = Calendar.current
        
        var returnData = weekDate()
        returnData.dateWeek = parseFormat.string(from: date!)
        returnData.startDate = self.dateFormatChange(date: parseFormat.string(from: date!), format1: parseFormat.dateFormat, format2: "yyyyMM") + "01"
        
        let nextMonth = calendar.date(byAdding: .month, value: 1, to: calFormat.date(from: returnData.startDate)!)
        returnData.endDate = calFormat.string(from: calendar.date(byAdding: .day, value: -1, to: nextMonth!)!)
        return returnData
    }
    
    //data�� compareData�� ���Ͽ� Ÿ�Խ�Ʈ������ ���� for int
    static func intCompareToType(_ data:Int, _ compareData:Int) -> String{
        if data > compareData {
            return "01"
        }
        else if data < compareData{
            return "03"
        }
        else{
            return "02"
        }
    }
        
    
    //���� ��¥�� yyyymmdd�������� ������
    static func today_format_YYYYMMDD() -> String{
        let todayDate = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: todayDate as Date)
    }
    
    //���� ��¥�� yyyymmdd�������� ������
    static func today_format_YYYYMMDDHHMM() -> String{
        let todayDate = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmm"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: todayDate as Date)
    }
    
    //���� ��¥��
    static func today_currentTime() -> String{
        let now = NSDate()
        let dateFormetter = DateFormatter()
        dateFormetter.dateFormat = "yy-MM-dd(E) HH:mm"
        dateFormetter.locale = Locale(identifier: "ko_KR")
        return dateFormetter.string(from: now as Date)
    }
    
    //data�� compareData�� ���Ͽ� Ÿ�Խ�Ʈ������ ���� for Double
    static func doubleCompareToType(_ data: Double, _ compareData: Double) -> String{
        if data > compareData {
            return "01"
        }
        else if data < compareData{
            return "03"
        }
        else{
            return "02"
        }
    }
    
    static func convertToDictionary(text : String) -> [String : Any]?{
        if let data = text.data(using: .utf8){
            do{
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
            }catch{
                Logger.error(message: error.localizedDescription)
            }
        }
        return nil
    }
    
    /// ���꽺Ʈ��
    ///
    /// - Parameters:
    ///   - text: �ڸ� ���ڿ�
    ///   - start: ���� �⺻�� 0
    ///   - end: �� �⺻�� 0
    /// - Returns: ���۰� ��
    static func substring(text: String = "", start: Int = 0, end: Int = 0) -> String{
        var returnString: String = ""
        
        if start > text.length {
            return  ""
        }
        
        if start != 0 {
            if end != 0 {
                returnString = text.substring(with: text.index(text.startIndex, offsetBy: start)..<text.index(text.startIndex, offsetBy: end))
                
            }else {
                returnString = text.substring(from: text.index(text.startIndex, offsetBy: start - 1))
            }
            
        } else {
            if end != 0 {
                returnString = text.substring(to: text.index(text.startIndex, offsetBy: end))
            }
        }
        return returnString
    }
    
    /// �ֹι�ȣ �������̼� üũ
    ///
    /// - Parameters:
    ///   - front: ���ڸ� 6�ڸ�
    ///   - rear: �� 7�ڸ�
    /// - Returns:
    static func isJumin(front: String, rear: String) -> Bool{
        if front.length < 6 {
            return false
        }
        if rear.length < 7 {
            return false
        }
        
        var chk = 0
        for i in 0..<6 {
            var str: String = substring(text: front, start: i, end: i+1)
            chk = chk + (((i % 8) + 2) * Int(str)!)
            
        }
        for i in 6..<12 {
            var str: String = substring(text: rear, start: i-6, end: i-5)
            chk = chk + (((i % 8) + 2) * Int(str)!)
        }
        
        chk = 11 - (chk % 11)
        chk = chk % 10
        if (chk != Int(substring(text: rear, start: 6, end: 7))) {
            return false
        }
        return true
    }
    
    static func isForeigner(front: String, rear: String) -> Bool{
        if front.length < 6 {
            return false
        }
        if rear.length < 7 {
            return false
        }
        
        if substring(text: rear, start: 1, end: 7) == "000000"{
            return true
        }
        
        var sum = 0
        if substring(text: rear, start: 0, end: 1) != "5" &&
            substring(text: rear, start: 0, end: 1) != "6" &&
            substring(text: rear, start: 0, end: 1) != "7" &&
            substring(text: rear, start: 0, end: 1) != "8" {
            return false
        }
        if Int(substring(text: rear, start: 1, end: 3))! % 2 != 0 {
            return false;
        }
        let full: String = front + rear
        for i in 0..<12 {
            sum += Int(substring(text: full, start: i, end: i+1))! * ((i % 8) + 2)
        }
        
        if (((11 - (sum % 11)) % 10 + 2) % 10 ) == Int(substring(text: full, start: 12, end: 13)) {
            return true;
        }
        
        return false
    }
    
    static func DictionaryToQueryString(data: [String: Any]) -> String{
        var output: String = ""
        for (key, value) in data {
            output += "\(key)=\(value)&"
        }
        output = String(output.characters.dropLast())
        return output
    }
    
    static func JSONStringify(value: AnyObject,prettyPrinted:Bool = false) -> String{
        let options = prettyPrinted ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions(rawValue: 0)
        if JSONSerialization.isValidJSONObject(value) {
            do{
                let data = try JSONSerialization.data(withJSONObject: value, options: options)
                if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                    return string as String
                }
            }catch {
                print("error")
                //Access error here
            }
        }
        return ""
    }
    
}

