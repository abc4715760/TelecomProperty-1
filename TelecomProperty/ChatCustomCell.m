

#import "ChatCustomCell.h"


@implementation ChatCustomCell
@synthesize deleteButton;
@synthesize dateLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
        
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}


- (void)dealloc {
	[dateLabel release];
	[deleteButton release];
    [super dealloc];
}


@end
