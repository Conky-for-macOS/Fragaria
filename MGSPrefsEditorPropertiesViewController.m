//
//  MGSPrefsEditorPropertiesViewController.m
//  Fragaria
//
//  Created by Jim Derry on 3/15/15.
//
//

#import "MGSPrefsEditorPropertiesViewController.h"
#import "MGSUserDefaultsController.h"
#import "MGSFontWell.h"


@interface MGSPrefsEditorPropertiesViewController ()

@property IBOutlet NSView *paneEditing;
@property IBOutlet NSView *paneGutter;
@property IBOutlet NSView *paneAutocomplete;
@property IBOutlet NSView *paneIndenting;
@property IBOutlet NSView *paneTextFont;

@end


@implementation MGSPrefsEditorPropertiesViewController

/*
 *  - init
 */
- (id)init
{
    NSBundle *bundle;
    NSView *v;
    CGFloat width;
    
    self = [super init];
    bundle = [NSBundle bundleForClass:[MGSPrefsEditorPropertiesViewController class]];
    [bundle loadNibNamed:@"MGSPrefsEditorProperties" owner:self topLevelObjects:nil];
    
    width = [self.paneEditing frame].size.width;
    v = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, width, 0)];
    [self setView:v];

    return self;
}


/*
 *  @property editorFont
 *  This is just to keep the editor font synced with the gutter font.
 */
- (IBAction)setEditorFont:(id)sender
{
    [self.userDefaultsController.values setValue:[sender font] forKey:MGSFragariaDefaultsGutterFont];
}


/*
 * - hideableViews
 */
- (NSDictionary *)propertiesForPanelSubviews
{
	return @{
			 NSStringFromSelector(@selector(paneEditing)) : [MGSFragariaView propertyGroupEditing],
			 NSStringFromSelector(@selector(paneGutter)) : [MGSFragariaView propertyGroupGutter],
			 NSStringFromSelector(@selector(paneAutocomplete)) : [MGSFragariaView propertyGroupAutocomplete],
			 NSStringFromSelector(@selector(paneIndenting)) : [MGSFragariaView propertyGroupIndenting],
			 NSStringFromSelector(@selector(paneTextFont)) : [MGSFragariaView propertyGroupTextFont],
			 };
}


/*
 * - keysForPanelSubviews
 */
- (NSArray *)keysForPanelSubviews
{
    return @[
        NSStringFromSelector(@selector(paneEditing)),
        NSStringFromSelector(@selector(paneGutter)),
        NSStringFromSelector(@selector(paneAutocomplete)),
        NSStringFromSelector(@selector(paneIndenting)),
        NSStringFromSelector(@selector(paneTextFont))
    ];
}


@end
