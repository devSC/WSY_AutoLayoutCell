//
//  SecondViewController.m
//  WSY_AutoLayoutCell
//
//  Created by Andou on 14/12/23.
//  Copyright (c) 2014年 SCDev. All rights reserved.
//

#import "SecondViewController.h"
#import "WSYLayoutCell2.h"
@interface SecondViewController ()

#define Screen_Width [[UIScreen mainScreen] bounds].size.width

@property NSMutableArray *objects;
@property (strong, nonatomic) NSMutableDictionary *offscreenCells;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.objects = [NSMutableArray arrayWithArray:@[@"All of us have read thrilling stories in which the hero had only a limited and specified time to live. Sometimes it was as long as a year, sometimes as short as 24 hours. But always we were interested in discovering just how the doomed hero chose to spend his last days or his last hours. I speak, of course, of free men who have a choice, not condemned criminals whose sphere of activities is strictly delimited", @"Such stories set us thinking, wondering what we should do under similar circumstances. What events, what experiences, what associations should we crowd into those last hours as mortal beings, what regrets? ", @"Sometimes I have thought it would be an excellent rule to live each day as if we should die tomorrow. Such an attitude would emphasize sharply the values of life. We should live each day with gentleness, vigor and a keenness of appreciation which are often lost when time stretches before us in the constant panorama of more days and months and years to come. There are those, of course, who would adopt the Epicurean motto of “Eat, drink, and be merry”. But most people would be chastened by the certainty of impending death.",@"In stories the doomed hero is usually saved at the last minute by some stroke of fortune, but almost always his sense of values is changed. He becomes more appreciative of the meaning of life and its permanent spiritual values. It has often been noted that those who live, or have lived, in the shadow of death bring a mellow sweetness to everything they do.", @"Most of us, however, take life for granted. We know that one day we must die, but usually we picture that day as far in the future. When we are in buoyant health, death is all but unimaginable. We seldom think of it. The days stretch out in an endless vista. So we go about our petty tasks, hardly aware of our listless attitude toward life. ", @"The same lethargy, I am afraid, characterizes the use of all our faculties and senses. Only the deaf appreciate hearing, only the blind realize the manifold blessings that lie in sight. Particularly does this observation apply to those who have lost sight and hearing in adult life. But those who have never suffered impairment of sight or hearing seldom make the fullest use of these blessed faculties. Their eyes and ears take in all sights and sounds hazily, without concentration and with little appreciation. It is the same old story of not being grateful for what we have until we lose it, of not being conscious of health until we are ill. ", @"I have often thought it would be a blessing if each human being were stricken blind and deaf for a few days at some time during his early adult life. Darkness would make him more appreciative of sight; silence would teach him the joys of sound. "]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView setEstimatedRowHeight:UITableViewAutomaticDimension];
    [self.tableView registerClass:[WSYLayoutCell2 class] forCellReuseIdentifier:@"WSYLayoutCell2"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

// 返回一个cell的预估高度，这样tableview首次加载时不会调用heightForRow方法，这样tableview可以显示出来，等到cell可见时，再调用heightForRow获取cell的真正高度
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 44.f;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseIdentifier = @"WSYLayoutCell2";
    WSYLayoutCell2 *cell = [self.offscreenCells objectForKey:reuseIdentifier];
    if (!cell) {
        cell = [[WSYLayoutCell2 alloc] init];
        [self.offscreenCells setObject:cell forKey:reuseIdentifier];
    }
    NSString *project = [self.objects objectAtIndex:indexPath.row];
    cell.detailLabel.text = project;
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    
    [cell setNeedsLayout];// pay attention
    [cell layoutIfNeeded];//pay attention
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height+1;
    
    //    CGFloat topMargin = 38.f;
    //    CGFloat bottomMargin = 20.f;
    //    NSString *text = self.objects[indexPath.row];
    //    CGSize size = [text boundingRectWithSize:CGSizeMake(Screen_Width-81-20.f, 10000.f) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.f]} context:nil].size;
    //
    //    return size.height+topMargin+bottomMargin ;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WSYLayoutCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"WSYLayoutCell2" forIndexPath:indexPath];
    cell.detailLabel.text = self.objects[indexPath.row];
    [cell updateFonts];
    // Configure the cell...
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    
    return cell;
}

@end
