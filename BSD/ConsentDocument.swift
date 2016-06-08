
import ResearchKit

class ConsentDocument: ORKConsentDocument {
    // MARK: Properties
    
    let ipsum = [
        "When should you start and how often should you have mammograms to screen for breast cancer. \n\nShould you start in your 40's or wait until you are 50?\n\nShould you have a mammogram every year or every other year?\n\nThe first step in making these decisions is understanding your risk of breast cancer.",
        "Duis euismod sollicitudin elementum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed at pharetra sapien. Pellentesque cursus laoreet interdum. Nunc mi sapien, congue vel eleifend in, luctus sit amet massa. Nam tempus metus nec mauris bibendum, vel suscipit quam aliquet. Vestibulum sagittis mi et tempus iaculis. Integer varius eros non sagittis elementum. Proin dictum magna sit amet nulla volutpat posuere eget ac mi. Cras aliquam tristique velit nec porttitor. Integer nulla ligula, vestibulum a ullamcorper non, volutpat non nibh. Integer auctor ipsum id leo pharetra, vitae dapibus augue sagittis. Proin ut diam non orci vulputate rutrum a et nulla. Maecenas in varius augue, eu pretium metus. In auctor ornare augue ac sodales.",
        "Information you enter here is anonymous, and we never ask your name or email address.",
        "Maecenas quis varius massa. Nam in dapibus turpis, ut varius eros. Proin a ex enim. Sed faucibus magna vel tincidunt facilisis. Donec id ligula vel mi suscipit sollicitudin. Nulla non magna blandit, semper augue vel, sagittis dui. Curabitur quis rutrum ex. Sed ipsum odio, mattis et dignissim sit amet, volutpat et turpis. Sed quis placerat orci. Duis vitae bibendum diam.",
        "Sed nec tortor sapien. Quisque tempor scelerisque vulputate. Nulla eget consequat urna. Aliquam tempus sagittis orci vel tempus. Mauris porta ante sed maximus iaculis. Etiam elit purus, pretium nec ipsum non, aliquam commodo erat. Aliquam sagittis, nibh at porta pellentesque, libero purus finibus nulla, sed consectetur tellus sem non nisl. Duis eu sollicitudin orci. Quisque tincidunt feugiat sapien ac accumsan. Nullam vitae fringilla quam.",
        "Integer tristique, nulla nec auctor consectetur, justo dolor sagittis erat, vel laoreet erat turpis vitae dui. Praesent purus tellus, eleifend faucibus sapien id, egestas mollis turpis. Fusce enim lorem, ornare quis ligula a, mattis feugiat diam. Praesent ullamcorper fringilla urna sollicitudin convallis. Curabitur eget dapibus ipsum, ac suscipit mauris. In hac habitasse platea dictumst. Vestibulum non hendrerit ex.",
        "Nulla convallis ligula ornare efficitur ullamcorper. Vivamus erat enim, malesuada sit amet dolor ac, tristique blandit felis. Praesent a ante ac nisi tempor elementum. Mauris ligula tellus, porttitor eu vehicula eget, condimentum sed nisi. Donec pharetra lacus tincidunt sapien dignissim iaculis. Duis id ultrices tortor, at congue dolor. Donec consequat fringilla leo, eu congue nulla suscipit non.",
        "Sed convallis, ligula vel egestas commodo, mauris nisl tincidunt arcu, id tristique est nunc sit amet felis. Curabitur tortor dolor, ullamcorper vitae pulvinar egestas, venenatis a sem. Cras sit amet maximus magna. Vivamus auctor nisi quis felis mattis, vel sagittis purus pulvinar. Nunc tristique nibh mauris, at eleifend arcu sodales nec. Curabitur rhoncus rutrum metus, ac pretium ante tempor sed. Sed vehicula placerat felis, nec interdum nisl fringilla eu. Nunc iaculis sit amet massa fringilla rhoncus. Maecenas consequat, risus eget commodo suscipit, lorem ex condimentum orci, et sollicitudin nisi eros sed lectus. Sed at erat nisl. Nunc venenatis mi tellus, vitae congue erat dictum a."
    ]
    
    // MARK: Initialization
    
    override init() {
        super.init()
        
        title = NSLocalizedString("Research Health Study Consent Form", comment: "")
        
        let sectionTypes: [ORKConsentSectionType] = [
            .Overview,
            .DataGathering,
            .Privacy,
            .DataUse,
            .TimeCommitment,
            .StudySurvey,
            .StudyTasks,
            .Withdrawing
        ]
        
        sections = zip(sectionTypes, ipsum).map { sectionType, ipsum in
            let section = ORKConsentSection(type: sectionType)
            
            let localizedIpsum = NSLocalizedString(ipsum, comment: "")
            let localizedSummary = localizedIpsum.componentsSeparatedByString(".")[0] + "."
            
            section.summary = localizedSummary
            section.content = localizedIpsum
            
            return section
        }
        
        let signature = ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature")
        addSignature(signature)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ORKConsentSectionType: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .Overview:
            return "Overview"
            
        case .DataGathering:
            return "DataGathering"
            
        case .Privacy:
            return "Privacy"
            
        case .DataUse:
            return "DataUse"
            
        case .TimeCommitment:
            return "TimeCommitment"
            
        case .StudySurvey:
            return "StudySurvey"
            
        case .StudyTasks:
            return "StudyTasks"
            
        case .Withdrawing:
            return "Withdrawing"
            
        case .Custom:
            return "Custom"
            
        case .OnlyInDocument:
            return "OnlyInDocument"
        }
    }
}